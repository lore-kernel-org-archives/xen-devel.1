From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 5/5] xen/libxc: suppress direct access to
 Credit1's migration delay
Date: Fri, 23 Feb 2018 10:25:59 +0100
Message-ID: <1519377959.5547.115.camel@suse.com>
References: <151931759370.5408.3600378338263227885.stgit@Solace.fritz.box>
 <151931853231.5408.9342065801393552631.stgit@Solace.fritz.box>
 <5A8FE8C802000078001AAC3A@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4568032265734638659=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zwdw=fr=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1epA6u-0000aU-P7
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 09:57:48 +0000
In-Reply-To: <5A8FE8C802000078001AAC3A@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============4568032265734638659==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-u6s++3yV98WguhAmkQVm"


--=-u6s++3yV98WguhAmkQVm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-23 at 02:11 -0700, Jan Beulich wrote:
> > > > On 22.02.18 at 17:55, <dfaggioli@suse.com> wrote:
> >=20
> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -351,8 +351,6 @@ struct xen_sysctl_pm_op {
> >          uint32_t                    set_sched_opt_smt;
> >          uint32_t                    get_max_cstate;
> >          uint32_t                    set_max_cstate;
> > -        uint32_t                    get_vcpu_migration_delay;
> > -        uint32_t                    set_vcpu_migration_delay;
> >      } u;
> >  };
>=20
> Such removal imo needs to be accompanied by bumping of the
> interface version.
>=20
Right! Sorry, I keep forgetting about that. Will do.

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-u6s++3yV98WguhAmkQVm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqP3igACgkQFkJ4iaW4
c+627xAAleXakg6Ow6y6I+MAKUKWATpsq/lMwab41Atb2nuLJ0JVNS1y3j6PNj1P
nqAxLguWuYbEX972MIhpvLQh0Ff4ynGriB54JSkmJ5SBah6TwZ3YGm36pgvco6Ly
cP6T5meMd/HNL9s14opLaZtp+zKX7A1UhNziF9Q/EMjTYS3I2oRaIX1z1VSt2YMN
cSU2hl3qIUdKryp5K0Og1oduNUAHsszdDDBc8ziRr/eMegifcIpMn7eDD9Dfw7Wf
YmfaUSiClXDNb8EVnFpwKUlauChOciSjdQ8RP2YZtO0JeuQJgmYsimJHj6mrd4q0
6is4woQ/Mxb1XiCgPuX2wNLGs6nOKIN8Y6dJNdllQoNvFoTJptPDQo0joRMK5aBB
dBFEmAkCP/W45n5coCYLH9WWu0R1SjFI0XqZK+216APzKvALc1fnjqw5oLhobRNd
F+j24mr4wXLr+fuGZAYMEDGbswSGq/6MLpI0DlHCdt/tha01Y7j2BInnHd2Q5S/L
gUC1JC5UplC1g+nWcXxtpmJxAN30/v9PTv8ozgyfopuvWDMt1BPspV1N4Ni8qUIL
GyLa4lazQxdmZtAn7BQEhQRBbZCHkvMPKYye5Umer5uLozzsfj5mqZEQp3o3Yzp9
At4Hs7N9S803DJQ6dozJ/b8/ec1dhvXUMmemOGUjfbKQ41T99XI=
=oaEY
-----END PGP SIGNATURE-----

--=-u6s++3yV98WguhAmkQVm--



--===============4568032265734638659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4568032265734638659==--
