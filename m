From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] tools: libxl/xl: run NUMA placement even
 when an hard-affinity is set
Date: Tue, 21 Aug 2018 17:14:52 +0200
Message-ID: <0272aceb4d34d1d9f4a92c1b6faaede59a1242a8.camel@suse.com>
References: <153452538306.14879.2645077465028661264.stgit@Palanthas.fritz.box>
 <20180820101428.djudte4z2wye3cz3@citrix.com>
 <b346c13a4a05c75d531da1dcfa7ea684a0d5089e.camel@suse.com>
 <23419.59543.385873.125444@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2517208254120976060=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gbqd=le=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1fs8NZ-00039Z-QD
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 15:15:33 +0000
In-Reply-To: <23419.59543.385873.125444@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============2517208254120976060==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ak0E8dxCRWYXNI7e6d+W"


--=-ak0E8dxCRWYXNI7e6d+W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-08-21 at 11:25 +0100, Ian Jackson wrote:
> Dario Faggioli writes ("Re: [Xen-devel] [PATCH] tools: libxl/xl: run
> NUMA placement even when an hard-affinity is set"):
> > On Mon, 2018-08-20 at 11:14 +0100, Wei Liu wrote:
> > > You can use NDEBUG instead.
> >=20
> > But I don't have a too strong opinion; I'll change it to us NDEBUG
> > if
> > that's what you prefer.
>=20
> Please do not use NDEBUG.  libxl is not designed to be compiled with
> NDEBUG.
>=20
Err.. Ok. So, what do I do?

Do I leave it under this special "manually enable for development and
testing" kind of thing?

Do I make it always on?

Do I get rid of it?

:-)

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-ak0E8dxCRWYXNI7e6d+W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlt8LGwACgkQFkJ4iaW4
c+473hAApM9KY81p1oigEBCcJmDKRSStDJHmrJlDfUc8YyZhJD5XlG4xtpVhE9vA
rnXZ7wwTw4nvn3H1+Dy01FDLMdizawS+QSBsJkvD3L4tDGGckfQ+JVlglBzyWUe+
A9oLDOIebckDYuUHZoD4Mq/ltUVwPAL8ImeYoAo1eRT+DEwWcxtFGNuYEz2lFRtA
eVlJFszUwWeLe1M2N/5/PMBvuWTJDUIy9oMaKd9E4uckNKEM2D5Sb2KJ+XameGQ7
Js0u0em8TfA2PhnO0Gw8U/RSEvRdrsYwqygvgV6+0HYgw50Fmi17BfmuWSGDn15J
i+k1OWutsRqAOUR+zUbU62gAUa58DneMHBc8fLnpRzlkhiit7XzhmSsaddKmOkk8
CBXRdySVfoDssQ9Bxe1F/m96UyjRStdAhSI9MM16wh18rDOrME4CkWHuKJ+aXzjI
SYUlKceWenwaIDNJ8IcfLD8jq0TXBaTOGUj39FFZuwPFj2Cu97wCIt8SR9f/OhVc
CIj6aHkNU4Bpc4MlG3FcMbMNhKfQWnD830GGYl03zmDgQktljxuD1/jkAt15RYBr
kuXeE/bytj6ljTrXWSAW45hVRaEFlMC/bLIArIa4L/Yw4rmZRkJeUj/mPeLqjHEi
iNYkJsdEr8kTJErfsG7pYvoNmcMdrMycdt1QoH1dG2fLJXhl0Cw=
=Cr/X
-----END PGP SIGNATURE-----

--=-ak0E8dxCRWYXNI7e6d+W--



--===============2517208254120976060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2517208254120976060==--
