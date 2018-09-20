From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: null scheduler bug
Date: Thu, 20 Sep 2018 18:09:04 +0200
Message-ID: <a468e3dfc55bb6a421d47b908f89d9112075cc04.camel@suse.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
 <a938e477609ae123ae61aec515daa34ccaf0b8f3.camel@suse.com>
 <CADJ6SV2G=51BK2p-bouNGfiS5sP2tiV6ztZZ7PFGjiptRw_P3w@mail.gmail.com>
 <44174941bcd8f250a6ecd42ea10a78bf12453134.camel@suse.com>
 <CADJ6SV2wis2kOz9j4OGTzRLd+2O2f_SuxktFWRq2A_tbng_3Ug@mail.gmail.com>
 <529d38d04b140d90d33e424a064d401cf06f14cf.camel@suse.com>
 <CADJ6SV09MS1x+qGJOu71W8M6cVhRaVuODBYDReHWmOm4c1NEfQ@mail.gmail.com>
 <CADJ6SV0+O5c52_qwOUEakuX82C2+8Z-M4mKj0x+13GXjaiJjvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7216692105700459712=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wywx=mc=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g31WZ-0007kx-QI
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 16:09:51 +0000
In-Reply-To: <CADJ6SV0+O5c52_qwOUEakuX82C2+8Z-M4mKj0x+13GXjaiJjvw@mail.gmail.com>
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


--===============7216692105700459712==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-CEJ0niGnbLfAVFfsywST"


--=-CEJ0niGnbLfAVFfsywST
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Sorry for not having followed up. I was (and still am) planning to, but
am also a bit busy.

On Thu, 2018-09-20 at 15:04 +0200, Milan Boberic wrote:
> I ran some more tests and managed to successfully create and destroy
> domU as many times as I want, without any delay between destroy and
> create.
> I added:
>  printk("End of a domain_destroy function");
>  in domain_destroy function and
> printk("End of a complete_domain_destroy function"); in
> complete_domain_destroy function, at the end of the functions.
> Those functions are in domain.c file.
>
Right. This is exactly the kind of debug patch I wanted to
suggest/send. It is, in fact, what was being use to diagnose/fix the
RCU issue, when it first came up, as you may have seen.

> Now, after every xl create it prints:
>=20
> root@uz3eg-iocc-2018-2:~# xl create bm1.cfg
> Parsing config from bm1.cfg
> <G><3>memory_map:add: dom2 gfn=3Dff0a0 mfn=3Dff0a0 nr=3D1
>=20
Mmm... So, you added a printk() (or, actually, two of them) in the
domain destruction path, and are seeing (different) things being
printed during domain creation? How nice! :-D

I'm not sure how that happens, and whether/how this new output relates
to the problem. However, what about the printk() you added? Do you see
their output? It may be visible only on the console and/or in `xl
dmesg'.

While there, if you can, I'd add timestamsp, e.g.:

printk("t=3D%"PRI_stime":End of a domain_destroy function", NOW());
printk("t=3D%"PRI_stime":End of a complete_domain_destroy function", NOW())=
;

and check what the outpur looks like both under credit or credit2, and
under null.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-CEJ0niGnbLfAVFfsywST
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlujxiIACgkQFkJ4iaW4
c+607hAAtjlO7HgOE4fMWC62RuiV8BuDJkrbefiZv/I0zGBoRU29Ww0HO7ZOdyyE
81axFT/dZ3U5m5tAepaW9AO137s/HQNR/ncLlfR09Q/cYpyfP+CIJdM4ZXRa9sCO
aFdU85+1GK83E4hIRhHs5NicXUXjwCLNdfBW1bu+pdow2vSb9oOMy4784j8jUqBs
eGOOho7LcM9LNWo02mu1fkrWxxa9lqS4/g2fuv2rYkpAVrtelbJgl/nauJ+LaP1W
JcmbSmhSf+vEU1g0yrzPvlngi6B3XCzg2TFN5OBWIC/pI7m/TQ/Z9oWqsvngtZov
I/jctsKqtH0RKu+1a4H6mDqZ04iw3vMFK8jew+wdde5UbWeqJ3iD2BUyTIVOez5G
CwNDL6jtvE8tXpT83w3Oua5d+CnZNMIV8SLcbGU58bODrclVurl4dzdeOBiaBFru
U82VlFjmklrjYgo/uAmfltTlCozZr74/X6si27brTIBwWHyawcUodsemPZwuJmm8
ZxrUorsINx9UE46jEQqy0XDxn2OwI0TXM5MfD9oXBPFdln7KrT63zqYO+5GXKZ8h
G8klMlM/nXyd4xooENMVBUpoFRqUNmPzGjKadCbDK0jLfmbbJzYm8ad9r7XMNnCR
JNKw302Po2gJDE80zjWIlvpGC2bjFJxvUPRfKnCZ3YQHPe13fFY=
=jgVb
-----END PGP SIGNATURE-----

--=-CEJ0niGnbLfAVFfsywST--



--===============7216692105700459712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7216692105700459712==--
