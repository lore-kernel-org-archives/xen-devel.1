From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: automation: Creating a patchwork instance to
 improve pre-commit build testing
Date: Tue, 24 Jul 2018 19:22:00 +0200
Message-ID: <e5b85bb5063db69ca7a1712066779bee620de952.camel@suse.com>
References: <DD622B30-B54C-4B9A-AA24-05329BD800B9@citrix.com>
 <5B56EC0002000078001D708C@prv1-mh.provo.novell.com>
 <20180724092430.puacbfkbimdm5anz@citrix.com>
 <5B56F2BB02000078001D7130@prv1-mh.provo.novell.com>
 <20180724094352.bobqiacujy4tgcp4@citrix.com>
 <5B56F99502000078001D719C@prv1-mh.provo.novell.com>
 <20180724101858.jhsyfdkpy7urdrku@citrix.com>
 <A73BD547-2874-42D6-A766-046FA4C0E1DC@citrix.com>
 <17f94bb6-2fce-c6d7-7ae9-e380708d3a96@arm.com>
 <18079EC1-15A4-4C05-A78F-0570E1F54E8E@citrix.com>
 <cf651d14-f6f4-b651-b6b3-1fc5cbdbcd8f@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6211108917600330012=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ymhk=ki=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1fi10j-0001sG-Qa
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 17:22:09 +0000
In-Reply-To: <cf651d14-f6f4-b651-b6b3-1fc5cbdbcd8f@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Iurii Artemenko <Iurii_Artemenko@epam.com>, Doug Goldstein <cardoe@cardoe.com>, Minios-devel <minios-devel@lists.xenproject.org>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org


--===============6211108917600330012==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-zKe2CYgjx4vs3/48O9NI"


--=-zKe2CYgjx4vs3/48O9NI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW,

On Tue, 2018-07-24 at 16:26 +0100, George Dunlap wrote:
> On 07/24/2018 12:23 PM, Lars Kurth wrote:
> >=20
> > It seems to me there are a number of options we have and thus some
> > decisions
> > that need to be made.

> > 2: Do we have an opt-in or op-out (e.g. through a tag, a specific
> > CC, etc.) for patches
>=20
> Opt-out.
>
+1

> > 5: Do we report back on success or only on failure?
> > See question by Julien
>=20
> I'd start with having the bot respond to 00/NN exactly once, both on
> success and failure.
>=20
+1

> > 4: Who else, besides the author should get a mail
> > The patch submitters should definitely get a mail, the question is
> > whether people on the CC list should also get one
>=20
> I think the bot should reply-to-all.  Maybe we can add an opt-out to
> our
> website, so that the bot won't reply to you if you don't want it to.
>=20
+1

:-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-zKe2CYgjx4vs3/48O9NI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAltXYDkACgkQFkJ4iaW4
c+7V6A//b1YKt44bsqoBGCMIZt2VT9yo4Eui4NgxrQqhxk1w+vf5rzb07Qpvb72I
LqVJtA+9DhPeQNF1BTPsStNDCy6UsYEI6K4A7J6A5a1W0ywgBjoZga4ETWbgLioD
lEpmTdFwqyRGT6H2ZX3eoMX7Clh0VVQJlQPmcS6NbI8j7LTpaX2eROc5oYNyuidR
h81DENTt0TiY3p7g6ibT/F0MVjcNo2oqDX7ib9cJYwuOOQ6ae8iFBtowamKvnSiG
hMrvL6WG3oatnwk7oI13baSlEHhEteLXWSVMsCe9qBjSzO6rUcBdNVtLjto9azpm
hWzXrVwtlrnALDvscqiktSB+pbICK5lmlfSGRK7bPh3i6PkbgOXsu4iKmEobuDgD
CMTEEHObbF3+QzNm0tZYB0PKkAVk8Lj/zxY4IGXMyRdlX6i58zCyQYO81a8koYS7
7mblOeIPZfXjm92m0X6UPUo8joJO/6a88sCMZPwg7BBoJPu2pxUPNII5VkLSU9nf
dnmAoXjplwVu+ioirDNPko//jY5qN4qDHeES1gOogCaq389kQUk2xXgwlM2BVDA4
yhdfLSgDfH0jeBvwYH/LHd7ULucTWZNtPb6hmPzuxnWCk3fq6W5in0TSqJQS1kmQ
OtvZIjiG1InI8CncZ2Y4RxTLzZff/20oU8ymTFACIAs/xbUc+t8=
=bbvP
-----END PGP SIGNATURE-----

--=-zKe2CYgjx4vs3/48O9NI--



--===============6211108917600330012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6211108917600330012==--
