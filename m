From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH] x86/xen: Calculate __max_logical_packages
	on PV domains
Date: Tue, 27 Feb 2018 17:08:00 +0000
Message-ID: <9a7c4dae-4758-5aca-b3af-2129b62719e2__49409.5450420447$1519751237$gmane$org@invisiblethingslab.com>
References: <20180207234923.13544-1-prarit@redhat.com>
 <5607eaea-5cc3-31a4-9685-1d7dd147f564@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1829761460960072596=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ineh=fv=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1eqijp-0007i2-B9
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 17:08:25 +0000
In-Reply-To: <5607eaea-5cc3-31a4-9685-1d7dd147f564@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: stable@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>, Juergen Gross <jgross@suse.com>, Andi Kleen <ak@linux.intel.com>, Dou Liyang <douly.fnst@cn.fujitsu.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org, linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>, Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Kate Stewart <kstewart@linuxfoundation.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1829761460960072596==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="JMngEWmMcPHWStrIjEXor47fA6wpJJMRn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JMngEWmMcPHWStrIjEXor47fA6wpJJMRn
Content-Type: multipart/mixed; boundary="2I3xzpHpxaU3zHZL2ruHtg5OjUjA6ry4H";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: stable@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Prarit Bhargava <prarit@redhat.com>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 Juergen Gross <jgross@suse.com>, Dou Liyang <douly.fnst@cn.fujitsu.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Lutomirski <luto@kernel.org>, Andi Kleen <ak@linux.intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, xen-devel@lists.xenproject.org
Message-ID: <9a7c4dae-4758-5aca-b3af-2129b62719e2@invisiblethingslab.com>
Subject: Re: [PATCH] x86/xen: Calculate __max_logical_packages on PV domains
References: <20180207234923.13544-1-prarit@redhat.com>
 <5607eaea-5cc3-31a4-9685-1d7dd147f564@oracle.com>
In-Reply-To: <5607eaea-5cc3-31a4-9685-1d7dd147f564@oracle.com>

--2I3xzpHpxaU3zHZL2ruHtg5OjUjA6ry4H
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Boris Ostrovsky:
> On 02/07/2018 06:49 PM, Prarit Bhargava wrote:
>> The kernel panics on PV domains because native_smp_cpus_done() is
>> only called for HVM domains.
>>
>> Calculate __max_logical_packages for PV domains.
>>
>> Fixes: b4c0a7326f5d ("x86/smpboot: Fix __max_logical_packages estimate=
")
>> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
>> Tested-and-reported-by: Simon Gaiser <simon@invisiblethingslab.com>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: "H. Peter Anvin" <hpa@zytor.com>
>> Cc: x86@kernel.org
>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> Cc: Juergen Gross <jgross@suse.com>
>> Cc: Dou Liyang <douly.fnst@cn.fujitsu.com>
>> Cc: Prarit Bhargava <prarit@redhat.com>
>> Cc: Kate Stewart <kstewart@linuxfoundation.org>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Andy Lutomirski <luto@kernel.org>
>> Cc: Andi Kleen <ak@linux.intel.com>
>> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
>> Cc: xen-devel@lists.xenproject.org
>=20
>=20
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

The fixed bug is in 4.15 so it should get into stable. It's
63e708f826bb21470155d37b103a75d8a9e25b18 upstream.


--2I3xzpHpxaU3zHZL2ruHtg5OjUjA6ry4H--

--JMngEWmMcPHWStrIjEXor47fA6wpJJMRn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlqVkIoACgkQkO9xfO/x
ly8mrA//VO8ImbrrDAH96dqEKxlkrZJR7d/c7BX5Wr7YYjRN/cRjCMJVTRpKAmjV
95mk8Ra4S0U2zlKV/sG02q5Ni/lgmPtOcHJ9SerVXywDaREHX+xoNc8yM/y4DWbE
uABPS8JFBhNfzCFSBqYjHeKrnPpniEdiZgl+YUZTRyx559gHU/wU0CH7II1IUvm9
SEanahC4xjPhLkSh0bfITimB+Dg6xPnG91ELAvCOkkGyfakHOC51I6+yafmX97io
ZvHjvTIOS1BeXQHVEWjs6s1P+F2v1pzl3ozvKCVDecK76WCd0RZWqMvOW9nXQkN3
XXKzYXBb4ZwcN3dCSlsCnIc2TdAJ2u0B4EubAyVRBGqFKV19uRK+geBInBsSuD0c
iE5aJkef4WnomDnGjQdpQZCYcpnwaG2qhLvdJ69jqw5Q6KdRKIQduCY5HGBR9s2Y
iBUX6gvtKxuVh3zAVBG9Gxt7MNRg9aPeqXGc4r5t13FyhPtxJDUULsafUVFMqY20
wmpry30hTOPveh//AWN88dS0gCuTCDFWTDqWfeVv8lnhm6+swEmDAHzamZv1EK1p
2HLG4a88e5+0gILmki/FRZEyk/tGwydmuukKyD442tyH6URAk637Frv9qQQO3xJS
5rWWL0j7JE942VQrLGtM93fQCnZdhrhX4rQQ8henRt1F2PjWyuA=
=7b7d
-----END PGP SIGNATURE-----

--JMngEWmMcPHWStrIjEXor47fA6wpJJMRn--


--===============1829761460960072596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1829761460960072596==--
