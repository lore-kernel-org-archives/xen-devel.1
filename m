From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH 3/3] x86: check feature flags after resume
Date: Fri, 13 Apr 2018 18:56:00 +0000
Message-ID: <8657d89c-ca48-2a81-3a12-35d62642b8a3@invisiblethingslab.com>
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <5AD09B5102000078001BB0F7@prv1-mh.provo.novell.com>
 <1c5ff5c3-3178-8d42-08ca-4711c7507ac1@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0815320864498210142=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cx/4=hc=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f73rW-0007u2-Di
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 18:55:54 +0000
In-Reply-To: <1c5ff5c3-3178-8d42-08ca-4711c7507ac1@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0815320864498210142==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ijIc7vlRD3EunagvKF6e6IWVL2JhutC7K"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ijIc7vlRD3EunagvKF6e6IWVL2JhutC7K
Content-Type: multipart/mixed; boundary="mQsoXCFDadQfBDuPSBnfP6cUEdirip9T4";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Message-ID: <8657d89c-ca48-2a81-3a12-35d62642b8a3@invisiblethingslab.com>
Subject: Re: [PATCH 3/3] x86: check feature flags after resume
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <5AD09B5102000078001BB0F7@prv1-mh.provo.novell.com>
 <1c5ff5c3-3178-8d42-08ca-4711c7507ac1@invisiblethingslab.com>
In-Reply-To: <1c5ff5c3-3178-8d42-08ca-4711c7507ac1@invisiblethingslab.com>

--mQsoXCFDadQfBDuPSBnfP6cUEdirip9T4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Simon Gaiser:
> Jan Beulich:
>> Make sure no previously present features are missing after resume (and=

>> the re-loading of microcode), to avoid later crashes or (likely silent=
)
>> hangs / live locks. This doesn't go beyond checking x86_capability[],
>> but this should be good enough for the immediate need of making sure
>> that the BIT mitigation MSRs are still available.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/acpi/power.c
>> +++ b/xen/arch/x86/acpi/power.c
>> @@ -254,6 +254,9 @@ static int enter_state(u32 state)
>> =20
>>      microcode_resume_cpu(0);
>> =20
>> +    if ( !recheck_cpu_features(0) )
>> +        panic("Missing previously available feature(s).");
>> +
>>      ci->bti_ist_info =3D default_bti_ist_info;
>>      asm volatile (ALTERNATIVE("", "wrmsr", X86_FEATURE_XEN_IBRS_SET)
>>                    :: "a" (SPEC_CTRL_IBRS), "c" (MSR_SPEC_CTRL), "d" (=
0)
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -501,6 +501,9 @@ void identify_cpu(struct cpuinfo_x86 *c)
>>  	printk("\n");
>>  #endif
>> =20
>> +	if (system_state =3D=3D SYS_STATE_resume)
>> +		return;
>> +
>>  	/*
>>  	 * On SMP, boot_cpu_data holds the common feature set between
>>  	 * all CPUs; so make sure that we indicate which features are
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -473,6 +473,28 @@ void __init init_guest_cpuid(void)
>>      calculate_hvm_max_policy();
>>  }
>> =20
>> +bool recheck_cpu_features(unsigned int cpu)
>> +{
>> +    bool okay =3D true;
>> +    struct cpuinfo_x86 c;
>> +    const struct cpuinfo_x86 *bsp =3D &boot_cpu_data;
>> +    unsigned int i;
>> +
>> +    identify_cpu(&c);
>=20
> This runs into a bug in identify_cpu(). x86_vendor_id does not get
> zeroed, so the x86_vendor_id is not null terminated and the vendor
> identification fails.
>=20
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index 4feaa2ceb6..5750d26216 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -366,8 +366,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
>         c->x86_vendor =3D X86_VENDOR_UNKNOWN;
>         c->cpuid_level =3D -1;    /* CPUID not detected */
>         c->x86_model =3D c->x86_mask =3D 0; /* So far unknown... */
> -       c->x86_vendor_id[0] =3D '\0'; /* Unset */
> -       c->x86_model_id[0] =3D '\0';  /* Unset */
> +       memset(&c->x86_vendor_id, 0, sizeof(c->x86_vendor_id));
> +       memset(&c->x86_model_id, 0, sizeof(c->x86_model_id));
>         c->x86_max_cores =3D 1;
>         c->x86_num_siblings =3D 1;
>         c->x86_clflush_size =3D 0;
>=20
> With this patch it works for me.

Meh, also a backport failure from me. Since e34bc403c3c7 this problem
should not appear since it does not assume a null terminated string.


--mQsoXCFDadQfBDuPSBnfP6cUEdirip9T4--

--ijIc7vlRD3EunagvKF6e6IWVL2JhutC7K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlrQ/UIACgkQkO9xfO/x
ly/lqBAAg7usRPuIvtYkfG/1+yaHav8nplKriuX8iE9UuuMMo3Ovy/ZjrVZ56xAd
poy4Jre3FQG0l6ubNgLqS8X539lkdLUeoARph7kZSPTPg6vdMEFRK4bgk2EuCUk8
RkUprWxqrurPn67me+ED7sfM3ObkiVD6akVJpFY5TmUsDQRC9D86RCkKJ2Pw6bX8
tVZTjhM738GSIpkLKRibjV9PFJZx+1U2aYr/j83Dbb7LkACQr+IVgHrDQYJbx2f+
bDvoZjpmWl8ywkN3v26bHD61ENPAe/9Nvmah3osSGme37Cw/tHUVBSjn6lSgIx3M
IvGbgARJ07rdzVM6yda0dIBL65WzGPrt9kwVmbzijkpXlnF8U/859Uma++mYhaxK
BCspybJQNiR1tus/Rzuhzn0aQFsqeXALwee7QHVDMBqZ35s07jTu7RK/auOjazr7
ywgmwzqNWUgwdrgIigfv1AJfrrRounsyDB4+irruZehuyE2KDeOKBBWMBV72a4EJ
2AKfkGP8qMyZNoUKGcUqujAzZcqm4frPlNTIBMv0+xpC4c4lv5bnit5olMU063wZ
JdPH4z0KeoLNlhxonpfn4ZNFvJGMtUGA7oVDvgMBwOipSV9spc/SwhmJlhTF3WZv
oiGG3H5pXw3OSw4jx5D4rkoX+eRETLbz3fNuNGGjhG5kJV7Yv8I=
=zilT
-----END PGP SIGNATURE-----

--ijIc7vlRD3EunagvKF6e6IWVL2JhutC7K--


--===============0815320864498210142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0815320864498210142==--
