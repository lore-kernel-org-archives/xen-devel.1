From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v10] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Tue, 11 Dec 2018 16:40:59 +0100
Message-ID: <20181211154059.GC18447@aepfle.de>
References: <20181207085122.14171-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5062784094935090937=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t2nM=OU=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gWkA5-0003zV-2R
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 15:41:29 +0000
In-Reply-To: <20181207085122.14171-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5062784094935090937==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline


--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 07, Olaf Hering wrote:

> [ the math added to xen-tscmode.7 suggests that a domU should see a time
>   drift, which ntpd corrects. But the actual correction reported in
>   ntp.drift is entirely different than the one calculated in the
>   example. To me it is unclear why the example is wrong, more research
>   must be done. I'm sending this out just to get feedback about how
>   exactly the per-host knob must be implemented. ]
>=20
> Add a knob to control when vTSC emulation will be activated for a domU
> with tsc_mode=3Ddefault. Without such option each TSC access from domU
> will be emulated, which causes a significant perfomance drop for
> workloads that make use of rdtsc.

I wonder why this needs to be a config option at all.


I think that if a domU uses TSC as clocksoure it also must run NTP in
some way to avoid the potential drift what will most likely happen,
independent of any migration. And if it must do that, NTP will handle a
drift up to 500 PPM. This means 500us. But if a domU is moved from a
2.3GHz host to a 2.4GHz host the expected drift is much larger. The
clock will run slower, the amount of ticks representing a second happen
within a timespan of 0.958333 seonds. Adding the drift to that number
means an NTPd could correct up to 0.958833 seconds. This is out of
bounds either way.

If Xen already bases its decision to emulate TSC on bogus numbers,
shouldnt it automatically allow some tolerance for tsc_mode=3Ddefault?
Xen itself can not know if the estimated value in cpu_khz is at the edge
or in the middle of the range of possible freqencies. If we assume the
total range is 200 KHz, and up to 500 PPM can be corrected, a possible
default tolerance would be like: [insert math here]


So I think the suggested vtsc_tolerance_khz should in fact add a local
static vtsc_tolerance_khz into xen/arch/x86/time.c, and tsc_set_info
should base the decision on this variable like it is already done in the
suggested patch. No admin tuning of this value is required IMO.

Olaf

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXA/aiAAKCRBdQqD6ppg2
frCoAKCIrX0Lg2YlYFOGZkHMqiLcVjFWSACfU4NbVr0i2oFhRBg6KFhUJji+3ug=
=oyyK
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--


--===============5062784094935090937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5062784094935090937==--
