package tiger.api.test.data;

import com.intuit.karate.junit5.Karate;

public class Runner {
	@Karate.Test
	public Karate testRunner() {
		return Karate.run("classpath:features").tags("smoke");
			
		
	}

}
