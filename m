From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 00/17] Add support for qemu-xen
 runnning in a Linux-based stubdomain.
Date: Thu, 1 Nov 2018 18:32:07 +0100
Message-ID: <20181101173207.GB1638@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23494.5998.10340.694382@mariner.uk.xensource.com>
 <20181016173240.GA1563@mail-itl>
 <23494.9572.676973.726194@mariner.uk.xensource.com>
 <20181016204628.GD1563@mail-itl>
 <23495.21043.960987.833172@mariner.uk.xensource.com>
 <20181017160559.GB2755@mail-itl>
 <23515.12398.298018.490061@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3099151048597460087=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7tsl=nm=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gIGpJ-0002Yz-N9
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 17:32:13 +0000
In-Reply-To: <23515.12398.298018.490061@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org


--===============3099151048597460087==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 04:57:18PM +0000, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("Re: [RFC PATCH v2 00/17] Add sup=
port for qemu-xen runnning in a Linux-based stubdomain."):
> > All the xenconsoled stuff is unchanged (and unlikely to change), so it
> > should be safe to review it. Patches 06 and 07 also shouldn't change.
>=20
> Sorry, I missed this reply.  I will go on to review those.
>=20
> > The thing that will change is qemu cmdline and qmp handling. TBH I'm no=
t sure
> > if its better to touch qmp now, or after reworked qmp handling by
> > Anthony will be merged. There will definitely be some conflicts and it
> > may even affects what underlying mechanism is chosen for qmp transport.
> > Based on discussion here, and in libxl__ev_qmp_* thread, I see two
> > viable options:
> >=20
> > 1. libvchan
> >   pros:
> >    - out of band reset support, so qmp capabilities negotiation can be
> >      handled gracefully
> >   cons:
> >    - more work, require patching qemu (or adding vchan->socket proxy),
> >      adds dependency on libvchan to libxl (probably not a problem)
> >    - possibly more complex libxl__ev_qmp_* handling, or at least needs
> >      separate handling of send/receive for stubdomain case
>=20
> I think that the changes to libxl__ev_qmp_* will be relatively
> self-contained, particularly after Anthony's async rework.  There's
> one place where the communication occurs.
>=20
> Does libvchan offer asynchronous connection (ie, connect/disconnect
> calls which cannot be stalled by the peer, but which instead allow
> poll/select-based async) ?  I think it may not, in which case we need
> a vchan to socket proxy anyway.

libxenvchan_server_init is asynchronous. libxenvchan_client_init is too,
but it fails if called before server is ready. I have a
wrapper[1] around libxenvchan_client_init in Qubes code which solve this
problem with xs_watch. "libvchan: create xenstore entries in one
transaction" patch is related to that wrapper.

Maybe it should be also added to libxenvchan? Right now it only waits
(synchronously) for server to appear (using while(...) xs_read_watch()).
This is slightly more complex, as it also handle remote domain death
before establishing connection as well as save+restore local domain.
But it can be provided as a separate function like
libxenvchan_client_wait_for_server or such.

Providing a function that could be used in libxl would be more complex,
as it needs to integrate with libxl async API. Maybe it could use
good old trick with separate thread + pipe() for signaling readiness?
This way, the libxenvchan_client_wait_for_server would start separate
thread (using own xenstore connection) and return fd that libxl can wait
on. No need to convert libxenvchan_client_wait_for_server into callback
hell...

[1] https://github.com/QubesOS/qubes-core-vchan-xen/blob/master/vchan/init.=
c#L58-L168

> Aside from that the libxl dependency is untroublesome.
>=20
> > 2. pv console
> >   pros:
> >    - no qemu modifications
> >    - same read()/write() on libxl side
> >   cons:
> >    - no out of band reset, needs libxl handling for that (skipping
> >      negotiation)
>=20
> Doesn't this potentially mean that the qmp console connection can
> become irrecoverably desynchronised ?  I don't know how you would
> recover from the situation where another libxl process had got halfway
> through some qmp stuff and been terminated (for whatever reason; maybe
> the calling toolstack crashed).

That's right, it could result in irrecoverably desynchronised
connection. So, we need out of band reset.

> >    - possibly other problems from that (events filling up some buffers
> >      when no one is listening?)
>=20
> xenconsole drops things in this situation.  I think that may result in
> desynchronisation.
>=20
> > BTW Does libxl listed for qmp events?
>=20
> Not right now.  It may want to in future.  Anthony's qmp series
> discards events.
>=20
> > There is also third option: xenstore, but that would probably require
> > totally separate libxl__ev_qmp_* implementation, so I'd rule it out.
>=20
> That's not a terrible idea but I can't see it being popular with qemu
> upstream, so you'd end up writing a kind of bidirectional
> qmp<->xenstore proxy.  Urgh.

Well, I do that already (for pci-ins). In bash.

> > If problems with pv console could be solved, I'd go this way. But
> > otherwise libvchan seems like a good alternative.
>=20
> Yes.
>=20
> Ian.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvbOJcACgkQ24/THMrX
1yw/TQf/a+dDGml4IZDZn5M76iL60DLStbmI9MGzImZJgoeyO4dOz9u/kWyHkgCb
SRtePGog29WsYXg+FUyh42+Fy73vLw27Lpk/2C1ZwwnEa1J8TgYZ9FXgMo486wRt
jlZRXmL6RfJ06qfIY/J0jcCfwaLjXCGttPpVvZKoIcFrgJS0gXdHcMaYyS9nzMOq
2I5IPwUPQyKMWY5a7yPTTUUk03oLTN3Xoos1Tvxc8GRqrw5PybKcuJ8GZk2gSi0p
45oKGchkybN5A8UVFyLHK+PwmIf+8qWXpTTwjt/2mDVhwMKY0m3NSWEACG19m7J2
rCaqyTLtNy+9wBWmvkzBzvWvfa91og==
=dzir
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--


--===============3099151048597460087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3099151048597460087==--
