From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 00/17] Add support for qemu-xen
 runnning in a Linux-based stubdomain.
Date: Sun, 18 Nov 2018 18:25:53 +0100
Message-ID: <20181118172553.GN781@mail-itl>
References: <20181016173240.GA1563@mail-itl>
 <23494.9572.676973.726194@mariner.uk.xensource.com>
 <20181016204628.GD1563@mail-itl>
 <23495.21043.960987.833172@mariner.uk.xensource.com>
 <20181017160559.GB2755@mail-itl>
 <23515.12398.298018.490061@mariner.uk.xensource.com>
 <20181101173207.GB1638@mail-itl>
 <20181115174144.GM1302@perard.uk.xensource.com>
 <20181115185708.GI781@mail-itl>
 <20181116103907.GN1302@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7586107485857142882=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HfAK=N5=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gOQpd-0005xs-03
 for xen-devel@lists.xenproject.org; Sun, 18 Nov 2018 17:26:01 +0000
In-Reply-To: <20181116103907.GN1302@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Ian Jackson <ian.jackson@citrix.com>, Eric Shelton <eshelton@pobox.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============7586107485857142882==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v4cNTr+tRGSs1txX"
Content-Disposition: inline


--v4cNTr+tRGSs1txX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 16, 2018 at 10:39:07AM +0000, Anthony PERARD wrote:
> On Thu, Nov 15, 2018 at 07:57:08PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Nov 15, 2018 at 05:41:44PM +0000, Anthony PERARD wrote:
> > > On Thu, Nov 01, 2018 at 06:32:07PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Thu, Nov 01, 2018 at 04:57:18PM +0000, Ian Jackson wrote:
> > > > > Marek Marczykowski-G=C3=B3recki writes ("Re: [RFC PATCH v2 00/17]=
 Add support for qemu-xen runnning in a Linux-based stubdomain."):
> > > > > > 2. pv console
> > > > > >   pros:
> > > > > >    - no qemu modifications
> > > > > >    - same read()/write() on libxl side
> > > > > >   cons:
> > > > > >    - no out of band reset, needs libxl handling for that (skipp=
ing
> > > > > >      negotiation)
> > > > >=20
> > > > > Doesn't this potentially mean that the qmp console connection can
> > > > > become irrecoverably desynchronised ?  I don't know how you would
> > > > > recover from the situation where another libxl process had got ha=
lfway
> > > > > through some qmp stuff and been terminated (for whatever reason; =
maybe
> > > > > the calling toolstack crashed).
> > > >=20
> > > > That's right, it could result in irrecoverably desynchronised
> > > > connection. So, we need out of band reset.
> > >=20
> > > Actually, it looks like we can recover that situation without out of
> > > band reset. It's even in the spec[1]:
> >=20
> > That's interesting. And it mention serial console explicitly as the use
> > case for this. Does it apply to monitor socket too, or guest agent only?
> > I'd much prefer to use console, as the code would be much simpler (the
> > same handling for local and stubdomain qemu).
>=20
> The 'guest-sync-delimited' command doesn't seems to be available on the
> monitor socket. I should have checked that ... but that would just mean
> that libxl would need to tolerate the first read to be an incompleted
> json-object. Then we can use the 'id' that every response have to figure
> out if it was a reply sent to a previous libxl run. We can maybe encode
> the pid into the id.

It may be tricky to figure out where is the end of such incomplete json
object... Suppose you read:

{ "x": { "y": 1 } } }

If you read this from the beginning looking for json, you'll get valid
json object unless you encounter the last "}" (which you may receive in
separate read() call, if you're unlucky). I'm afraid the logic for
skipping initial (possibly incomplete) object(s) may be quite complex.
Maybe better propose upstream to include 'guest-sync-delimited' also on
monitor socket too? In that case, the command naming will be awkward,
but still, similar command would be useful in that context.

> > Also, this doesn't cover capabilities (re-)negotiation. While actual
> > capabilities are probably not a problem, libxl do store qemu version
> > from the server greeting (is it used anywhere?).
>=20
> The QEMU version is still available after the capabilities negociation,
> one simply need to execute 'query-version'.

That's good.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--v4cNTr+tRGSs1txX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvxoKMACgkQ24/THMrX
1yzhdgf+Iw7ioUJnoI7lH+to+oda0/H5fnVmP6XiI7hB8Lw+8cRj4KQdUUaOFhhK
/bVezRioAcJyj5p5ui0KSb0YXF/26gRKhBnzZP0Xy8Aq9ecX8OWdTzH/cKw2i6Ub
SSsa51KWSzxnwbi9sCC5zwipDqRx5rLbgMQIsqPzlMRgJPVLqH3uihQsKMUjhl9Y
a2C39wT7Cj0FAupwNc/KDzjbS/DWmadxgpX04K1lAaQvc+umSg1zyd9FN6yj60jk
YxfP+41qZcIbc4Qqtektq1UyOqfX+L3xoZ+Pxxb/dHzCw9/oEZXV0CA5tO6BEjLj
tYgzGyuXrKA41aTMpq4LqqqR5VTZqg==
=/5rq
-----END PGP SIGNATURE-----

--v4cNTr+tRGSs1txX--


--===============7586107485857142882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7586107485857142882==--
