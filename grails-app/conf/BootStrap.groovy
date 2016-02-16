import com.DataFeedService

class BootStrap {
    DataFeedService  dataFeedService
    def init = { servletContext ->
        dataFeedService.insertData();
    }
    def destroy = {
    }
}
