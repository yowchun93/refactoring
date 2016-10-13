require_relative "../program_ver1.rb"

RSpec.describe "MovieRentalCalculator" do
  it "works" do
    program = Program.new
    statement = program.print_customer_statement
    
    expect(statement).to eq("hello")
  end
end
