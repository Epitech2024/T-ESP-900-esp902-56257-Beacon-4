# Setup EmbeddedProto
cd ../EmbeddedProto
python setup.py
cd ..

$protocol_version = Get-Content '.\protocol\protocol.version' -Raw

# Setup DeviceFirmware
# mkdir .\DeviceFirmware\Arduino_Firmware_src\src\protocol
# mkdir .\DeviceFirmware\Arduino_Firmware_src\src\embedded_proto
protoc --plugin=protoc-gen-eams=.\EmbeddedProto\protoc-gen-eams.bat -I .\Protocol\ --eams_out=.\DeviceFirmware\Arduino_Firmware_src\src\protocol protocol.proto
cp .\EmbeddedProto\src\* .\DeviceFirmware\Arduino_Firmware_src\src\embedded_proto
"#ifndef PROTOCOL_VERSION_H`n`#define PROTOCOL_VERSION_H`n`const char *protocolVersion = `"$protocol_version`";`n`#endif /* PROTOCOL_VERSION_H */" | Out-File '.\DeviceFirmware\Arduino_Firmware_src\src\protocol\protocolversion.h' -Encoding UTF8

# Setup GatewayFirmware
# mkdir .\GatewayFirmware\Arduino_Firmware_src\src\protocol
# mkdir .\GatewayFirmware\Arduino_Firmware_src\src\embedded_proto
protoc --plugin=protoc-gen-eams=.\EmbeddedProto\protoc-gen-eams.bat -I .\Protocol\ --eams_out=.\GatewayFirmware\Arduino_Firmware_src\src\protocol protocol.proto
cp .\EmbeddedProto\src\* .\GatewayFirmware\Arduino_Firmware_src\src\embedded_proto
"#ifndef PROTOCOL_VERSION_H`n`#define PROTOCOL_VERSION_H`n`const char *protocolVersion = `"$protocol_version`";`n`#endif /* PROTOCOL_VERSION_H */" | Out-File '.\GatewayFirmware\Arduino_Firmware_src\src\protocol\protocolversion.h' -Encoding UTF8


