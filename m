From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH 3/3] x86: check feature flags after resume
Date: Fri, 13 Apr 2018 18:29:00 +0000
Message-ID: <1c5ff5c3-3178-8d42-08ca-4711c7507ac1@invisiblethingslab.com>
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <5AD09B5102000078001BB0F7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5406513095022189902=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cx/4=hc=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f73Rz-0005ea-CI
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 18:29:31 +0000
In-Reply-To: <5AD09B5102000078001BB0F7@prv1-mh.provo.novell.com>
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
--===============5406513095022189902==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ZnhcFQ1P9I0yAAjwhrISEQMgA771IH6Qr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZnhcFQ1P9I0yAAjwhrISEQMgA771IH6Qr
Content-Type: multipart/mixed; boundary="xk5bLDdCVuYZb4RD5cYG3Vvtd3PrzRcjk";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Message-ID: <1c5ff5c3-3178-8d42-08ca-4711c7507ac1@invisiblethingslab.com>
Subject: Re: [PATCH 3/3] x86: check feature flags after resume
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <5AD09B5102000078001BB0F7@prv1-mh.provo.novell.com>
In-Reply-To: <5AD09B5102000078001BB0F7@prv1-mh.provo.novell.com>

--xk5bLDdCVuYZb4RD5cYG3Vvtd3PrzRcjk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> Make sure no previously present features are missing after resume (and
> the re-loading of microcode), to avoid later crashes or (likely silent)=

> hangs / live locks. This doesn't go beyond checking x86_capability[],
> but this should be good enough for the immediate need of making sure
> that the BIT mitigation MSRs are still available.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -254,6 +254,9 @@ static int enter_state(u32 state)
> =20
>      microcode_resume_cpu(0);
> =20
> +    if ( !recheck_cpu_features(0) )
> +        panic("Missing previously available feature(s).");
> +
>      ci->bti_ist_info =3D default_bti_ist_info;
>      asm volatile (ALTERNATIVE("", "wrmsr", X86_FEATURE_XEN_IBRS_SET)
>                    :: "a" (SPEC_CTRL_IBRS), "c" (MSR_SPEC_CTRL), "d" (0=
)
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -501,6 +501,9 @@ void identify_cpu(struct cpuinfo_x86 *c)
>  	printk("\n");
>  #endif
> =20
> +	if (system_state =3D=3D SYS_STATE_resume)
> +		return;
> +
>  	/*
>  	 * On SMP, boot_cpu_data holds the common feature set between
>  	 * all CPUs; so make sure that we indicate which features are
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -473,6 +473,28 @@ void __init init_guest_cpuid(void)
>      calculate_hvm_max_policy();
>  }
> =20
> +bool recheck_cpu_features(unsigned int cpu)
> +{
> +    bool okay =3D true;
> +    struct cpuinfo_x86 c;
> +    const struct cpuinfo_x86 *bsp =3D &boot_cpu_data;
> +    unsigned int i;
> +
> +    identify_cpu(&c);

This runs into a bug in identify_cpu(). x86_vendor_id does not get
zeroed, so the x86_vendor_id is not null terminated and the vendor
identification fails.

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 4feaa2ceb6..5750d26216 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -366,8 +366,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
        c->x86_vendor =3D X86_VENDOR_UNKNOWN;
        c->cpuid_level =3D -1;    /* CPUID not detected */
        c->x86_model =3D c->x86_mask =3D 0; /* So far unknown... */
-       c->x86_vendor_id[0] =3D '\0'; /* Unset */
-       c->x86_model_id[0] =3D '\0';  /* Unset */
+       memset(&c->x86_vendor_id, 0, sizeof(c->x86_vendor_id));
+       memset(&c->x86_model_id, 0, sizeof(c->x86_model_id));
        c->x86_max_cores =3D 1;
        c->x86_num_siblings =3D 1;
        c->x86_clflush_size =3D 0;

With this patch it works for me.

> +
> +    for ( i =3D 0; i < NCAPINTS; ++i )
> +    {
> +        if ( !(~c.x86_capability[i] & bsp->x86_capability[i]) )
> +            continue;
> +
> +        printk(XENLOG_ERR "CPU%u: cap[%2u] is %08x (expected %08x)\n",=

> +               cpu, i, c.x86_capability[i], bsp->x86_capability[i]);
> +        okay =3D false;
> +    }
> +
> +    return okay;
> +}
> +
>  const uint32_t *lookup_deep_deps(uint32_t feature)
>  {
>      static const struct {
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -90,11 +90,14 @@ void initialize_cpu_data(unsigned int cp
>      cpu_data[cpu] =3D boot_cpu_data;
>  }
> =20
> -static void smp_store_cpu_info(int id)
> +static bool smp_store_cpu_info(unsigned int id)
>  {
>      unsigned int socket;
> =20
> -    identify_cpu(&cpu_data[id]);
> +    if ( system_state !=3D SYS_STATE_resume )
> +        identify_cpu(&cpu_data[id]);
> +    else if ( !recheck_cpu_features(id) )
> +        return false;
> =20
>      socket =3D cpu_to_socket(id);
>      if ( !socket_cpumask[socket] )
> @@ -102,6 +105,8 @@ static void smp_store_cpu_info(int id)
>          socket_cpumask[socket] =3D secondary_socket_cpumask;
>          secondary_socket_cpumask =3D NULL;
>      }
> +
> +    return true;
>  }
> =20
>  /*
> @@ -187,12 +192,19 @@ static void smp_callin(void)
>      setup_local_APIC();
> =20
>      /* Save our processor parameters. */
> -    smp_store_cpu_info(cpu);
> +    if ( !smp_store_cpu_info(cpu) )
> +    {
> +        printk("CPU%u: Failed to validate features - not coming back o=
nline\n",
> +               cpu);
> +        cpu_error =3D -ENXIO;
> +        goto halt;
> +    }
> =20
>      if ( (rc =3D hvm_cpu_up()) !=3D 0 )
>      {
>          printk("CPU%d: Failed to initialise HVM. Not coming online.\n"=
, cpu);
>          cpu_error =3D rc;
> +    halt:
>          clear_local_APIC();
>          spin_debug_enable();
>          cpu_exit_clear(cpu);
> --- a/xen/include/asm-x86/cpuid.h
> +++ b/xen/include/asm-x86/cpuid.h
> @@ -253,6 +253,9 @@ static inline void cpuid_featureset_to_p
>  extern struct cpuid_policy raw_cpuid_policy, host_cpuid_policy,
>      pv_max_cpuid_policy, hvm_max_cpuid_policy;
> =20
> +/* Check that all previously present features are still available. */
> +bool recheck_cpu_features(unsigned int cpu);
> +
>  /* Allocate and initialise a CPUID policy suitable for the domain. */
>  int init_domain_cpuid_policy(struct domain *d);
> =20


--xk5bLDdCVuYZb4RD5cYG3Vvtd3PrzRcjk--

--ZnhcFQ1P9I0yAAjwhrISEQMgA771IH6Qr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlrQ9xUACgkQkO9xfO/x
ly8IehAAncbA3zlH0iQsII029x1V4bjqcFr7N3DXHrwX/QtOhawD7jDAlwVtt5P4
DJT/FWP9vp5OuToeQ31I19RnAC7pm/eweO7hYkirA3nEe429103q7mQKnr+hx1rT
Y1vPqbcTknlk790jBtR6vcUH3f1aPfuZoQIN8J9dwPkOMV9ppBmI+WehafrLZKLH
RDFBf37pf6g95gx8FsAYviETN+3VOD36AdiZChm/pa9YVkOozFNpIg/k7KID6u1x
oHEcX+oHl8nwkT9ufRcQ2Vg7j4u12cpfHtkho08mm8OFBqZxT2CK6e8wJwF3tNHK
Y9G21aAefJxO3nGJN3r/bXzOLDooR6yahUmMEvY+pRCHOisN3gaC5Rb54cGKdO4B
TKaiyBPzivQtaJbAL7rlMhstaAsNsjbMERGgmQ0UuiS/nx/SpkEYCb/isaEq4AEf
VHWqZNCn7JHC8hAtQBHnzNfyNXWHczTDqXfc5UKZHgUDwt9WuBTZpeWrXl/3XmMP
E6mB8QpeqUkNuUNbzM/ITVDYnCTiYcHBkRfSVqw1UqJEUXlFnaPU7hC19Ypu/amd
1U14noDb42oS/7YHRDVor++YjQd+2If8JELb/zsSgEGA4T0KTN2r6JbpORzhaQpM
afKMrhzMLB65d/tQ4ObNyM+KWbvbhQk8HXT6C2eud0spJiG75HY=
=sNjp
-----END PGP SIGNATURE-----

--ZnhcFQ1P9I0yAAjwhrISEQMgA771IH6Qr--


--===============5406513095022189902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5406513095022189902==--
