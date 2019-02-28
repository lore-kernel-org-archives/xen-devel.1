From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Race condition on device add hanling in xl devd
Date: Thu, 28 Feb 2019 13:38:07 +0100
Message-ID: <20190228123807.GO5348@mail-itl>
References: <20181217120001.GB23474@mail-itl>
 <20181217121855.zsrn6fvliz4f5yul@mac>
 <20181217122315.GC23474@mail-itl>
 <20181217130534.6sdlcywutzcwzw2d@mac>
 <be0aadbb141f4537a6a058a4801fd7ea@AMSPEX02CL02.citrite.net>
 <20181217143212.abwf7k6dx233647d@mac>
 <628e7577dcae457ba39d88ff78fefff2@AMSPEX02CL02.citrite.net>
 <20181217160919.l73npsmx72mh5d4z@mac>
 <20190224231402.GB5279@mail-itl>
 <20190228100837.3velwvbmrfcs4eor@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8271104284206811407=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aQvT=RD=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gzKx9-0007ZM-JU
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 12:38:19 +0000
In-Reply-To: <20190228100837.3velwvbmrfcs4eor@Air-de-Roger>
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


--===============8271104284206811407==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0+35XlDF45POFHfm"
Content-Disposition: inline


--0+35XlDF45POFHfm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2019 at 11:08:37AM +0100, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 25, 2019 at 12:14:02AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, Dec 17, 2018 at 05:09:19PM +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Mon, Dec 17, 2018 at 02:42:23PM +0000, Paul Durrant wrote:
> > > > I suspect I must be remembering a XenServer-specific hack^Wpatch th=
en. I'd have to dig... it's been a while since I messed with the netif stat=
e model, which is of course different the blkif state model.
> > >=20
> > > Quite likely. With udev scripts is was feasible to only execute
> > > hotplug scripts for vifs with an attached frontend.
> > >=20
> > > With libxl this is not possible, since hotplug scripts are run during
> > > domain creation, at which point the guest is completely paused.
> > >=20
> > > I'm not that familiar with bridges and vifs, but maybe the vifs status
> > > can be set to offline until there's a frontend attached in order to
> > > reduce the bridge distributor load? (if that's not already the case).
> >=20
> > I've found was the problem, and with some definition of "race condition"
> > it could be named this way.
> > The problem is that for some reason xenstore watch on device add
> > sometimes does not fire in xl devd. But then, when libxl in dom0
> > timeouts and remove the device, the xenstore watch in xl devd fire and
> > hotplug script is called. At this point device is already gone, so
> > it fails. xl devd then quickly calls hotplug script the second time, for
> > device removal.
> >=20
> > I have no idea why this xenstore watch do not fire, but triggering a
> > no-op write into watched path (to trigger the watch again) workarounds
> > the problem. I use a xenstore watch in dom0 for that[1] - which works.
> > I suspect something related to KVM nested virtualization (lost
> > interrupt?)...
>=20
> That's very weird, could you try to run xenstored in dom0 with trace
> enabled [0] in order to try to figure out what's happening?

I've tried already, but it was way too slow (remember it's nested KVM,
it doesn't really improve the performance). I hit multiple timeouts even
without hitting this problem. Unfortunately I don't have logs from that
experiment anymore.

I can try again...

> I assume this only happens when running nested in KVM?

I'd say so. I'm not entirely sure, because I've seen similar symptoms on
bare metal Xen too in the past, but I think it could be a different
problem and also I haven't seen it in past 3 months.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--0+35XlDF45POFHfm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlx31i8ACgkQ24/THMrX
1yy3mwf8DshtMpARpUI7jVGd53CooTLan/qBIkhubjumMmTebW0eV05FSk10p3Wc
VIyYl0LCLP/HSF1N58x2YOwGDzY3VVYo2tnNToexEAqSo6UlLY0P5lZrQOrbxmfQ
xwKHtMxX9xubSbYzgYWAmna/b10pBZlNRhShn83TuSmL1oObG1xkN8tm6PxCq0zm
SB/vqzxeFBvI+v/iaBav8SLSSJDGxJfJU4tokS0wdHwXLCSQgMCdd2JNOvpEJpxe
paFCrQk9TjQCbwR/MCRO8ACI+Z9xFzb6Wps6+EVQlyO1eJ/IlBieOj9goV9B8x3b
KVzsT2aeQBYaAbNKglRmEAXwyJehvQ==
=q1gn
-----END PGP SIGNATURE-----

--0+35XlDF45POFHfm--


--===============8271104284206811407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8271104284206811407==--
