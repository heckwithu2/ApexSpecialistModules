public class ParkLocator {

    public static List<String> country(String country) {
        ParkService.ParksImplPort prksvc = new ParkService.ParksImplPort();
        return prksvc.byCountry(country);
    }

}