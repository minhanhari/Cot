require "test_helper"

class ApplicationTest < ActionDispatch::IntegrationTest
    test "filter" do
        get '/graph', params: { genes: "TP53\r\nMUC16\r\nKMT2D\r\nKDM6A\r\nARID1A\r\nPIK3CA\r\nKMT2C\r\nRB1\r\nFAT4\r\nCSMD3", cell: '', coregulation: 2 }
    end
end
