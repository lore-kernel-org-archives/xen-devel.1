From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Mon, 01 Apr 2019 09:10:51 +0200
Message-ID: <36496b27179ccd23aeb3e051e3ded04fdb493b8c.camel@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <5CA1B285020000780022361D@suse.com>
 <10544c22-138e-c993-ca7f-3a3392e03243@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5046273507719280331=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=skML=SD=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hAr67-0003GJ-5l
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 07:11:11 +0000
In-Reply-To: <10544c22-138e-c993-ca7f-3a3392e03243@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5046273507719280331==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-BHfCVXHjuQ+aLcvKYHN0"


--=-BHfCVXHjuQ+aLcvKYHN0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-04-01 at 08:49 +0200, Juergen Gross wrote:
> On 01/04/2019 08:41, Jan Beulich wrote:
> > One further general question came to mind: How about also having
> > "sched-granularity=3Dthread" (or "...=3Dnone") to retain current
> > behavior, at least to have an easy way to compare effects if
> > wanted? But perhaps also to allow to deal with potential resources
> > wasting configurations like having mostly VMs with e.g. an odd
> > number of vCPU-s.
>=20
> Fine with me.
>=20
Mmm... I'm still in the process of looking at the patches, so there
might be something I'm missing, but, from the descriptions and from
talking to you (Juergen), I was assuming that to be the case already...
isn't it so?

> > The other question of course is whether the terms thread, core,
> > and socket are generic enough to be used in architecture
> > independent code. Even on x86 it already leaves out / unclear
> > where / how e.g. AMD's compute units would be classified. I
> > don't have any good suggestion for abstraction, so possibly
> > the terms used may want to become arch-specific.
>=20
> I followed the already known terms from the credit2_runqueue
> parameter. I think they should match. Which would call for
> "sched-granularity=3Dcpu" instead of "thread".
>=20
Yep, I'd go for cpu. Both for, as you said, consistency and also
because I can envision "granularity=3Dthread" being mistaken/interpreted
as a form of "thread aware co-scheduling" (i.e., what
"granularity=3Dcore" actually does! :-O)

Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-BHfCVXHjuQ+aLcvKYHN0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyhuXsACgkQFkJ4iaW4
c+6XMxAAumFuqFQKVplWlmFBj0qdreZdRhzdANbB0q9ssLiVjJ6lx1Et7PA7rE2e
uWIjKGjUn3c+uSZPx+qTM5bbnIQjvf7NdbqgMf1siXKVUQrlTBMiwQAm0PIkobLu
OmqOvaih3s1TaCgeaxIwt/PW/KPAeuSr9AhNmjMfbGg0LmzVEYWa1kM8NIY5gF2/
gPwwkUf3uh3NFa7BzvT8ClukR9fsL0hP6DW/Av3ch23WOPmhmT8NO+a2WyZetgv4
nBkgspPpUaiDQRsxpFGMx2/a+PyGdlCUaMdnw806C3NIsqHadJuWmgVDikJzLPia
RXTS+2tQ6pwM3CyIJIDsyfCokQgeaZJUGSKOPX1ey42UzM289RyMxFa+W75plEPY
hP42hsfGWEFqtuJK2OzscIaMIWKKF1kUxu6LGh8PvcGJmZsl059zopv0aS7CUYXP
o7f3sJslcU1FFTVvSOGY9/86aQ7KjjpdOgN/pGsZJO3bLd3zm0Fl/r4rEf9xH+OT
nmUI+9c099pH2MNHPJGLX7wl82ds0lQO2b0Svtre1hAOR/WKpSgS0h+qkKH9C+L1
Akm28WcKFCcgiUimwXowWj3lA4MgoXaO5BUG+PBYqE+nrW7g4ew+KEP0TN5F3kYO
5e19ywRAq1lGsVK+o1dxPx+g7jovE0PZa5dojYjF0WlsVvzlJWI=
=jhzR
-----END PGP SIGNATURE-----

--=-BHfCVXHjuQ+aLcvKYHN0--



--===============5046273507719280331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5046273507719280331==--
