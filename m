From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] doc: correct default scheduler in
 xen-command-line.pandoc
Date: Thu, 17 Jan 2019 16:57:05 +0100
Message-ID: <f357de4170383724611b989b65b94a96bc0356d5.camel@suse.com>
References: <20190115113510.27121-1-jgross@suse.com>
 <9702a712-278d-583a-976a-9255caac6214@citrix.com>
 <16cd9a9e-e879-7869-d494-f439c6499d13@suse.com>
 <0bebf5d6-a1ab-b9bb-d12f-be0e92eefe5c@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6459309720441049668=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YTZO=PZ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gkA2A-00070d-DN
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 15:56:46 +0000
In-Reply-To: <0bebf5d6-a1ab-b9bb-d12f-be0e92eefe5c@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============6459309720441049668==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5A7zhAydVY9/aSGUUr0R"


--=-5A7zhAydVY9/aSGUUr0R
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-01-15 at 11:41 +0000, Andrew Cooper wrote:
> On 15/01/2019 11:40, Juergen Gross wrote:
> > On 15/01/2019 12:38, Andrew Cooper wrote:
> > > On 15/01/2019 11:35, Juergen Gross wrote:
> > > >=20
> > > > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-
> > > > command-line.pandoc
> > > > index d39bcee928..e24e3a45e4 100644
> > > > --- a/docs/misc/xen-command-line.pandoc
> > > > +++ b/docs/misc/xen-command-line.pandoc
> > > > @@ -1705,7 +1705,7 @@ with read and write permissions.
> > > >  ### sched
> > > >  > `=3D credit | credit2 | arinc653 | rtds | null`
> > > > =20
> > > > -> Default: `sched=3Dcredit`
> > > > +> Default: `sched=3Dcredit2`
> > > > =20
> > > >  Choose the default scheduler.
> > > > =20
> > > Like XSM, this is Kconfig controlled, not a static default, and
> > > also
> > > depends on the compiled schedulers.  This should read something
> > > like:
> > >=20
> > > > Default: selectable via Kconfig.  Depends on enabled
> > > > schedulers.
> > The Kconfig default is credit2.
>=20
> Only when credit2 is compiled in, which isn't even the the case for
> all
> Kconfig fragments we have in tree.
>=20
So, basically, what you're saying is that we need a patch that removes
any mention to what the default is, right?

Like removing the line:

 Default: `sched=3Dcredit`

without replacing it with anything else?

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-5A7zhAydVY9/aSGUUr0R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlxApdEACgkQFkJ4iaW4
c+5SaA/9GDbYuAV7IYfgR+J6LvnrwJe7LdGZe+Ad2FdVpof12E6aqdNRFWaS14tm
+5IrexsrkiIhtT2AtFyigyQsDEHcOdsMs7Ry09JXoJjZSCp5yeUqI05exTKNNhDX
nLDw8UN77Wy8y90pdCRyd221+iacpkfRCA6aQE91O3yDtS1hS1BsLd71ha9F9hE2
SPfW2Tdv3aSioBzAO1Jl9QmeffNGdXdeeqDjY9r38HwLz2irXCEf+wm1+yeB1kUB
BjQRMdVkoIjRer3b7ELbC5pm29jzAj0YpVr30W4MfmlVUk4nze2TgJvDEtbv4P3q
cMH8VMGOrvefXox7fJDRNv6RJhBdyYAUUZ+cWwkUUslAwms7d/Y7HrAZWcL73Tfs
QZkhq6VTwv6gX290TcUzWX53O4FMDRWEoWB1c9fjMEUZtOGWUILUxzGCw2S/dFnc
J/9LjFL9YmE7EkzD2Me9oNv4oVl+dy8E8Ces1Mf0OnxX+FhpRpIveGhIkMbjYWH7
87A15MG7G5hKV6sOD5rL0qgrC6aV2nLlkvzf+bRWecl0Z3jvzUt+v869Fm9mmYXL
X0a3dNUIPOpMMIjNyc8HEOK/46USlJHk6Z4CwAjEGE3Jb6eh2fjqWdysNWODww5u
xfEZ3sQroxcVHEfKdBLlXowgqv8kTEQH2a/zNTkClqIjTmDkTrc=
=u62Q
-----END PGP SIGNATURE-----

--=-5A7zhAydVY9/aSGUUr0R--



--===============6459309720441049668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6459309720441049668==--
