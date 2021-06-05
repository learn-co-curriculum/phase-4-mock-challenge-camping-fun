require 'rails_helper'

RSpec.describe "UnnecessaryRoutes", type: :routing do
  
  it "does not define unnecessary pizza routes" do
    expect(post: "/pizzas").not_to be_routable
    expect(get: "/pizzas/1").not_to be_routable
    expect(patch: "/pizzas/1").not_to be_routable
    expect(delete: "/pizzas/1").not_to be_routable
  end
  
  it "does not define unnecessary restaurant routes" do
    expect(post: "/restaurants").not_to be_routable
    expect(patch: "/restaurants/1").not_to be_routable
  end
  
  it "does not define unnecessary restaurant_pizza routes" do
    expect(get: "/restaurant_pizzas").not_to be_routable
    expect(get: "/restaurant_pizzas/1").not_to be_routable
    expect(patch: "/restaurant_pizzas/1").not_to be_routable
    expect(delete: "/restaurant_pizzas/1").not_to be_routable
  end

end
