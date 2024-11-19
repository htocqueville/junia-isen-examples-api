resource "azurerm_service_plan" "service_plan" {
  name                = "ccp-service-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B3"
}

resource "azurerm_linux_web_app" "web_app" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {}

  depends_on = [azurerm_service_plan.service_plan]
}
