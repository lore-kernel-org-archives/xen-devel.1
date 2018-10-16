From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 00/17] Add support for qemu-xen
 runnning in a Linux-based stubdomain.
Date: Tue, 16 Oct 2018 19:32:40 +0200
Message-ID: <20181016173240.GA1563@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23494.5998.10340.694382@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5925988006232233912=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x11d=m4=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gCTD4-0001fR-Nb
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 17:32:46 +0000
In-Reply-To: <23494.5998.10340.694382@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org


--===============5925988006232233912==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 05:53:02PM +0100, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("[RFC PATCH v2 00/17] Add support=
 for qemu-xen runnning in a Linux-based stubdomain."):
> > [stuff]
>=20
> Thanks for this.  I'm very keen on this approach and keen on getting
> it upstream.  Sorry for the delay reviewing it!  I have been away a
> lot.
>=20
> > General idea is to allow freely set device_model_version and
> > device_model_stubdomain_override and choose the right options based on =
this choice.
> > Also, allow to specific path to stubdomain kernel/ramdisk, for greater =
flexibility.
> > Right now when qemu-xen in stubdomain is selected, it is assumed it's
> > Linux-based and few decisions are based on it, specifically:
>=20
> That sounds sensible.
>=20
> >  - qemu args encoding (\x1b as separator, to allow spaces in arguments)
>=20
> What if the arguments contain \x1b ?=20

Well, here I've changed "What if the arguments contain a space" to "What
if the arguments contain \x1b" ;)

> I think you may need a quoting
> scheme, or to use nul.

The main reason for this over alternatives (including nul) is using
shell script on the stubdomain side to handle this. Handling nul char in
shell is major PITA.

> > It may be a good idea to document "stubdomain API" somewhere. Is there =
such
> > document for MiniOS one?
>=20
> No.
>=20
> >  Here is an initial version for Linux one:
> >=20
> >     Assumptions about Linux-based stubdomain for qemu-xen:
> >     * qemu command line is stored by toolstack in
> >       /vm/<target-uuid>/image/dmargs xenstore entry, arguments are sepa=
rated
> >       with \x1b character
>=20
> Oh, xenstore.  From docs/misc/xenstore.txt:
>=20
> | xenstore values should normally be 7-bit ASCII text strings
> | containing bytes 0x20..0x7f only
>=20
> I think you could have separate xenstore keys for the seperate
> arguments, or you could encode it somehow.

What "normally" means in this context? For me it doesn't mean other
characters are prohibited.

> >     * qemu can access saved state (if any) at its FD 3
> >     * qemu can write its state (for save/migration) to its FD 4
>=20
> That's a description of the protocol to *qemu*.  Is the toolstack then
> responsible for the protocol across the domain boundary ?  I think it
> would be nice to specify that here too.

Well, toolstack is responsible for qemu command line (and QMP), so it is
part of the stubdomain protocol...

>=20
> >     * qemu expects backend for serial console at /dev/hvc3
> >     * disks configured for the target are available as /dev/xvd*, in
> >       configuration order
> >     * qemu can call /etc/qemu-ifup and /etc/qemu-ifdown to connect/disc=
onnect
> >       network interface to appropriate network

Actually, after recent changes in our linux stubdomain, this last point
wouldn't be needed. It's handled internally by observing qmp events.

> Please can we put this in-tree and not in a 00/ cover letter :-).

Sure.

> > Initial version has no QMP support - in initial patches it is completely
> > disabled, which means no suspend/restore. QMP normally would be used fo=
r PCI
> > passthrough setup, but it is worked around with MiniOS-like control pro=
tocol
> > over xenstore, which then is translated to QMP on stubdomain side.
>=20
> How unpleasant.  But better than nothing.
>
> > Some option is to use separate console for that, but that require
> > xenstoled supporting multiple consoles per domain (the goal is to not h=
ave qemu
> > in dom0 at all). Also, it would be preferable to evaluate how libxl
> > handle potentially malicious QMP responses.
>=20
> We are working on that latter point anyway.
>=20
> > Another option is to use xenstore - either translate everything needed =
to
> > MiniOS-like thing, or write already json-formatted requests to xenstore=
 and
> > watch there for responses. When using separate xenstore dir for that, w=
ith
> > per-command entries (command id as a key name?) that would solve concur=
rency
> > problem.
>=20
> That would be fine too.
>=20
> > QMP support over separate console: patch "libxl: access QMP socket via =
console
> > for qemu-in-stubdomain" implements some early PoC of this.
> > Major limitation: only one connection at a time and no means of out of
> > band reset (and re-negotiate). I've tried adding very simple `qmp_reset`
> > command for in-band connection reset, but it is unreliable because of t=
he
> > first limitation - xl process running in background hold this connectio=
n open
> > and every other xl instance interfere with it. On the other hand, for l=
ibvirt
> > use case one connection could be enough (leaving alone libvirtd restart=
).
>=20
> This is awkward, isn't it.  The Xen PV console protocol has no reset
> mechanism.  Can we use libvchan here and provide qmp vchans ?

That would be an option too. Require (trivial) vchan->unix socket proxy.

> > Xenconsoled patches add support for multiple consoles in xenconsoled, t=
o avoid the need
> > for qemu in dom0 for this to work. Multiple consoles for a stubdomain a=
re used for:
> >  - logs (console 0)
> >  - save + restore (console 1, 2)
> >  - qmp (console 3)
> >  - serial terminal to target domU (console 4)
> > Xenconsoled patches are in fact a separate series, but I'm sending them=
 here to
> > ease dependencies handling (latter libxl patches use that).
>=20
> That sounds reasonable.
>=20
> > What qmp-libxenstat socket is for?
> >=20
> > PCI passthrough support require some more love. Right now, libxl tries =
to setup
> > pcifront for both target HVM and stubdomain and the former fails (race
> > condition):
> >     xen-pciback pci-259-0: 22 Couldn't locate PCI device (0000:00:1b.0)=
! perhaps already in-use?
> > Fortunately it isn't needed. There is also a PCI related problem on
> > domain shutdown - it looks like first stubdomain is paused and then lib=
xl waits
> > for pcifront there.
> > Also, MSI doesn't work (qemu output):
> >=20
> >     [00:05.0] xen_pt_msgctrl_reg_write: setup MSI (register: 81).
> >     [00:05.0] msi_msix_setup: requested pirq 55 for MSI (vec: 0, entry:=
 0)
> >     [00:05.0] msi_msix_setup: Error: Mapping of MSI (err: 1, vec: 0, en=
try 0)
> >     [00:05.0] xen_pt_msgctrl_reg_write: Warning: Can not map MSI (regis=
ter: 80)!
> >     [00:05.0] Write-back to unknown field 0x44 (partially) inhibited (0=
x00)
> >     [00:05.0] If the device doesn't work, try enabling permissive mode
> >     [00:05.0] (unsafe) and if it helps report the problem to xen-devel
>=20
> I confess I don't understand PCI passthrough but it would be nice for
> this to work.  I think a starting point might be to write down who is
> supposed to do what...
>=20
> > This patch series is third (fourth?) attempt to get rid of limitation
> > "if you want to use stubdomain, you're stuck with qemu-traditional", do=
ne over
> > years, by many people.
> > I think it should be acceptable plan to gradually add features to
> > qemu-xen+stubdomain configuration - not necessary waiting with committi=
ng any
> > of those patches until full feature set of qemu-xen is supported. After=
 all,
> > right now "feature set supported by qemu-xen+stubdom" is empty, so woul=
dn't be
> > worse.
>=20
> Absolutely.
>=20
> Ian.
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvGILkACgkQ24/THMrX
1ywK4Af/Z2F77xyYoDI9KRLxSVTcqxjnBPwiwahr+7pUKCD0gFTfqSMlRP7CBXLj
rAKV+7LfZGY/aNZs+dTuJj48xFX4DCX6f6I/Oxm8XDPNqu9vwyWPfLJ5oW8kdpkO
WsTNNHMmZv48azC4Vl/5mtXRu/JcORBtXDTs21waVLoawKsfNcev2kd5isUbq5Nf
X0ZirC5j++fSQzYNKGC/yzHTP4R1EsieYUpkomugQ2xOFfQNRpRTvzDBDaIjPryG
EOqi0uKlFMTcX+lXfh5k4YG8bdrmWsyw8HFhu3hF9N/gLZiNCsd+eNLhz1FUF9bo
O7EoncyD5qJ3yFt+Z2LRl7Bx/r9D1A==
=Xa4i
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--


--===============5925988006232233912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5925988006232233912==--
