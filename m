From: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@ice.rwth-aachen.de>
Subject: Re: vgic initialization with maximum number of
 interrupt lines fails
Date: Fri, 22 Mar 2019 16:39:29 +0100
Message-ID: <6833242e-2258-2d6a-40fb-9ceb4711e5fb@ice.rwth-aachen.de>
References: <b5b240bd-2837-b404-f072-f229bd6fb766@ice.rwth-aachen.de>
 <ef416ee8-e523-56b4-c984-e0b3ea362333@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2166960247500807787=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ih5Y=RZ=ice.rwth-aachen.de=lukas.juenger@srs-us1.protection.inumbo.net>)
 id 1h7MGc-0002nh-OV
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 15:39:34 +0000
In-Reply-To: <ef416ee8-e523-56b4-c984-e0b3ea362333@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

--===============2166960247500807787==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms060009060503040208050809"

--------------ms060009060503040208050809
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/22/19 4:20 PM, Julien Grall wrote:
>=20
>=20
> On 22/03/2019 13:30, Lukas J=C3=BCnger wrote:
>> Hi all,
>=20
> Hi,
>=20

Hi Julien,

Thank you for your quick reply.

>> I use Xen in an ARMv8 simulator for research purposes.
>> I ran into the following problem during dom0 creation in vgic=20
>> initialization.
>> Bringup fails because -EINVAL is returned by the code below.
>>
>> xen/arch/arm/vgic.c in domain_vgic_init():
>> 132=C2=A0=C2=A0=C2=A0=C2=A0 nr_spis =3D ROUNDUP(nr_spis, 32);
>> 133
>> 134=C2=A0=C2=A0=C2=A0=C2=A0 /* Limit the number of virtual SPIs suppor=
ted to (1020 - 32) =3D=20
>> 988=C2=A0 */
>> 135=C2=A0=C2=A0=C2=A0=C2=A0 if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
>> 136=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>
>> nr_spis comes from config->arch.nr_spis in xen/arch/arm/domain.c in=20
>> arch_domain_create():
>> 702=C2=A0=C2=A0=C2=A0=C2=A0 if ( (rc =3D domain_vgic_init(d, config->a=
rch.nr_spis)) !=3D 0 )
>> 703=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto fail;
>>
>> arch.nr_spis comes from xen/arch/arm/setup.c in start_xen():
>> 891=C2=A0=C2=A0=C2=A0=C2=A0 dom0_cfg.arch.nr_spis =3D gic_number_lines=
() - 32;
>>
>> gic_number_lines() in xen/arch/arm/gic.c:
>> 62 unsigned int gic_number_lines(void)
>> 63 {
>> 64=C2=A0=C2=A0=C2=A0=C2=A0 return gic_hw_ops->info->nr_lines;
>> 65 }
>>
>> populated in xen/arch/arm/gic-v2.c in gicv2_dist_init:
>> 354=C2=A0=C2=A0=C2=A0=C2=A0 type =3D readl_gicd(GICD_TYPER);
>> 355=C2=A0=C2=A0=C2=A0=C2=A0 nr_lines =3D 32 * ((type & GICD_TYPE_LINES=
) + 1);
>> 356=C2=A0=C2=A0=C2=A0=C2=A0 /* Only 1020 interrupts are supported */
>> 357=C2=A0=C2=A0=C2=A0=C2=A0 nr_lines =3D min(1020U, nr_lines);
>> 358=C2=A0=C2=A0=C2=A0=C2=A0 gicv2_info.nr_lines =3D nr_lines;
>>
>> GICv2 supports up to 1020 interrupts.
>> In this case type will be (type & GICD_TYPE_LINES) will be 31, as the =

>> bits [4:0] of GICD_TYPER will be 1.
>> nr_lines will be 1024 and finally reduced to 1020, because of special =

>> purpose interrupts.
>> Later it will be rounded up to 1024 again and then the check will fail=
=2E
>> Is this expected behavior and if yes, why?
>=20
> This is a known issues I haven't had time to properly fix yet. The GIC =

> requires a multiple of 32 interrupts. In addition, the 2 vGIC=20
> implementation rely that all "existing" interrupts are fully implemente=
d.
>=20
> Some of the last lot of 32 interrupts (IRQ 992 - IRQ 1023) contains=20
> special purpose interrupts. The special purpose interrupts are not full=
y=20
> implemented. So it would expose a potential vulnerability issue if we=20
> were supporting up to 1020
> interrupts.
>=20

I was not aware that there were special interrupts starting from IRQ=20
992. The GICv2 architecture spec mentions only IRQ1020-1023 to be=20
special (Section 3.2.5).

> This is why we limit to 992 interrupts. As Dom0 exposes the same number=
=20
> of interrupts as the host, this is an issue on platform where the GIC=20
> report 1024 interrupts. AFAIK, those platforms are only virtual, so my =

> idea was to limit the number interrupts exposed to Dom0. Something like=
:
>=20
> dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), 992) - 32;
>=20
> Does you platform have interrupts wired above 992?

In my simulator I just reduced the number of interrupts reported to be=20
available by the GICv2 model. This solves the issue for my use case.

Thanks,
Lukas

> Cheers,
>=20
>>
>> Best regards,
>> Lukas
>>
>>
>> _______________________________________________
>> Xen-devel mailing list
>> Xen-devel@lists.xenproject.org
>> https://lists.xenproject.org/mailman/listinfo/xen-devel
>>
>=20



--------------ms060009060503040208050809
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
EL8wggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYT
AkRFMSswKQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYD
VQQLDBZULVN5c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFs
Um9vdCBDbGFzcyAyMB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNV
BAYTAkRFMUUwQwYDVQQKEzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVu
IEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERG
Ti1WZXJlaW4gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMtg1/9moUHN0vqHl4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZs
FVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8FXRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0p
eQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+BaL2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0
WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qLNupOkSk9s1FcragMvp0049ENF4N1
xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz9AkH4wKGMUZrAcUQDBHHWekC
AwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUk+PYMiba1fFKpZFK4OpL
4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYDVR0TAQH/BAgwBgEB
/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGCLB4wCAYGZ4EM
AQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUvcmwvVGVs
ZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYBBQUH
MAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5j
ZXIwDQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4
eTizDnS6dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/
MOaZ/SLick0+hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3S
PXez7vTXTf/D6OWST1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc2
2CzeIs2LgtjZeOJVEqM7h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bP
ZYoaorVyGTkwggWsMIIElKADAgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYD
VQQGEwJERTFFMEMGA1UEChM8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hl
biBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRE
Rk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcN
MzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9l
cmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UE
CwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp1xCeOdfZojDbchwFfylf
S2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6WLkDh0YNMZj0cZGnl
m6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mITQ5HjUhfZZkQ
0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUkP7agCwf9
TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22MZD08
WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAd
BgNVHQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK
4OpL4qIMz+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIu
cGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYB
BQUHAQEEgdAwgc0wMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1T
ZXJ2ZXIvT0NTUDBKBggrBgEFBQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwt
cm9vdC1nMi1jYS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9j
ZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0
MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21
rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCNT1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7L
n8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+lgQCXISoKTlslPwQkgZ7nu7YRrQb
tQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v9NsH1VuEGMGpuEvObJAaguS5
Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7EUkp2KgtdRXYShjqFu9V
NCIaE40GMIIF9TCCBN2gAwIBAgIMH82llPklWDm75neOMA0GCSqGSIb3DQEBCwUAMIGNMQsw
CQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRz
Y2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTE4MDkyODEzMDkyNloXDTIxMDky
NzEzMDkyNlowgYMxCzAJBgNVBAYTAkRFMRQwEgYDVQQKDAtSV1RIIEFhY2hlbjFGMEQGA1UE
Cww9SW5zdGl0dXRlIGZvciBDb21tdW5pY2F0aW9uIFRlY2hub2xvZ2llcyBhbmQgRW1iZWRk
ZWQgU3lzdGVtczEWMBQGA1UEAwwNTHVrYXMgSnVlbmdlcjCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMwu1968dVplCQF7E8qcfmH69j4wgk3F8l0dnyrJR44QUGNMQf1Q4Ap8
yYSr+WcJhlYQric47wcT6Cyd5PiUs6SyGp8p2vZPPpDUb4nw+Z6Y835I4aGUkbh0qSx+0ohN
sw+zMJC8bZNcQ00/nQy+s3EZ5J+UAmTlYHI57LX08XziB/MzHyEVljh2c/DT8tmGY67StN+G
dNqYBzZVADKHg/bufR4BenKCx7oX63xB/7tM4aZeMMbvb7f/W1gGOSOA8wMBL3ZVMZkFn2MS
a/Wl6ANUBKwd1fbP68h3zUM3EzPAzE2SJR4/W2aQwIkP5hcv3AKHKf0ewT6EHR5n20VhLacC
AwEAAaOCAlswggJXMEAGA1UdIAQ5MDcwDwYNKwYBBAGBrSGCLAEBBDARBg8rBgEEAYGtIYIs
AQEEAwgwEQYPKwYBBAGBrSGCLAIBBAMIMAkGA1UdEwQCMAAwDgYDVR0PAQH/BAQDAgXgMB0G
A1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQUpuj2DlDUOOzcO/iBS+QA
cUgXmRwwHwYDVR0jBBgwFoAUazqYi/nyU4na4K2yMh4JH+iqO3QwKwYDVR0RBCQwIoEgbHVr
YXMuanVlbmdlckBpY2Uucnd0aC1hYWNoZW4uZGUwgY0GA1UdHwSBhTCBgjA/oD2gO4Y5aHR0
cDovL2NkcDEucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jcmwvY2FjcmwuY3Js
MD+gPaA7hjlodHRwOi8vY2RwMi5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2Ny
bC9jYWNybC5jcmwwgdsGCCsGAQUFBwEBBIHOMIHLMDMGCCsGAQUFBzABhidodHRwOi8vb2Nz
cC5wY2EuZGZuLmRlL09DU1AtU2VydmVyL09DU1AwSQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAx
LnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSQYI
KwYBBQUHMAKGPWh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIv
Y2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcNAQELBQADggEBACbY4U3kbHN5OvhbAYBCD372
KyWiuSpSqJvPhKT/PdknlPyHgtCLP4ossyFS8dTsZw7nXa5Dw1YHVVdWTPv8kZrmuWVg1OkU
yFLTEt6AVtZTl6Hek2cNRbgz4rlxgobN1LOMtJ+ziIvCVPqCfPmCtwWGke7T7rZvVyFZyC7z
IW4fZAqZo4KAI7cMBOXDRdVSrCQ4PUr0JUdeaSe3kzSo/Dp0dqms1rjHsgG7eAtixGQGGdHB
xRn4xvgZY3lbJxP1uW9hZM1b+23uqRMvSeVITyV6nct3e0pnD3O8EA/WkUvHJsB5lJGUf8ip
snejDJ2Y3+d3l/4z14iu2o4qCbfRoAsxggQLMIIEBwIBATCBnjCBjTELMAkGA1UEBhMCREUx
RTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2No
dW5nc25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVp
biBHbG9iYWwgSXNzdWluZyBDQQIMH82llPklWDm75neOMA0GCWCGSAFlAwQCAQUAoIICPTAY
BgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTAzMjIxNTM5MzBa
MC8GCSqGSIb3DQEJBDEiBCDhKP5Bx8j1V9y0EE6Bo8eDna6wx6wNGc8KAaZmRM4p8TBsBgkq
hkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYI
KoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMIGv
BgkrBgEEAYI3EAQxgaEwgZ4wgY0xCzAJBgNVBAYTAkRFMUUwQwYDVQQKDDxWZXJlaW4genVy
IEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAO
BgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4gR2xvYmFsIElzc3VpbmcgQ0EC
DB/NpZT5JVg5u+Z3jjCBsQYLKoZIhvcNAQkQAgsxgaGggZ4wgY0xCzAJBgNVBAYTAkRFMUUw
QwYDVQQKDDxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVu
Z3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4g
R2xvYmFsIElzc3VpbmcgQ0ECDB/NpZT5JVg5u+Z3jjANBgkqhkiG9w0BAQEFAASCAQA8TJGz
kZ3JzHt+1farH9ZlM5BSwb1ZQZcEa9Lna/Zt8F0vrgQbvebnx6BvXQMsqrlEuNZVoMRJidea
C4fxYWL2/i/wk4IxvPeqV9vB3ewXT3dhYidLZ3ZhbRogKtX2txhjSmZSszwPsUGjD4O31NZ0
FHBg6+i9d1oW3Jc7LxJB0whrsrDyTbi485PPKTTVXNLptnjDl2K5vIc0a40lWuZI9gWO1LPE
OLn9sl+/6KIi9c+zdkY8wCGh/IaLCknSCOfYg0xI4C3FD0UBzyAUAxC1B11m+Ctq8l5wA5O3
qgsLLBs0t5ctE4GaFVaN0KgMwC/S/I0p0EI6fYB0IbD8k4dqAAAAAAAA
--------------ms060009060503040208050809--


--===============2166960247500807787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2166960247500807787==--
