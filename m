From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 17/18] xen/arm: Resume Dom0 after Xen resumes
Date: Sat, 17 Nov 2018 00:01:44 +0100
Message-ID: <855b1bb125bb3ec2a7d51dd0144787700d6568c0.camel@suse.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-18-git-send-email-mirela.simonovic@aggios.com>
 <77c3d2c9-a1e0-a5b3-0a4e-fc6ea079b817@arm.com>
 <CAKPH-Ngdb_w+uHKFrMd_fF62pM0idQJie2RdKDtD8HbZyNV1WQ@mail.gmail.com>
 <CAKPH-NiEnpDWwT65zwczx20hZcEN4qTayQXpO4=4iye2mcky3Q@mail.gmail.com>
 <dc9b6382-490e-fd41-6fec-faf211103cee@arm.com>
 <CAKPH-Ngn1vp0oxtXs_cO5WnCJJExg5y=QQO5tck6fd1Z76ozsg@mail.gmail.com>
 <2edccbdc-5c9e-630a-27f0-1c937f926bec@arm.com>
 <alpine.DEB.2.10.1811161056400.22115@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1811161105070.22115@sstabellini-ThinkPad-X260>
 <CAKPH-Ni3noct-9WHGLgUCG+19MKOJnbpk_uMMGcPEQ3Kd1U11Q@mail.gmail.com>
 <6b1b7986-5ce1-b3d2-11c9-63e7b17606f7@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1511463935260139604=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nxwo=n3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gNn7U-0005u6-J2
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 23:01:48 +0000
In-Reply-To: <6b1b7986-5ce1-b3d2-11c9-63e7b17606f7@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <Julien.Grall@arm.com>, Mirela Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>, Xen Devel <xen-devel@lists.xen.org>, Davorin Mista <dm@aggios.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>
List-Id: xen-devel@lists.xenproject.org


--===============1511463935260139604==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YbLNUAmDDj2Dg4QIlZLK"


--=-YbLNUAmDDj2Dg4QIlZLK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-11-16 at 21:58 +0000, Julien Grall wrote:
> On 16/11/2018 21:41, Mirela Simonovic wrote:
> > On Fri, Nov 16, 2018 at 8:09 PM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> > > > It should be possible to figure out which domain needs to
> > > > awaken from
> > > > there.
> > >=20
> > > Actually, evtchn_send eventually will trigger a proper interrupt
> > > injection into the domain
> > > (xen/arch/arm/vgic.c:arch_evtchn_inject),
> > > which will necessarely wake it up. So it is possible that it will
> > > already work without any need for additional changes?
> > >=20
> >=20
> > Absolutely, that sounds great :) Then we could just drop this
> > patch.
>=20
> I don't think you can drop this patch... As you tie the host suspend
> to=20
> the hardware domain suspend, it may makes sense to resume at the same
> time.
>=20
FWIW, I think that too.

In fact, let's assume a *fully* disaggregated setup, where dom0 only
has the toolstack, while it has no hardware, no PV backend, etc... If
we don't resume it explicitly together with Xen, who is going to resume
it? :-O

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-YbLNUAmDDj2Dg4QIlZLK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvvTFgACgkQFkJ4iaW4
c+569hAAxFk54UZ8nk8WB7EV16+WCKZyQHVr0EhfG7v70VCneUPPkh82DYXNzqaB
9e1bN4zevjA30G13/IGS3qrBZqWBvvbiEw6m0YyHnbqySSnLyRvpUZHKvie8mUop
cZjh4thNmPj3noG/PR/O3GIm9IXKAXcOKA68ZDBc0tGDky6qGvollrpu9+DXPOv9
oMkDw9rwNO/JdlAHCJH86Z8Yfk2CumidVj2agfUbCzRZ66e2O7LoCDyH6MY+piPw
j1qO8OHsuee26AqlsRr4wxX4BgAT+it8tKAkpiSkB4OPc0kcRa3hyu+KB04ZVuuL
1yoXMf0SAuVUSRWXKkSk+Eg7zLk7eIEonvDwJQcMp1iHzJiNsMkdqh8R/6Ct9hLH
Srnbmtt9Z24KnxVtDLkMiWSmmmQ+pqTAgFVMoDJRaBcdt6r4ZFYXPEBc6OCWD3bn
8HqX/U4ocj9UzT/LqiZquwtYI343+8oMUq72n0awx6lKA+tCMw1xIhPQBED3iDSu
fAeTBjImaIzXtlqSqi3MOnxwNZsIg1lkfl96V7KhheGnWxq8SFbxd9KZoiyes2ts
DjoDwLlPXSVuO+qa7yZ4NKHTwJgBsbYfMRp8WyTsEo+Ppzano/i/zveEa20ZD8Q9
w9xCF/lGyO+iYRDYA4PZIDqOqt7wWK4nMqy6UrdBtVQsysH3CE0=
=ucHa
-----END PGP SIGNATURE-----

--=-YbLNUAmDDj2Dg4QIlZLK--



--===============1511463935260139604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1511463935260139604==--
