From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re:
 =?utf-8?q?xen=3A_credit2=3A_credit2_can=E2=80=99t__r?=
 =?utf-8?q?each_the_throughput_as_expected?=
Date: Thu, 14 Feb 2019 16:07:06 +0100
Message-ID: <c38b34d7a97fe4cab961b6db71a5e89ffcb75f01.camel@suse.com>
References: <0E8924944E28FD4A97A19E5A680D8A82368B95A0@DGGEML521-MBX.china.huawei.com>
 <SG2PR01MB3302A6419948E232ED234A2497670@SG2PR01MB3302.apcprd01.prod.exchangelabs.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5753717599693587810=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MESF=QV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1guIaM-0006El-M3
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 15:05:58 +0000
In-Reply-To: <SG2PR01MB3302A6419948E232ED234A2497670@SG2PR01MB3302.apcprd01.prod.exchangelabs.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============5753717599693587810==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Uc0yulES8l/2jQo1H7no"


--=-Uc0yulES8l/2jQo1H7no
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forwarding to xen-devel, as it was dropped, and I did not notice.
---
On Thu, 2019-02-14 at 07:10 +0000, zheng chuan wrote:=20
> Hi, Dario,
> =20
Hi,

> I have put the test demo in attachment, please run it as follows:
> 1. compile it
>   gcc upress.c -o upress
> 2. calculate the loops in dom0 first
>   ./upress -l 100
>   For example, the output is
>   cpu khz : 2200000
>   calculate loops: 4472.
>   We get 4472.
> 3. give the 20% pressure for each vcpu in guest by
>   ./upress -l 20 -z 4472 &
>   It is better to bind each pressure task to vcpu by taskset.
> =20
Ok, thanks for the code and the instructions, I will give it a try.

> Sorry for the mess picture, you can see the figure below.
>=20
Yeah, that's clearer. However, it is preferred to avoid HTML emails. In
these cases, you could put the table in some online accessible
document, and post the link. :-)

Also, let me ask this again, is this coming from actual tracing (like
with `xentrace` etc)?

> The green one means vcpu is running while the red one means idle.
> In Fig.1, vcpu1 and vcpu2 runs staggeredly, it means vcpu1 runs 20ms
> and then vcpu2 runs 20ms while vcpu1 is sleeping.
>=20
How do you know it's sleeping and not, for instance, that it has been
preempted and hence is waiting to run?

My point being that, when you setup a workload like this, and only look
at the throughput you achieve, it is expected that schedulers with
longer timeslices do better.

It would be interesting to look at both throughput and latency, though.
In fact, (assuming the analysis is correct) in the Credit1 case, if two
vcpus wakes up at about the same time, the one that wins the pcpu runs
for a full timeslice, or until it blocks, i.e., in this case, for 20ms.
This means the other vcpu will have to wait for so long, before being
able to do anything.

> In Fig.2, vcpu1 and vcpu2 runs at the same time, it means vcpu1 and
> vcpu2 compete for pCPU, and then go to sleep at the same time.
> Obviously, the smaller time-slice is, the worse competition happens.
>=20
But the better the latency. :-D

What I mean is that, achieving best throughput or best latency at the
same time is often impossible, and the job of a scheduler is to come up
with a trade-off, as well as with tunables for letting people that
cares more about either one or the other, to steer it that direction.

Achieving better latency than Credit1 has been a goal of Credit2, since
design time. However, it's possible that we ended up sacrificing
throughput too much, or that we lack tunables to let users decide what
they want.

Of course, this is all assuming that the analysis of the problem that
you're providing is correct, which I'll be looking into confirming. :-)

> As you mentioned that the Credit2 does not have a real timeslice, the
> vcpu can be preempted by the difference of credit (+
> sched_ratelimit_us) dynamically.
>=20
Actually, it's:

 difference_of_credit + min(CSCHED2_MIN_TIMER, sched_ratelimit_us)

> > Perhaps, one thing that can be done to try to confirm this
> analysis, would be to
> > make the scheduling less frequent in Credit2 and, on the other
> hand, to make
> > it more frequent in Credit1.
> Here is the further test result:
> i.  it is interesting that it still works well if I make Credit1 to
> 1ms by xl sched-credit -s -t 1
> linux-sodv:~ # xl sched-credit
> Cpupool Pool-0: tslice=3D1ms ratelimit=3D1000us migration-delay=3D0us
> Name                                ID Weight  Cap
> Domain-0                             0    256    0
> Xenstore                             1    256    0
> guest_1                              2    256    0
> guest_2                              3    256    0
> =20
Hah, yes, it is interesting indeed! It shows us one more time how not
predictable Credit1 behavior is, because of all the hacks it
accumulated over time (some of which, are my doing, I know... :-P).

> ii.  it works well if sched_ratelimit_us is set up to 30ms above.
> linux-sodv:~ # xl sched-credit2 -s -p Pool-0
> Cpupool Pool-0: ratelimit=3D30000us
> =20
Ok, good to know, thanks for doing the experiment.

If you have time, can you try other values? I mean, while still on
Credit2, try to set ratelimiting to, like, 20, 15, 10, 5, and report
what happens?

> However, the sched_ratelimit_us is not so elegant and flexiable that
> it guarantees the specific time-slice fixedly.
>=20
Well, I personally never loved it, but it is not completely unrelated
to what we're seeing and discussing, TBH. It indeed was introduced to
improve the throughput, in workloads where there was too many wakeups
(which, in Credit1, also resulted in invoking the scheduler and often
in context switching, do to boosting).

> It may very likely cause degrading of the other scheduler criteria
> like sched_latency.
> As far as I know, CFS could adjust time-slice according to the
> nr_queue in runqueue (in__sched_period() ).
> Could it possible that Credit2 also have the similar ability to
> adjust time-slice automatically?
> =20
Well, let's see. Credit2 and CFS are very similar, in principle, but
the code is actually quite different. But yeah, we may be able to come
up with something more clever than just plain ratelimiting, for
adjusting what CFS calls "the granularity".

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-Uc0yulES8l/2jQo1H7no
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlxlhBoACgkQFkJ4iaW4
c+5RpBAAu3GjCeVPnLznVIah37J+nruhGhr4XgOup2Z1ktTWc+Dgc/7j2I/cwX/Z
2gMxJ8AuSi0GSC2r8GG55hKeJjSVuGCye73/BKI1goDXtDQ7XyqRMVmLapvzofTT
CN8kUOvBwJTTOhkDtt9m+b/e4XH4vloJVyGJVaY7FXT7XGEpqU55DmsJJreQRVPj
1gy97ORmMX5xrQ1MZiKomBnAhN6kExMv/vm9hOXg/P8ennWMa5NMs8HBQjbWtDtO
JVCcohg5Hl+b9akE3J1wR1NSbUloQMv9yYDgmy+3CCm9BmeY42vN3MKlnP8yInhN
/dMSvwZT7zPQGXKxXNdBFFm1/kWPGmUQcYzRP6q6g74nsyML1T8Gv+GjvQLF21AQ
IhwI3v2Vf8bKsRQdhrghsd+ERSm+2cwnT01r5ReWWCXgn81qDzT633Srdnz78d0d
Y4N9zf4adb5p+cUXWUTXV14J1zYaPrDlxweOVvluaixg3dOCK38oysz/Io/di/1M
sKr6jMPOUH9EpoMTpiKex3qcT8IPiE3izpsnw2oaVq6ggzZQ9SDDf2Y92MGBsN4x
NZ11T3+vnei1q9Z0+d4G38Fwa46bl8IRli5OjZr9/rYq92NMQDLqdLB8TroCA+r4
4sdK8FyzgZQUJbDMBCHPYRXgkg3ps/S7nMY3shG2dCZJBUK5fF8=
=sG44
-----END PGP SIGNATURE-----

--=-Uc0yulES8l/2jQo1H7no--



--===============5753717599693587810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5753717599693587810==--
