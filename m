From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH 2/3] x86: suppress BTI mitigations around S3
 suspend/resume
Date: Fri, 13 Apr 2018 18:25:00 +0000
Message-ID: <93d8078e-b0c6-81a6-ab28-aa856c9ef0d5@invisiblethingslab.com>
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <5AD09B2B02000078001BB0F4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2783106552119014615=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cx/4=hc=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f73NZ-0005Ir-PV
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 18:24:57 +0000
In-Reply-To: <5AD09B2B02000078001BB0F4@prv1-mh.provo.novell.com>
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
--===============2783106552119014615==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="sxooTzC4hlIywygfMmfJfTIhsA7k5YSQw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sxooTzC4hlIywygfMmfJfTIhsA7k5YSQw
Content-Type: multipart/mixed; boundary="3zaPUIBPS8QaQoforATtueXEfsAgBhGmx";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Message-ID: <93d8078e-b0c6-81a6-ab28-aa856c9ef0d5@invisiblethingslab.com>
Subject: Re: [PATCH 2/3] x86: suppress BTI mitigations around S3
 suspend/resume
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <5AD09B2B02000078001BB0F4@prv1-mh.provo.novell.com>
In-Reply-To: <5AD09B2B02000078001BB0F4@prv1-mh.provo.novell.com>

--3zaPUIBPS8QaQoforATtueXEfsAgBhGmx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> NMI and #MC can occur at any time after S3 resume, yet the MSR_SPEC_CTR=
L
> may become available only once we're reloaded microcode. Make
> SPEC_CTRL_ENTRY_FROM_INTR_IST and DO_SPEC_CTRL_EXIT_TO_XEN no-ops for
> the critical period of time.
>=20
> Also set the MSR back to its intended value.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -28,6 +28,7 @@
>  #include <asm/tboot.h>
>  #include <asm/apic.h>
>  #include <asm/io_apic.h>
> +#include <asm/spec_ctrl.h>
>  #include <acpi/cpufreq/cpufreq.h>
> =20
>  uint32_t system_reset_counter =3D 1;
> @@ -163,6 +164,7 @@ static int enter_state(u32 state)
>  {
>      unsigned long flags;
>      int error;
> +    struct cpu_info *ci;
>      unsigned long cr4;
> =20
>      if ( (state <=3D ACPI_STATE_S0) || (state > ACPI_S_STATES_MAX) )
> @@ -210,6 +212,10 @@ static int enter_state(u32 state)
>      else
>          error =3D 0;
> =20
> +    ci =3D get_cpu_info();
> +    ci->use_shadow_spec_ctrl =3D 0;
> +    ci->bti_ist_info =3D 0;
> +
>      ACPI_FLUSH_CPU_CACHE();
> =20
>      switch ( state )
> @@ -248,6 +254,11 @@ static int enter_state(u32 state)
> =20
>      microcode_resume_cpu(0);
> =20
> +    ci->bti_ist_info =3D default_bti_ist_info;
> +    asm volatile (ALTERNATIVE("", "wrmsr", X86_FEATURE_XEN_IBRS_SET)

This does not compile for me:

  power.c: Assembler messages:
  power.c:272: Error: value of 257 too large for field of 1 bytes at 0

Changing the alternative based on the other "wrmsr" calls fixes it:

  asm volatile (ALTERNATIVE(ASM_NOP3, "wrmsr", X86_FEATURE_XEN_IBRS_SET)

> +                  :: "a" (SPEC_CTRL_IBRS), "c" (MSR_SPEC_CTRL), "d" (0=
)
> +                  : "memory");
> +
>   done:
>      spin_debug_enable();
>      local_irq_restore(flags);


--3zaPUIBPS8QaQoforATtueXEfsAgBhGmx--

--sxooTzC4hlIywygfMmfJfTIhsA7k5YSQw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlrQ9gIACgkQkO9xfO/x
ly+tCw//YhOn/P4VWURPPQAahFZr7Qm1GUlHBdS9sKDw/yTXihAH1gy6gwz5aXDW
5LpOlmAc1YuGEkA0lOVK7Bodt7lzOgUd3HHYrwCKddwM+UM0Fw6GoI2fOoEAyvF2
vMEPuwysJ4zgQqgqfX00cUx1zBeqx/GywvyMJ+vSiGnhHJkoW2uMg8ThNZXaJ3G/
udZQVgxJ1HUG02LY1ULmXGXkXbw3oTSEhTvvIHFYFqBHyMl+EX1mjmGCeolDeFMr
LFZqpkdWTl64HmG8uwERzVDHksfhUmsodngWIj+MWwWSc4EBxoPhVXvkBQk0MDng
Gcg9Jak1nC3TXQfubZdL5nLZ886pfEmBwU+vWGgLfDJEU1PoJdHALrWTe7HTs1aR
Ty7sb8V6pehio/+47EXD+Dhvopok3uwCsFK3hHHgMQKxCuC239ShM2KBcHyU9bV1
HDCeTGn3lXV9bc9DLQzYhi1hbhR4yJ24fPFUdtJQWTlx7jlrDnxaPZGJlWUcrHro
mSiG6/L0SgYNQ3oVgFvm+QAJbTeK9woHGxevkyI+r26PGRFwtjv2n6tgCobXID68
Al0XppWyjD4OFtuZiOkkvKm6ENU+/J9GYAIqSrH1cd2JpdslzHsXgFvzdwQgL/Lt
6dcctii3oFKlALzvKtkIMpgY2YzddSUWVBjT3ej/qReD3uSz0Jc=
=Nbme
-----END PGP SIGNATURE-----

--sxooTzC4hlIywygfMmfJfTIhsA7k5YSQw--


--===============2783106552119014615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2783106552119014615==--
