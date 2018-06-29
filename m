From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] schedulers: validate / correct global data
 just once
Date: Fri, 29 Jun 2018 16:44:27 +0200
Message-ID: <bcb2c9e5b4021c626f2706791f98c64d26682bdb.camel@suse.com>
References: <5B362FD402000078001CF26F@prv1-mh.provo.novell.com>
 <4cb5704633cb82cfaa2293ff36d9ff3395c6a3ae.camel@suse.com>
 <5B363FF702000078001CF36A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2162852970117049112=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tetx=jp=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1fYudz-0001E1-4y
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 14:45:03 +0000
In-Reply-To: <5B363FF702000078001CF36A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============2162852970117049112==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-EBOtDgVXWXhbuPssY4Te"


--=-EBOtDgVXWXhbuPssY4Te
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-06-29 at 08:19 -0600, Jan Beulich wrote:
> > > > On 29.06.18 at 15:47, <dfaggioli@suse.com> wrote:
> >=20
> > My rev-by tag stands if that is added in this patch (and even if a
> > different wording is used). But I am also fine with the patch to go
> > in
> > without that, as I consider it an improvement of the current
> > situation
> > anyway.
>=20
> I was more considering this the possible subject of another patch.
>=20
Sure, and for me, that's perfectly fine!

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-EBOtDgVXWXhbuPssY4Te
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAls2RcsACgkQFkJ4iaW4
c+6a6g/+M4vnyWMoiyJTLi8lwx3/+LLzAJLroHmfcAFHlBPKw/WXhIkTtLCygHWu
Wc7CRmtG2C2SJgn2JrgN8AkiF25lWp2ejA+Qa3O4ku4LN6OLXox63k8Du97PdvCg
rtu7k1M88LI0e7a2U2rDhnZwkf5G+clgNdAnRe/igdV6H3M6YeQ/oLSwENRLMAJH
tunbUNeKDP9UCBJDVH/B6odG1ZXs7DkBrb18ntfnQEp5mmR0MMyTFbElZC5jG7dr
fvYMrEMo2CHQzNxkdryDwTzUGt9GkgYNMQ1lVDqHl1HSRdVCVcQ3L03V5JIMqQDH
JL508NB2xWXu6BtDMUpRRRww6PSqu7LBsYxV3b15domCJTm1YHRrU6pv7LtXLBRb
EK3p35as3MoY3viQrcT47nTQxIkxs7shcMUGAH3kgrhOYVMcyRalzBp17e9xrhZS
5ZZ3EKRbS4EBzd7ND5V7EAI27P5Pw06z7Xwr66xp39kyu+J/0BWixurfPamU2NY9
2E9Qav1MxygNDHd98VOGIc2p6pnEQ3korMT4OHspoHQNzLqzTrOGMske+PItM+N9
sub0qUhjkRja7VEdkjFxtI9s3dQ+XEzyzW2Bjc9DGx/mqyhm1iftJh0910Abq17J
VenmBMZV7dhxy8SEqKRzPv8RqdcS1iSN+JuHSDxi9oUl7P3LKXM=
=/PtA
-----END PGP SIGNATURE-----

--=-EBOtDgVXWXhbuPssY4Te--



--===============2162852970117049112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2162852970117049112==--
