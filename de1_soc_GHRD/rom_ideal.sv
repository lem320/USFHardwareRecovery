module rom_ideal (
    input [14:0] address,
    output reg [11:0] data
);

always @(*) begin
    case (address)
        15'h0000: data = 12'h7FF;
        15'h0001: data = 12'h934;
        15'h0002: data = 12'hA68;
        15'h0003: data = 12'hB9A;
        15'h0004: data = 12'hCCB;
        15'h0005: data = 12'hDF7;
        15'h0006: data = 12'hF21;
        15'h0007: data = 12'h045;
        15'h0008: data = 12'h164;
        15'h0009: data = 12'h27D;
        15'h000A: data = 12'h38F;
        15'h000B: data = 12'h49A;
        15'h000C: data = 12'h59D;
        15'h000D: data = 12'h697;
        15'h000E: data = 12'h787;
        15'h000F: data = 12'h86D;
        15'h0010: data = 12'h949;
        15'h0011: data = 12'hA1A;
        15'h0012: data = 12'hADE;
        15'h0013: data = 12'hB97;
        15'h0014: data = 12'hC43;
        15'h0015: data = 12'hCE2;
        15'h0016: data = 12'hD73;
        15'h0017: data = 12'hDF7;
        15'h0018: data = 12'hE6C;
        15'h0019: data = 12'hED3;
        15'h001A: data = 12'hF2B;
        15'h001B: data = 12'hF74;
        15'h001C: data = 12'hFAE;
        15'h001D: data = 12'hFD8;
        15'h001E: data = 12'hFF3;
        15'h001F: data = 12'hFFF;
        15'h0020: data = 12'hFFB;
        15'h0021: data = 12'hFE8;
        15'h0022: data = 12'hFC5;
        15'h0023: data = 12'hF93;
        15'h0024: data = 12'hF51;
        15'h0025: data = 12'hF01;
        15'h0026: data = 12'hEA1;
        15'h0027: data = 12'hE33;
        15'h0028: data = 12'hDB7;
        15'h0029: data = 12'hD2C;
        15'h002A: data = 12'hC94;
        15'h002B: data = 12'hBEF;
        15'h002C: data = 12'hB3C;
        15'h002D: data = 12'hA7E;
        15'h002E: data = 12'h9B3;
        15'h002F: data = 12'h8DD;
        15'h0030: data = 12'h7FB;
        15'h0031: data = 12'h710;
        15'h0032: data = 12'h61B;
        15'h0033: data = 12'h51D;
        15'h0034: data = 12'h416;
        15'h0035: data = 12'h307;
        15'h0036: data = 12'h1F1;
        15'h0037: data = 12'h0D5;
        15'h0038: data = 12'hFB3;
        15'h0039: data = 12'hE8D;
        15'h003A: data = 12'hD61;
        15'h003B: data = 12'hC33;
        15'h003C: data = 12'hB02;
        15'h003D: data = 12'h9CE;
        15'h003E: data = 12'h89A;
        15'h003F: data = 12'h765;
        15'h0040: data = 12'h631;
        15'h0041: data = 12'h4FD;
        15'h0042: data = 12'h3CC;
        15'h0043: data = 12'h29E;
        15'h0044: data = 12'h172;
        15'h0045: data = 12'h04C;
        15'h0046: data = 12'hF2A;
        15'h0047: data = 12'hE0E;
        15'h0048: data = 12'hCF8;
        15'h0049: data = 12'hBE9;
        15'h004A: data = 12'hAE2;
        15'h004B: data = 12'h9E4;
        15'h004C: data = 12'h8EF;
        15'h004D: data = 12'h804;
        15'h004E: data = 12'h722;
        15'h004F: data = 12'h64C;
        15'h0050: data = 12'h581;
        15'h0051: data = 12'h4C3;
        15'h0052: data = 12'h410;
        15'h0053: data = 12'h36B;
        15'h0054: data = 12'h2D3;
        15'h0055: data = 12'h248;
        15'h0056: data = 12'h1CC;
        15'h0057: data = 12'h15E;
        15'h0058: data = 12'h0FE;
        15'h0059: data = 12'h0AE;
        15'h005A: data = 12'h06C;
        15'h005B: data = 12'h03A;
        15'h005C: data = 12'h017;
        15'h005D: data = 12'h004;
        15'h005E: data = 12'h000;
        15'h005F: data = 12'h00C;
        15'h0060: data = 12'h027;
        15'h0061: data = 12'h051;
        15'h0062: data = 12'h08B;
        15'h0063: data = 12'h0D4;
        15'h0064: data = 12'h12C;
        15'h0065: data = 12'h193;
        15'h0066: data = 12'h208;
        15'h0067: data = 12'h28C;
        15'h0068: data = 12'h31D;
        15'h0069: data = 12'h3BC;
        15'h006A: data = 12'h468;
        15'h006B: data = 12'h521;
        15'h006C: data = 12'h5E5;
        15'h006D: data = 12'h6B6;
        15'h006E: data = 12'h792;
        15'h006F: data = 12'h878;
        15'h0070: data = 12'h968;
        15'h0071: data = 12'hA62;
        15'h0072: data = 12'hB65;
        15'h0073: data = 12'hC70;
        15'h0074: data = 12'hD82;
        15'h0075: data = 12'hE9B;
        15'h0076: data = 12'hFBA;
        15'h0077: data = 12'h0DE;
        15'h0078: data = 12'h208;
        15'h0079: data = 12'h334;
        15'h007A: data = 12'h465;
        15'h007B: data = 12'h597;
        15'h007C: data = 12'h6CB;
        15'h007D: data = 12'h7FF;
        15'h007E: data = 12'h934;
        15'h007F: data = 12'hA68;
        15'h0080: data = 12'hB9A;
        15'h0081: data = 12'hCCB;
        15'h0082: data = 12'hDF7;
        15'h0083: data = 12'hF21;
        15'h0084: data = 12'h045;
        15'h0085: data = 12'h164;
        15'h0086: data = 12'h27D;
        15'h0087: data = 12'h38F;
        15'h0088: data = 12'h49A;
        15'h0089: data = 12'h59D;
        15'h008A: data = 12'h697;
        15'h008B: data = 12'h787;
        15'h008C: data = 12'h86D;
        15'h008D: data = 12'h949;
        15'h008E: data = 12'hA1A;
        15'h008F: data = 12'hADE;
        15'h0090: data = 12'hB97;
        15'h0091: data = 12'hC43;
        15'h0092: data = 12'hCE2;
        15'h0093: data = 12'hD73;
        15'h0094: data = 12'hDF7;
        15'h0095: data = 12'hE6C;
        15'h0096: data = 12'hED3;
        15'h0097: data = 12'hF2B;
        15'h0098: data = 12'hF74;
        15'h0099: data = 12'hFAE;
        15'h009A: data = 12'hFD8;
        15'h009B: data = 12'hFF3;
        15'h009C: data = 12'hFFF;
        15'h009D: data = 12'hFFB;
        15'h009E: data = 12'hFE8;
        15'h009F: data = 12'hFC5;
        15'h00A0: data = 12'hF93;
        15'h00A1: data = 12'hF51;
        15'h00A2: data = 12'hF01;
        15'h00A3: data = 12'hEA1;
        15'h00A4: data = 12'hE33;
        15'h00A5: data = 12'hDB7;
        15'h00A6: data = 12'hD2C;
        15'h00A7: data = 12'hC94;
        15'h00A8: data = 12'hBEF;
        15'h00A9: data = 12'hB3C;
        15'h00AA: data = 12'hA7E;
        15'h00AB: data = 12'h9B3;
        15'h00AC: data = 12'h8DD;
        15'h00AD: data = 12'h7FB;
        15'h00AE: data = 12'h710;
        15'h00AF: data = 12'h61B;
        15'h00B0: data = 12'h51D;
        15'h00B1: data = 12'h416;
        15'h00B2: data = 12'h307;
        15'h00B3: data = 12'h1F1;
        15'h00B4: data = 12'h0D5;
        15'h00B5: data = 12'hFB3;
        15'h00B6: data = 12'hE8D;
        15'h00B7: data = 12'hD61;
        15'h00B8: data = 12'hC33;
        15'h00B9: data = 12'hB02;
        15'h00BA: data = 12'h9CE;
        15'h00BB: data = 12'h89A;
        15'h00BC: data = 12'h765;
        15'h00BD: data = 12'h631;
        15'h00BE: data = 12'h4FD;
        15'h00BF: data = 12'h3CC;
        15'h00C0: data = 12'h29E;
        15'h00C1: data = 12'h172;
        15'h00C2: data = 12'h04C;
        15'h00C3: data = 12'hF2A;
        15'h00C4: data = 12'hE0E;
        15'h00C5: data = 12'hCF8;
        15'h00C6: data = 12'hBE9;
        15'h00C7: data = 12'hAE2;
        15'h00C8: data = 12'h9E4;
        15'h00C9: data = 12'h8EF;
        15'h00CA: data = 12'h804;
        15'h00CB: data = 12'h722;
        15'h00CC: data = 12'h64C;
        15'h00CD: data = 12'h581;
        15'h00CE: data = 12'h4C3;
        15'h00CF: data = 12'h410;
        15'h00D0: data = 12'h36B;
        15'h00D1: data = 12'h2D3;
        15'h00D2: data = 12'h248;
        15'h00D3: data = 12'h1CC;
        15'h00D4: data = 12'h15E;
        15'h00D5: data = 12'h0FE;
        15'h00D6: data = 12'h0AE;
        15'h00D7: data = 12'h06C;
        15'h00D8: data = 12'h03A;
        15'h00D9: data = 12'h017;
        15'h00DA: data = 12'h004;
        15'h00DB: data = 12'h000;
        15'h00DC: data = 12'h00C;
        15'h00DD: data = 12'h027;
        15'h00DE: data = 12'h051;
        15'h00DF: data = 12'h08B;
        15'h00E0: data = 12'h0D4;
        15'h00E1: data = 12'h12C;
        15'h00E2: data = 12'h193;
        15'h00E3: data = 12'h208;
        15'h00E4: data = 12'h28C;
        15'h00E5: data = 12'h31D;
        15'h00E6: data = 12'h3BC;
        15'h00E7: data = 12'h468;
        15'h00E8: data = 12'h521;
        15'h00E9: data = 12'h5E5;
        15'h00EA: data = 12'h6B6;
        15'h00EB: data = 12'h792;
        15'h00EC: data = 12'h878;
        15'h00ED: data = 12'h968;
        15'h00EE: data = 12'hA62;
        15'h00EF: data = 12'hB65;
        15'h00F0: data = 12'hC70;
        15'h00F1: data = 12'hD82;
        15'h00F2: data = 12'hE9B;
        15'h00F3: data = 12'hFBA;
        15'h00F4: data = 12'h0DE;
        15'h00F5: data = 12'h208;
        15'h00F6: data = 12'h334;
        15'h00F7: data = 12'h465;
        15'h00F8: data = 12'h597;
        15'h00F9: data = 12'h6CB;
        15'h00FA: data = 12'h7FF;
        15'h00FB: data = 12'h934;
        15'h00FC: data = 12'hA68;
        15'h00FD: data = 12'hB9A;
        15'h00FE: data = 12'hCCB;
        15'h00FF: data = 12'hDF7;
        15'h0100: data = 12'hF21;
        15'h0101: data = 12'h045;
        15'h0102: data = 12'h164;
        15'h0103: data = 12'h27D;
        15'h0104: data = 12'h38F;
        15'h0105: data = 12'h49A;
        15'h0106: data = 12'h59D;
        15'h0107: data = 12'h697;
        15'h0108: data = 12'h787;
        15'h0109: data = 12'h86D;
        15'h010A: data = 12'h949;
        15'h010B: data = 12'hA1A;
        15'h010C: data = 12'hADE;
        15'h010D: data = 12'hB97;
        15'h010E: data = 12'hC43;
        15'h010F: data = 12'hCE2;
        15'h0110: data = 12'hD73;
        15'h0111: data = 12'hDF7;
        15'h0112: data = 12'hE6C;
        15'h0113: data = 12'hED3;
        15'h0114: data = 12'hF2B;
        15'h0115: data = 12'hF74;
        15'h0116: data = 12'hFAE;
        15'h0117: data = 12'hFD8;
        15'h0118: data = 12'hFF3;
        15'h0119: data = 12'hFFF;
        15'h011A: data = 12'hFFB;
        15'h011B: data = 12'hFE8;
        15'h011C: data = 12'hFC5;
        15'h011D: data = 12'hF93;
        15'h011E: data = 12'hF51;
        15'h011F: data = 12'hF01;
        15'h0120: data = 12'hEA1;
        15'h0121: data = 12'hE33;
        15'h0122: data = 12'hDB7;
        15'h0123: data = 12'hD2C;
        15'h0124: data = 12'hC94;
        15'h0125: data = 12'hBEF;
        15'h0126: data = 12'hB3C;
        15'h0127: data = 12'hA7E;
        15'h0128: data = 12'h9B3;
        15'h0129: data = 12'h8DD;
        15'h012A: data = 12'h7FB;
        15'h012B: data = 12'h710;
        15'h012C: data = 12'h61B;
        15'h012D: data = 12'h51D;
        15'h012E: data = 12'h416;
        15'h012F: data = 12'h307;
        15'h0130: data = 12'h1F1;
        15'h0131: data = 12'h0D5;
        15'h0132: data = 12'hFB3;
        15'h0133: data = 12'hE8D;
        15'h0134: data = 12'hD61;
        15'h0135: data = 12'hC33;
        15'h0136: data = 12'hB02;
        15'h0137: data = 12'h9CE;
        15'h0138: data = 12'h89A;
        15'h0139: data = 12'h765;
        15'h013A: data = 12'h631;
        15'h013B: data = 12'h4FD;
        15'h013C: data = 12'h3CC;
        15'h013D: data = 12'h29E;
        15'h013E: data = 12'h172;
        15'h013F: data = 12'h04C;
        15'h0140: data = 12'hF2A;
        15'h0141: data = 12'hE0E;
        15'h0142: data = 12'hCF8;
        15'h0143: data = 12'hBE9;
        15'h0144: data = 12'hAE2;
        15'h0145: data = 12'h9E4;
        15'h0146: data = 12'h8EF;
        15'h0147: data = 12'h804;
        15'h0148: data = 12'h722;
        15'h0149: data = 12'h64C;
        15'h014A: data = 12'h581;
        15'h014B: data = 12'h4C3;
        15'h014C: data = 12'h410;
        15'h014D: data = 12'h36B;
        15'h014E: data = 12'h2D3;
        15'h014F: data = 12'h248;
        15'h0150: data = 12'h1CC;
        15'h0151: data = 12'h15E;
        15'h0152: data = 12'h0FE;
        15'h0153: data = 12'h0AE;
        15'h0154: data = 12'h06C;
        15'h0155: data = 12'h03A;
        15'h0156: data = 12'h017;
        15'h0157: data = 12'h004;
        15'h0158: data = 12'h000;
        15'h0159: data = 12'h00C;
        15'h015A: data = 12'h027;
        15'h015B: data = 12'h051;
        15'h015C: data = 12'h08B;
        15'h015D: data = 12'h0D4;
        15'h015E: data = 12'h12C;
        15'h015F: data = 12'h193;
        15'h0160: data = 12'h208;
        15'h0161: data = 12'h28C;
        15'h0162: data = 12'h31D;
        15'h0163: data = 12'h3BC;
        15'h0164: data = 12'h468;
        15'h0165: data = 12'h521;
        15'h0166: data = 12'h5E5;
        15'h0167: data = 12'h6B6;
        15'h0168: data = 12'h792;
        15'h0169: data = 12'h878;
        15'h016A: data = 12'h968;
        15'h016B: data = 12'hA62;
        15'h016C: data = 12'hB65;
        15'h016D: data = 12'hC70;
        15'h016E: data = 12'hD82;
        15'h016F: data = 12'hE9B;
        15'h0170: data = 12'hFBA;
        15'h0171: data = 12'h0DE;
        15'h0172: data = 12'h208;
        15'h0173: data = 12'h334;
        15'h0174: data = 12'h465;
        15'h0175: data = 12'h597;
        15'h0176: data = 12'h6CB;
        15'h0177: data = 12'h7FF;
        15'h0178: data = 12'h934;
        15'h0179: data = 12'hA68;
        15'h017A: data = 12'hB9A;
        15'h017B: data = 12'hCCB;
        15'h017C: data = 12'hDF7;
        15'h017D: data = 12'hF21;
        15'h017E: data = 12'h045;
        15'h017F: data = 12'h164;
        15'h0180: data = 12'h27D;
        15'h0181: data = 12'h38F;
        15'h0182: data = 12'h49A;
        15'h0183: data = 12'h59D;
        15'h0184: data = 12'h697;
        15'h0185: data = 12'h787;
        15'h0186: data = 12'h86D;
        15'h0187: data = 12'h949;
        15'h0188: data = 12'hA1A;
        15'h0189: data = 12'hADE;
        15'h018A: data = 12'hB97;
        15'h018B: data = 12'hC43;
        15'h018C: data = 12'hCE2;
        15'h018D: data = 12'hD73;
        15'h018E: data = 12'hDF7;
        15'h018F: data = 12'hE6C;
        15'h0190: data = 12'hED3;
        15'h0191: data = 12'hF2B;
        15'h0192: data = 12'hF74;
        15'h0193: data = 12'hFAE;
        15'h0194: data = 12'hFD8;
        15'h0195: data = 12'hFF3;
        15'h0196: data = 12'hFFF;
        15'h0197: data = 12'hFFB;
        15'h0198: data = 12'hFE8;
        15'h0199: data = 12'hFC5;
        15'h019A: data = 12'hF93;
        15'h019B: data = 12'hF51;
        15'h019C: data = 12'hF01;
        15'h019D: data = 12'hEA1;
        15'h019E: data = 12'hE33;
        15'h019F: data = 12'hDB7;
        15'h01A0: data = 12'hD2C;
        15'h01A1: data = 12'hC94;
        15'h01A2: data = 12'hBEF;
        15'h01A3: data = 12'hB3C;
        15'h01A4: data = 12'hA7E;
        15'h01A5: data = 12'h9B3;
        15'h01A6: data = 12'h8DD;
        15'h01A7: data = 12'h7FB;
        15'h01A8: data = 12'h710;
        15'h01A9: data = 12'h61B;
        15'h01AA: data = 12'h51D;
        15'h01AB: data = 12'h416;
        15'h01AC: data = 12'h307;
        15'h01AD: data = 12'h1F1;
        15'h01AE: data = 12'h0D5;
        15'h01AF: data = 12'hFB3;
        15'h01B0: data = 12'hE8D;
        15'h01B1: data = 12'hD61;
        15'h01B2: data = 12'hC33;
        15'h01B3: data = 12'hB02;
        15'h01B4: data = 12'h9CE;
        15'h01B5: data = 12'h89A;
        15'h01B6: data = 12'h765;
        15'h01B7: data = 12'h631;
        15'h01B8: data = 12'h4FD;
        15'h01B9: data = 12'h3CC;
        15'h01BA: data = 12'h29E;
        15'h01BB: data = 12'h172;
        15'h01BC: data = 12'h04C;
        15'h01BD: data = 12'hF2A;
        15'h01BE: data = 12'hE0E;
        15'h01BF: data = 12'hCF8;
        15'h01C0: data = 12'hBE9;
        15'h01C1: data = 12'hAE2;
        15'h01C2: data = 12'h9E4;
        15'h01C3: data = 12'h8EF;
        15'h01C4: data = 12'h804;
        15'h01C5: data = 12'h722;
        15'h01C6: data = 12'h64C;
        15'h01C7: data = 12'h581;
        15'h01C8: data = 12'h4C3;
        15'h01C9: data = 12'h410;
        15'h01CA: data = 12'h36B;
        15'h01CB: data = 12'h2D3;
        15'h01CC: data = 12'h248;
        15'h01CD: data = 12'h1CC;
        15'h01CE: data = 12'h15E;
        15'h01CF: data = 12'h0FE;
        15'h01D0: data = 12'h0AE;
        15'h01D1: data = 12'h06C;
        15'h01D2: data = 12'h03A;
        15'h01D3: data = 12'h017;
        15'h01D4: data = 12'h004;
        15'h01D5: data = 12'h000;
        15'h01D6: data = 12'h00C;
        15'h01D7: data = 12'h027;
        15'h01D8: data = 12'h051;
        15'h01D9: data = 12'h08B;
        15'h01DA: data = 12'h0D4;
        15'h01DB: data = 12'h12C;
        15'h01DC: data = 12'h193;
        15'h01DD: data = 12'h208;
        15'h01DE: data = 12'h28C;
        15'h01DF: data = 12'h31D;
        15'h01E0: data = 12'h3BC;
        15'h01E1: data = 12'h468;
        15'h01E2: data = 12'h521;
        15'h01E3: data = 12'h5E5;
        15'h01E4: data = 12'h6B6;
        15'h01E5: data = 12'h792;
        15'h01E6: data = 12'h878;
        15'h01E7: data = 12'h968;
        15'h01E8: data = 12'hA62;
        15'h01E9: data = 12'hB65;
        15'h01EA: data = 12'hC70;
        15'h01EB: data = 12'hD82;
        15'h01EC: data = 12'hE9B;
        15'h01ED: data = 12'hFBA;
        15'h01EE: data = 12'h0DE;
        15'h01EF: data = 12'h208;
        15'h01F0: data = 12'h334;
        15'h01F1: data = 12'h465;
        15'h01F2: data = 12'h597;
        15'h01F3: data = 12'h6CB;
        15'h01F4: data = 12'h7FF;
        15'h01F5: data = 12'h934;
        15'h01F6: data = 12'hA68;
        15'h01F7: data = 12'hB9A;
        15'h01F8: data = 12'hCCB;
        15'h01F9: data = 12'hDF7;
        15'h01FA: data = 12'hF21;
        15'h01FB: data = 12'h045;
        15'h01FC: data = 12'h164;
        15'h01FD: data = 12'h27D;
        15'h01FE: data = 12'h38F;
        15'h01FF: data = 12'h49A;
        default: data = 12'h000;
    endcase
end

endmodule