From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH 2/3] x86: suppress BTI mitigations around S3
 suspend/resume
Date: Fri, 13 Apr 2018 18:34:00 +0000
Message-ID: <09e872a9-43c7-3220-49d1-4037f0e880f5@invisiblethingslab.com>
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <5AD09B2B02000078001BB0F4@prv1-mh.provo.novell.com>
 <93d8078e-b0c6-81a6-ab28-aa856c9ef0d5@invisiblethingslab.com>
 <14156d42-af09-3f51-6b5f-69aa654757d2@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3762555724062612271=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cx/4=hc=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f73X9-0006OD-Qo
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 18:34:51 +0000
In-Reply-To: <14156d42-af09-3f51-6b5f-69aa654757d2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3762555724062612271==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="fbXNOYkvKYIWxX7EAzRzaV8EKdg4ik4Px"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fbXNOYkvKYIWxX7EAzRzaV8EKdg4ik4Px
Content-Type: multipart/mixed; boundary="QfBthV6BLOFJbC7jDujZUmN1Q0XMp855Y";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
Message-ID: <09e872a9-43c7-3220-49d1-4037f0e880f5@invisiblethingslab.com>
Subject: Re: [PATCH 2/3] x86: suppress BTI mitigations around S3
 suspend/resume
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <5AD09B2B02000078001BB0F4@prv1-mh.provo.novell.com>
 <93d8078e-b0c6-81a6-ab28-aa856c9ef0d5@invisiblethingslab.com>
 <14156d42-af09-3f51-6b5f-69aa654757d2@citrix.com>
In-Reply-To: <14156d42-af09-3f51-6b5f-69aa654757d2@citrix.com>

--QfBthV6BLOFJbC7jDujZUmN1Q0XMp855Y
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Andrew Cooper:
> On 13/04/18 19:25, Simon Gaiser wrote:
>> Jan Beulich:
>>> NMI and #MC can occur at any time after S3 resume, yet the MSR_SPEC_C=
TRL
>>> may become available only once we're reloaded microcode. Make
>>> SPEC_CTRL_ENTRY_FROM_INTR_IST and DO_SPEC_CTRL_EXIT_TO_XEN no-ops for=

>>> the critical period of time.
>>>
>>> Also set the MSR back to its intended value.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/acpi/power.c
>>> +++ b/xen/arch/x86/acpi/power.c
>>> @@ -28,6 +28,7 @@
>>>  #include <asm/tboot.h>
>>>  #include <asm/apic.h>
>>>  #include <asm/io_apic.h>
>>> +#include <asm/spec_ctrl.h>
>>>  #include <acpi/cpufreq/cpufreq.h>
>>> =20
>>>  uint32_t system_reset_counter =3D 1;
>>> @@ -163,6 +164,7 @@ static int enter_state(u32 state)
>>>  {
>>>      unsigned long flags;
>>>      int error;
>>> +    struct cpu_info *ci;
>>>      unsigned long cr4;
>>> =20
>>>      if ( (state <=3D ACPI_STATE_S0) || (state > ACPI_S_STATES_MAX) )=

>>> @@ -210,6 +212,10 @@ static int enter_state(u32 state)
>>>      else
>>>          error =3D 0;
>>> =20
>>> +    ci =3D get_cpu_info();
>>> +    ci->use_shadow_spec_ctrl =3D 0;
>>> +    ci->bti_ist_info =3D 0;
>>> +
>>>      ACPI_FLUSH_CPU_CACHE();
>>> =20
>>>      switch ( state )
>>> @@ -248,6 +254,11 @@ static int enter_state(u32 state)
>>> =20
>>>      microcode_resume_cpu(0);
>>> =20
>>> +    ci->bti_ist_info =3D default_bti_ist_info;
>>> +    asm volatile (ALTERNATIVE("", "wrmsr", X86_FEATURE_XEN_IBRS_SET)=

>> This does not compile for me:
>>
>>   power.c: Assembler messages:
>>   power.c:272: Error: value of 257 too large for field of 1 bytes at 0=

>>
>> Changing the alternative based on the other "wrmsr" calls fixes it:
>>
>>   asm volatile (ALTERNATIVE(ASM_NOP3, "wrmsr", X86_FEATURE_XEN_IBRS_SE=
T)
>=20
> Ah - you're presumably back-porting this to 4.8?
>=20
> Jan's code is correct for staging, and your version here is correct for=

> all currently-released versions of Xen.  (I've done quite a lot of
> playing with alternatives generation for 4.11.)

Yeah, sorry, I should have checked if it works with staging.


--QfBthV6BLOFJbC7jDujZUmN1Q0XMp855Y--

--fbXNOYkvKYIWxX7EAzRzaV8EKdg4ik4Px
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlrQ+FQACgkQkO9xfO/x
ly/1jw/+NpR9XP8QvY7Vu6aygOQSAUOBBReu2DaoWPlzFvewjigF7VstgdROswsT
5BTjpVh/HhPPjVulLViK/ERornH6dUoXxYjM5Aa4velI0pj+VDWb03+SRGuOrP3t
qA/H2Cilbb/gJTVAkldsm3uEBwOPpCfN7jUobyG9tsMvhgz3HssIcqKWPuJq+r6f
Jt+45MIPZPu1dbw3/X2RaRheyc8dPn4btYXSbzhOOwm0IWzg+eM9VzVwGj3743Nd
yUXd9bWYu+XolyjgCEKZmYQg/SVrzqXRuYEqrFGjcVwFzPDWSF2Ipw29IuMMRFnF
8koynM9iZtmTgstR5DptRrwHiY6ZSRjfBumdk53LRmvKIX0ShfThbt/6G697UlJY
t5i/I3Dqrf0ULAB6hA4G3GnaFKZbwRTKz0BK7y1SZxgPE4lZYGj5FhN+Jm6FiVUC
KgepI2uUl7kpbmAVoyBLSjuzXshrtMhqQrPHC2Vyg/cm9I2c5C2WsvsLEdKZZca5
+h9gYqhKYD5CH0hOvyX/at35iMdsc5txdYoWHZBeHO5LfYj9qdwvrnbhZma/uUvE
9Yrh0MifV3J8RGOxnKpRnn/x2hskf+tT8sQ/wSq2DuJtw2FmiCXppS9xKwYH7AEG
2+kHRBG0i5KAO2p5fus3tUSRW9uP+pkgdiCFXLNIAT/ctjeaw38=
=nXHK
-----END PGP SIGNATURE-----

--fbXNOYkvKYIWxX7EAzRzaV8EKdg4ik4Px--


--===============3762555724062612271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3762555724062612271==--
