From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: {xen,
 dom0}_vga_console_info.u.vesa_lfb.lfb_base field too small
Date: Mon, 6 May 2019 12:29:53 +0200
Message-ID: <20190506102953.GW1728@mail-itl>
References: <20190505132740.GT1728@mail-itl>
 <a4435002-24ef-9565-f1fb-3de6c54b1fe7@suse.com>
 <5CD004F2020000780022C1B2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4689830543301568507=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNasn-0004Sa-Lv
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 10:30:05 +0000
In-Reply-To: <5CD004F2020000780022C1B2@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============4689830543301568507==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vKcNkqnJHUUp475E"
Content-Disposition: inline


--vKcNkqnJHUUp475E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] {xen, dom0}_vga_console_info.u.vesa_lfb.lfb_base
 field too small

On Mon, May 06, 2019 at 03:57:06AM -0600, Jan Beulich wrote:
> >>> On 06.05.19 at 10:04, <jgross@suse.com> wrote:
> > On 05/05/2019 15:27, Marek Marczykowski-G=C3=B3recki wrote:
> >> Hi,
> >>=20
> >> I have a machine that allocate vesa LFB above 4GB, as reported by UEFI
> >> GOP. At 0x4000000000 to be specific.
> >> vga_console_info.u.vesa_lfb.lfb_base is a 32bit field, so it gets
> >> truncated, leading to all kind of memory corruptions when something
> >> writes there.
> >> If that would be only about Xen, that wouldn't be that bad, but
> >> unfortunately exactly the same structure is used as an interface for
> >> dom0 start info (at least PV one).
> >> My only idea is to introduce yet another entry in *_vga_console_info.u
> >> union (efi_lfb64?) with a 64bit lfb_base field. And mark it in
> >> video_type (XEN_VGATYPE_EFI_LFB64?). But I'm not sure how non-patched
> >> Linux (or other supported OSes) would respond to this. xen_init_vga() =
in
> >> Linux doesn't seem to bail on unknown video_type, so it may be fragile.
> >>=20
> >> Any better ideas?
> >=20
> > In Linux kernel the screen_info structure has ext_lfb_base for that
> > purpose (it contains the upper 32 bits of lfb_base).
> >=20
> > We could add a similar member to Xen's dom0_vga_console_info.u.vesa_lfb
> > and let the kernel detect its presence by using the value of
> > start_info.console.dom0.info_size - this wouldn't require a new video
> > type and old kernels would run as today. The same scheme is used for
> > gbl_caps and mode_attrs already.
>=20
> +1

Makes sense.
That said, in Linux, VIDEO_CAPABILITY_64BIT_BASE is 2, same as COMPAT
bit Xen use in gbl_caps - which is later copied to
screen_info->capabilities by Linux... Another interaction is that, all
extra fields (gbl_caps, mode_attrs) are skipped with
XEN_VGATYPE_EFI_LFB. It will look a little confusing that bit 2 means
totally different things depending on video type. And to be honest, I'm
not sure if Linux wouldn't interpret COMPAT bit wrong here.

BTW another problem I have on this machine is the framebuffer size. It's
3840 x 2160, which is larger than max resolution hardcoded in
drivers/video/lfb.c (1920 x 1200). efi_find_gop_mode() chooses the
largest one, ignoring this limit. On one hand, it should take the limit
into account, but on another, increasing the limit looks quite harmless
(other than the console is quite slow) and not changing the mode during
boot looks better.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--vKcNkqnJHUUp475E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzQDKAACgkQ24/THMrX
1yzOsAf/ZsX/HyxEegb24/zWWTOdpUwHK2wPPq3YeIhYZvL3mYgXAUEdHRduXGAo
7EFnNgQORazhUjUU8e+7CXkvYT6clCF8TluvtSbQpUbyvsPT4WofBpZ8Us/DCuEQ
DAPt1d8OTQ/RZ1Hl/Bz9CrFVVxqtwlSEuw3oO1bLfajXjtU8+gGNJ0k3tizCuCYE
+KdFe78dLPoD8jm1LvkP8d5oe12205c8G76VdTMMGJ8qwKopqBsOOm0y5tT9GkLP
qWfVIEkS2LyO+4zehd6bpZUgbm+uXrCgw6Sj8Y6hztOh/KraPXQ9Zotzgcr12QX5
AI8DK6vhAwEdgzlvwu+iWTvVYdhDVw==
=vfBj
-----END PGP SIGNATURE-----

--vKcNkqnJHUUp475E--


--===============4689830543301568507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4689830543301568507==--
