From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Test for osstest, features used in Qubes OS
Date: Thu, 17 May 2018 16:59:22 +0200
Message-ID: <20180517145922.GA20125@mail-itl>
References: <20180516215425.GB11683@mail-itl>
 <23293.29942.645249.704280@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0723993979263142406=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <23293.29942.645249.704280@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============0723993979263142406==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2018 at 01:26:30PM +0100, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("Test for osstest, features used =
in Qubes OS"):
> > As discussed some time ago, I'd like to help with adding tests for some
> > features we use in Qubes OS.
> >=20
> > IMO the easiest thing to test is host suspend. You just need to execute
> > "rtcwake -s 30 -m mem", and see if the host is back to live after ~30s.
> > Right now I know it works on Xen 4.8, but supposedly is broken on
> > staging (haven't tested the most recent version).
> > Next step would be the same while having some domains running.
> >=20
> > How the test should look like (where to add this? etc)?
>=20
> I guess this should be a new
>   ts-host-suspend-test
> script.
>=20
> Is it likely that this will depend on non-buggy host firmware ?  If so
> then we need to make arrangements to test it and only do it on hosts
> which are not buggy.  In practice this probably means wiring it up to
> the automatic host examiner.

Yes, probably.

> > Next things would be mostly related to PCI passthrough:
> >  - PCI passthrough with qemu in stubdomain
> >  - the same as above, but with Linux-based stubdomain (we need cleanup
> >    and send patches for that first, probably 4.12 material)
> >  - guest suspend (recently added libxl_domain_suspend_only), for
> >    different guest types (PV, PVH, HVM), also with/without PCI device
> >=20
> > For this, the machine obviously need to have IOMMU (I assume at least
> > some of the hardware used in test lab have it), and some spare PCI
> > device. I use sound card for some of such tests. But testing on USB
> > controllers would be more useful (from out experience, one of the most
> > problematic devices for suspend, sadly also lacking FLR or such...).
>=20
> I doubt any of our x86 machines have sound cards. ...  Just looked at
> one and it says
>   00:03.0 Audio device: Intel Corporation Xeon E3-1200 v3/4th Gen Core
>   Processor HD Audio Controller (rev 06)
> which is obviously mad.
>=20
> I'm pretty sure they all have usb controllers.  Almost all of them
> have multiple NICs, often on different pci devices, although it is
> difficult to tell if a NIC not connected to anything is working.
>=20
> Eg,
>=20
>   02:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network
>   Connection (rev 03)
>=20
>   03:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network
>   Connection (rev 03)
>=20
> Is there some kind of cheap USB HID, that is interactable-with, which
> we could plug into each machine's USB port ?  I'm slightly concerned
> that plugging in a storage device, or connecting the other NIC, might
> interfere with booting.

I use mass storage for tests... But if you use network boot, it
shouldn't really interfere, no?

> If you want to get pci passthrough tests working I would suggest
> testing it with non-stubdom first.  I assume the config etc. is the
> same, so having got that working, osstest would be able to test it for
> the stubdom tests too.

Oh, I though there are already tests for that...
Yes, good idea.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlr9mMoACgkQ24/THMrX
1ywUnAf/S30LnmFNbxQFba8P3y+2rbDuV6Amsaf7JQL0uFxFTx0OyW2p+AvaHgFg
JxXcylHrH9x/4xcMvY9LEl++BPaXigdi6kWyVCOPZg0udbzYqzVKWskJOESZJzb8
L/uYrJCb6M50ad3OTJU+77hY7GIZKzsw7qenOJFc0DElyinuhK/RzGW1RsJTgxFB
hGMCJkwxmvq6t1r0XrDAf1ayHc3jZyjY6uqkGjNTdy7UiUMT7o4mgQpvVFNNhG98
37B8WH3dk2BwpM8LoLs2sreQ+O9nWKKc2n9PO7RpdZmzrPS1636x2WI4F+X1bx5H
wQVddrjda13yai41WeadjKbIwKSYgw==
=RZct
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--


--===============0723993979263142406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0723993979263142406==--
