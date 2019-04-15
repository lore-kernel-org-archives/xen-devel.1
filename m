From: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [Qemu-block] [PATCH 2/3] xen-bus: allow AioContext
 to be specified for each event channel
Date: Mon, 15 Apr 2019 09:42:49 +0100
Message-ID: <20190415084249.GA29134__21667.3873060913$1555317829$gmane$org@stefanha-x1.localdomain>
References: <20190408151617.13025-1-paul.durrant@citrix.com>
 <20190408151617.13025-3-paul.durrant@citrix.com>
 <20190410125708.GE1435@perard.uk.xensource.com>
 <582f92f1ddf24985b75c32fe913784df@AMSPEX02CL01.citrite.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9094800167093852450=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wCf9=SR=gmail.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1hFxCY-0002Ql-4d
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 08:42:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id y7so20728057wrn.11
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 01:42:52 -0700 (PDT)
In-Reply-To: <582f92f1ddf24985b75c32fe913784df@AMSPEX02CL01.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============9094800167093852450==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2019 at 03:20:05PM +0000, Paul Durrant wrote:
> > -----Original Message-----
> > From: Anthony PERARD [mailto:anthony.perard@citrix.com]
> > Sent: 10 April 2019 13:57
> > To: Paul Durrant <Paul.Durrant@citrix.com>
> > Cc: qemu-devel@nongnu.org; qemu-block@nongnu.org; xen-devel@lists.xenpr=
oject.org; Stefano Stabellini
> > <sstabellini@kernel.org>; Stefan Hajnoczi <stefanha@redhat.com>; Kevin =
Wolf <kwolf@redhat.com>; Max
> > Reitz <mreitz@redhat.com>
> > Subject: Re: [PATCH 2/3] xen-bus: allow AioContext to be specified for =
each event channel
> >=20
> > On Mon, Apr 08, 2019 at 04:16:16PM +0100, Paul Durrant wrote:
> > > This patch adds an AioContext parameter to xen_device_bind_event_chan=
nel()
> > > and then uses aio_set_fd_handler() to set the callback rather than
> > > qemu_set_fd_handler().
> > >
> > > Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
> > > ---
> > > @@ -943,6 +944,7 @@ static void xen_device_event(void *opaque)
> > >  }
> > >
> > >  XenEventChannel *xen_device_bind_event_channel(XenDevice *xendev,
> > > +                                               AioContext *ctx,
> > >                                                 unsigned int port,
> > >                                                 XenEventHandler handl=
er,
> > >                                                 void *opaque, Error *=
*errp)
> > > @@ -968,8 +970,9 @@ XenEventChannel *xen_device_bind_event_channel(Xe=
nDevice *xendev,
> > >      channel->handler =3D handler;
> > >      channel->opaque =3D opaque;
> > >
> > > -    qemu_set_fd_handler(xenevtchn_fd(channel->xeh), xen_device_event=
, NULL,
> > > -                        channel);
> > > +    channel->ctx =3D ctx;
> > > +    aio_set_fd_handler(channel->ctx, xenevtchn_fd(channel->xeh), fal=
se,
> > > +                       xen_device_event, NULL, NULL, channel);
> >=20
> > I wonder if the `'is_external' parameter of aio_set_fd_handler shoud be
> > `true' here, instead. That flag seems to be used when making a snapshot
> > of a blockdev, for example.
> >=20
> > That was introduced by:
> > dca21ef23ba48f6f1428c59f295a857e5dc203c8^..c07bc2c1658fffeee08eb46402b2=
f66d55b07586
> >=20
> > What do you think?
>=20
> Interesting. I admit I was merely transcribing what qemu_set_fd_handler()=
 passes without really looking into the values. Looking at the arguments th=
at virtio-blk passes to aio_set_event_notifier() though, and what 'is_exter=
nal' means, it would appear that setting it to true is probably the right t=
hing to do. Do you want me to send a v2 of the series or can you fix it up?

Hi,
Handlers are invoked by the aio_poll() event loop.  Some handlers are
considered "external" in the sense that they submit new I/O requests
=66rom the guest or outside world.  Others are considered "internal" in
the sense that they are part of the block layer and not an entry point
into the block layer.

There are points where the block layer wants to run the event loop but
new requests must not be submitted.  In this case aio_disable_external()
will be called so that "external" handlers are not processed.

For example, see virtio's virtio_queue_aio_set_host_notifier_handler().
This is the virtqueue kick ioeventfd and it shouldn't be processed when
aio_disable_external() has been called.

Stefan

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJctEQJAAoJEJykq7OBq3PIu0sH/j33XBML1ks0HDKmv3/DT/bM
RTx2pqg/l3kxLGJo6fB7nrtfgjMjlR066YVR3XTC2NigraF1YD/lJkdOHOUOcKXP
abr/QnY5IrHIY+n4+xapM5uozs4K+thrSmKK6CGFh+KkZdBGy5FT9csPUie7198N
oXf0fhVGjxTwJc+hMvbzJrryWFKOlH+AIUR/Hb9E1ExbssvddXh63jyetSnk48f6
Orjl6O8ddKDdSs7yoJVcuVhJ+0ZtcmaYvwbhcdUSoOQ6lFMezkihsrxb8VmGG86T
wMjjhmVPIv5IiU61AiVCkCNT0OlKCeUf3eEwdn8GfWWyJpmNz+BTblUfQ1ecPVA=
=0fKF
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--


--===============9094800167093852450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9094800167093852450==--
