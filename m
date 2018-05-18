From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Test for osstest, features used in Qubes OS
Date: Fri, 18 May 2018 17:44:10 +0200
Message-ID: <20180518154410.GD11683@mail-itl>
References: <20180516215425.GB11683@mail-itl>
 <23293.29942.645249.704280@mariner.uk.xensource.com>
 <20180517145922.GA20125@mail-itl>
 <23293.39881.793095.966171@mariner.uk.xensource.com>
 <333a22af-9b93-4460-12f7-b848e8887488@eikelenboom.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3475864019895168174=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <333a22af-9b93-4460-12f7-b848e8887488@eikelenboom.it>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>
Cc: Ian Jackson <ian.jackson@citrix.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============3475864019895168174==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Content-Disposition: inline


--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2018 at 08:00:38PM +0200, Sander Eikelenboom wrote:
> Marek / Ian,
>=20
> Nice to see PCI-passthrough getting some attention again.
>=20
> On 17/05/18 17:12, Ian Jackson wrote:
> > Marek Marczykowski-G=C3=B3recki writes ("Re: Test for osstest, features=
 used in Qubes OS"):
> >> On Thu, May 17, 2018 at 01:26:30PM +0100, Ian Jackson wrote:
> >>> Is there some kind of cheap USB HID, that is interactable-with, which
> >>> we could plug into each machine's USB port ?  I'm slightly concerned
> >>> that plugging in a storage device, or connecting the other NIC, might
> >>> interfere with booting.
> >>
> >> I use mass storage for tests... But if you use network boot, it
> >> shouldn't really interfere, no?
> >=20
> > We do both network boot and disk boot.  I think the BIOS disk boot has
> > to continue to work and boot the HDD.

In fact, using any device should be enough for the start. USB mouse for
example. Just reading USB descriptor involve some communication with the
controller, so it should be some indication about its state.

> As a user of pci-passthrough for quite some time and reporting some pci-p=
assthrough bugs in the past,
> I do have some comments:
>=20
> - First of all it would be very nice to get some autotesting :).
> - But if you want to thoroughly test pci-passthrough,=20
>   it will be far from easy since there is quite a multi-dimensional suppo=
rt matrix
>   (I'm not implying that everything should be done or it won't be valuabl=
e if any is missing,
>    it's only meant for reference):
>   1) Guest side implementation:=20
>      - PV guest (pcifront)
>      - HVM (qemu-traditional)=20
>      - HVM (qemu-xen)=20
>      - HVM (qemu-upstream)=20
>      - perhaps PVH support for pci passthrough coming around the corner.
>=20
>   2) (Un)Binding method to pciback:
>      - binding pci devices to pciback on host boot (command line)=20
>      - de/re/unbinding devices from dom0 while running.
> =20
>   3) (Un)binding to guest:
>      - On guest start (guest.cfg pci=3D[...])
>      - After the guest has been started with 'xl pci-*' commands
>   3) Device interrupts: legacy versus MSI versus MSI-X
>   4) Other pci device features: roms, BAR sizes, etc.
>   5) AMD versus Intel IOMMU
>=20
> From the past reports, I know (1) and (3) did matter (problems being isol=
ated to one of these variants only).

Yes, that's right, my experience is similar in that matter. Especially
point 3 is tricky/problematic, as some devices (or rather: drivers)
doesn't correctly fallback to legacy interrupts if MSI/MSI-X isn't
available.
So, the ideal test should check those things too - if the guest driver
really use what it's expected to use. But lets start with something
first. I don't know how osstest handle it yet, but I'd expect adding
more guest configurations to run the same test on should be easy.

> As for restarting guests and reassigning pci-devices again to other guest=
s the current pciback reset support lacks
> the bus-reset patches at present in upstream linux kernels. Passthrough o=
f AMD Radeon graphics adapters works only one
> time without it (if you stop and restart a guest it doesn't work anymore =
and you need to reboot the host).=20
> With the bus-reset patches (which have been posted to the list and seem t=
o be in both Qubes and Xenserver=20
> in some form but not in upstream linux). Someone from Oracle had picked t=
hem up to get them upstream some time ago,
> but that effort seems to have stalled.

Can you point specifically what patches are you talking about? In Qubes
in most cases device reset is handled by libvirt...

> The code in libxl seems to be quite messy for pci-passthrough especially =
for handling all the guest side implementations (1)
> and xenstore interactions that go with it (or don't for qemu).
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlr+9MoACgkQ24/THMrX
1yxwrAgAlJqvMbwQXS/jkp/4zT3bTYZ76pzjgkqW+MDpm6Kp5MuDpre20uFI8G31
WDiKW8wKz4FPbYFmWLW7Kf4nvB9juCxxSd2uN7Y6c9oeHlMqtTTVCVXcC9BX0DLg
uZn/fwnWCNyJVV5lLjBDmXk/RSjtgbi6vXGiUgKPLsadqMQZqUbEF5Zg6Ov0Y84z
ksEWJKikKo+NBrNsBAKVtWwJgqxaUhjztE50i9f8gZPejaM/LGfxWr6dvbs+yuXZ
ZMlVS82pHkQFS8yuy4pUMRyEj67O+FgHUd8R5gk0WtAcUiLkTDZl03eiUaFmQgoV
1hu6Y3aIEpUB74q5An7J0Ftog+TIJQ==
=zTBu
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--


--===============3475864019895168174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3475864019895168174==--
