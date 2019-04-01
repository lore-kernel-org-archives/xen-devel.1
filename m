From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RFC 08/49] xen/sched: use new sched_item
 instead of vcpu in scheduler interfaces
Date: Mon, 01 Apr 2019 09:05:50 +0200
Message-ID: <18bf2961fcb586dc74f1ea972acf62e001ea8c58.camel@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-9-jgross@suse.com>
 <4570eeac-64a8-f424-28df-883347c69f15@citrix.com>
 <bcbe39bc-fc79-d401-13fc-69bf34ffa17d@suse.com>
 <7c1a66e4-f95e-ba79-e76a-d721cf838a64@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3897755955882842527=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=skML=SD=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hAr1H-0002QA-Hf
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 07:06:11 +0000
In-Reply-To: <7c1a66e4-f95e-ba79-e76a-d721cf838a64@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Julien Grall <julien.grall@arm.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============3897755955882842527==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-zjz4IJpLF2mIVbubwGmv"


--=-zjz4IJpLF2mIVbubwGmv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-04-01 at 08:06 +0200, Juergen Gross wrote:
> On 30/03/2019 11:24, Juergen Gross wrote:
> > I think its is easier to do it myself, as I'm touching nearly all
> > of
> > the call sites anyway.
>=20
> And another thought I had: with RETPOLINE indirect jumps are even
> more
> expensive. Would it be a good idea to remove the function pointers
> from
> struct scheduler and generate the inline wrappers at build time?
>
Yep, I was thinking about doing something like that already,
independently from this feature/series.

At least something that special case the configured default scheduler,
and let its hooks be called without indirect jumps (i.e., similarly to
what's being done in Linux, in quite a few places, these days).

> The
> wrappers could then call the related specific scheduler function
> based
> on the scheduler Id using a chain of if ... else if ... statements.=20
>
I guess we'd have to see how the final code will look, but I like the
idea, and I think it's well worth a try.

Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-zjz4IJpLF2mIVbubwGmv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyhuE4ACgkQFkJ4iaW4
c+4ZYBAAj3tCpvUfLHkKB4lOUZgptvWBp7f53ZvYolehKIbJqBumfv6J0qkoY6Su
GTc3hbiZV7P39omTBJ5T/9yWPHzkxwtGI13UytHClMxiHjAp9crHlu3eshSJxpj1
q/DNtjfbLWsFQV4czP24q+iuI74tu+MjyxcZl6OkHPASpUK6T7H1CpO24PXYxoKw
C05u/y/P+UJNEEnElVRsJ/2Kro4s5BD/GNseYDmRKXqXTWvx1GJtCqP9m2zAAAla
Eur2Iy2t+5wI1Gl3QAfSy8mrL7Q3ifnFf7ad/l63f8Q9MOfQkBrHZmUhq9eVzATG
tGUPdwAoV/hAWruTRjHqy+hmmMSY1YG5Nk366eXMaooXr7RkgpbBC3qAva3lTh9R
dzOlaxh7/qklCmHpZpDCO/Cj2aA6G+vUFdj7JoIO1opmlxELHJ3TnlR5bNlqYaBH
+mt/vTNkJ9wy3rHGH/zXqItIcklP50fKlAZEZWtSDdegOyoOdUAiW6O5sEMBEd/y
HSXwTJJQSTq22k9k5kSIoWL0LZ7rDQ96xiEGY6oj/LkEQomoxjM3zjhQtmEqpoyb
Cny+N/Ii0AbrBbLHjCz+oQLM9Grfu+4hAFXcR2WeTfLoDc6fNjL7BEyRt0XBkrP/
tQKbiMf96MSHOTsQLZu+b7GRaA14tBGXqdqAZjtePjojmRxK0KQ=
=nFDH
-----END PGP SIGNATURE-----

--=-zjz4IJpLF2mIVbubwGmv--



--===============3897755955882842527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3897755955882842527==--
