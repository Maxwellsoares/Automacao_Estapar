import os
from datetime import datetime
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

class ScreenshotLibrary:
    def __init__(self):
        pass

    def _get_selenium_driver(self):
        """Obtém o WebDriver diretamente da instância da SeleniumLibrary."""
        try:
            seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
            return seleniumlib.driver
        except Exception as e:
            raise Exception("Erro ao obter instância do SeleniumLibrary: " + str(e))

    @keyword
    def salvar_evidencia(self, nome="evidencia"):
        """Salva uma captura de tela na pasta 'Evidencias' com timestamp."""
        driver = self._get_selenium_driver()
        if not driver or not hasattr(driver, "save_screenshot"):
            raise Exception("WebDriver não está disponível ou não suporta screenshots.")

        pasta = os.path.join(os.getcwd(), "Evidencias")
        os.makedirs(pasta, exist_ok=True)

        timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
        caminho = os.path.join(pasta, f"{nome}_{timestamp}.png")
        driver.save_screenshot(caminho)
        return caminho
