package SJUserInterface.SJForm;

import java.io.InputStream;
import java.util.Objects;

public class SJLogo implements SJIImageDesign {

    @Override
    public InputStream SJGetPathImage() {
        return Objects.requireNonNull(getClass().getResourceAsStream("/SJUserInterface/Resources/SJImages/SJlogo.png"));
    }

}
