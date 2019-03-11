From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v12] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Mon, 11 Mar 2019 11:49:47 +0100
Message-ID: <20190311114947.1d47e04e.olaf@aepfle.de>
References: <20190308192059.24610-1-olaf@aepfle.de>
 <5C863567020000780021D1FE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7268946082787603129=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=y/+I=RO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h3IVI-0001Oy-88
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 10:49:56 +0000
In-Reply-To: <5C863567020000780021D1FE@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============7268946082787603129==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/4W622DWrJFFGjdrLlXrLk7c"; protocol="application/pgp-signature"

--Sig_/4W622DWrJFFGjdrLlXrLk7c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 11 Mar 2019 04:16:07 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> >>> On 08.03.19 at 20:20, <olaf@aepfle.de> wrote: =20
> > To reiterate the second paragraph: if a domU uses TSC as primary clock
> > source, it is expected that it runs NTP to cover for the resulting
> > drift. Therefore this change does no need a knob to turn it on or off. =
=20
> Did you omit a 't' or a 'w' above? Judging from the patch I think you
> mean "not", but I don't see how this follows, especially with your
> subsequent reply validly stating that such a requirement did not
> exist with the XenoLinux kernels.

This does indeed mean 'does not need a knob'.

I do not see how the HVM domU clock can be without drift if it does not
sync with an external source. It seems xenlinux based PV drivers lack
a clocksource, so they would better run ntp. pvops provides a clocksource=
=3Dxen,
but apparently with a low resolution.


> > +#define VTSC_NTP_PPM_TOLERANCE 500UL  /* Amount of drift NTP will hand=
le */ =20
> As per above, "will" is too strong here: I think this wants to be "can", =
and
> you want to add "if enabled in the guest".

I will reword this comment.

> > +#define VTSC_JITTER_RANGE_KHZ 200UL   /* Assumed jitter in cpu_khz */ =
=20
> I'm struggling to understand the comment: Surely not every single
> CPU surfaces a jitter of precisely 200kHz?

This is the observed range of frequencies on a large number of hosts.
The frequencies are expected to be exactly like "2.4GHz", but due to
inaccurate measurement the value of "cpu_khz" is higher or lower.
The value of "200" is simple the range of observed frequencies.

I will find a better name for this variable.


> > +     *    freq    tolerated freq difference
> > +     *  ------- =3D -------------------------
> > +     *  Million         Million + PPM     =20
> > +     */
> > +    tmp =3D 1000 * 1000;
> > +    tmp +=3D VTSC_NTP_PPM_TOLERANCE;
> > +    tmp *=3D cpu_khz;
> > +    tmp /=3D 1000 * 1000;
> > +
> > +    tmp -=3D cpu_khz;
> > +
> > +    /*
> > +     * Reduce the theoretical upper limit by the assumed measuring ina=
ccuracy.
> > +     */
> > +    if ( tmp >=3D VTSC_JITTER_RANGE_KHZ )
> > +        tmp -=3D VTSC_JITTER_RANGE_KHZ; =20
> This could suggest the constant is meant to be an upper bound, but
> (as said in review of prior versions) subtracting introduce a non-
> linearity, _and_ it doesn't guarantee the result to be within the
> assumed bounds.

The upper bound is the PPM value. ntpd in Linux can handle up to 500.
What is unclear about this formula?
First PPM is converted into "khz", on a 2GHz system tmp will become 1000.
Then the inaccuracy has to be handled, Xen can not know if cpu_khz is corre=
ct.
As said above, the observed range was 200, so this will be subtracted.

> > +    vtsc_tolerance_khz =3D tmp;
> > +    printk("Tolerating vtsc jitter for domUs: %u kHz\n", vtsc_toleranc=
e_khz); =20
> Could you remind me again how Dom0 remains unaffected here?
> And if that's indeed the case, why would that be?

A dom0 does not move from one host to another.
And it better synchronizes with an external clock if domUs are supposed to =
be migrated in the future.

Olaf

--Sig_/4W622DWrJFFGjdrLlXrLk7c
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIY9SwAKCRBdQqD6ppg2
fpTUAKDTw8o89iCohIyuieQkjmoWKzHuFACfS+ZejVy1W61kguLpRzZIjv118AY=
=yvyp
-----END PGP SIGNATURE-----

--Sig_/4W622DWrJFFGjdrLlXrLk7c--


--===============7268946082787603129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7268946082787603129==--
