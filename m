From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] x86/xen: Add "xen_timer_slop" command line
 option
Date: Tue, 26 Mar 2019 10:13:32 +0100
Message-ID: <a32c8b1d7866ee3b074b1d674b40e03e51dbd54a.camel__8835.74104388885$1553591682$gmane$org@suse.com>
References: <1553279397-130201-1-git-send-email-ryan.thibodeaux@starlab.io>
 <abf65a68-9463-0f0e-1f51-6eefd3cacc88@oracle.com>
 <52bfeae7c256faec444b69efe58d363ad60c3fc5.camel@suse.com>
 <20190323114151.5cebf31b@sweethome> <20190325130530.56603806@luca64>
 <69e40698-f7ae-11c3-e4b7-dda4f1fadcf6@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3209304780224333442=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yUlD=R5=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h8i9U-0001aj-Cm
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2019 09:13:48 +0000
In-Reply-To: <69e40698-f7ae-11c3-e4b7-dda4f1fadcf6@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, luca abeni <luca.abeni@santannapisa.it>
Cc: jgross@suse.com, oleksandr_andrushchenko@epam.com, linux-kernel@vger.kernel.org, thibodux@gmail.com, ryan.thibodeaux@starlab.io, xen-devel@lists.xenproject.org, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org


--===============3209304780224333442==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ySIvEmEZ+N1iVOye3K9P"


--=-ySIvEmEZ+N1iVOye3K9P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-03-25 at 09:43 -0400, Boris Ostrovsky wrote:
> On 3/25/19 8:05 AM, luca abeni wrote:
> >=20
> > The picture shows the latencies measured with an unpatched guest
> > kernel
> > and with a guest kernel having TIMER_SLOP set to 1000 (arbitrary
> > small
> > value :).
> > All the experiments have been performed booting the hypervisor with
> > a
> > small timer_slop (the hypervisor's one) value. So, they show that
> > decreasing the hypervisor's timer_slop is not enough to measure low
> > latencies with cyclictest.
>=20
> I have a couple of questions:
> * Does it make sense to make this a tunable for other clockevent
> devices
> as well?
>
So, AFAIUI, the thing is as follows. In clockevents_program_event(), we
keep the delta between now and the next timer event within
dev->max_delta_ns and dev->min_delta_ns:

  delta =3D min(delta, (int64_t) dev->max_delta_ns);
  delta =3D max(delta, (int64_t) dev->min_delta_ns);

For Xen (well, for the Xen clock) we have:

  .max_delta_ns =3D 0xffffffff,
  .min_delta_ns =3D TIMER_SLOP,

which means a guest can't ask for a timer to fire earlier than 100us
ahead, which is a bit too coarse, especially on contemporary hardware.

For "lapic_deadline" (which was what was in use in KVM guests, in our
experiments) we have:

  lapic_clockevent.max_delta_ns =3D clockevent_delta2ns(0x7FFFFF, &lapic_cl=
ockevent);
  lapic_clockevent.min_delta_ns =3D clockevent_delta2ns(0xF, &lapic_clockev=
ent);

Which means max is 0x7FFFFF device ticks, and min is 0xF.
clockevent_delta2ns() does the conversion from ticks to ns, basing on
the results of the APIC calibration process. It calls cev_delta2ns()
which does some scaling, shifting, divs, etc, and, at the very end,
this:

  /* Deltas less than 1usec are pointless noise */
  return clc > 1000 ? clc : 1000;

So, as Ryan is also saying, the actual minimum, in this case, depends
on hardware, with a sanity check of "never below 1us" (which is quite
smaller than 100us!)

Of course, the actual granularity depends on hardware in the Xen case
as well, but that is handled in Xen itself. And we have mechanisms in
place in there to avoid timer interrupt storms (like, ahem, the Xen's
'timer_slop' boot parameter... :-P)

And this is basically why I was also thinking we can/should lower the
default value of TIMER_SLOP, here in the Xen clock implementation in
Linux.

> * This patch adjusts min value. Could max value (ever) need a similar
> adjustment?
>=20
Well, for Xen, it's already 0xffffffff. I don't see use cases when one
would want a smaller max. Wanting an higher max *might* be of some
interest,  e.g., for power management, if the first timer event is 1min
ahead, and you don't want to be woken up every (if my math is right) 4
secs.

But we'd have to see if that actually works, not to mention that 4 secs
is already large enough, IMHO, that it's unlikely we'll be really
sleeping for that much time without having to wake up for one reason or
another. :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-ySIvEmEZ+N1iVOye3K9P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyZ7TwACgkQFkJ4iaW4
c+55/RAA2r1QTWiBrvh0X5J9zV7K6fs3sOAIaIs0FYkoDjwkVz8LGxnrlhhKCGKx
hD3DSAesFH1m2bbGzslm8aqzaUEDA8dypa5DBjkGG5frpPsN81mr/qh6QCY3yFhS
dq8BwUVyHTArurXk+h9z4t7DS9dCsrcvtjJJ5dDr7m4PHb4reRWAWkxzkO0ErO/Q
CaM1IkZGPwsG/K4ipaUjwl+mqRVbmxirmkmmjtoZYlJVT709Wa98ByHvbPqqnu5S
/+VQ2agQ9bEiFYsgTUWfmYiVPDhzYRISyCXy7RSKAaXLJBIvyDUs0CVXRrc6QJgS
UcSvMM+siXGKg8kVN2Yz+KnjlkoifR84RuQpdCGNRTyAKwKljWg/AzvvdV88DbMC
PoudqZRg2LOQsHUAUZvvQWNfPACgUJDvwTxx18YhfjgNeSsUi2ot+W5tdKmbEJnh
PYkSUZwWqZ5l8z7wVxasXN262B3yxf79vAfD6tmLhOF7rRY6VULQmW0zOMgUqOmd
sg8e+lVOJCbIQXihYZWH1A5iRGNLqOZ8G7WY/r0fRzRSP3Z1wjVb+INoTcH1Y7b6
JdRhedr3v3wQwIBVbCnasKtM01peGjiiJGpxoEqycN9cpbjQmJQhKOsATd7Dj40p
Vli0U+dYf4MLP/Hg/oX5o48WQS9sdAiEE3s7KHuvHBv3pWABKI8=
=UFYQ
-----END PGP SIGNATURE-----

--=-ySIvEmEZ+N1iVOye3K9P--



--===============3209304780224333442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3209304780224333442==--
