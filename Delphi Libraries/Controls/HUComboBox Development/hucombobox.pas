{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit HUComboBox;

{$warn 5023 off : no warning about unused units}
interface

uses
  HUComboBox1, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('HUComboBox1', @HUComboBox1.Register);
end;

initialization
  RegisterPackage('HUComboBox', @Register);
end.
