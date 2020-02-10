import com.intuit.karate.junit5.Karate;

class FeatureRunner {
    
    @Karate.Test
    Karate testUsers() {
//        return new Karate().feature("my.feature").relativeTo(getClass());
        return new Karate().tags("@omdb").relativeTo(getClass());
    }

    @Karate.Test
    Karate metaWeatherTests(){
        return new Karate().tags("@meta_weather").relativeTo(getClass());
    }

    @Karate.Test
    Karate spartansTests(){
        return new Karate().tags("@delete_spartan").relativeTo(getClass());
    }

    @Karate.Test
    Karate addSpartans(){
        return new Karate().tags("@add_spartan_with_external_json").relativeTo(getClass());
    }

}
