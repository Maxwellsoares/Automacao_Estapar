*** Settings ***
Documentation        Arquivo dedicado para os locator referentes a funcionalidade "Login" - Magento 2

*** Variables ***

${Create_Account}                                          //html/body/div[2]/header/div[1]/div/ul/li[3]

${sign_in}                                                 //html/body/div[2]/header/div[1]/div/ul

${first_name}                                              //*[@id="form-validate"]/fieldset[1]/div[1]

${last_name}                                               //*[@id="lastname"]

${Scroll}                                                  //*[@id="form-validate"]/div/div[1]

${email}                                                   //*[@id="form-validate"]/fieldset[2]/div[1] 

${password}                                               //*[@id="form-validate"]/fieldset[2]/div[2]/div

${confirm_password}                                       //*[@id="form-validate"]/fieldset[2]/div[3]

${account_login}                                          //*[@id="form-validate"]

${confirmo_registro_usuario}                              //*[@id="maincontent"]/div[1]/div[2]/div

${123}                                                    //*[@id="form-validate"]/div/div[1]

${email_login}                                            //*[@id="login-form"]/fieldset/div[2]

${password_login}                                         //*[@id="pass"]

${sign_in_login}                                          //*[@id="send2"]/span

${validar_tela_inicial}                                   //html/body/div[2]/header/div[1]/div/ul

${selecionar_item_compra}                                 //*[@id="maincontent"]/div[3]/div/div[2]/div[1]/a/span/span[2]

${selecionar_item_compra_2}                               //*[@id="product-item-info_5"]/a/span/span/img

${selecionar_tamanho_blusa}                              //*[@id="product-options-wrapper"]

${selecionar_cor_blusa}                                  //*[@id="product-options-wrapper"]/div/div

${add_to_cart}                                           //*[@id="product-addtocart-button"]/span

${visualizar_carrinho}                                   //html/body/div[2]/header/div[2]/div[1]/a

${proceed_to_checkout}                                   //*[@id="top-cart-btn-checkout"]

${company_preencher}                                     //*[@id="SIAWS64"]

${street_adress_1}                                       //*[@id="JTT3T4W"]

${streed_adress_2}                                       //*[@id="RMIQX2F"]

${street_adress_3}                                       //*[@id="BOYQJWG"]

${btn_next_finalizacao_compra}                          //*[@id="shipping-method-buttons-container"]/div/button/span
  
${btn_place_order}                                      //*[@id="checkout-payment-method-load"]/div/div/div[2]/div[2]/div[4]/div/button/span

${validacao_tela_finalizacao_compra}                    //*[@id="maincontent"]/div[1]/h1/span

${validar_tela_login_erro}                              //*[@id="maincontent"]/div[2]/div[2]/div/div/div