From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Wed, 13 Mar 2019 11:23:39 +0100
Message-ID: <20190313112339.73774003.olaf@aepfle.de>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0010569013225649209=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3/bD=RQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h4138-00031p-Tj
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 10:23:51 +0000
In-Reply-To: <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============0010569013225649209==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/+U/+HMnesHP1gIGCfZ=JDEf"; protocol="application/pgp-signature"

--Sig_/+U/+HMnesHP1gIGCfZ=JDEf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 13 Mar 2019 03:18:39 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> > +    if ( tmp >=3D VTSC_MEASUREMENT_INACCURACY_RANGE_KHZ )
> > +        tmp -=3D VTSC_MEASUREMENT_INACCURACY_RANGE_KHZ; =20
> The discontinuity is still there, and so far you've failed to explain
> why a discontinuity is what you want here.

I think this is part of the commit message, there is an entire paragraph
for it. Perhaps the word "jitter" needs to be replaced by something else.

> > +            khz_diff =3D ABS(((long)cpu_khz - gtsc_khz)); =20
> This could easily be the initializer of the variable. And there's one
> too many pair of parentheses.

I will look into that part.

> I'm sorry, but I continue to object to this adjustment getting done
> both by default _and_ not in a per-guest manner. As said before,
> you can't demand guests to run NTP, and hence you can't expect
> them to get along with a few hundred kHz jump in observed TSC
> frequency. Whether the performance drop due to vTSC use is
> better or worse is a policy decision, which we should leave to the
> admin. Hence the feature needs to be off by default, and there
> needs to be at least a host-wide control to enable it; a per-guest
> control would be better. IOW I explicitly do not agree with the
> last sentence of the commit message.

This per-domU knob exists already: tsc_mode=3Dalways_emulate
IF a workload expects such behavior, the host admin can enable it.

Also I explained several times that the speed in which TSC advances is
kind of "opqaue" (if that is the correct english term), not only due to the
unavoidable inaccuracy. IF a workload on bare-metal or virtualized needs
to know a more accurate time, it needs an external clocksource. Without
such source the speed will remain inaccurate before and after this change.


Also: anyone else with an opinion on this change? Cant be a Jan-One-Men-Sho=
w...

Olaf

--Sig_/+U/+HMnesHP1gIGCfZ=JDEf
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIjaKwAKCRBdQqD6ppg2
fnmuAKCN+QjaDJ2KgfH75z/MbdVIZurIdQCbBNZnJmYIpEl/64SOmTnIyyeDie0=
=NtW9
-----END PGP SIGNATURE-----

--Sig_/+U/+HMnesHP1gIGCfZ=JDEf--


--===============0010569013225649209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0010569013225649209==--
