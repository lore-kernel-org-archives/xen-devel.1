From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 00/17] Alternative Meltdown mitigation
Date: Mon, 12 Feb 2018 18:54:16 +0100
Message-ID: <1518458056.3682.42.camel@suse.com>
References: <20180209140151.24714-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1768507722525176693=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qkv9=fg=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1elIJB-0004UF-L1
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 17:54:29 +0000
In-Reply-To: <20180209140151.24714-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org


--===============1768507722525176693==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bniyCbSuegiJLqSqh6+u"


--=-bniyCbSuegiJLqSqh6+u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-09 at 15:01 +0100, Juergen Gross wrote:
> This series is available via github:
>=20
> https://github.com/jgross1/xen.git xpti
>=20
> Dario wants to do some performance tests for this series to compare
> performance with Jan's series with all optimizations posted.
>=20
And some of this is indeed ready.

So, this is again on my testbox, with 16 pCPUs and 12GB of RAM, and I
used a guest with 16 vCPUs and 10GB of RAM.

I benchmarked Jan's patch *plus* all the optimizations and overhead
mitigation patches he posted on xen-devel (the ones that are already in
staging, and also the ones that are not yet there). That's "XPTI-Light"=20
in the table and in the graphs. Booting this with 'xpti=3Dfalse' is
considered the baseline, while booting with 'xpti=3Dtrue' is the actual
thing we want to measure. :-)

Then I ran the same benchmarks on Juergen's branch above, enabled at
boot. That's "XPYI" in the table and graphs (yes, I know, sorry for the
typo!).

http://openbenchmarking.org/result/1802125-DARI-180211144
http://openbenchmarking.org/result/1802125-DARI-180211144&obr_hgv=3DXPTI-Li=
ght+xpti%3Dfalse&obr_nor=3Dy&obr_hgv=3DXPTI-Light+xpti%3Dfalse

As far as the following benchmarks go:
- [disk] I/O benchmarks (like aio-stress, fio, iozone)
- compress/uncompress benchmarks
- sw building benchmarks
- system benchmarks (pgbench, nginx, most of the stress-ng cases)
- scheduling latency benchmarks (schbench)

the two approach are very very close. It may be said that 'XPTI-Light
optimized' has, overall, still a little bit of an edge. But really,
that varies from test to test, and most of the time is marginal (either
way).

System-V message passing and semaphores, as well as socket activity
tests, together with hackbench ones, seems to cause Juergen's XPTI
serious problems, though.

With Juergen, we decided to dig this a bit more. He hypothesized that,
currently, (vCPU) context switching costs are high in his solution.
Therefore, I went and check (roughly) how many context switches occurs
in Xen, during a few of the benchmarks.

Here's a summary.

******** stress-ng CPU ********
 =3D=3D XPTI
  stress-ng: info: cpu               1795.71 bogo ops/s
  sched: runs through scheduler      29822=20
  sched: context switches            14391
 =3D=3D XPTI-Light
  stress-ng: info: cpu               1821.60 bogo ops/s
  sched: runs through scheduler      24544=20
  sched: context switches            9128

******** stress-ng Memory Copying ********
 =3D=3D XPTI
  stress-ng: info: memcpy            831.79 bogo ops/s
  sched: runs through scheduler      22875=20
  sched: context switches            8230
 =3D=3D XPTI-Light
  stress-ng: info: memcpy            827.68
  sched: runs through scheduler      23142=20
  sched: context switches            8279

******** schbench ********
 =3D=3D XPTI
  Latency percentiles (usec)
	50.0000th: 36672
	75.0000th: 79488
	90.0000th: 124032
	95.0000th: 154880
	*99.0000th: 232192
	99.5000th: 259328
	99.9000th: 332288
	min=3D0, max=3D568244
  sched: runs through scheduler      25736=20
  sched: context switches            10622=20
 =3D=3D XPTI-Light
  Latency percentiles (usec)
	50.0000th: 37824
	75.0000th: 81024
	90.0000th: 127872
	95.0000th: 156416
	*99.0000th: 235776
	99.5000th: 271872
	99.9000th: 348672
	min=3D0, max=3D643999
  sched: runs through scheduler      25604=20
  sched: context switches            10741

******** hackbench ********
 =3D=3D XPTI
  Running with 4*40 (=3D=3D 160) tasks   250.707 s
  sched: runs through scheduler      1322606=20
  sched: context switches            1208853
 =3D=3D XPTI-Light
  Running with 4*40 (=3D=3D 160) tasks    60.961 s
  sched: runs through scheduler      1680535=20
  sched: context switches            1668358

******** stress-ng SysV Msg Passing ********
 =3D=3D XPTI
  stress-ng: info: msg                276321.24 bogo ops/s
  sched: runs through scheduler      25144
  sched: context switches            10391
 =3D=3D XPTI-Light
  stress-ng: info: msg               1775035.18 bogo ops/s
  sched: runs through scheduler      33453=20
  sched: context switches            18566

******** schbench -p *********
 =3D=3D XPTI
  Latency percentiles (usec)
	50.0000th: 53
	75.0000th: 56
	90.0000th: 103
	95.0000th: 161
	*99.0000th: 1326
	99.5000th: 2172
	99.9000th: 4760
	min=3D0, max=3D124594
  avg worker transfer: 478.63 ops/sec 1.87KB/s
  sched: runs through scheduler      34161=20
  sched: context switches            19556
 =3D=3D XPTI-Light
  Latency percentiles (usec)
	50.0000th: 16
	75.0000th: 17
	90.0000th: 18
	95.0000th: 35
	*99.0000th: 258
	99.5000th: 424
	99.9000th: 1005
	min=3D0, max=3D110505
  avg worker transfer: 1791.82 ops/sec 7.00KB/s
  sched: runs through scheduler      41905=20
  sched: context switches            27013

So, basically, the intuition seems to me to be confirmed. In fact, we
see that until the number of context switches happening during the
specific benchmark are limited to ~ below 10k, Juergen's XPTI is fine,
and on par or better than Jan's XPTI-Light (see stress-ng:cpu, stress-
ng:memorycopying, schbench).

Above 10k, XPTI begins to suffer; and the more context switches there
are, the worse (e.g., see how bad it goes in the hackbench case).

Note that, in the stress-ng:sysvmsg case, we see that in the XPTI-Light=20
case that there are ~20k context switches, and I believe that the fact
that we only see ~10k of them in the XPTI case, is that, due to context
switch being slower, the benchmark did less work in its 30s of
execution.

We can have a confirmation of that by looking at the schedbench-p case,
where the slowdown is evident by looking at the average data
transferred by the workers.

So, that's it for now. Thoughts are welcome. :-)

...

Or, actually, that's not it! :-O In fact, right while I was writing
this report, it came out on IRC that something can be done, on
Juergen's XPTI series, to mitigate the performance impact a bit.

Juergen sent me a patch already, and I'm re-running the benchmarks with
that applied. I'll let know how the results ends up looking like.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-bniyCbSuegiJLqSqh6+u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqB1MgACgkQFkJ4iaW4
c+425hAAxYTqXCmEZ3CSWrKAQ8+5KKgTgL+rkBFjutHa3M37n7TvCx7saa/WpI8D
liHoWL0ioGBXhX/GRfjt0b1b5NE7hqr1jMY4hfHKxialXEXBGYfuBhQx2hoZpzGA
9cabFy+hfFnLdP2vwbKuLaor1Eghtiz+QDTvMSmyJz8fZRl9VGd9UXqVmqj2GIWN
XFRomHfbv+U/fC9Tfg/e/CkjtiqVEYQpxfZlj4g31pWu4qV0+rJ9dEH/WT12G53j
RmewYvc5LGWN02Wishkq2Jc24OnH+juR0NJ3G8TztWdJfnDE4nypPW+Bvu30Rgj5
TrVwpikBmWU9PdVG5qh4tZe5EGFyO/7JYIysGND0HqAIzDrsXEoAYN5v4A+s8OY6
G1lSuCnfuvqL+bZCKbRDZvCqPsKEUE3wRs4UKFEd/KslqDH3vMN8cfHlKOMyt1bq
RVCyD6cGS9N0pYmxShAv/AumM7nzqgifZDa4UPMGGhwJbu3BSP05lmUlaSHtIElK
MIkGIMK/9OWxhYfY6nPkoDBNVE4Ob4/89EbrioxB6ZAWmKxFbExNQL2ZDTQeUEVj
nmT/aov39rqwVRitlFBk27lbIkaCHcA17eyclcWPBfjlK7z2gVdwPAWyFq+uGtJb
5aYDdNccK73RD90dUiooiQTPhTzsKg3LEwVL0PDoRwbTOCQR+TU=
=1dTe
-----END PGP SIGNATURE-----

--=-bniyCbSuegiJLqSqh6+u--



--===============1768507722525176693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1768507722525176693==--
