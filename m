From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 4/6] xen/sched: Remove {init,
 destroy}_domain() interfaces
Date: Thu, 01 Mar 2018 12:08:22 +0100
Message-ID: <1519902502.9145.18.camel@suse.com>
References: <1519827268-18199-1-git-send-email-andrew.cooper3@citrix.com>
 <1519827268-18199-5-git-send-email-andrew.cooper3@citrix.com>
 <92a3c792-1399-c2fc-44d4-fbf4161c0c83@citrix.com>
 <8bf35012-737a-420e-33a7-ab68b06df14a@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3595402051283452424=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <8bf35012-737a-420e-33a7-ab68b06df14a@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Robert VanVossen <robert.vanvossen@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org


--===============3595402051283452424==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-rMlpaXtf3lFL55T6TTMW"


--=-rMlpaXtf3lFL55T6TTMW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-02-28 at 16:33 +0000, Andrew Cooper wrote:
> On 28/02/18 16:22, George Dunlap wrote:
> >=20
> > I kind of feel like there was a reason for the init / alloc
> > difference;
> > but as you say, at the moment all the schedulers are basically
> > identical.  In the unlikely event that we need separate callbacks,
> > we
> > can introduce them at such time as we have a need for them.
> >=20
> > Reviewed-by: George Dunlap <george.dunlap@citrix.com>
>=20
> It looks like it was the cpupool work (c/s 78be3dbb, 2010) which
> split
> alloc/free domdata() out of init/destroy domain() and made the latter
> effectively redundant.
>=20
Yes. As far as I can see/tell (I wasn't here), that commit introduced
alloc_domdata because there was the need to allocate the per-scheduler
domain data, without immediately assigning it to sched_priv.

I guess something like this that Andrew is doing could have been done
at that point. It just was not. :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-rMlpaXtf3lFL55T6TTMW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqX3yYACgkQFkJ4iaW4
c+67zQ/+PQCbCl+wGVrEqSNBtoNScWJoWVVI+CHPo+j3fVk5Yk1tuSHYzXEcx4oT
8DD8q8bV/eBzJCLc8qO0/X+ymhoL7nXLeL87WQ0Espaeva1wEr/1chqkluS8SEH5
IPlsEtF6f1WEQNXDC94cEfpxJlQYbSx5JRD0MfLRDuxOyW7aRqmiV6aIH0qP0shg
cWJeQtsSqM19hub6VGbmFiLmslJF0X9VO4L2+2eP7HqJrS2lrKDqQADIcOviDAmU
oDmuiQjKStPVlerqKZj1xf+fJHXD1lO/s0p3h9C0aggZDmAeGAA/bFiTmHvZg3RP
D7fv6oWU7naTJ8BwTfmrJxel8DKB7TCE/5jH6Oic5OApmS9RbxBSSharoYd6HZ8w
aH4TNqRPWoOgstBP96nNIQNTwNp3jiZnyHk4uQPvN3Zz12a24OvS+2pQX2f1cHVA
M+/mtSFsXYwNa8Fbuld/NYjyJju2Ciq6SGVd1osZtv5pFcIdQywqsgsNdcwxuBRL
HZ8oa2At4Uaq+SqE+CtK2tTiFnh3BNoBsSLpVDjwvZon319UjV3+yVwTGxG9jpqP
yOFsBo2UHvIsbbGlfAf/AtSup/TId68aEOZBoHZd1TcUTPxkVOCToW1HJPiJk33T
x7i+ixzpLMrj+6SKOETObahMy5zX3icGfdFie+PAuyAp+kwkWT4=
=/zaH
-----END PGP SIGNATURE-----

--=-rMlpaXtf3lFL55T6TTMW--



--===============3595402051283452424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3595402051283452424==--
