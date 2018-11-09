From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Xen 4.12 Development Update
Date: Fri, 09 Nov 2018 19:02:21 +0100
Message-ID: <9e318b36708f65a15706ef36d224e65cf85f3e88.camel@suse.com>
References: <20181109101631.5729-1-jgross@suse.com>
 <5BE5673A02000078001FA1B7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1643659669259023210=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mhqu=nu=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gLB6z-0000A6-Pm
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 18:02:29 +0000
In-Reply-To: <5BE5673A02000078001FA1B7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============1643659669259023210==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-kg1M8ZYzL4ydS5khzr9C"


--=-kg1M8ZYzL4ydS5khzr9C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-11-09 at 03:53 -0700, Jan Beulich wrote:
> > > > On 09.11.18 at 11:16, <jgross@suse.com> wrote:
> > =3D=3D Hypervisor =3D=3D=20
> >=20
> > *  Per-cpu tasklet
> >   -  XEN-28
> >   -  Konrad Rzeszutek Wilk
> >=20
> > *  Improvements to domain creation (v2)
> >   -  Andrew Cooper
> >=20
> > *  Argo (inter-VM communication)
> >   -  Christopher Clark
>=20
> Core aware scheduling (Dario)?
>
Yes, indeed. Thanks Jan:

 *  Core aware scheduling for Credit2
   - Dario Faggioli

Status is RFC posted, waiting for feedback.

If I do get some feedback (and depending on the feedback itself, of
course :-D ) there are chances for such series to be ready in time.

The Credit1 one has, on the other hand, much smaller chances.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-kg1M8ZYzL4ydS5khzr9C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvly60ACgkQFkJ4iaW4
c+4jGQ//SD9fpSbLuqKeYQpSQ3CP1K0WaApmnHcC8WH/rpmH5WC/PnJzmQ7yqqWs
a6eOo/VPA5TIWK+oheFLWcysh44dGZiYm4fJv8ZXEcyaqhUoahqjX1mIt3e67UQX
JyT0GU8rTOQ7M3fJbq7kJDY1IgReuIO+eUTyappE3pfXm1CCxj3ZJ7ES+6qsg1RK
ONukfP8ai+sOCTDNsEJcbcilI1bnmipOHJvnPw7u/pr7Uk4JKaOoe9LXAkDgsA/7
S6yTELzEYIFk7oPeHUpGkhELXrcUdLwIqqlsqirnmG0mBV7Vhffz0LBLBQ6dMfjh
dUZiZ/lPOxpkie6BOXtKLKVFRxLfqkJGL5IQo/oazvNG67UM1cUDz4m7ZrtEzlaH
UtevD6sJMQS3TO5OX5igh9oxoRsNwGX69BDUch7VFBBZAgHhNV/sNsCk+a5bLyBz
rp+XU9szl1ybTP1+eNgIv/1FRSz/ummHzUha1TJWd9G+hrLQjmroThN1cg37XXOH
3/pgzcb2PNRAHG/GAYR0UAJT1+y6Uyk/sxvcUTKiXIQFQlY9amAdEiT5D+VzY4mP
h98J4UM+bxlmVkN5a+B112r8bOaaM056WuVvHcomb7vp4SdUhPojj9XQ/nuyQMAn
kNbynSb7CFyvziBbTnsAIyH4l+oXHJQyh34Myzm/jlOMFnOtbEE=
=IrBw
-----END PGP SIGNATURE-----

--=-kg1M8ZYzL4ydS5khzr9C--



--===============1643659669259023210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1643659669259023210==--
