unit LUX.Audio.WAV;

interface //#################################################################### ■

uses LUX, LUX.D1, System.Classes, System.Generics.Collections;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TAnsiChar4 = array [ 0..3 ] of AnsiChar;

     TChunkKind = ( ckNone,
                    ckFMT,
                    ckDATA,
                    ckFACT,
                    ckCUE,
                    ckPLST,
                    ckLIST,
                    ckLABL,
                    ckNOTE,
                    ckLTXT,
                    ckSMPL,
                    ckINST,
                    ///// Broadcast Wave Format
                    ckBEXT,
                    ckIXML,
                    ckQLTY,
                    ckMEXT,
                    ckLEVL,
                    ckLINK,
                    ckAXML,
                    ckCONT );

     TFormatWAV = ( WAVE_FORMAT_UNKNOWN                    = $0000,
                    WAVE_FORMAT_PCM                        = $0001,
                    WAVE_FORMAT_ADPCM                      = $0002,
                    WAVE_FORMAT_MS_ADPCM                   = $0002,
                    WAVE_FORMAT_IEEE_FLOAT                 = $0003,
                    WAVE_FORMAT_VSELP                      = $0004,
                    WAVE_FORMAT_IBM_CVSD                   = $0005,
                    WAVE_FORMAT_ALAW                       = $0006,
                    WAVE_FORMAT_MULAW                      = $0007,
                    WAVE_FORMAT_DTS                        = $0008,
                    WAVE_FORMAT_DRM                        = $0009,
                    WAVE_FORMAT_WMAVOICE9                  = $000A,
                    WAVE_FORMAT_WMAVOICE10                 = $000B,
                    WAVE_FORMAT_OKI_ADPCM                  = $0010,
                    WAVE_FORMAT_DVI_ADPCM                  = $0011,
                    WAVE_FORMAT_IMA_ADPCM                  = $0011,
                    WAVE_FORMAT_MEDIASPACE_ADPCM           = $0012,
                    WAVE_FORMAT_SIERRA_ADPCM               = $0013,
                    WAVE_FORMAT_G723_ADPCM                 = $0014,
                    WAVE_FORMAT_DIGISTD                    = $0015,
                    WAVE_FORMAT_DIGIFIX                    = $0016,
                    WAVE_FORMAT_DIALOGIC_OKI_ADPCM         = $0017,
                    WAVE_FORMAT_MEDIAVISION_ADPCM          = $0018,
                    WAVE_FORMAT_CU_CODEC                   = $0019,
                    WAVE_FORMAT_HP_DYN_VOICE               = $001A,
                    WAVE_FORMAT_YAMAHA_ADPCM               = $0020,
                    WAVE_FORMAT_SONARC                     = $0021,
                    WAVE_FORMAT_DSPGROUP_TRUESPEECH        = $0022,
                    WAVE_FORMAT_ECHOSC1                    = $0023,
                    WAVE_FORMAT_AUDIOFILE_AF36             = $0024,
                    WAVE_FORMAT_APTX                       = $0025,
                    WAVE_FORMAT_AUDIOFILE_AF10             = $0026,
                    WAVE_FORMAT_PROSODY_1612               = $0027,
                    WAVE_FORMAT_LRC                        = $0028,
                    WAVE_FORMAT_DOLBY_AC2                  = $0030,
                    WAVE_FORMAT_GSM610                     = $0031,
                    WAVE_FORMAT_MSNAUDIO                   = $0032,
                    WAVE_FORMAT_ANTEX_ADPCME               = $0033,
                    WAVE_FORMAT_CONTROL_RES_VQLPC          = $0034,
                    WAVE_FORMAT_DIGIREAL                   = $0035,
                    WAVE_FORMAT_DIGIADPCM                  = $0036,
                    WAVE_FORMAT_CONTROL_RES_CR10           = $0037,
                    WAVE_FORMAT_NMS_VBXADPCM               = $0038,
                    WAVE_FORMAT_CS_IMAADPCM                = $0039,
                    WAVE_FORMAT_ROLAND_RDAC                = $0039,
                    WAVE_FORMAT_ECHOSC3                    = $003A,
                    WAVE_FORMAT_ROCKWELL_ADPCM             = $003B,
                    WAVE_FORMAT_ROCKWELL_DIGITALK          = $003C,
                    WAVE_FORMAT_XEBEC                      = $003D,
                    WAVE_FORMAT_G721_ADPCM                 = $0040,
                    WAVE_FORMAT_G728_CELP                  = $0041,
                    WAVE_FORMAT_MSG723                     = $0042,
                    WAVE_FORMAT_INTEL_G723_1               = $0043,
                    WAVE_FORMAT_INTEL_G729                 = $0044,
                    WAVE_FORMAT_SHARP_G726                 = $0045,
                    WAVE_FORMAT_MPEG                       = $0050,
                    WAVE_FORMAT_RT24                       = $0052,
                    WAVE_FORMAT_PAC                        = $0053,
                    WAVE_FORMAT_MPEGLAYER3                 = $0055,
                    WAVE_FORMAT_LUCENT_G723                = $0059,
                    WAVE_FORMAT_CIRRUS                     = $0060,
                    WAVE_FORMAT_ESPCM                      = $0061,
                    WAVE_FORMAT_VOXWARE                    = $0062,
                    WAVE_FORMAT_CANOPUS_ATRAC              = $0063,
                    WAVE_FORMAT_G726_ADPCM                 = $0064,
                    WAVE_FORMAT_G722_ADPCM                 = $0065,
                    WAVE_FORMAT_DSAT                       = $0066,
                    WAVE_FORMAT_DSAT_DISPLAY               = $0067,
                    WAVE_FORMAT_VOXWARE_BYTE_ALIGNED       = $0069,
                    WAVE_FORMAT_VOXWARE_AC8                = $0070,
                    WAVE_FORMAT_VOXWARE_AC10               = $0071,
                    WAVE_FORMAT_VOXWARE_AC16               = $0072,
                    WAVE_FORMAT_VOXWARE_AC20               = $0073,
                    WAVE_FORMAT_VOXWARE_RT24               = $0074,
                    WAVE_FORMAT_VOXWARE_RT29               = $0075,
                    WAVE_FORMAT_VOXWARE_RT29HW             = $0076,
                    WAVE_FORMAT_VOXWARE_VR12               = $0077,
                    WAVE_FORMAT_VOXWARE_VR18               = $0078,
                    WAVE_FORMAT_VOXWARE_TQ40               = $0079,
                    WAVE_FORMAT_VOXWARE_SC3                = $007A,
                    WAVE_FORMAT_VOXWARE_SC3_1              = $007B,
                    WAVE_FORMAT_SOFTSOUND                  = $0080,
                    WAVE_FORMAT_VOXARE_TQ60                = $0081,
                    WAVE_FORMAT_VOXWARE_TQ60               = $0081,
                    WAVE_FORMAT_MSRT24                     = $0082,
                    WAVE_FORMAT_G729A                      = $0083,
                    WAVE_FORMAT_MVI_MVI2                   = $0084,
                    WAVE_FORMAT_DF_G726                    = $0085,
                    WAVE_FORMAT_DF_GSM610                  = $0086,
                    WAVE_FORMAT_ISIAUDIO                   = $0088,
                    WAVE_FORMAT_ONLIVE                     = $0089,
                    WAVE_FORMAT_MULTITUDE_FT_SX20          = $008A,
                    WAVE_FORMAT_INFOCOM_ITS_G721_ADPCM     = $008B,
                    WAVE_FORMAT_CONVEDIA_G729              = $008C,
                    WAVE_FORMAT_CONGRUENCY                 = $008D,
                    WAVE_FORMAT_SBC24                      = $0091,
                    WAVE_FORMAT_DOLBY_AC3_SPDIF            = $0092,
                    WAVE_FORMAT_MEDIASONIC_G723            = $0093,
                    WAVE_FORMAT_PROSODY_8KBPS              = $0094,
                    WAVE_FORMAT_ZYXEL_ADPCM                = $0097,
                    WAVE_FORMAT_PHILIPS_LPCBB              = $0098,
                    WAVE_FORMAT_PACKED                     = $0099,
                    WAVE_FORMAT_MALDEN_PHONYTALK           = $00A0,
                    WAVE_FORMAT_RACAL_RECORDER_GSM         = $00A1,
                    WAVE_FORMAT_RACAL_RECORDER_G720_A      = $00A2,
                    WAVE_FORMAT_RACAL_RECORDER_G723_1      = $00A3,
                    WAVE_FORMAT_RACAL_RECORDER_TETRA_ACELP = $00A4,
                    WAVE_FORMAT_NEC_AAC                    = $00B0,
                    WAVE_FORMAT_RAW_AAC1                   = $00FF,
                    WAVE_FORMAT_RHETOREX_ADPCM             = $0100,
                    WAVE_FORMAT_IRAT                       = $0101,
                    IBM_FORMAT_MULAW                       = $0101,
                    IBM_FORMAT_ALAW                        = $0102,
                    IBM_FORMAT_ADPCM                       = $0103,
                    WAVE_FORMAT_VIVO_G723                  = $0111,
                    WAVE_FORMAT_VIVO_SIREN                 = $0112,
                    WAVE_FORMAT_PHILIPS_CELP               = $0120,
                    WAVE_FORMAT_PHILIPS_GRUNDIG            = $0121,
                    WAVE_FORMAT_DIGITAL_G723               = $0123,
                    WAVE_FORMAT_SANYO_LD_ADPCM             = $0125,
                    WAVE_FORMAT_SIPROLAB_ACEPLNET          = $0130,
                    WAVE_FORMAT_SIPROLAB_ACELP4800         = $0131,
                    WAVE_FORMAT_SIPROLAB_ACELP8V3          = $0132,
                    WAVE_FORMAT_SIPROLAB_G729              = $0133,
                    WAVE_FORMAT_SIPROLAB_G729A             = $0134,
                    WAVE_FORMAT_SIPROLAB_KELVIN            = $0135,
                    WAVE_FORMAT_VOICEAGE_AMR               = $0136,
                    WAVE_FORMAT_G726ADPCM                  = $0140,
                    WAVE_FORMAT_DICTAPHONE_CELP68          = $0141,
                    WAVE_FORMAT_DICTAPHONE_CELP54          = $0142,
                    WAVE_FORMAT_QUALCOMM_PUREVOICE         = $0150,
                    WAVE_FORMAT_QUALCOMM_HALFRATE          = $0151,
                    WAVE_FORMAT_TUBGSM                     = $0155,
                    WAVE_FORMAT_MSAUDIO1                   = $0160,
                    WAVE_FORMAT_WMAUDIO2                   = $0161,
                    WAVE_FORMAT_WMAUDIO3                   = $0162,
                    WAVE_FORMAT_WMAUDIO_LOSSLESS           = $0163,
                    WAVE_FORMAT_WMASPDIF                   = $0164,
                    WAVE_FORMAT_UNISYS_NAP_ADPCM           = $0170,
                    WAVE_FORMAT_UNISYS_NAP_ULAW            = $0171,
                    WAVE_FORMAT_UNISYS_NAP_ALAW            = $0172,
                    WAVE_FORMAT_UNISYS_NAP_16K             = $0173,
                    WAVE_FORMAT_SYCOM_ACM_SYC008           = $0174,
                    WAVE_FORMAT_SYCOM_ACM_SYC701_G726L     = $0175,
                    WAVE_FORMAT_SYCOM_ACM_SYC701_CELP54    = $0176,
                    WAVE_FORMAT_SYCOM_ACM_SYC701_CELP68    = $0177,
                    WAVE_FORMAT_KNOWLEDGE_ADVENTURE_ADPCM  = $0178,
                    WAVE_FORMAT_FRAUNHOFER_IIS_MPEG2_AAC   = $0180,
                    WAVE_FORMAT_DTS_DS                     = $0190,
                    WAVE_FORMAT_CREATIVE_ADPCM             = $0200,
                    WAVE_FORMAT_CREATIVE_FASTSPEECH8       = $0202,
                    WAVE_FORMAT_CREATIVE_FASTSPEECH10      = $0203,
                    WAVE_FORMAT_UHER_ADPCM                 = $0210,
                    WAVE_FORMAT_ULEAD_DV_AUDIO             = $0215,
                    WAVE_FORMAT_ULEAD_DV_AUDIO_1           = $0216,
                    WAVE_FORMAT_QUARTERDECK                = $0220,
                    WAVE_FORMAT_ILINK_VC                   = $0230,
                    WAVE_FORMAT_RAW_SPORT                  = $0240,
                    WAVE_FORMAT_ESST_AC3                   = $0241,
                    WAVE_FORMAT_GENERIC_PASSTHRU           = $0249,
                    WAVE_FORMAT_IPI_HSX                    = $0250,
                    WAVE_FORMAT_IPI_RPELP                  = $0251,
                    WAVE_FORMAT_CS2                        = $0260,
                    WAVE_FORMAT_SONY_SCX                   = $0270,
                    WAVE_FORMAT_SONY_SCY                   = $0271,
                    WAVE_FORMAT_SONY_ATRAC3                = $0272,
                    WAVE_FORMAT_SONY_SPC                   = $0273,
                    WAVE_FORMAT_TELUM_AUDIO                = $0280,
                    WAVE_FORMAT_TELUM_IA_AUDIO             = $0281,
                    WAVE_FORMAT_NORCOM_VOICE_SYSTEMS_ADPCM = $0285,
                    WAVE_FORMAT_FM_TOWNS_SND               = $0300,
                    WAVE_FORMAT_MICRONAS                   = $0350,
                    WAVE_FORMAT_MICRONAS_CELP833           = $0351,
                    WAVE_FORMAT_BTV_DIGITAL                = $0400,
                    WAVE_FORMAT_INTEL_MUSIC_CODER          = $0401,
                    WAVE_FORMAT_INDEO_AUDIO                = $0402,
                    WAVE_FORMAT_QDESIGN_MUSIC              = $0450,
                    WAVE_FORMAT_ON2_VP7_AUDIO              = $0500,
                    WAVE_FORMAT_ON2_VP6_AUDIO              = $0501,
                    WAVE_FORMAT_VME_VMPCM                  = $0680,
                    WAVE_FORMAT_TPC                        = $0681,
                    WAVE_FORMAT_LIGHTWAVE_LOSSLESS         = $08AE,
                    WAVE_FORMAT_OLIGSM                     = $1000,
                    WAVE_FORMAT_OLIADPCM                   = $1001,
                    WAVE_FORMAT_OLICELP                    = $1002,
                    WAVE_FORMAT_OLISBC                     = $1003,
                    WAVE_FORMAT_OLIOPR                     = $1004,
                    WAVE_FORMAT_LH_CODEC                   = $1100,
                    WAVE_FORMAT_LH_CODEC_CELP              = $1101,
                    WAVE_FORMAT_LH_CODEC_SBC8              = $1102,
                    WAVE_FORMAT_LH_CODEC_SBC12             = $1103,
                    WAVE_FORMAT_LH_CODEC_SBC16             = $1104,
                    WAVE_FORMAT_NORRIS                     = $1400,
                    WAVE_FORMAT_ISIAUDIO_2                 = $1401,
                    WAVE_FORMAT_SOUNDSPACE_MUSICOMPRESS    = $1500,
                    WAVE_FORMAT_MPEG_ADTS_AAC              = $1600,
                    WAVE_FORMAT_MPEG_RAW_AAC               = $1601,
                    WAVE_FORMAT_MPEG_LOAS                  = $1602,
                    WAVE_FORMAT_NOKIA_MPEG_ADTS_AAC        = $1608,
                    WAVE_FORMAT_NOKIA_MPEG_RAW_AAC         = $1609,
                    WAVE_FORMAT_VODAFONE_MPEG_ADTS_AAC     = $160A,
                    WAVE_FORMAT_VODAFONE_MPEG_RAW_AAC      = $160B,
                    WAVE_FORMAT_MPEG_HEAAC                 = $1610,
                    WAVE_FORMAT_VOXWARE_RT24_SPEECH        = $181C,
                    WAVE_FORMAT_SONICFOUNDRY_LOSSLESS      = $1971,
                    WAVE_FORMAT_INNINGS_TELECOM_ADPCM      = $1979,
                    WAVE_FORMAT_LUCENT_SX8300P             = $1C07,
                    WAVE_FORMAT_LUCENT_SX5363S             = $1C0C,
                    WAVE_FORMAT_CUSEEME                    = $1F03,
                    WAVE_FORMAT_NTCSOFT_ALF2CM_ACM         = $1FC4,
                    WAVE_FORMAT_DVM                        = $2000,
                    WAVE_FORMAT_DTS2                       = $2001,
                    WAVE_FORMAT_MAKEAVIS                   = $3313,
                    WAVE_FORMAT_DIVIO_MPEG4_AAC            = $4143,
                    WAVE_FORMAT_NOKIA_ADAPTIVE_MULTIRATE   = $4201,
                    WAVE_FORMAT_DIVIO_G726                 = $4243,
                    WAVE_FORMAT_LEAD_SPEECH                = $434C,
                    WAVE_FORMAT_LEAD_VORBIS                = $564C,
                    WAVE_FORMAT_WAVPACK_AUDIO              = $5756,
                    WAVE_FORMAT_OGG_VORBIS_MODE_1          = $674F,
                    WAVE_FORMAT_OGG_VORBIS_MODE_2          = $6750,
                    WAVE_FORMAT_OGG_VORBIS_MODE_3          = $6751,
                    WAVE_FORMAT_OGG_VORBIS_MODE_1_PLUS     = $676F,
                    WAVE_FORMAT_OGG_VORBIS_MODE_2_PLUS     = $6770,
                    WAVE_FORMAT_OGG_VORBIS_MODE_3_PLUS     = $6771,
                    WAVE_FORMAT_3COM_NBX                   = $7000,
                    WAVE_FORMAT_INTERWAV_VSC112            = $7150,
                    WAVE_FORMAT_FAAD_AAC                   = $706D,
                    WAVE_FORMAT_AMR_NB                     = $7361,
                    WAVE_FORMAT_AMR_WB                     = $7362,
                    WAVE_FORMAT_AMR_WP                     = $7363,
                    WAVE_FORMAT_GSM_AMR_CBR                = $7A21,
                    WAVE_FORMAT_GSM_AMR_VBR_SID            = $7A22,
                    WAVE_FORMAT_COMVERSE_INFOSYS_G723_1    = $A100,
                    WAVE_FORMAT_COMVERSE_INFOSYS_AVQSBC    = $A101,
                    WAVE_FORMAT_COMVERSE_INFOSYS_SBC       = $A102,
                    WAVE_FORMAT_SYMBOL_G729_A              = $A103,
                    WAVE_FORMAT_VOICEAGE_AMR_WB            = $A104,
                    WAVE_FORMAT_INGENIENT_G726             = $A105,
                    WAVE_FORMAT_MPEG4_AAC                  = $A106,
                    WAVE_FORMAT_ENCORE_G726                = $A107,
                    WAVE_FORMAT_ZOLL_ASAO                  = $A108,
                    WAVE_FORMAT_SPEEX_VOICE                = $A109,
                    WAVE_FORMAT_VIANIX_MASC                = $A10A,
                    WAVE_FORMAT_WM9_SPECTRUM_ANALYZER      = $A10B,
                    WAVE_FORMAT_WMF_SPECTRUM_ANAYZER       = $A10C,
                    WAVE_FORMAT_GSM_610                    = $A10D,
                    WAVE_FORMAT_GSM_620                    = $A10E,
                    WAVE_FORMAT_GSM_660                    = $A10F,
                    WAVE_FORMAT_GSM_690                    = $A110,
                    WAVE_FORMAT_GSM_ADAPTIVE_MULTIRATE_WB  = $A111,
                    WAVE_FORMAT_POLYCOM_G722               = $A112,
                    WAVE_FORMAT_POLYCOM_G728               = $A113,
                    WAVE_FORMAT_POLYCOM_G729_A             = $A114,
                    WAVE_FORMAT_POLYCOM_SIREN              = $A115,
                    WAVE_FORMAT_GLOBAL_IP_ILBC             = $A116,
                    WAVE_FORMAT_RADIOTIME_TIME_SHIFT_RADIO = $A117,
                    WAVE_FORMAT_NICE_ACA                   = $A118,
                    WAVE_FORMAT_NICE_ADPCM                 = $A119,
                    WAVE_FORMAT_VOCORD_G721                = $A11A,
                    WAVE_FORMAT_VOCORD_G726                = $A11B,
                    WAVE_FORMAT_VOCORD_G722_1              = $A11C,
                    WAVE_FORMAT_VOCORD_G728                = $A11D,
                    WAVE_FORMAT_VOCORD_G729                = $A11E,
                    WAVE_FORMAT_VOCORD_G729_A              = $A11F,
                    WAVE_FORMAT_VOCORD_G723_1              = $A120,
                    WAVE_FORMAT_VOCORD_LBC                 = $A121,
                    WAVE_FORMAT_NICE_G728                  = $A122,
                    WAVE_FORMAT_FRACE_TELECOM_G729         = $A123,
                    WAVE_FORMAT_CODIAN                     = $A124,
                    WAVE_FORMAT_FLAC                       = $F1AC,
                    WAVE_FORMAT_EXTENSIBLE                 = $FFFE,
                    WAVE_FORMAT_DEVELOPMENT                = $FFFF );

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% THeaderRIFF

     THeaderRIFF = packed record
     private
     public
       Name :TAnsiChar4;
       Size :Cardinal;
       Kind :TAnsiChar4;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TChunk

     TChunk = packed record
     private
     public
       Name :TAnsiChar4;
       Size :Cardinal;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TChunkFMT

     TChunkFMT = packed record
     private
       ///// アクセス
       function GetName :TAnsiChar4;
       function GetSize :Cardinal;
       function GetChunk :TChunk;
     public
       Compression :Word;
       ChannelsN   :Word;
       SampleRate  :Cardinal;
       ByteRate    :Cardinal;
       BlockSize   :Word;
       SampleBits  :Word;
       ExtSize     :Word;
       ExtData     :array of Byte;
       ///// プロパティ
       property Name  :TAnsiChar4 read GetName;
       property Size  :Cardinal   read GetSize;
       property Chunk :TChunk     read GetChunk;
       ///// メソッド
       procedure Load( const F_:TFileStream; const Size_:Cardinal );
       procedure Save( const F_:TFileStream );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWave8c1

     TWave8c1 = packed record
     private
     public
       o :Byte;
       ///// 型変換
       class operator Implicit( const X_:Single ) :TWave8c1;
       class operator Implicit( const X_:TWave8c1 ) :Single;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWave8c2

     TWave8c2 = packed record
     private
     public
       L :Byte;
       R :Byte;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWave16c1

     TWave16c1 = packed record
     private
     public
       o :Smallint;
       ///// 型変換
       class operator Implicit( const X_:Single ) :TWave16c1;
       class operator Implicit( const X_:TWave16c1 ) :Single;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWave16c2

     PWave16c2 = ^TWave16c2;

     TWave16c2 = packed record
     private
     public
       L :Smallint;
       R :Smallint;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleWave2

     TSingleWave2 = record
     private
     public
       L :Single;
       R :Single;
       /////
       constructor Create( const L_,R_:Single );
       ///// 型変換
       class operator Implicit( const W_:TWave8c2 ) :TSingleWave2;
       class operator Implicit( const W_:TSingleWave2 ) :TWave8c2;
       class operator Implicit( const W_:TWave16c2 ) :TSingleWave2;
       class operator Implicit( const W_:TSingleWave2 ) :TWave16c2;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAV

     TFileWAV = class
     private
     protected
       _RIFF    :THeaderRIFF;
       _Format  :TChunkFMT;
       _SampleN :Integer;
       _Wave    :TArray<TWave16c2>;
       ///// アクセス
       function GetTotalTime :Single;
       function GetTypePCM :String;
       function GetWave( const I_:Integer ) :TWave16c2;
       procedure SetWave( const I_:Integer; const Wave_:TWave16c2 );
     public
       constructor Create; overload;
       constructor Create( const FileName_:String ); overload;
       destructor Destroy; override;
       ///// プロパティ
       property RIFF                     :THeaderRIFF read   _RIFF                   ;
       property Format                   :TChunkFMT   read   _Format                 ;
       property SampleN                  :Integer     read   _SampleN                ;
       property TotalTime                :Single      read GetTotalTime              ;
       property TypePCM                  :String      read GetTypePCM                ;
       property Wave[ const I_:Integer ] :TWave16c2   read GetWave      write SetWave;
       ///// メソッド
       procedure LoadFromFile( const FileName_:String );
       procedure SaveToFile( const FileName_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAVIter

     TFileWAVIter< TValue_ > = class( TIter1D< TValue_, TFileWAV > )
     private
     protected
       _CurrentP :PWave16c2;
     public
       constructor Create( const Parent_:TFileWAV; const HeadI_:Integer = 0; const StepX_:Integer = 1 );
       ///// メソッド
       procedure GoHead; override;
       procedure GoPrev; overload; override;
       procedure GoNext; overload; override;
       procedure GoPrev( const N_:Integer ); overload; override;
       procedure GoNext( const N_:Integer ); overload; override;
       procedure GoJump( const I_:Integer ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAVIterL

     TFileWAVIterL = class( TFileWAVIter< Single > )
     private
     protected
       ///// アクセス
       function GetValue :Single; override;
       procedure SetValue( const Value_:Single ); override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAVIterR

     TFileWAVIterR = class( TFileWAVIter< Single > )
     private
     protected
       ///// アクセス
       function GetValue :Single; override;
       procedure SetValue( const Value_:Single ); override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleWave2IterL

     TSingleWave2IterL = class( TArrayIter< Single, TSingleWave2 > )
     private
     protected
       ///// アクセス
       function GetValue :Single; override;
       procedure SetValue( const Value_:Single ); override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleWave2IterR

     TSingleWave2IterR = class( TArrayIter< Single, TSingleWave2 > )
     private
     protected
       ///// アクセス
       function GetValue :Single; override;
       procedure SetValue( const Value_:Single ); override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

    _ListPCM_ :TDictionary< Word, String >;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function ChunkToKind( const Name_:TAnsiChar4 ) :TChunkKind;

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% THeaderRIFF

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TChunk

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TChunkFMT

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TChunkFMT.GetName :TAnsiChar4;
begin
     Result := 'fmt ';
end;

function TChunkFMT.GetSize :Cardinal;
begin
     if ExtSize = 0 then Result := 16
                    else Result := 16 + SizeOf( ExtSize ) + ExtSize;
end;

function TChunkFMT.GetChunk :TChunk;
begin
     Result.Name := Name;
     Result.Size := Size;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

procedure TChunkFMT.Load( const F_:TFileStream; const Size_:Cardinal );
begin
     F_.Read( Self, 16 );

     if Size_ = 16 then
     begin
          ExtSize := 0;

          SetLength( ExtData, 0 );
     end
     else
     begin
          F_.Read( ExtSize, SizeOf( ExtSize ) );

          SetLength( ExtData, ExtSize );

          F_.Read( ExtData[0], ExtSize );
     end;
end;

procedure TChunkFMT.Save( const F_:TFileStream );
var
   C :TChunk;
begin
     C := Chunk;

     F_.Write( C, SizeOf( C ) );

     F_.Write( Self, 16 );

     if ExtSize > 0 then
     begin
          F_.Write( ExtSize, SizeOf( ExtSize ) );
          F_.Write( ExtData,         ExtSize   );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWave8c1

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

///////////////////////////////////////////////////////////////////////// 型変換

class operator TWave8c1.Implicit( const X_:Single ) :TWave8c1;
begin
     Result.o := Round( 128 + 127 * X_ );
end;

class operator TWave8c1.Implicit( const X_:TWave8c1 ) :Single;
begin
     Result := ( X_.o - 128 ) / 127;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWave8c2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWave16c1

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

///////////////////////////////////////////////////////////////////////// 型変換

class operator TWave16c1.Implicit( const X_:Single ) :TWave16c1;
begin
     Result.o := Round( X_ * 32767 );
end;

class operator TWave16c1.Implicit( const X_:TWave16c1 ) :Single;
begin
     Result := X_.o / 32767;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWave16c2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleWave2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleWave2.Create( const L_,R_:Single );
begin
     L := L_;
     R := R_;
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 型変換

class operator TSingleWave2.Implicit( const W_:TWave8c2 ) :TSingleWave2;
begin
     with Result do
     begin
          L := ( W_.L - 128 ) / 127;
          R := ( W_.R - 128 ) / 127;
     end
end;

class operator TSingleWave2.Implicit( const W_:TSingleWave2 ) :TWave8c2;
begin
     with Result do
     begin
          L := Round( 128 + 127 * W_.L );
          R := Round( 128 + 127 * W_.R );
     end
end;

class operator TSingleWave2.Implicit( const W_:TWave16c2 ) :TSingleWave2;
begin
     with Result do
     begin
          L := W_.L / 32767;
          R := W_.R / 32767;
     end
end;

class operator TSingleWave2.Implicit( const W_:TSingleWave2 ) :TWave16c2;
begin
     with Result do
     begin
          L := Round( W_.L * 32767 );
          R := Round( W_.R * 32767 );
     end
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAV

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX アクセス

function TFileWAV.GetTotalTime :Single;
begin
     Result := _SampleN / _Format.SampleRate;
end;

function TFileWAV.GetTypePCM :String;
begin
     Result := _ListPCM_.Items[ _Format.Compression ]
end;

function TFileWAV.GetWave( const I_:Integer ) :TWave16c2;
begin
     Result := _Wave[ I_ ]
end;

procedure TFileWAV.SetWave( const I_:Integer; const Wave_:TWave16c2 );
begin
     _Wave[ I_ ] := Wave_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TFileWAV.Create;
begin
     inherited;

end;

constructor TFileWAV.Create( const FileName_:String );
begin
     Create;

     LoadFromFile( FileName_ )
end;

destructor TFileWAV.Destroy;
begin

     inherited;
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX メソッド

procedure TFileWAV.LoadFromFile( const FileName_:String );
var
   F :TFileStream;
//-------------------------------------------------------
     procedure FindFMT;
     var
        C :TChunk;
     begin
          while F.Position < F.Size do
          begin
               F.Read( C, SizeOf( C ) );

               if C.Name = _Format.Name then
               begin
                    _Format.Load( F, C.Size );

                    Exit;
               end
               else F.Seek( C.Size, TSeekOrigin.soCurrent );
          end;

          Assert( False, '「fmt」チャンクが見つかりません。' );
     end;
     //--------------------------------------------------
     procedure FindDAT;
     var
        C :TChunk;
     begin
          while F.Position < F.Size do
          begin
               F.Read( C, SizeOf( C ) );

               if C.Name = 'data' then
               begin
                    _SampleN := C.Size div _Format.BlockSize;

                    SetLength( _Wave, _SampleN );

                    F.Read( _Wave[0], C.Size );

                    Exit;
               end
               else F.Seek( C.Size, TSeekOrigin.soCurrent );
          end;

          Assert( False, '「data」チャンクが見つかりません。' );
     end;
//-------------------------------------------------------
begin
     F := TFileStream.Create( FileName_, fmOpenRead );

     F.Read( _RIFF, SizeOf( _RIFF ) );

     with _RIFF do
     begin
          Assert( Name = 'RIFF', '"RIFF" = ' + Name );
          Assert( Kind = 'WAVE', '"WAVE" = ' + Kind );
     end;

     FindFMT;

     FindDAT;

     F.Free;
end;

procedure TFileWAV.SaveToFile( const FileName_:String );
var
   F :TFileStream;
   C :TChunk;
begin
     F := TFileStream.Create( FileName_, fmCreate );

     F.Write( _RIFF, SizeOf( _RIFF ) );

     _Format.Save( F );

     C.Name := 'data';
     C.Size := _SampleN * SizeOf( TWave16c2 );

     F.Write( C, SizeOf( C ) );
     F.Write( _Wave[0], C.Size );

     F.Free;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAVIter

constructor TFileWAVIter< TValue_ >.Create( const Parent_:TFileWAV; const HeadI_:Integer = 0; const StepX_:Integer = 1 );
begin
     inherited;

     TailI := High( _Parent._Wave );
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX メソッド

procedure TFileWAVIter< TValue_ >.GoHead;
begin
     _CurrentP := @_Parent._Wave[ _HeadI ];
end;

procedure TFileWAVIter< TValue_ >.GoPrev;
begin
     Dec( _CurrentP, _StepX )
end;

procedure TFileWAVIter< TValue_ >.GoNext;
begin
     Inc( _CurrentP, _StepX )
end;

procedure TFileWAVIter< TValue_ >.GoPrev( const N_:Integer );
begin
     Dec( _CurrentP, _StepX * N_ )
end;

procedure TFileWAVIter< TValue_ >.GoNext( const N_:Integer );
begin
     Inc( _CurrentP, _StepX * N_ )
end;

procedure TFileWAVIter< TValue_ >.GoJump( const I_:Integer );
begin
     _CurrentP := @_Parent._Wave[ _HeadI + StepX * I_ ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAVIterL

function TFileWAVIterL.GetValue :Single;
begin
     Result := TSingleWave2( _CurrentP^ ).L;
end;

procedure TFileWAVIterL.SetValue( const Value_:Single );
begin
     _CurrentP^ := TSingleWave2.Create( Value_, _CurrentP^.R );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileWAVIterR

function TFileWAVIterR.GetValue :Single;
begin
     Result := TSingleWave2( _CurrentP^ ).R;
end;

procedure TFileWAVIterR.SetValue( const Value_:Single );
begin
     _CurrentP^ := TSingleWave2.Create( _CurrentP^.L, Value_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleWave2IterL

function TSingleWave2IterL.GetValue :Single;
begin
     Result := _CurrentP.L;
end;

procedure TSingleWave2IterL.SetValue( const Value_:Single );
begin
     _CurrentP.L := Value_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleWave2IterR

function TSingleWave2IterR.GetValue :Single;
begin
     Result := _CurrentP.R;
end;

procedure TSingleWave2IterR.SetValue( const Value_:Single );
begin
     _CurrentP.R := Value_;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function ChunkToKind( const Name_:TAnsiChar4 ) :TChunkKind;
begin
     if Name_ = 'fmt ' then Result := ckFMT
                       else
     if Name_ = 'data' then Result := ckDATA
                       else
     if Name_ = 'fact' then Result := ckFACT
                       else
     if Name_ = 'cue ' then Result := ckCUE
                       else
     if Name_ = 'plst' then Result := ckPLST
                       else
     if Name_ = 'list' then Result := ckLIST
                       else
     if Name_ = 'labl' then Result := ckLABL
                       else
     if Name_ = 'note' then Result := ckNOTE
                       else
     if Name_ = 'ltxt' then Result := ckLTXT
                       else
     if Name_ = 'smpl' then Result := ckSMPL
                       else
     if Name_ = 'inst' then Result := ckINST

                       else

     if Name_ = 'bext' then Result := ckBEXT
                       else
     if Name_ = 'iXML' then Result := ckIXML
                       else
     if Name_ = 'qlty' then Result := ckQLTY
                       else
     if Name_ = 'mext' then Result := ckMEXT
                       else
     if Name_ = 'levl' then Result := ckLEVL
                       else
     if Name_ = 'link' then Result := ckLINK
                       else
     if Name_ = 'axml' then Result := ckAXML
                       else
     if Name_ = 'cont' then Result := ckCONT

                       else Result := ckNone;
end;

//############################################################################## □

procedure MakeListPCM;
begin
     _ListPCM_ := TDictionary< Word, String >.Create;

     with _ListPCM_ do
     begin
          Add( $0000, 'unknown' );
          Add( $0001, 'PCM Windows' );
          Add( $0002, 'MS ADPCM Windows' );
          Add( $0005, 'IBM CSVD' );
          Add( $0006, 'A-Law Windows' );
          Add( $0007, 'μ-Law Windows' );
          Add( $0010, 'OKI ADPCM' );
          Add( $0011, 'IMA/DVI ADPCM Windows' );
          Add( $0012, 'MediaSpace ADPCM' );
          Add( $0013, 'Sierra ADPCM' );
          Add( $0014, 'ADPCM (G.723)' );
          Add( $0015, 'DIGISTD' );
          Add( $0016, 'DIGIFIX' );
          Add( $0020, 'YAMAHA ADPCM' );
          Add( $0021, 'SONARC' );
          Add( $0022, 'TrueSpeech Windows' );
          Add( $0023, 'Echo Speech1' );
          Add( $0024, 'AF36 (Audiofile)' );
          Add( $0025, 'Apix' );
          Add( $0026, 'AF10 (Audiofile)' );
          Add( $0030, 'AC2 (Dolby)' );
          Add( $0031, 'GSM 6.10 Windows' );
          Add( $0033, 'ANTEX ADPCM' );
          Add( $0034, 'VQLPC (Control Resources)' );
          Add( $0035, 'DIGIREAL' );
          Add( $0036, 'DIGIADPCM' );
          Add( $0037, 'CR10 (Control Resources)' );
          Add( $0040, 'ADPCM (G.721)' );
          Add( $0101, 'IBM μ-LAW' );
          Add( $0102, 'IBM A-LAW' );
          Add( $0103, 'IBM ADPCM' );
          Add( $0200, 'Creative Labs ADPCM' );
          Add( $0300, 'FM TOWNS' );
          Add( $1000, 'Olivetti GSM' );
          Add( $1001, 'Olivetti ADPCM' );
          Add( $1002, 'Olivetti CELP' );
          Add( $1003, 'Olivetti SBC' );
          Add( $1004, 'Olivetti OPR' );
     end;
end;

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

     MakeListPCM;

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

     _ListPCM_.Free;

end. //######################################################################### ■
