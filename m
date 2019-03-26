From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen: Add "xen_timer_slop" command line
 option
Date: Tue, 26 Mar 2019 19:21:31 -0400
Message-ID: <907547fa-a7e8-8dca-dabf-dd063705f196__15251.4817704045$1553642227$gmane$org@oracle.com>
References: <1553279397-130201-1-git-send-email-ryan.thibodeaux@starlab.io>
 <abf65a68-9463-0f0e-1f51-6eefd3cacc88@oracle.com>
 <52bfeae7c256faec444b69efe58d363ad60c3fc5.camel@suse.com>
 <20190323114151.5cebf31b@sweethome> <20190325130530.56603806@luca64>
 <69e40698-f7ae-11c3-e4b7-dda4f1fadcf6@oracle.com>
 <a32c8b1d7866ee3b074b1d674b40e03e51dbd54a.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8178342033930910577=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bztm=R5=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1h8vIV-0003j4-90
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2019 23:15:59 +0000
In-Reply-To: <a32c8b1d7866ee3b074b1d674b40e03e51dbd54a.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, luca abeni <luca.abeni@santannapisa.it>
Cc: jgross@suse.com, oleksandr_andrushchenko@epam.com, linux-kernel@vger.kernel.org, thibodux@gmail.com, ryan.thibodeaux@starlab.io, xen-devel@lists.xenproject.org, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8178342033930910577==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gJZMH4gN93xMd5pBDv2bQvBrKCkcmeWEw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gJZMH4gN93xMd5pBDv2bQvBrKCkcmeWEw
Content-Type: multipart/mixed; boundary="kpJSbBO0d3C5fDaszESxGLyuhLexno1r4";
 protected-headers="v1"
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Dario Faggioli <dfaggioli@suse.com>,
 luca abeni <luca.abeni@santannapisa.it>
Cc: thibodux@gmail.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, oleksandr_andrushchenko@epam.com,
 tglx@linutronix.de, jgross@suse.com, ryan.thibodeaux@starlab.io
Message-ID: <907547fa-a7e8-8dca-dabf-dd063705f196@oracle.com>
Subject: Re: [PATCH] x86/xen: Add "xen_timer_slop" command line option
References: <1553279397-130201-1-git-send-email-ryan.thibodeaux@starlab.io>
 <abf65a68-9463-0f0e-1f51-6eefd3cacc88@oracle.com>
 <52bfeae7c256faec444b69efe58d363ad60c3fc5.camel@suse.com>
 <20190323114151.5cebf31b@sweethome> <20190325130530.56603806@luca64>
 <69e40698-f7ae-11c3-e4b7-dda4f1fadcf6@oracle.com>
 <a32c8b1d7866ee3b074b1d674b40e03e51dbd54a.camel@suse.com>
In-Reply-To: <a32c8b1d7866ee3b074b1d674b40e03e51dbd54a.camel@suse.com>

--kpJSbBO0d3C5fDaszESxGLyuhLexno1r4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 3/26/19 5:13 AM, Dario Faggioli wrote:
> On Mon, 2019-03-25 at 09:43 -0400, Boris Ostrovsky wrote:
>> On 3/25/19 8:05 AM, luca abeni wrote:
>>> The picture shows the latencies measured with an unpatched guest
>>> kernel
>>> and with a guest kernel having TIMER_SLOP set to 1000 (arbitrary
>>> small
>>> value :).
>>> All the experiments have been performed booting the hypervisor with
>>> a
>>> small timer_slop (the hypervisor's one) value. So, they show that
>>> decreasing the hypervisor's timer_slop is not enough to measure low
>>> latencies with cyclictest.
>> I have a couple of questions:
>> * Does it make sense to make this a tunable for other clockevent
>> devices
>> as well?
>>
> So, AFAIUI, the thing is as follows. In clockevents_program_event(), we=

> keep the delta between now and the next timer event within
> dev->max_delta_ns and dev->min_delta_ns:
>
>   delta =3D min(delta, (int64_t) dev->max_delta_ns);
>   delta =3D max(delta, (int64_t) dev->min_delta_ns);
>
> For Xen (well, for the Xen clock) we have:
>
>   .max_delta_ns =3D 0xffffffff,
>   .min_delta_ns =3D TIMER_SLOP,
>
> which means a guest can't ask for a timer to fire earlier than 100us
> ahead, which is a bit too coarse, especially on contemporary hardware.
>
> For "lapic_deadline" (which was what was in use in KVM guests, in our
> experiments) we have:
>
>   lapic_clockevent.max_delta_ns =3D clockevent_delta2ns(0x7FFFFF, &lapi=
c_clockevent);
>   lapic_clockevent.min_delta_ns =3D clockevent_delta2ns(0xF, &lapic_clo=
ckevent);
>
> Which means max is 0x7FFFFF device ticks, and min is 0xF.
> clockevent_delta2ns() does the conversion from ticks to ns, basing on
> the results of the APIC calibration process. It calls cev_delta2ns()
> which does some scaling, shifting, divs, etc, and, at the very end,
> this:
>
>   /* Deltas less than 1usec are pointless noise */
>   return clc > 1000 ? clc : 1000;
>
> So, as Ryan is also saying, the actual minimum, in this case, depends
> on hardware, with a sanity check of "never below 1us" (which is quite
> smaller than 100us!)
>
> Of course, the actual granularity depends on hardware in the Xen case
> as well, but that is handled in Xen itself. And we have mechanisms in
> place in there to avoid timer interrupt storms (like, ahem, the Xen's
> 'timer_slop' boot parameter... :-P)
>
> And this is basically why I was also thinking we can/should lower the
> default value of TIMER_SLOP, here in the Xen clock implementation in
> Linux.

What do you think would be a sane value? 10us? Should we then still keep
this patch?

My concern would be that if we change the current value and it turns out
to be very wrong we'd then have no recourse.


-boris


--kpJSbBO0d3C5fDaszESxGLyuhLexno1r4--

--gJZMH4gN93xMd5pBDv2bQvBrKCkcmeWEw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExAVKDNg/TOdD61Yyit52kIbKwbIFAlyas/sACgkQit52kIbK
wbIEZg/+OJRIfk1e3xN7p3LJBgZLSzqkCrBGKYvwLpSvmVuzhwIr1HGSrdW784qK
3rU0dEPI17OobUk0NmWNDufKzxoeoHHr1pxFMcnFgoPwrkct+yYiQr8dB9L+kQY/
1MAnHVNQ/npXSvk/LgHHOJPeTK1hS4ks7oE6790WYbKucEI2BDI+g7EYvXSc7sE+
2tO5MMFMHhNtxDRwaohteKHQXkgc0XQaXItk7GJyL4NBFeb6Tw6xYuFny4PuqDMv
9GI04LCndYwfHfr39W4iZHjfnSZgrtEXBCN9UblEUGwRkNERrWgO1CLfm8bOoFpb
LMClMYXm+Iqtmlm0ubBS+kjDsigIVlzeZqcalbuMvwUYf6jkZwRxlF6Xt6fOr/Z3
b9JUHYLvNVoOU+9+vKkJ+CYfhQPudLtTDuAXnd/6vNeMvOf63OlGIflHbiz05JoI
kWY0e8thM/0UxUZZtVUgBtMoH4lmlhbRa3bzfGzrwc6A46tEfMNj8zj82ysYR8Oc
kpPEUxh75OVkDH5hd0qBikcRdZZGXqFNIoHFL+KlFnjiKrJ9mSci85odd8IpZVov
/z63WQsrHcyeto7CUC2y3lR+o1v7QlSqgWxk69me67svDSpKNzp9schZI+9aXAmN
knhE/ER166CI6GMErqI7MsGZYnOEymYMdd2IJBc3FZKVcs0GTfQ=
=tSX3
-----END PGP SIGNATURE-----

--gJZMH4gN93xMd5pBDv2bQvBrKCkcmeWEw--


--===============8178342033930910577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8178342033930910577==--
