From: 'Marek =?utf-8?Q?Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Should PV frontend drivers trust the backends?
Date: Tue, 1 May 2018 17:00:00 +0200
Message-ID: <20180501150000.GC1452@mail-itl>
References: <0e971d69-ba71-cff8-a9b5-cf0d49ebc77e@gmail.com>
 <20180430173238.GA13598@mail-itl>
 <9b85396090414fadaa79d20342237174@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3640058452347430849=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y0cr=hu=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fDWoY-0000do-TO
 for xen-devel@lists.xenproject.org; Tue, 01 May 2018 15:03:35 +0000
In-Reply-To: <9b85396090414fadaa79d20342237174@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>, 'Juergen Gross' <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============3640058452347430849==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 01, 2018 at 07:55:39AM +0000, Paul Durrant wrote:
> > -----Original Message-----
> > From: Marek Marczykowski-G=C3=B3recki
> > [mailto:marmarek@invisiblethingslab.com]
> > Sent: 30 April 2018 18:33
> > To: Oleksandr Andrushchenko <andr2000@gmail.com>
> > Cc: Paul Durrant <Paul.Durrant@citrix.com>; 'Juergen Gross'
> > <jgross@suse.com>; xen-devel <xen-devel@lists.xenproject.org>
> > Subject: Re: [Xen-devel] Should PV frontend drivers trust the backends?
> >=20
> > On Thu, Apr 26, 2018 at 11:47:41AM +0300, Oleksandr Andrushchenko wrote:
> > > On 04/26/2018 11:16 AM, Paul Durrant wrote:
> > > > > -----Original Message-----
> > > > > From: Oleksandr Andrushchenko [mailto:andr2000@gmail.com]
> > > > > Sent: 26 April 2018 07:00
> > > > > To: Paul Durrant <Paul.Durrant@citrix.com>; 'Juergen Gross'
> > > > > <jgross@suse.com>; xen-devel <xen-devel@lists.xenproject.org>
> > > > > Subject: Re: [Xen-devel] Should PV frontend drivers trust the
> > backends?
> > > > >
> > > > > On 04/25/2018 04:47 PM, Paul Durrant wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: Xen-devel [mailto:xen-devel-bounces@lists.xenproject.or=
g]
> > On
> > > > > Behalf
> > > > > > > Of Juergen Gross
> > > > > > > Sent: 25 April 2018 13:43
> > > > > > > To: xen-devel <xen-devel@lists.xenproject.org>
> > > > > > > Subject: [Xen-devel] Should PV frontend drivers trust the
> > backends?
> > > > > > >
> > > > > > > This is a followup of a discussion on IRC:
> > > > > > >
> > > > > > > The main question of the discussion was: "Should frontend dri=
vers
> > > > > > > trust their backends not doing malicious actions?"
> > > > > > >
> > > > > > > This IMO includes:
> > > > > > >
> > > > > > > 1. The data put by the backend on the ring page(s) is sane and
> > > > > > >      consistent, meaning that e.g. the response producer inde=
x is
> > always
> > > > > > >      ahead of the consumer index.
> > > > > > >
> > > > > > > 2. Response data won't be modified by the backend after the
> > producer
> > > > > > >      index has been incremented signaling the response is val=
id.
> > > > > > >
> > > > > > > 3. Response data is sane, e.g. an I/O data length is not larg=
er than
> > > > > > >      the buffer originally was.
> > > > > > >
> > > > > > > 4. When a response has been sent all grants belonging to the
> > request
> > > > > > >      have been unmapped again by the backend, meaning that the
> > frontend
> > > > > > >      can assume the grants can be removed without conflict.
> > > > > > >
> > > > > > > Today most frontend drivers (at least in the Linux kernel) se=
em to
> > > > > > > assume all of the above is true (there are some exceptions, b=
ut
> > never
> > > > > > > for all items):
> > > > > > >
> > > > > > > - they don't check sanity of ring index values
> > > > > > > - they don't copy response data into local memory before look=
ing at
> > it
> > > > > > > - they don't verify returned data length (or do so via BUG_ON=
())
> > > > > > > - they BUG() in case of a conflict when trying to remove a gr=
ant
> > > > > > >
> > > > > > > So the basic question is: should all Linux frontend drivers be
> > modified
> > > > > > > in order to be able to tolerate buggy or malicious backends? =
Or is
> > the
> > > > > > > list of trust above fine?
> > > > > > >
> > > > > > > IMO even in case the frontends do trust the backends to behave
> > sane this
> > > > > > > doesn't mean driver domains don't make sense. Driver domains =
still
> > make
> > > > > > > a Xen host more robust as they e.g. protect the host against =
driver
> > > > > > > failures normally leading to a crash of dom0.
> > > > > > >
> > > > > > I see the general question as being analogous to 'should a Linux
> > device
> > > > > driver trust its hardware' and I think the answer for a general p=
urpose
> > OS like
> > > > > linux is 'yes'.
> > > > > > Now, having worked on fault tolerant systems in a past life, th=
ere are
> > > > > definitely cases where you want your OS not to implicitly trust i=
ts
> > peripheral
> > > > > hardware and hence special device drivers are used.
> > > > > So what do you do if counters provided by the untrusted HW are ok
> > > > > and the payload is not?
> > > > Well, that depends on whether there is actually any way to verify t=
he
> > payload in a driver. Whatever layer in the system is responsible for th=
e data
> > needs to verify its integrity in a fault tolerant system. Generally the=
 driver can
> > only attempt to verify that it's hardware is working as expect and quie=
sce it if
> > not. For that reason, in the systems I worked on, the driver had the ab=
ility to
> > control FETs that disconnected peripheral h/w from the PCI bus.
> > > >
> > > > > > I think the same would apply for virtual machines in situations=
 where
> > a
> > > > > driver domain is not wholly controlled by a host administrator or=
 is not
> > > > > trusted to the same extent as dom0 for other reasons; i.e. they s=
hould
> > have
> > > > > specialist frontends.
> > > > > I believe we might be able to express some common strategy for the
> > > > > frontends.
> > > > > I do understand though that it all needs to be decided on case by=
 case
> > > > > basis,
> > > > > but common things could still be there, e.g. if prod/cons counter=
s are
> > > > > not in sync
> > > > > what a frontend needs to do:
> > > > >   =C2=A0- should it keep trying to get in sync - might be a bad i=
dea as the
> > > > > req/resp data
> > > > >   =C2=A0=C2=A0 may already become inconsistent (net can probably =
survive, but not
> > > > > block)
> > > > >   =C2=A0- should it tear down the connection with the backend - t=
his may
> > > > > render in the whole
> > > > >   =C2=A0=C2=A0 system instability, e.g. imagine you tear down a "=
/" block device
> > > > >   =C2=A0- should it BUG_ON and die
> > > > > To me the second option (tear down the connection) seems to be
> > > > > more reasonable, although it can still render the guest unusable,=
 but at
> > > > > least it
> > > > > gives a chance for the guest to recover in a proper way
> > > > >
> > > > Absolutely that can be done and it's certainly a good idea to be so=
mewhat
> > defensive but, as you say, it's quite likely that the PV pair is part o=
f a critical
> > subsystem for the guest and so a BUG() may well be the best option to m=
ake
> > sure that the inevitable guest crash actually contains pertinent inform=
ation.
> >=20
> > In some cases indeed such device might be critical. But "quite likely"
> > IMO isn't good enough to abandon all the other cases and crash the
> > domain if any device fails.
> > Tearing down misbehaving connection is absolutely reasonable (I do not
> > advocate for some complex recovery algorithm), but crashing the domain
> > is not.
>=20
> So what happens if the backend servicing the VM's boot disk fails? Is it =
better to:
>=20
> a) BUG()/BSOD with some meaningful stack and code such that it's obvious =
that happened, so
> b) cover up and wait until something further up the storage stack crashes=
 the VM, probably with some error that's just a generic timeout
>=20
> I'm clearly advocating a) but it's possible b) may be more desirable in s=
ome scenarios. I think the choice is up to whoever is writing the frontend =
and no-one else should decide their policy for them.

But you know, BUG() isn't the only method for getting error message.
I see in this thread proper logging is used as an excuse for crashing
things - really, this is very poor excuse. You can use printk, or even
WARN() or such. And if there are cases where the only way to get
meaningful messages is crashing the whole thing, somethings is _really_
wrong.
In many cases crashing the thing will actually make retrieving messages
harder, not easier (remote systems, console not working etc).

> > > > > And, if my assumption is correct, we still do trust the contents =
of the
> > > > > requests
> > > > > and responses, e.g. the payload is still trusted.
> > > > Why should the payload be any more trusted than the content of the
> > shared ring? They are both shared with the backend and therefore can be
> > corrupted to the same extent.
> > > This is exactly my point: if we only try to protect from inconsistent
> > > prod/cons then
> > > this protection is still incomplete as the payload may be the source =
of
> > > failure.
> >=20
> > Well, you can take extra measures, external to the driver, to
> > protect against malicious payload (like encryption mentioned by Andrew,
> > or dm-verity for block devices). But you can't do the same about the
> > driver itself (ring handling etc).
> >=20
>=20
> As I said, verification should be down to the layer that has the relevant=
 information.
>=20
> > Of course backend will be able to perform a DoS to some extend in all
> > the cases, at least by stopping responding to requests. But keep in mind
> > that root fs is not the only device out there. There are also other
> > block device, network interfaces etc. And misbehaving backend should
> > _not_ be able to take over frontend domain in those cases. And ideally
> > also shouldn't also be able to crash it (if device isn't critical for
> > domU).
> >=20
>=20
> I still think that is the choice of the frontend. Yes, they can be progra=
mmed defensively but for some usecases it may just not be that important.
>=20
> > If you want some real world use cases for this, here are two from Qubes
> > OS:
> >=20
> > 1. Block devices - base system devices (/, /home equivalent etc) have
> > backends in dom0 (*), but there is also an option to use block devices
> > exported by other domains. For example the one handling USB controllers.
> > So, when you plug USB stick, one domain handle all the USB nasty stuff,
> > and export it as a plain device to another domain when user can mount
> > LUKS container stored there. Whatever happens there, nothing from that
> > USB stick touches dom0 at any time.
> >=20
> > 2. Network devices - there are no network backends in dom0 at all. There
> > is one (or more) dedicated domain for handling NICs, then there is
> > (possibly a tree of) domain(s) routing the traffic. In some cases a VM
> > facing actual network (where the backend runs) is considered less
> > trusted than a VM using that network (where the frontend runs).
>=20
> But, without revocable grants that backend could still DoS the frontend, =
right?

Yes, but in that case it should be enough to kill the backend (domain)
and frontend domain should be good, right?
What I mean, malicious/buggy backend should be able to do harm only to
devices it controls. Not crashing the whole driver (affecting all
devices of that kind), or the whole system.=20

And definitely arbitrary code execution or info leak also should not be
possible. I hope we agree at least to this point, right?

Of course this all is about what the driver itself. If upper layer is about
to execute any payload it gets, then PV driver can do nothing about it.
But as you've said, it should be up to the frontend [domain configuration].

> > BTW Since XSA-155 we do have some additional patches for block and
> > network frontend, making similar changes as done to backends at that
> > time. I'll resend them in a moment.
> >=20
> > (*) we still have plans to support also untrusted backends for base
> > system, with domU verifying all the data it gets (dm-verity, dm-crypt).
> > But it isn't there yet.
>=20
> Maybe the frontend should advised on the trust level of a backend so that=
 it can apply auditing should it wish to. If the backend were running in do=
m0 then there would be little point, but a frontend may wish to be more car=
eful when e.g. the domain is a trusted driver domain (but with no dm priv).=
 There have also been discussions about skipping the use of grants when the=
 backend has mapping privilege, for performance reasons, so maybe that coul=
d be worked in too.

Generally I'd avoid multiple modes (either dom0/non-dom0 or
trusted/untrusted). This almost always leads to some bugs in one of
those branches sooner or later.
=20
--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlrogO8ACgkQ24/THMrX
1yzCfQf/WsZ3HpqRsVNySydCEhmuBzSPTgfyHmIe3O8vBD+C04WaK82OwSQwdFWy
SwMx85A8TaYCyFIbiP0Z/BcL3lnGL7v5XduBA+GyYa3tgsryAg1qBptNqzDwG/Kg
qkYsvS+awiDHJ8CteiJVRZLOL9avRbDIkcaBrVt73yYlXqjJz9EhW34YLJB8c3Uf
heFAqjqhZdaCv12m6BACViT1TLx/sLJiKzygOLt/vti+2raHRk1YSGJNbjTKpQJS
PWmpDJ8DcpcIZU/0A0lyUHLraJPIu4gaRZOz/UGaXlgmk3xHRksbI8SZX/6rGza5
3UJdlHzRme8bVWH4LIwbBKcLu/e5WQ==
=2rjP
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--


--===============3640058452347430849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3640058452347430849==--
