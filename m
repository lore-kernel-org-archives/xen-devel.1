From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Fwd: [tip:x86/urgent] x86,
 sched: Allow topologies where NUMA nodes share an LLC
Date: Tue, 17 Apr 2018 19:02:11 +0200
Message-ID: <ba48376a7ea8f7bc6f08dca90d49aa443299c54a.camel@suse.com>
References: <tip-1340ccfa9a9afefdbab90d7935d4ed19817e37c2@git.kernel.org>
 <121a86b4-3eff-15ac-6542-d81d00780751@suse.com>
 <6cabb912-47c5-9974-0d91-d38e0a39b09a@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0099225538134912550=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yslv=hg=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1f8Tzz-0007ja-2t
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 17:02:31 +0000
In-Reply-To: <6cabb912-47c5-9974-0d91-d38e0a39b09a@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, anshul makkar <anshulmakkar@gmail.com>
List-Id: xen-devel@lists.xenproject.org


--===============0099225538134912550==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-tHChrBadeWiWBHM0qWfU"


--=-tHChrBadeWiWBHM0qWfU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-04-17 at 15:08 +0100, Andrew Cooper wrote:
> On 17/04/18 15:02, Juergen Gross wrote:
> > Is this something we should be aware of in Xen, too?
>=20
> If we had something close to a working topology representation,
> probably.
>=20
True, as far as letting the guest know about these details (in
appropriate circumnstaces) goes.

About using it _within_ Xen, well:

"Intel's Skylake Server CPUs have a different LLC topology than
previous
generations. When in Sub-NUMA-Clustering (SNC) mode, the package is
divided
into two "slices", each containing half the cores, half the LLC, and
one
memory controller and each slice is enumerated to Linux as a NUMA
node. This is similar to how the cores and LLC were arranged for the
Cluster-On-Die (CoD) feature."

This looks similar (but not identical) to, e.g., AMD EPYC. If Xen also
sees each slice as a NUMA node as well, we already are doing something
(although, of course, we can always improve).

If not, I see ways of taking advantage of the information that not all
the cores in the socket equally share the LLC, e.g., in Credit2, by
providing a per-LLC runqueue option and/or by taking that into account
in the 'migration resistance' mechanisms (there is already work in that
direction).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-tHChrBadeWiWBHM0qWfU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrWKJMACgkQFkJ4iaW4
c+71tBAA2ZcVXUiKfZgIY5mQi6QvrnYuexALkIG/e8SfQ6FveyHz3JSnD6KwY4DU
jv2uSD9mw04tOhzJXFSvIv+elNqhgAdh8Hvxw0q+TOoEwh2BQrY6RkF0cFcDuT7D
WZEG+ZRmBle3SRdbSf5kC3nNlKWKCDfCGP+x2ZkSWmJ4BW88hnJ5KDAdVF/w0SfX
t8ewX5p08s3ySjdFwuaj9YjgVPGA4B4HKtwXmiKydwnMtghsrIUhUTB1D9a5v38j
vepghW559Ub5IUW5zP2hZQTEkI4RiZUK5caUV0cWQ9dDxBhhyqnb0p7C2rJ/JpS4
2f1bTTKEYdEoRyOdAY8sq/bU9v8UKOdbBBnOTQlZw6w1VxtPBcpzZS06OcQzPq6j
1dGGTDuIoO6ybOiMdL5ysrUg3kRb4YiG3ky+gJhUw+LXw/AfmOmkIYeFzTu2kNNU
9+ePbqkUCsgeN0I3xEVwF6C9P0U3y9bg+k9jkSAJztbmB84HOjxvz7dNlWpDarex
uORWz0Bw9Vx5Nx809Dw0XlK6ZJe959qAgcl+TtGfrvvLgJM6CBJagON4LVBc1pbi
dXD53O9cfM+4IYDkot1VAKGAsV6lwIMKIUJVGclIUtrsxlLz+fBvJe4VSF6wk0yT
udXtrYfG8GEQu2pui7UMORW99YBFpZimFKB+rnJD038K2S10zjk=
=aMoF
-----END PGP SIGNATURE-----

--=-tHChrBadeWiWBHM0qWfU--



--===============0099225538134912550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0099225538134912550==--
