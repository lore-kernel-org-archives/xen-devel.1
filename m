From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Should PV frontend drivers trust the backends?
Date: Mon, 30 Apr 2018 19:32:38 +0200
Message-ID: <20180430173238.GA13598@mail-itl>
References: <0e971d69-ba71-cff8-a9b5-cf0d49ebc77e@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4927792144632705931=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ssrj=ht=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fDCia-0000zX-Km
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 17:36:04 +0000
In-Reply-To: <0e971d69-ba71-cff8-a9b5-cf0d49ebc77e@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: 'Juergen Gross' <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============4927792144632705931==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 26, 2018 at 11:47:41AM +0300, Oleksandr Andrushchenko wrote:
> On 04/26/2018 11:16 AM, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Oleksandr Andrushchenko [mailto:andr2000@gmail.com]
> > > Sent: 26 April 2018 07:00
> > > To: Paul Durrant <Paul.Durrant@citrix.com>; 'Juergen Gross'
> > > <jgross@suse.com>; xen-devel <xen-devel@lists.xenproject.org>
> > > Subject: Re: [Xen-devel] Should PV frontend drivers trust the backend=
s?
> > >=20
> > > On 04/25/2018 04:47 PM, Paul Durrant wrote:
> > > > > -----Original Message-----
> > > > > From: Xen-devel [mailto:xen-devel-bounces@lists.xenproject.org] On
> > > Behalf
> > > > > Of Juergen Gross
> > > > > Sent: 25 April 2018 13:43
> > > > > To: xen-devel <xen-devel@lists.xenproject.org>
> > > > > Subject: [Xen-devel] Should PV frontend drivers trust the backend=
s?
> > > > >=20
> > > > > This is a followup of a discussion on IRC:
> > > > >=20
> > > > > The main question of the discussion was: "Should frontend drivers
> > > > > trust their backends not doing malicious actions?"
> > > > >=20
> > > > > This IMO includes:
> > > > >=20
> > > > > 1. The data put by the backend on the ring page(s) is sane and
> > > > >      consistent, meaning that e.g. the response producer index is=
 always
> > > > >      ahead of the consumer index.
> > > > >=20
> > > > > 2. Response data won't be modified by the backend after the produ=
cer
> > > > >      index has been incremented signaling the response is valid.
> > > > >=20
> > > > > 3. Response data is sane, e.g. an I/O data length is not larger t=
han
> > > > >      the buffer originally was.
> > > > >=20
> > > > > 4. When a response has been sent all grants belonging to the requ=
est
> > > > >      have been unmapped again by the backend, meaning that the fr=
ontend
> > > > >      can assume the grants can be removed without conflict.
> > > > >=20
> > > > > Today most frontend drivers (at least in the Linux kernel) seem to
> > > > > assume all of the above is true (there are some exceptions, but n=
ever
> > > > > for all items):
> > > > >=20
> > > > > - they don't check sanity of ring index values
> > > > > - they don't copy response data into local memory before looking =
at it
> > > > > - they don't verify returned data length (or do so via BUG_ON())
> > > > > - they BUG() in case of a conflict when trying to remove a grant
> > > > >=20
> > > > > So the basic question is: should all Linux frontend drivers be mo=
dified
> > > > > in order to be able to tolerate buggy or malicious backends? Or i=
s the
> > > > > list of trust above fine?
> > > > >=20
> > > > > IMO even in case the frontends do trust the backends to behave sa=
ne this
> > > > > doesn't mean driver domains don't make sense. Driver domains stil=
l make
> > > > > a Xen host more robust as they e.g. protect the host against driv=
er
> > > > > failures normally leading to a crash of dom0.
> > > > >=20
> > > > I see the general question as being analogous to 'should a Linux de=
vice
> > > driver trust its hardware' and I think the answer for a general purpo=
se OS like
> > > linux is 'yes'.
> > > > Now, having worked on fault tolerant systems in a past life, there =
are
> > > definitely cases where you want your OS not to implicitly trust its p=
eripheral
> > > hardware and hence special device drivers are used.
> > > So what do you do if counters provided by the untrusted HW are ok
> > > and the payload is not?
> > Well, that depends on whether there is actually any way to verify the p=
ayload in a driver. Whatever layer in the system is responsible for the dat=
a needs to verify its integrity in a fault tolerant system. Generally the d=
river can only attempt to verify that it's hardware is working as expect an=
d quiesce it if not. For that reason, in the systems I worked on, the drive=
r had the ability to control FETs that disconnected peripheral h/w from the=
 PCI bus.
> >=20
> > > > I think the same would apply for virtual machines in situations whe=
re a
> > > driver domain is not wholly controlled by a host administrator or is =
not
> > > trusted to the same extent as dom0 for other reasons; i.e. they shoul=
d have
> > > specialist frontends.
> > > I believe we might be able to express some common strategy for the
> > > frontends.
> > > I do understand though that it all needs to be decided on case by case
> > > basis,
> > > but common things could still be there, e.g. if prod/cons counters are
> > > not in sync
> > > what a frontend needs to do:
> > >   =C2=A0- should it keep trying to get in sync - might be a bad idea =
as the
> > > req/resp data
> > >   =C2=A0=C2=A0 may already become inconsistent (net can probably surv=
ive, but not
> > > block)
> > >   =C2=A0- should it tear down the connection with the backend - this =
may
> > > render in the whole
> > >   =C2=A0=C2=A0 system instability, e.g. imagine you tear down a "/" b=
lock device
> > >   =C2=A0- should it BUG_ON and die
> > > To me the second option (tear down the connection) seems to be
> > > more reasonable, although it can still render the guest unusable, but=
 at
> > > least it
> > > gives a chance for the guest to recover in a proper way
> > >=20
> > Absolutely that can be done and it's certainly a good idea to be somewh=
at defensive but, as you say, it's quite likely that the PV pair is part of=
 a critical subsystem for the guest and so a BUG() may well be the best opt=
ion to make sure that the inevitable guest crash actually contains pertinen=
t information.

In some cases indeed such device might be critical. But "quite likely"
IMO isn't good enough to abandon all the other cases and crash the
domain if any device fails.
Tearing down misbehaving connection is absolutely reasonable (I do not
advocate for some complex recovery algorithm), but crashing the domain
is not.

> >=20
> > > And, if my assumption is correct, we still do trust the contents of t=
he
> > > requests
> > > and responses, e.g. the payload is still trusted.
> > Why should the payload be any more trusted than the content of the shar=
ed ring? They are both shared with the backend and therefore can be corrupt=
ed to the same extent.
> This is exactly my point: if we only try to protect from inconsistent
> prod/cons then
> this protection is still incomplete as the payload may be the source of
> failure.

Well, you can take extra measures, external to the driver, to
protect against malicious payload (like encryption mentioned by Andrew,
or dm-verity for block devices). But you can't do the same about the
driver itself (ring handling etc).

Of course backend will be able to perform a DoS to some extend in all
the cases, at least by stopping responding to requests. But keep in mind
that root fs is not the only device out there. There are also other
block device, network interfaces etc. And misbehaving backend should
_not_ be able to take over frontend domain in those cases. And ideally
also shouldn't also be able to crash it (if device isn't critical for
domU).

If you want some real world use cases for this, here are two from Qubes
OS:

1. Block devices - base system devices (/, /home equivalent etc) have
backends in dom0 (*), but there is also an option to use block devices
exported by other domains. For example the one handling USB controllers.
So, when you plug USB stick, one domain handle all the USB nasty stuff,
and export it as a plain device to another domain when user can mount
LUKS container stored there. Whatever happens there, nothing from that
USB stick touches dom0 at any time.

2. Network devices - there are no network backends in dom0 at all. There
is one (or more) dedicated domain for handling NICs, then there is
(possibly a tree of) domain(s) routing the traffic. In some cases a VM
facing actual network (where the backend runs) is considered less
trusted than a VM using that network (where the frontend runs).

BTW Since XSA-155 we do have some additional patches for block and
network frontend, making similar changes as done to backends at that
time. I'll resend them in a moment.

(*) we still have plans to support also untrusted backends for base
system, with domU verifying all the data it gets (dm-verity, dm-crypt).
But it isn't there yet.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlrnUzYACgkQ24/THMrX
1yx5Agf/QPBvu48VmX0CxrwAOKF3NtZXvmOVAykd80yCyFYEm6rkvIAL3suBpzCD
WawXrkTpOOhq9fktuioDI1vmjsYgHETrp+vMbpq+SUL2/Didpqklg5QSzTbgao5N
Ibha8rjqxR5Z95W+OK8SsSR6XdS0bm18YiKNRnNpdfu4PlneEBVKNVaBIeAJm5es
ft4pmfsvQP+1h/VrE0gsQm2k1/Ff8Jfbipe8KtNkbIjMSmIyPGuRpKMH6MmbdYkV
lVzwjaofe8Q+sMX3KWiNMmcmYzrhjXHxgdSYueTLnxYS9ra25NzuqdvXlAyspNhI
LvReBFffMA8hzrdJq6iehVOiY/cFRA==
=0Hn8
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--


--===============4927792144632705931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4927792144632705931==--
