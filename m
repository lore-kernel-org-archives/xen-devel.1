From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: {xen,
 dom0}_vga_console_info.u.vesa_lfb.lfb_base field too small
Date: Sun, 5 May 2019 15:27:40 +0200
Message-ID: <20190505132740.GT1728@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3077111936154259749=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AYeZ=TF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNHBN-0004ML-6D
 for xen-devel@lists.xenproject.org; Sun, 05 May 2019 13:27:57 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 629EE21D
 for <xen-devel@lists.xenproject.org>; Sun,  5 May 2019 09:27:44 -0400 (EDT)
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 586FEE44B5
 for <xen-devel@lists.xenproject.org>; Sun,  5 May 2019 09:27:43 -0400 (EDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============3077111936154259749==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H88uUF932U8Oj0a6"
Content-Disposition: inline


--H88uUF932U8Oj0a6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: {xen,dom0}_vga_console_info.u.vesa_lfb.lfb_base field too small

Hi,

I have a machine that allocate vesa LFB above 4GB, as reported by UEFI
GOP. At 0x4000000000 to be specific.
vga_console_info.u.vesa_lfb.lfb_base is a 32bit field, so it gets
truncated, leading to all kind of memory corruptions when something
writes there.
If that would be only about Xen, that wouldn't be that bad, but
unfortunately exactly the same structure is used as an interface for
dom0 start info (at least PV one).
My only idea is to introduce yet another entry in *_vga_console_info.u
union (efi_lfb64?) with a 64bit lfb_base field. And mark it in
video_type (XEN_VGATYPE_EFI_LFB64?). But I'm not sure how non-patched
Linux (or other supported OSes) would respond to this. xen_init_vga() in
Linux doesn't seem to bail on unknown video_type, so it may be fragile.

Any better ideas?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--H88uUF932U8Oj0a6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzO5MwACgkQ24/THMrX
1yyWFwf/cajomXTfDGFNaosEYL0lcjpjnx1jBd9aqGKB+6/IU74xtd8ICYygy5V2
tQfAMYNP8WE+wMe8UnxqFUVH6yQH7diu3MYrOvvUaO69z28bjh7r14skPNyYonMS
yUpZwMumiuEeFwLm111LGdQKmHbWTwMon45KSY9TDOqxULJtWg+tO/kLBdfpLgVC
Yl5fY0xWXzchNXy383xh38giaKV89WQQQNZ9He+2miA7zxZQ2Zqbw5/Va/tJz61n
KtSzHagjEgsi5bMquvpG+w6/236pDhyrUc+5mU6ZiQUZh6xWWaouxJ/hkoKuJUuz
io41fdVh2urcD9VuV8cQMGDdMBoVrA==
=weM5
-----END PGP SIGNATURE-----

--H88uUF932U8Oj0a6--


--===============3077111936154259749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3077111936154259749==--
