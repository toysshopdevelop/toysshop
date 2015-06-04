require 'rails_helper'

describe 'User' do
  let!(:category) { FactoryGirl.create :category }
  let!(:product) { FactoryGirl.create :product }

  it 'buy product', js: true do
    visit '/orders/new'
    expect(page).to have_content(I18n.t('empty_cart'))

    visit '/'
    find_button(I18n.t('to_cart')).click
    expect(page).to have_content(I18n.t('in_cart.one', count: 1))

    visit '/orders/new'
    expect(page).to have_content(I18n.t('your_cart'))
    page.has_selector?('table tr')

    click_button(I18n.t('order.confirm'))
    find('.order_name').has_css?('.has-error')
    find('.order_adress').has_css?('.has-error')
    find('.order_phone').has_css?('.has-error')

    page.select '5', from: "select_product_#{product.id}"
    find('#discount').has_no_css?('.hidden')

    fill_in 'order_name', with: 'user name'
    fill_in 'order_adress', with: 'user address'
    fill_in 'order_phone', with: '90987123124'
    click_button(I18n.t('order.confirm'))
    expect(page).to have_content(I18n.t('order.created'))

    visit '/'
    find_button(I18n.t('to_cart')).click

    visit '/orders/new'
    find_link("delete_product_#{product.id}").click
    expect(current_url) == store_path
  end
end
