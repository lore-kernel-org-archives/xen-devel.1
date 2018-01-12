From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen/credit2: Drop unnecessary bit test
Date: Fri, 12 Jan 2018 09:45:24 +0100
Message-ID: <1515746724.30117.75.camel@suse.com>
References: <1515689305-29482-1-git-send-email-andrew.cooper3@citrix.com>
 <e5b93c38-5e8a-3fa1-ee6f-b49ebe45ba1d@citrix.com>
 <1515691609.30117.59.camel@suse.com>
 <acc1cc95-02c4-ab5e-a9ce-5a6056caa9cf@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2800271090975039903=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <acc1cc95-02c4-ab5e-a9ce-5a6056caa9cf@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============2800271090975039903==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-GS+02bFcF1busnjqTx7I"


--=-GS+02bFcF1busnjqTx7I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-01-11 at 17:36 +0000, Andrew Cooper wrote:
> It is generally worth doing a read to conditionally avoid a locked
> RMW,
> in the case that you expect the locked RMW to be unnecessary (i.e.
> the
> modification is already present).
>=20
> The same is not true for plain memory reads and writes.  The overhead
> of
> the conditional jump far outweighs the saving of possibly not
> dirtying
> the cache line.
>=20
Sure.

> The reason I noticed this is because (with my bitops change), the
> compiler optimised the if out entirely.
>=20
Ah, interesting. :-)

It's not necessary, as George Acked it already, but feel free to add a:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-GS+02bFcF1busnjqTx7I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpYdaQACgkQFkJ4iaW4
c+4QVA/+OwSvN40DXJKWJFmO4zpgijctLWv/FybmYqHjwfuK0DifrshA+WjCwb1u
nLpcQfCYRxOFVGwWvHbIALs/olcNFPPKJsIhR7pNOG5Fgk+SPxrsRRDZtT1XqYGj
2VagCxco9QTWsHBZO40I/W1uGLxygryzKp8rKvocui7pb6D3KVb15gAyVqga3YRQ
8+eTguXp8dH12Kmrh5e945DHXvb3ORu2YVlxJ9YNp8y4lRwxZ0tND89ay1isb+kv
OIdqjSynJtDrxPM8tEGAzMVBp5CpjgmvCuu68Sx9eYS0n0Lt/XRrH12Qg8XRVrjo
QwbXp6+ju7X03I8MvesOKx/rm+C3I667LW88dwqGKZo49OsNu0ixe4z5m1qF3Go1
tXn6RxSCBItoT0v6bN9/QhwKMsytFgkK0s9VozLHny37LYcgZ489Kis6MpM7ZaLl
IJjVjkp9FjyaVF+poPhXzjWUyNif3EmnFmHIS/krYCISr7PWgp9cIztw6lhFhR/Z
JifihsMvEfv6r4tGaZWV1wjhBqBrZDCfxDdnNPnC2Oq4B0x+u3qsVc6/CvbWbRSx
Ik57Z3HAWorap5sowg+ruxKx87KWF32lMQdPiCSNNhDa0bpUEFbJkjarB3sCbtHI
ZQHa/EcWBsr2l6+nxdBuD5LhFbK9mrAGKMZUVx4Dw10QoGVfqZo=
=dmTI
-----END PGP SIGNATURE-----

--=-GS+02bFcF1busnjqTx7I--



--===============2800271090975039903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2800271090975039903==--
