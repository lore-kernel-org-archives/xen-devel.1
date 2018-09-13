From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: null scheduler bug
Date: Thu, 13 Sep 2018 19:39:02 +0200
Message-ID: <529d38d04b140d90d33e424a064d401cf06f14cf.camel@suse.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
 <a938e477609ae123ae61aec515daa34ccaf0b8f3.camel@suse.com>
 <CADJ6SV2G=51BK2p-bouNGfiS5sP2tiV6ztZZ7PFGjiptRw_P3w@mail.gmail.com>
 <44174941bcd8f250a6ecd42ea10a78bf12453134.camel@suse.com>
 <CADJ6SV2wis2kOz9j4OGTzRLd+2O2f_SuxktFWRq2A_tbng_3Ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3126528977055576863=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tvlc=l3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g0Vaq-0005th-3U
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 17:39:52 +0000
In-Reply-To: <CADJ6SV2wis2kOz9j4OGTzRLd+2O2f_SuxktFWRq2A_tbng_3Ug@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>
Cc: xen-devel@lists.xenproject.org, stefano@stabellini.net
List-Id: xen-devel@lists.xenproject.org


--===============3126528977055576863==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-rKHz6FqnCA+Iqx6GHKpF"


--=-rKHz6FqnCA+Iqx6GHKpF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-09-13 at 17:18 +0200, Milan Boberic wrote:
> Commits are there and I will definitely continue with 4.10 version.
> But it didn't solve my problem entirely.
>=20
> I create my bare-metal application (with xl create) and destroy it
> with xl destroy (it disappears from xl list) and when I try to create
> it again same error pops but if I immediately run xl create command
> again it creates it without error.
> If I run xl create twice fast sometimes bare-metal application isn't
> in any state (it should be in "running" state).
> If I wait some time (approximately between 30 and 90 seconds) after
> destruction of that bm app and then run xl create it will create it
> without error.
>=20
Ok, thanks for trying and reporting back.

If possible, help me understand things a bit better.

So, can you confirm that the situation _actually_improves_ with Xen
4.10 ?=20

Basically, as far as I've understood things, with Xen 4.9, you destroy
a guest, and you can _never_ re-create it, not even after 30 seconds,
90 seconds, 2 minutes, 1 hour, ecc. Is that correct?

With Xen 4.10, it may still fail, if you try to re-create it within ~30
to 90 seconds, but after that, it works. Is that also correct?

I need to know this, because I want to understand if the issue is, at
least partially, cured by the RCU fixes, although having to wait 30
seconds is definitely not what I was expecting (i.e., there might be
something else).

Another question, in case I manage to produce a debug patch, are you ok
to put it in your source tree, build with it, and tell us what you see?

Thanks again and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-rKHz6FqnCA+Iqx6GHKpF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluaoLkACgkQFkJ4iaW4
c+6GThAAulS35XGpMjc3umirR/Zc6lM5S61GLjGE4mOIklNndUQIjaOnlqLcJ6Ut
pI3xnobOHh0HeQaQlks9MD4jUhx72vcdOaIfb0dVahnDqQwX0DPQdZhYvF90nzWg
wxb5drnLgI8MaiugHni7HQAUvSE8KGp31vv0d7ShekThDhqZUK27SlNZeJWOY9gV
KUPWrpgPFCGq7iC00Ge8VMN64smZSLxHKnKowNwtjvF58RukYjTtJMXTxdktouwg
Drqj55YR1o7AyslaN+odUAnPVnI7BZxTki5RBeaeZe0V8WanYoTBMPWxbyK76FUG
1heTlCsKComR2obFrQ1dSFnTbd27quzZfkV3WqWVdu/m/Qou1KqfzZbpPU5IQzuD
de7B2iT6hz7nkWjWGrU5tyGhw5kROb7bzEp56Gd3iGekK232JcfYqi9IYd+W3xgf
037PUoz8ACgX6IaUy4P9rcmgusLkPe9PTCc9v8+WG7tY4S2fLpx+w4Vyjt2kTbh+
7hzl/GZ05JQPLDKHqz30pvDyLFhwTGJiXEpHw3pP8nPyXImtbq0Sl83tQ+1Res9m
CfkFjFX3ArSmcCJ7qUC0YoMg8ykkkfRzdfnIWtyFd8BOuu50f61lyzyzn6GdX1od
MzRHtKeDZV2jNSSQgk2oPIrMH35mXZtL2Dn7LvkAotpNpiKMmu0=
=fW+v
-----END PGP SIGNATURE-----

--=-rKHz6FqnCA+Iqx6GHKpF--



--===============3126528977055576863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3126528977055576863==--
