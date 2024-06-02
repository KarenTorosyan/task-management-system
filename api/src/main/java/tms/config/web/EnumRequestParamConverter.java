package tms.config.web;

import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.GenericConverter;
import org.springframework.stereotype.Component;

import java.util.Set;

@Component
public class EnumRequestParamConverter implements GenericConverter {

    @Override
    public Set<ConvertiblePair> getConvertibleTypes() {
        return Set.of(new ConvertiblePair(String.class, Enum.class));
    }

    @SuppressWarnings("unchecked rawtypes")
    @Override
    public Object convert(Object source, TypeDescriptor sourceType, TypeDescriptor targetType) {
        String value = (String) source;
        Class<Enum> enumType = (Class<Enum>) targetType.getType();
        return Enum.valueOf(enumType, value.toUpperCase());
    }
}
