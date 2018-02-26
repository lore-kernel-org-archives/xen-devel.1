From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH RFC 00/10] x86 passthrough code cleanup
Date: Mon, 26 Feb 2018 01:47:38 +0100
Message-ID: <20180226004738.GO2023@mail-itl>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1910153C5@SHSMSX101.ccr.corp.intel.com>
 <a4d4900e-ba01-bde2-b2a4-79dcf0d8bebb@cardoe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7089849973880994119=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=8zii=fu=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1eq6y8-0008WS-8C
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 00:48:40 +0000
In-Reply-To: <a4d4900e-ba01-bde2-b2a4-79dcf0d8bebb@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7089849973880994119==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kswDJesP0akhmDn8"
Content-Disposition: inline


--kswDJesP0akhmDn8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2018 at 10:39:20PM -0600, Doug Goldstein wrote:
> On 2/22/18 11:12 PM, Tian, Kevin wrote:
> >> From: Wei Liu
> >> Sent: Thursday, February 22, 2018 5:47 AM
> >>
> >> Hi all
> >>
> >> At some point I would like to make CONFIG_HVM and CONFIG_PV work.
> >> The
> >> passthrough code is one of the road blocks for that work.
> >=20
> > Can you elaborate the motivation of this change? why does someone
> > want to disable HVM or PV logic completely from hypervisor?
>=20
> I can say I recall advocating for this at Xen Summit in Cambridge. I
> believe I talked about it in Toronto as well. There are a number of
> users of Xen that would certainly want to ship without all the code
> associated with PV compiled in. Given the nature of design "compromises"
> in many parts of x86 systems there is certainly a non-zero sum of people
> that would likely utilize the ability to remove code that doesn't need
> to be there. I think every individual on this list who has been involved
> in the security has been in a room of @intel.com folks has seen features
> vs security win out many times.
>=20
> I don't think its a hard stretch of the imagination to see people
> disabling PV in data centers running newer workloads on PVH and HVM
> only.

Yes, definitely disabling PV will be useful. Right after being able to
use PCI passthrough with PVH.

> I can see the real question being why HVM? That I would say lies
> with the direction of discretionary access controls in Xen vs mandatory
> access controls. To solve for the lack of functionality we've grown
> things like "dmops" and I could certainly see a product like Qubes
> running only PVH domains in the future.
>=20
> Since I picked on Qubes I've CC'd Marek.

So, is it going to be an option to have CONFIG_HVM=3Dn and CONFIG_PVH=3Dy at
the same time? While currently we do support Windows, so need
CONFIG_HVM=3Dy, but I can see in some future/alternative version we could
have even that disabled. For example right now we do have
CONFIG_SHADOW_PAGING disabled.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--kswDJesP0akhmDn8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlqTWUMACgkQ24/THMrX
1ywPBAf7B/Y7s8VJEi8r4bEXKBsKaTZWpTHjROUK+fKnYJ8oKg36aPcklmaI7njU
JKszxeunwjMqRCEWzVF9dl6WPJLXR4wJxjMW/F9AcZ7gEY6Q7Li9gusW7FgY8OGN
cKkukheUqtWX9PBPhcViH8DE67WAAlmx3MAGeADNJu/KF7V1I4i3HW6E//be6ri7
/9nRo1/llNPSrPdkOFdg4WVkTzXRNcvOR3ev2RvdF7mklKHovo/v2W5cuPbN5K+Y
pC14WhBzq3tj3LuZM21oY7lOoo+caHEbN3gRXiJVOjPQIEtNI3R4Fks+1h1HPjgx
vtMFRgbPMQwbweHJpBMkuJEMe7uK7Q==
=QfC/
-----END PGP SIGNATURE-----

--kswDJesP0akhmDn8--


--===============7089849973880994119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7089849973880994119==--
