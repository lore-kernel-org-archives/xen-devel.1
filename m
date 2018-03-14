From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [xen-unstable-smoke bisection] complete
 build-arm64-xsm
Date: Wed, 14 Mar 2018 08:42:32 -0500
Message-ID: <66849ecf-4f84-a1fc-dfbf-64b5293a7c1d@cardoe.com>
References: <E1evwAL-0001ri-7m@osstest.test-lab.xenproject.org>
 <5AA8E46602000078001B1591@prv-mh.provo.novell.com>
 <04f8a92f-0e9f-a256-8d6f-127457a4d114@citrix.com>
 <20180314105447.3tjfpeek535lxtbq@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5377419344962029504=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=12qi=ge=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ew6fw-0008D7-0x
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 13:42:40 +0000
Received: by mail-yw0-x22d.google.com with SMTP id l24so2134930ywk.6
 for <xen-devel@lists.xenproject.org>; Wed, 14 Mar 2018 06:42:38 -0700 (PDT)
In-Reply-To: <20180314105447.3tjfpeek535lxtbq@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, osstest-admin@xenproject.org, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5377419344962029504==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="0yawZzxqv3VzkmeV51rii5J2clqbu5b0t"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0yawZzxqv3VzkmeV51rii5J2clqbu5b0t
Content-Type: multipart/mixed; boundary="SsqkoBHxxHH9BHq3tmC0rDQckIJg1zeUR";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org,
 osstest-admin@xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <66849ecf-4f84-a1fc-dfbf-64b5293a7c1d@cardoe.com>
Subject: Re: [Xen-devel] [xen-unstable-smoke bisection] complete
 build-arm64-xsm
References: <E1evwAL-0001ri-7m@osstest.test-lab.xenproject.org>
 <5AA8E46602000078001B1591@prv-mh.provo.novell.com>
 <04f8a92f-0e9f-a256-8d6f-127457a4d114@citrix.com>
 <20180314105447.3tjfpeek535lxtbq@citrix.com>
In-Reply-To: <20180314105447.3tjfpeek535lxtbq@citrix.com>

--SsqkoBHxxHH9BHq3tmC0rDQckIJg1zeUR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/14/18 5:54 AM, Wei Liu wrote:
> On Wed, Mar 14, 2018 at 09:01:10AM +0000, Andrew Cooper wrote:
>> On 14/03/2018 07:59, Jan Beulich wrote:
>>>>>> On 14.03.18 at 03:29, <osstest-admin@xenproject.org> wrote:
>>>> branch xen-unstable-smoke
>>>> xenbranch xen-unstable-smoke
>>>> job build-arm64-xsm
>>>> testid xen-build
>>>>
>>>> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
>>>> Tree: xen git://xenbits.xen.org/xen.git
>>>>
>>>> *** Found and reproduced problem changeset ***
>>>>
>>>>   Bug is in tree:  xen git://xenbits.xen.org/xen.git
>>>>   Bug introduced:  b43501451733193b265de30fd79a764363a2a473
>>>>   Bug not present: eef83fd2af0d4c78afec34c199c977fc97d8a0b3
>>>>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/=
120707/=20
>>>>
>>>>
>>>>   commit b43501451733193b265de30fd79a764363a2a473
>>>>   Author: Doug Goldstein <cardoe@cardoe.com>
>>>>   Date:   Mon Mar 12 23:06:51 2018 -0500
>>>>  =20
>>>>       tools: detect appropriate debug optimization level
>>>>      =20
>>>>       When building debug use -Og as the optimization level if its a=
vailable,
>>>>       otherwise retain the use of -O0. -Og has been added by GCC to =
enable all
>>>>       optimizations that to not affect debugging while retaining ful=
l
>>>>       debugability.
>>>>      =20
>>>>       Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
>>>>       Acked-by: Wei Liu <wei.liu2@citrix.com>
>>> Sadly altering optimization levels always has the potential of
>>> triggering issues like this:
>>>
>>> xc_dom_arm.c: In function 'meminit':
>>> xc_dom_arm.c:446:5: error: 'p2m_size' may be used uninitialized in th=
is function [-Werror=3Dmaybe-uninitialized]
>>>      for ( pfn =3D 0; pfn < p2m_size; pfn++ )
>>>      ^
>>> cc1: all warnings being treated as errors
>>> /home/osstest/build.120709.build-arm64-xsm/xen/tools/libxc/../../tool=
s/Rules.mk:230: recipe for target 'xc_dom_arm.o' failed
>>> make[5]: *** [xc_dom_arm.o] Error 1
>>
>> We really should be build testing things at all optimisation levels.=C2=
=A0 We
>> should be ashamed that -O3 gives build failures in most of our major
>> components.=C2=A0 (This is yet another item on my TODO list which I've=
 not
>> had time to complete.)
>=20
> I agree with your opinion in general.
>=20
> In this particular case, I think the compiler is to be blamed. p2m_size=

> should have been initialised in a previous loop by the time the code
> comes to the place gcc complained.
>=20
> Wei.
>=20

Agreed. But the compiler used by osstest won't be changing any time soon
to pick up fixes.

What would the ARM maintainers like me to do? Initialize it to 0 at the t=
op?

--=20
Doug Goldstein


--SsqkoBHxxHH9BHq3tmC0rDQckIJg1zeUR--

--0yawZzxqv3VzkmeV51rii5J2clqbu5b0t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlqpJshfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl3TPg/+JE0bvGyPI7bsQklUcJJCeJF4gWGgtjx3owvtVb7OprQZtNnvEiQKX6Gg
mlTriAC/V//b7/usAbrXq4YGTtCPofIKRQ3CAu4PzRX89CaAYEAs9h2qMV01rdmB
7JXmWilsl7xVhCuDIPg3frrRZ6b19IiVNxuL3MJKVwFDr/QUHL2XU1Oc+z00S5PV
+KoovXqXgs4ynfIihzGXa94iS+08kQ0YRBwUnlWSefHubq/9SbsI1VwqAtMxlUGW
Dw6mZLaIvR6+xqRS9f2AYMApIT7WnxxYMgymd6BR5rNMN96QaTnHt4ck7iJA+pUY
YK+kL/CLr3Ss4lHZr+t/v3KpW0AeZ1+FxgkPNSghz7rvlF+XGIUHc0MKrJOPuRf0
c8d/M9YujSQ5IHA14I2LI9dzYxzu7YTP7ZFgjqqGskk+WCCsry+5M4Vbk0mxOLEL
Jho2CZtbnTfgCOCSsb++Nn98wdN2ZgISMzigiyqLp/Aq+wqpsb5bmIlBhNWjHOrq
i8erYTsNHWi74U8oTfO/ljujHe2OdmyBjBk3NYrgRS5xrRYkxljgADNSL07MLBmX
oiubGlLCR4akqXiuCuoFH1tpWqiV32zaK0skBt7py/5UYIw8Hr9QtQbl8dlTCfQo
IC0j0kSOFH2hVbVjjSrqwMs7XqYQzOKHtj5wrOAcyiKMHtMxH8Y=
=8tQX
-----END PGP SIGNATURE-----

--0yawZzxqv3VzkmeV51rii5J2clqbu5b0t--


--===============5377419344962029504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5377419344962029504==--
