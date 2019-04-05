Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED39EC10F00
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 13:54:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE5820693
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 13:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAE5820693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ice.rwth-aachen.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCPIn-0004Fv-TK; Fri, 05 Apr 2019 13:54:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0G5W=SH=ice.rwth-aachen.de=lukas.juenger@srs-us1.protection.inumbo.net>)
 id 1hCPIm-0004Fm-TP
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 13:54:40 +0000
X-Inumbo-ID: 57bdc18c-57aa-11e9-a0c7-13bcbb3c35b3
Received: from mail-out-2.itc.rwth-aachen.de (unknown [134.130.5.47])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57bdc18c-57aa-11e9-a0c7-13bcbb3c35b3;
 Fri, 05 Apr 2019 13:54:34 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BbAABQXadc/5wagoZlGgEBAQEBAgEBA?=
 =?us-ascii?q?QEHAgEBAQGBZYIRghIKhASVR5hagWcLBAEshEAChVMiOBIBAQMBAQkBAwJtKIV?=
 =?us-ascii?q?LAQUjVhAJAhgVFQICAlUGAQwBBQIBAYMeAYF1lA+bZYEviSZ+DwkBgSaBTIl7g?=
 =?us-ascii?q?haBOII9Lj6Dfw4GcIJLglcDpXUHAoEpg0yCEox0IItOBYkCi1OTdwICAgIJAhW?=
 =?us-ascii?q?BZiGBVnEugw2CFheOIT4ygSiMdwElgQgBgR8BAQ?=
X-IPAS-Result: =?us-ascii?q?A2BbAABQXadc/5wagoZlGgEBAQEBAgEBAQEHAgEBAQGBZYI?=
 =?us-ascii?q?RghIKhASVR5hagWcLBAEshEAChVMiOBIBAQMBAQkBAwJtKIVLAQUjVhAJAhgVF?=
 =?us-ascii?q?QICAlUGAQwBBQIBAYMeAYF1lA+bZYEviSZ+DwkBgSaBTIl7ghaBOII9Lj6Dfw4?=
 =?us-ascii?q?GcIJLglcDpXUHAoEpg0yCEox0IItOBYkCi1OTdwICAgIJAhWBZiGBVnEugw2CF?=
 =?us-ascii?q?heOIT4ygSiMdwElgQgBgR8BAQ?=
X-IronPort-AV: E=Sophos;i="5.60,312,1549926000"; 
 d="p7s'?scan'208";a="74445008"
Received: from rwthex-w1-a.rwth-ad.de ([134.130.26.156])
 by mail-in-2.itc.rwth-aachen.de with ESMTP; 05 Apr 2019 15:54:33 +0200
Received: from [137.226.91.156] (137.226.91.156) by rwthex-w1-a.rwth-ad.de
 (2a00:8a60:1:e500::26:156) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 5 Apr
 2019 15:54:32 +0200
To: Julien Grall <julien.grall@arm.com>, Lukas Juenger
 <juenger@ice.rwth-aachen.de>, <xen-devel@lists.xenproject.org>
References: <50fee047-6463-4524-9449-51555ed59277@rwthex-w1-a.rwth-ad.de>
 <a253ffd9-c71f-ccd5-1d65-5b6a0116d7e9@arm.com>
From: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@ice.rwth-aachen.de>
Date: Fri, 5 Apr 2019 15:54:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a253ffd9-c71f-ccd5-1d65-5b6a0116d7e9@arm.com>
X-Originating-IP: [137.226.91.156]
X-ClientProxiedBy: rwthex-w1-b.rwth-ad.de (2a00:8a60:1:e500::26:157) To
 rwthex-w1-a.rwth-ad.de (2a00:8a60:1:e500::26:156)
Message-ID: <d15820dc-5a8d-418b-820f-638453c70878@rwthex-w1-a.rwth-ad.de>
Subject: Re: [Xen-devel] [PATCH] arm/dom0: Add check for maximum number of
 supported vGIC IRQs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/mixed; boundary="===============3726549670274523185=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405135432.G2kCGhFVneoRem3TE_z2NbmZOHUQIpF-ordTSQYj9eA@z>

--===============3726549670274523185==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms050903000606040805060900"

--------------ms050903000606040805060900
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 4/1/19 1:24 PM, Julien Grall wrote:
> Hi Lukas,
Hi,
>=20
> You sent this patch twice. Is there any difference between the two?
No, they are the same. I accidentally send it twice.
>=20
> On 3/27/19 7:19 AM, Lukas Juenger wrote:
>> Xen's vGIC implementation supports a maximum number of 992 IRQ lines.
>=20
> NIT:=C2=A0 The correct term is Interrupt Lines.
>=20
>> GICv2 specification allows for 1020 IRQ lines.
> This is common code, so we should also take into account the other GIC =

> versions we support.
>=20
>=20
>=20
>> This commit adds a check for this discrepancy.
>=20
> Your commit message should explain why reducing to 992 Interrupts lines=
=20
> is fine. How about the following commit title and message?
>=20
> "xen/arm: Cap the number interrupts of lines for dom0
>=20
> Dom0 vGIC will use the same number interrupt lines as the hardware GIC.=
=20
> While the hardware GIC can support up to 1019 interrupt lines, the vGIC=
=20
> is only supporting up to 992 interrupt lines.
>=20
> This means Xen will not be able to boot on platform where the hardware =

> GIC supports more the 992 interrupt lines.
>=20
> While it would make sense to increase the limits in the vGICs, this is =

> not trivial because of the design choices.
>=20
> At the moment, only models seem to report the maximum of interrupt=20
> lines. They also don't have any interrupt wired above the 992 limits.
> So this would be fine to cap the interrupt for Dom0 to 992 lines.
> "
>=20
>>
>> Signed-off-by: Lukas Juenger (juenger@ice.rwth-aachen.de)
>=20
> We tend to encapsulate the e-mail between <...> and not (...).
>=20
I adapted the patch according to your suggestions above.
>> ---
>> =C2=A0 xen/arch/arm/setup.c | 8 +++++++-
>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 444857a967..37b3648a18 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -888,7 +888,13 @@ void __init start_xen(unsigned long=20
>> boot_phys_offset,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Create initial domain 0. */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* The vGIC for DOM0 is exactly emulati=
ng the hardware GIC */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dom0_cfg.arch.gic_version =3D XEN_DOMCT=
L_CONFIG_GIC_NATIVE;
>> -=C2=A0=C2=A0=C2=A0 dom0_cfg.arch.nr_spis =3D gic_number_lines() - 32;=

>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Xen vGIC supports a maximum of 992 IRQ lin=
es.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * 32 are substracted to cover local IRQs.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), =
(unsigned int)=20
>> 992) - 32;
>> +=C2=A0=C2=A0=C2=A0 if ( gic_number_lines() > 992 )
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk(XENLOG_WARNING "Max=
imum number of vGIC IRQs=20
>> exceeded.\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dom0_cfg.max_vcpus =3D dom0_max_vcpus()=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dom0 =3D domain_create(0, &dom0_cfg, tr=
ue);
>>
>=20
> Cheers,
>=20
Thanks for you input,
Lukas


--------------ms050903000606040805060900
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
BgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA0MDUxMzU0MzJa
MC8GCSqGSIb3DQEJBDEiBCCyQULWX/XpHSyP0BC2sO2GydPbREG2js3oO+atLc1VCjBsBgkq
hkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYI
KoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMIGv
BgkrBgEEAYI3EAQxgaEwgZ4wgY0xCzAJBgNVBAYTAkRFMUUwQwYDVQQKDDxWZXJlaW4genVy
IEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAO
BgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4gR2xvYmFsIElzc3VpbmcgQ0EC
DB/NpZT5JVg5u+Z3jjCBsQYLKoZIhvcNAQkQAgsxgaGggZ4wgY0xCzAJBgNVBAYTAkRFMUUw
QwYDVQQKDDxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVu
Z3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4g
R2xvYmFsIElzc3VpbmcgQ0ECDB/NpZT5JVg5u+Z3jjANBgkqhkiG9w0BAQEFAASCAQAs6m5H
bUbJ3R4Hkh2miowZItUgRS32EMC/H4SyDkhdUbATUcTm+UdFfJRQT5fIVg6nfrBkGBXImg34
tmtjXu8C2Xc2oHvXjdB8nilVYUi4kefYUM9Kmyz8jWeZHdap0vD+RIWHvMmzxLjA8o0t0aKR
rgihLop8WtJKoLlgPPDycPszPvaSvyB3sh/5h5+pYQC0g0MTKE8NNsDGpk8y6XGH6n4ZH7wb
jRAf1TfPmxcFF9W3VKIOH1kV3mS3LqH1ldK3As5fCsKVV54XsX+uioeh6MFxk0Ban13ItIlr
NV0QDaMzv2hvf9YCLSWWIGdvRNJWo+sL5yFH20vSJsJg1E7JAAAAAAAA
--------------ms050903000606040805060900--


--===============3726549670274523185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3726549670274523185==--

