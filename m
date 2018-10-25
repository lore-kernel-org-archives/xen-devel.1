From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Xen optimization
Date: Thu, 25 Oct 2018 15:44:51 +0200
Message-ID: <edca5496e2201dce26beafffff0e866e4a1243be.camel@suse.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <alpine.DEB.2.10.1810121035440.436@sstabellini-ThinkPad-X260>
 <CADJ6SV3jk=nnP=6T8R+OuvJH2uQ6uBrLmvudAHkKHP+mN-3hPA@mail.gmail.com>
 <e0f4fe11-eeb0-3a28-2e7e-246a8f72da19@arm.com>
 <12a4352a-2fd1-2d04-874a-4a779d18a097@arm.com>
 <CADJ6SV0E=cO3eFyt+meXTtZaoETYxpsHkViMDU=XV9CwNOjP8A@mail.gmail.com>
 <21de0bb5-81f2-ca26-e2e0-916c20ab2c02@arm.com>
 <CADJ6SV3sfqaXm8gvZDAx2wFY5_oiCf+mf0JynCGNrLBFkS-rVw@mail.gmail.com>
 <alpine.DEB.2.10.1810191336090.31582@sstabellini-ThinkPad-X260>
 <d3a589c5d95d70ef1c13b4fe6856b7ed387b4ee3.camel@suse.com>
 <CADJ6SV2891kOd_Ga8jjXdtKdjPAoWtADhizuS+kjSZNNOPMK+w@mail.gmail.com>
 <alpine.DEB.2.10.1810221037270.31582@sstabellini-ThinkPad-X260>
 <CADJ6SV0gUvRv_4Kp=Vz5n4WSQ3kgQrC=+gPz1QjrBzdFOoJwPA@mail.gmail.com>
 <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
 <CADJ6SV3kj0sN-0nzfqBwbz_BMerArKRtdYAQ-FfgvdM3FPqu_Q@mail.gmail.com>
 <12464587-0b86-890c-d115-b5cc417ea0ef@arm.com>
 <CADJ6SV2Uzt=Q_C2ycXwcYqyQr290cHy3SzE0k08=WNHY1eBgRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6739181682331987593=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xzhc=nf=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gFfwi-0002Ph-Tt
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 13:45:08 +0000
In-Reply-To: <CADJ6SV2Uzt=Q_C2ycXwcYqyQr290cHy3SzE0k08=WNHY1eBgRQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>, julien.grall@arm.com
Cc: stefano.stabellini@xilinx.com, andrii_anisov@epam.com, sstabellini@kernel.org, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org


--===============6739181682331987593==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-oOpLk5+yxXdQd9Y1tcWz"


--=-oOpLk5+yxXdQd9Y1tcWz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-10-25 at 14:36 +0200, Milan Boberic wrote:
> On Thu, Oct 25, 2018 at 1:30 PM Julien Grall <julien.grall@arm.com>
> wrote:
> >  Do you have DEBUG enabled?
>=20
> I'm not sure where exactly should I disable it. If you check line 18
> in xl dmesg file in attachment it says debug=3Dn, it's output of xl
> dmesg. I'm not sure if that is the DEBUG you are talking about.
>
Yes, this mean debug is *not* enabled. Which is the correct setup for
doing performance/latency evaluation.

It might, OTOH, be wise to turn it on when investigating the system
behavior (but that's a general remark, I don't know to what Julien was
referring to in this specific case).

To turn it on, in a recent enough Xen, which I think is what you're
using, you can use Kconfig (e.g., `make -C xen/ menuconfig').

> Also if I add prints somewhere in the code, I can see them, does that
> mean that DEBUG is enabled? If yes, can you tell me where exactly
> should I disable it?
>=20
It depends on the "print". If you add 'printk("bla");', it is correct
that you see "bla" in the log, even with debug=3Dn.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-oOpLk5+yxXdQd9Y1tcWz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvRyNMACgkQFkJ4iaW4
c+7Z+BAApQZnVyh2XRFEoncb+UMdpcLXiRVuJDl44mjeZAT2vCdo+pVxyDi65JrI
QJAYIcunFd1t4Qxd0Z6sc8+yj1xbHXKi5tBhzqLUXjV4NWcg/pBeP9GQmcxYCuu/
MdbiWjmhMteFWae4QhenmtCNydAsmiKEABvJM0Yumku4/zv+Mc+xGMArYkQ6l80X
wbQ/wtmE6OBpviMEF1aloG2qPQM9p+6gjvOJsfwbPFVwIXGZJaQ+0A82/fG7g+OL
+/sc0hnhZWPb4FBPCCwR/N5kti+/rQsdIYZG23JY9usFuoNbPcw7NwWHMsLvt7Ge
QteQ3MnoxF5sgAzt0aGr556CBBXvvy4QPUF/Jc8knZyiki0rH2ys7LFsIZMUSAif
urmBJyNm5cNWUGjburQIYtnNPB0tVmedgqmSBAzoQXsGt0gUo1+o7u/E1IGiK9zB
B5c78BivAvRs9csuPzXu/i04KkjgWBVJgEEvuZHBS2SshSF23xTfXnRs61s+o4lN
48JTkx9aJdU8BYK6m6K45OOeKBeCx6N9B0wYRyKyP4Y7Lqt4Py2kvE6geewzdsTG
3AUhMZF0y4c9gJ6cyxYqOZIBSvwzs4UCm5QZ9dCOLGhO6cHm3A0L+K1057tRvXcV
o+tjqGOVINZv0bgoe0d9tdkZNxqzEzE5pd2vg2uFUyvW/RMzgMY=
=CaxD
-----END PGP SIGNATURE-----

--=-oOpLk5+yxXdQd9Y1tcWz--



--===============6739181682331987593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6739181682331987593==--
