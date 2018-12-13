From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v11] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 13 Dec 2018 09:18:45 +0100
Message-ID: <20181213091845.54212b83.olaf@aepfle.de>
References: <20181212152056.20480-1-olaf@aepfle.de>
 <5C1139BD0200007800205934@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7354939789655921864=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AwXq=OW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gXMCv-0002k1-25
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 08:18:57 +0000
In-Reply-To: <5C1139BD0200007800205934@prv1-mh.provo.novell.com>
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

--===============7354939789655921864==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/QjVwDJn4wpwjR=xi+bu8d6B"; protocol="application/pgp-signature"

--Sig_/QjVwDJn4wpwjR=xi+bu8d6B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 12 Dec 2018 09:39:25 -0700
schrieb "Jan Beulich" <JBeulich@suse.com>:

> >>> On 12.12.18 at 16:20, <olaf@aepfle.de> wrote: =20
> > If a domU uses TSC as clocksoure it also must run NTP in some way to
> > avoid the potential drift what will most likely happen, independent of
> > any migration. =20
> Which drift? While anyone's well advised to run NTP, a completely
> isolated set of systems may have no need to, if their interactions don't
> depend on exactly matching time.

If these hosts do not sync time to some reference host, the advancing of ti=
me
is undefined before and after my change.

> > The calculation of the drift is based on the time
> > returned by remote servers versus how fast the local clock advances. NTP
> > can handle a drift up to 500PPM. This means the local clocksource can
> > run up to 500us slower or faster. This calculation is based on the TSC
> > frequency of the host where the domU was started. Once a domU is
> > migrated to a host of a different class, like from "2.3GHz" to "2.4GHz",
> > the TSC frequency changes, but the domU kernel may not recalibrate
> > itself. =20
>=20
> That's why we switch to emulated (or hardware scaling) mode in that
> case. It's anyway not really clear to me what this entire ...
>=20
> > As a result, the drift will be larger and might be outside of
> > the 500 PPM range. In addition, the kernel may notice the change of
> > speed in which the TSC advances and could change the clocksource. All
> > this depends of course on the type of OS that is running in the domU. =
=20
>=20
> ... (up to here) paragraph is supposed to tell the reader.
>=20
> > @@ -1885,6 +1888,16 @@ void __init early_time_init(void)
> >      printk("Detected %lu.%03lu MHz processor.\n",=20
> >             cpu_khz / 1000, cpu_khz % 1000);
> > =20
> > +    tmp =3D 1000 * 1000;
> > +    tmp +=3D VTSC_NTP_PPM_TOLERANCE;
> > +    tmp *=3D cpu_khz;
> > +    tmp /=3D 1000 * 1000;
> > +    tmp -=3D cpu_khz;
> > +    if (tmp >=3D VTSC_JITTER_RANGE_KHZ)
> > +        tmp -=3D VTSC_JITTER_RANGE_KHZ; =20
>=20
> Besides the style issue in the if() - how can this be correct? This
> clearly introduces a discontinuity (just consider the case where
> tmp is exactly VTSC_JITTER_RANGE_KHZ before the if()). And
> I also can't see how it guarantees the resulting value to be
> below VTSC_JITTER_RANGE_KHZ. Did you perhaps mean to
> cap the value (i.e. =3D instead of -=3D )?

This is supposed to make sure the value of Hz for 500us is always larger
than the assumed jitter. So for a 2GHz host, with a theoretical tolerance
of 1000, the actual tolerance is set to 800. tmp will be larger than the
assumed jitter for cpu_khz > 400.

> > +    vtsc_tolerance_khz =3D (unsigned int)tmp; =20
> Stray cast.

Copy&paste from the cpu_khz assignment, perhaps a remainder from i386 suppo=
rt?

> > +    printk("Tolerating vtsc jitter for domUs: %u kHz.\n", vtsc_toleran=
ce_khz); =20
> Please omit the full stop; the printk() in context above shouldn't
> have one either.

You mean the trailing dot, or what means "full stop" in this context?

> > +            disable_vtsc =3D khz_diff <=3D vtsc_tolerance_khz;
> > +
> > +            printk(XENLOG_G_INFO "d%d: host has %lu kHz,"
> > +                   " domU expects %u kHz,"
> > +                   " difference of %ld is %s tolerance of %u\n",
> > +                   d->domain_id, cpu_khz, gtsc_khz, khz_diff,
> > +                   disable_vtsc ? "within" : "outside",
> > +                   vtsc_tolerance_khz);
> > +        }
> > +
> >          if ( tsc_mode =3D=3D TSC_MODE_DEFAULT && host_tsc_is_safe() &&
> > -             (d->arch.tsc_khz =3D=3D cpu_khz ||
> > +             (disable_vtsc ||
> >                (is_hvm_domain(d) &&
> >                 hvm_get_tsc_scaling_ratio(d->arch.tsc_khz))) )
> >          { =20
>=20
> In any event I don't follow why all of the sudden this becomes
> an always-on mode, with not even a boot command line override.

Perhaps I failed to explain why there is no need to make this a knob.

If a domU uses TSC as its timesource, and if it also uses NTP to make
sure the time advances correctly, then this change will make sure the
advancing of time will be withing the bounds that NTP can correct.
If it does use TSC, but does not use NTP then the advancing will be
undefined before and after my change.


Olaf

--Sig_/QjVwDJn4wpwjR=xi+bu8d6B
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXBIV5QAKCRBdQqD6ppg2
fkoCAJ9tZiYvEZLMhB0Q+97lCs7rvsM7xACePtiy1LOP6N2XwX1Jlom+bYLT+wM=
=rFsF
-----END PGP SIGNATURE-----

--Sig_/QjVwDJn4wpwjR=xi+bu8d6B--


--===============7354939789655921864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7354939789655921864==--
