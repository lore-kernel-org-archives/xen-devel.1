From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: PVH backports to 4.9 and 4.8
Date: Tue, 23 Jan 2018 14:47:00 +0000
Message-ID: <e89157a7-ec0b-6794-a805-77b2562a2e75@invisiblethingslab.com>
References: <d06762c0-049e-0f9a-c674-e9bee70ec5c6@citrix.com>
 <9251050a-48ef-f8af-22da-a789a3afcbc5@invisiblethingslab.com>
 <6e0be7fa-0129-0a9d-485a-fdfed4f7d330@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9067819816106340740=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <6e0be7fa-0129-0a9d-485a-fdfed4f7d330@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============9067819816106340740==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="zbb1jwCyBaTVKZTU63oDsPQIQcnOtEuo7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zbb1jwCyBaTVKZTU63oDsPQIQcnOtEuo7
Content-Type: multipart/mixed; boundary="HHrzlqZtvlFJLJTOvKyavKujVrXruV1oZ";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Message-ID: <e89157a7-ec0b-6794-a805-77b2562a2e75@invisiblethingslab.com>
Subject: Re: [Xen-devel] PVH backports to 4.9 and 4.8
References: <d06762c0-049e-0f9a-c674-e9bee70ec5c6@citrix.com>
 <9251050a-48ef-f8af-22da-a789a3afcbc5@invisiblethingslab.com>
 <6e0be7fa-0129-0a9d-485a-fdfed4f7d330@citrix.com>
In-Reply-To: <6e0be7fa-0129-0a9d-485a-fdfed4f7d330@citrix.com>

--HHrzlqZtvlFJLJTOvKyavKujVrXruV1oZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

George Dunlap:
> On 01/23/2018 04:06 AM, Simon Gaiser wrote:
>> George Dunlap:
>>> Part of our solution to XSA-254 SP3 (aka "Meltdown") is to backport
>>> the PVH mode from 4.10 to 4.9 and 4.8.  This will first allow people
>>> able to run PVH kernels to switch their PV guests directly to PVH
>>> guests; and second, eventually enable the backport of patches which
>>> will enable transparent changing of PV guests into PVH guests.
>>>
>>> All of the hypervisor support seems to have existed already in 4.8, s=
o
>>> the only backports involve toolstack patches.
>>>
>>> I've put up two trees for a first-cut backport of the PVH
>>> functionality, to 4.9 and 4.8 here:
>>>
>>> git://xenbits.xen.org/people/gdunlap/xen.git
>>>
>>> Branches out/pvh-backport/4.8/v1 and out/pvh-backport/4.9/v1
>>>
>>> Below are the patches backported from 4.10 to 4.9 (23 patches total):=

>> [...]
>>
>> So future 4.8 releases will include the backports, right? Asking becau=
se
>> the AFAICS the 4.8.3-pre-shim-comet branch include them but staging-4.=
8
>> does not.
>=20
> Some of us have had informal conversations about backporting PVH and
> Comet host/toolstack patches to 4.8, and a number of us think it's a
> good idea, but we haven't had an official discussion with all the
> stakeholders yet.  We'll come back to it once more of the fires have
> been put out.
>=20
> Feel free to remind us in a month or so if you still haven't seen any
> patches in the stable-4.8 branch. :-)

Ok, thank you for the quick reply. In Qubes we are using PVH with 4.8
using the old device_model_version=3Dnone config option. And changing thi=
s
would be much easier before release (So the change should be in our rc
now). Anyway if it's not decided yet, we will have to guess what ends up
in future 4.8.z releases.


--HHrzlqZtvlFJLJTOvKyavKujVrXruV1oZ--

--zbb1jwCyBaTVKZTU63oDsPQIQcnOtEuo7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlpnSu4ACgkQkO9xfO/x
ly+MKw//TJTyUC6213KAwC4Agi4HyPdvY3uggBgFa3EmmJ71bysZEbtXEzulcYir
0jFaByBdCoAYfPBVoocFI3YwolSpFwGJt9C1cPplmgfy2h3LkWSIwJDRJ8Ca7XaW
X/th5syWk+Q21sujuE5Ca8dfbbrugAhJsXJFTaPoGpcNAPnamU81oAcKsIpj2eAp
cjxTwJTyREDOZ+ePTRKmghKuvHenai1cD6lav3rNzG7xb6+S/LF0l9SRNVFz9JJE
3K46arvSRZgEKL3leOu5GUCRDkPfh8Xik40/0Bmit771LQzE3p8YMf4yH5y8t2Tc
T4ot7UKNnZypgTi5Rcik92IAlsNarRqYclGil3g/De41O5issSadr7Ima8eFaF6q
+/i7Uu6ifiarD9qfBrv01PUFxkDhD0w57bY8cWjqct4wJFEyz2bLgBIa5z+zrsE8
Y9QbZkAnQeWcyDiqELZJ7BxDOFhxtRo60RN5+oTZ2pBgXNxXen7ytayEq2LDWs7m
QZToucfwWemHNS8bYoCen/1nnt0VGWlHbDMZHZBPky6owLdB0AAiyzoxnDL2YLz+
30NLIT/rnYcAKf4vt0yROISM+WEe3tDBxZQqmA7j+voDSwzBN+FcLCGdbkjFiG5Y
khkecLxakOvpX5LWeaezHy8awxkZxqztbwoUw5KAuRTfz8qvTrE=
=ZqMb
-----END PGP SIGNATURE-----

--zbb1jwCyBaTVKZTU63oDsPQIQcnOtEuo7--


--===============9067819816106340740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9067819816106340740==--
