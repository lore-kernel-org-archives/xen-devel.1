From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Race condition on device add hanling in xl devd
Date: Mon, 25 Feb 2019 00:14:02 +0100
Message-ID: <20190224231402.GB5279@mail-itl>
References: <20181216014743.GA5040@mail-itl>
 <20181217094059.rvoptuzp6im52jyp@mac>
 <20181217120001.GB23474@mail-itl>
 <20181217121855.zsrn6fvliz4f5yul@mac>
 <20181217122315.GC23474@mail-itl>
 <20181217130534.6sdlcywutzcwzw2d@mac>
 <be0aadbb141f4537a6a058a4801fd7ea@AMSPEX02CL02.citrite.net>
 <20181217143212.abwf7k6dx233647d@mac>
 <628e7577dcae457ba39d88ff78fefff2@AMSPEX02CL02.citrite.net>
 <20181217160919.l73npsmx72mh5d4z@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6677841469302383674=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GA31=Q7=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gy2yI-0006i3-Pf
 for xen-devel@lists.xenproject.org; Sun, 24 Feb 2019 23:14:10 +0000
In-Reply-To: <20181217160919.l73npsmx72mh5d4z@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6677841469302383674==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline


--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 17, 2018 at 05:09:19PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Mon, Dec 17, 2018 at 02:42:23PM +0000, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Roger Pau Monne
> > > Sent: 17 December 2018 14:32
> > > To: Paul Durrant <Paul.Durrant@citrix.com>
> > > Cc: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>=
; xen-
> > > devel <xen-devel@lists.xenproject.org>; Wei Liu <wei.liu2@citrix.com>
> > > Subject: Re: [Xen-devel] Race condition on device add hanling in xl d=
evd
> > >=20
> > > On Mon, Dec 17, 2018 at 01:11:11PM +0000, Paul Durrant wrote:
> > > > > -----Original Message-----
> > > > > From: Roger Pau Monne
> > > > > Sent: 17 December 2018 13:06
> > > > > To: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.=
com>
> > > > > Cc: xen-devel <xen-devel@lists.xenproject.org>; Wei Liu
> > > > > <wei.liu2@citrix.com>; Paul Durrant <Paul.Durrant@citrix.com>
> > > > > Subject: Re: [Xen-devel] Race condition on device add hanling in =
xl
> > > devd
> > > > >
> > > > > On Mon, Dec 17, 2018 at 01:23:15PM +0100, Marek Marczykowski-G=C3=
=B3recki
> > > > > wrote:
> > > > > > On Mon, Dec 17, 2018 at 01:18:55PM +0100, Roger Pau Monn=C3=A9 =
wrote:
> > > > > > > On Mon, Dec 17, 2018 at 01:00:01PM +0100, Marek Marczykowski-
> > > G=C3=B3recki
> > > > > wrote:
> > > > > > > > On Mon, Dec 17, 2018 at 10:40:59AM +0100, Roger Pau Monn=C3=
=A9 wrote:
> > > > > > > > > On Sun, Dec 16, 2018 at 02:47:43AM +0100, Marek Marczykow=
ski-
> > > > > G=C3=B3recki wrote:
> > > > > > > > > > A workaround could be implemented in hotplug script its=
elf -
> > > > > wait for
> > > > > > > > > > the device there. I'm not sure how proper solution could
> > > look
> > > > > like. Some
> > > > > > > > > > synchronization between xl devd and the kernel (like xl=
 devd
> > > > > monitoring
> > > > > > > > > > uevents)?
> > > > > > > > >
> > > > > > > > > There's already a synchronization mechanism, libxl waits =
for
> > > the
> > > > > > > > > backend to switch to state 2 (XenbusStateInitWait) before
> > > running
> > > > > the
> > > > > > > > > hotplug scripts [0].
> > > > > > > > >
> > > > > > > > > Maybe netback sets state 2 before creating the backend de=
vice?
> > > > > > > > >
> > > > > > > > > It looks to me like the backend needs to be sure everythi=
ng
> > > needed
> > > > > by
> > > > > > > > > the hotplug script is in place before switching to state =
2.
> > > > > > > >
> > > > > > > > I've done some more tests and I think that's something else.
> > > I've
> > > > > added
> > > > > > > > a loop waiting for /sys/class/net/$vif to a hotplug script,=
 but
> > > it
> > > > > timed
> > > > > > > > out (5s). I don't see _any_ kernel messages related to the
> > > device.
> > > > > > > >
> > > > > > > > It may be some bug in nested virtualization in KVM...
> > > > > > >
> > > > > > > In your message you said you have also observed this behavior=
 when
> > > > > > > running on bare metal, so it's likely not related to nested
> > > > > > > virtualization?
> > > > > >
> > > > > > Yes, but on bare metal is so hard to reproduce (like 0.1% or ev=
en
> > > less
> > > > > > startups), I'm not really sure if that was the same problem, as=
 the
> > > > > > problem doesn't leave that much logs...
> > > > >
> > > > > I'm not very familiar with netback, but I think it's indeed possi=
ble
> > > > > for netback to switch to state 2 without having created the vif.
> > > > > Netback switching from state 1 -> 2 seems to be solely controlled=
 by
> > > > > the frontend state (see frontend_changed).
> > > > >
> > > > > I think the patch below could solve this issue, but I haven't even
> > > > > compile tested it, could you give it a spin?
> > > > >
> > > > > I would also like to hear the opinion of netback maintainers, sin=
ce I
> > > > > might be completely wrong.
> > > >
> > > > IIRC there is a good reason why netback doesn't want the hotplug sc=
ript
> > > to run before moving into state 2... the script adds the vif to the b=
ridge
> > > and, if this is done on the 1 -> 2 transition then you may end up wit=
h a
> > > load of vifs sat on the bridge for which there is no frontend (at lea=
st
> > > yet, but maybe never)... so the bridge wastes time in every packet se=
nt to
> > > such a vif.
> > >=20
> > > I don't think netback has ever waited for a frontend before running
> > > hotplug scripts.
> > >=20
> > > In the udev times the hotplug script would be run upon vif creation,
> > > which happens in netback_probe, and when launching hotplug scripts
> > > from libxl the script is executed when the backend changes to state 2,
> > > which happens almost immediately because netback switches to state 2
> > > when the frotnend is in state 1 which is the initial frontend state.
> > >=20
> >=20
> > I suspect I must be remembering a XenServer-specific hack^Wpatch then. =
I'd have to dig... it's been a while since I messed with the netif state mo=
del, which is of course different the blkif state model.
>=20
> Quite likely. With udev scripts is was feasible to only execute
> hotplug scripts for vifs with an attached frontend.
>=20
> With libxl this is not possible, since hotplug scripts are run during
> domain creation, at which point the guest is completely paused.
>=20
> I'm not that familiar with bridges and vifs, but maybe the vifs status
> can be set to offline until there's a frontend attached in order to
> reduce the bridge distributor load? (if that's not already the case).

I've found was the problem, and with some definition of "race condition"
it could be named this way.
The problem is that for some reason xenstore watch on device add
sometimes does not fire in xl devd. But then, when libxl in dom0
timeouts and remove the device, the xenstore watch in xl devd fire and
hotplug script is called. At this point device is already gone, so
it fails. xl devd then quickly calls hotplug script the second time, for
device removal.

I have no idea why this xenstore watch do not fire, but triggering a
no-op write into watched path (to trigger the watch again) workarounds
the problem. I use a xenstore watch in dom0 for that[1] - which works.
I suspect something related to KVM nested virtualization (lost
interrupt?)...

[1] https://github.com/marmarek/openqa-tests-qubesos/blob/3e604b521eb4d4e1b=
8ff40ad9e278d63d9a3baa3/extra-files/system-tests/xenstore-watch-trigger.py
     =20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxzJToACgkQ24/THMrX
1yztAgf+Oagjlv2DsTBg6Kvg4FZwTmErt7eCW9rMilh7I7e+zz0Kxrz4+Io979Eo
bvO7wVcPCpk1EE+BBKgKsj2oJY0DL6+7XhDGC7VQGE7F8yk2YywVclnLEjXb42pr
5CisV83ikhBi7uOcUNPtBfTxrHA2mHTwLPEDN+kr0iG0SpqK71vxz9Bx9B2uNSwM
18ay2CI35Ut21e7st/xD/US9GmdBwkw49eOzs8h8C5QN0/XQ5UWiWOPiSXYF2yu4
SMPNM8TfPpLWJRQUoA34MAWNzx+cJ9eg0v8ntKcQQVCWO4hj8po2ntrQ6MO2WAGu
6TP8PVfNDVxO0JL3gkZRf8FNteuLeQ==
=2W0H
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--


--===============6677841469302383674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6677841469302383674==--
