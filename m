From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re:
 =?utf-8?q?xen=3A_credit2=3A_credit2_can=E2=80=99t_re?=
 =?utf-8?q?ach_the_throughput_as_expected?=
Date: Wed, 13 Feb 2019 13:44:45 +0100
Message-ID: <6accd1c20f3ee24920a48e4e3c820019b52aea34.camel@suse.com>
References: <SG2PR01MB3302E90C28F2EED3F8A6105997650@SG2PR01MB3302.apcprd01.prod.exchangelabs.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7044594111039577544=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sQnB=QU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gtttY-0001WL-C0
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 12:44:08 +0000
In-Reply-To: <SG2PR01MB3302E90C28F2EED3F8A6105997650@SG2PR01MB3302.apcprd01.prod.exchangelabs.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?=E9=83=91_=E5=B7=9D?= <jason.zhengchuan@hotmail.com>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "jgross@suse.com" <jgross@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "frank.yangjie@gmail.com" <frank.yangjie@gmail.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7044594111039577544==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-sKgfnBDcmcgZXelLkGxX"


--=-sKgfnBDcmcgZXelLkGxX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-02-12 at 13:36 +0000, =E9=83=91 =E5=B7=9D wrote:
> Hi, George,
>=20
Hi (although I'm not George :-D),

> I found Credit2 can=E2=80=99t reach the throughput as expected under my t=
est
> workload, compared to Credit and CFS. It is easy to reproduce, and I
> think the problem is really exist.
> It really took me a long time to find out why due to my lack of
> knowledge, and I cannot find a good way to solve it.
> Please do help to take a look at it. Thx.
>=20
Ok, thanks for your testing, and for reporting this to us.

A few questions.

> ***************
> [How to reproduce]
> ***************
> I use openSUSE-Tumbleweed with xen-4.11 version.
> Here is the test workload like:
> I have guest_1 with 4 vCPU and guest_2 with 8 vCPU running on 4 pCPU,
> that is, the relation of pCPU:vCPU is 1:3.
> Then I add pressure with 20% CPU usage for each vCPU, which results
> in total 240% pCPU usage.
> The 20% pressure model is that, I start one process on each vCPU,
> which runs 20ms indefinitely and then goes to sleep 80ms within the
> period of 100ms.
> I use xentop to observe guest cpu usage in dom0, as I expect, the
> guest cpu usage is 80% and 160% for guest_1 and guest_2 ,
> respectively.
>=20
Do you have the sources for this somewhere, so that we can try to
reproduce it ourself. I'm thinking to the source code for the periodic
apps (if you used a custom made one), or the repository (if you used
one from any) or the name of the benchmarking suite --and the parameter
used to create this scenario?

> **************
> [Why it happens]
> **************
> The test workload likes the polling from the long term to see.
> As showed in the figure below, the - - - - means the cputime the
> vcpus is running and the =E2=80=94=E2=80=94=E2=80=94 means the idle.
> As we can see from Fig.1, if vcpu_1 and vcpu_2 can run staggeredly,
> the throughput looks fine, however, if vcpu_1 and vcpu_2 runs at the
> same time, they will compete for pCPU, which results in poor
> throughput.
>=20
> vcpu_1        - - - - - - - =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94  - - - - - - - =E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94 - - - -
> -
>                   |                |                               |=20
>               |                               |
> vcpu_2                        - - - - - - - =E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94  - - - - - - -
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
>                   |  vcpu1    |   vcpu2   |               |  vcpu1  =20
>  |   vcpu2   |              |  vcpu1
> cpu usage   - - - - - - - - - - - - -  =E2=80=94=E2=80=94=E2=80=94=E2=80=
=94- - - - - - - - - - - - -
> - =E2=80=94=E2=80=94=E2=80=94=E2=80=94 - - - - - - -=20
>                                                            Fig.1
>=20
> vcpu_1       - - - - - - - =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94                  - - - - - - -
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
>                  |
> vcpu_2       - - - - - - - =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94                  - - - - - - -
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
>                  |  compete running     |   both
> sleep         |  compete running    |   both sleep    |       =20
> cpu usage   - - - - - - - - - - - - - - =E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94 - - - - - - - - - -
> - - - - =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94
>                                                            Fig.2
>=20
Ok, I'm not entirely sure I follow all this, but let's put it aside for
a second. The question I have is, is this analysis coming from looking
at actual traces? If yes, can you upload somewhere/share the trace
files?

> As we do reset_credit() when snext->credit is negative which makes
> the credit value is too close between each vcpu.
> As a result, from long term to observe, the time-slice of each vcpu
> becomes smaller, they compete for pCPU at the same time just like
> shown in Fig.2 above.
> Thus, i think the reason why it can't reach the expected throughput
> is that reset_credit() for all vcpu will make the time-slice smaller
> which is different from
> Credit and CFS.
>=20
Ok, so you're saying this drop of "throughput" can be caused by
scheduling happening too frequently in Credit2.

Well, I guess that is a possibility, although, as I said above, I'd
need to think a bit more about this, as well as trying to reproduce it,
and look at actual traces.

Perhaps, one thing that can be done to try to confirm this analysis,
would be to make the scheduling less frequent in Credit2 and, on the
other hand, to make it more frequent in Credit1. In theory, if the
analysis is correct, you would observe the behavior of this specific
workload improving on Credit2 and degrading in Credit1, when doing so.

If you fancy trying that, for Credit1, you can play with the
sched_credit_tslice_ms Xen boot time parameter (e.g., try pushing it
down to 1ms).

For Credit2, it's a little trickier, as the scheduler does not have a
real timeslice. So, either you alter CSCHED2_MIN_TIMER, in the code, or
you "mimic" the timeslice increase by setting sched_ratelimit_us to a
higher value (like, e.g., 10ms).

It's not a conclusive test, but I think it is a good enough one for
gaining some more understanding of the issue.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-sKgfnBDcmcgZXelLkGxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlxkET0ACgkQFkJ4iaW4
c+5FcRAAgfX9XcN2E1HRDSzQWbtiKGdnT/83bwLgoJ2QfqNHfUpF481VmUsIbgjg
VReEIyQMNwNr//xs/eh4FmI9VFQxUM0aaPV6AY5sVqf8TAGOgrz7VoftdmVeI18D
yKigXb8ED1bv8pCMRL9ZobFEwxlvuNwy43x8BnVSJaz18PvSeoy9TMJJCthDx5rQ
QJnwHYKa3waAus64u6glSowU50ZjNAMlqOAZXY8CY1xVfYlTSF/cK1ZYgl3oErzP
BnSFoO+ssi1u7vG+jM6I/FtFzlIX/qkyRmZ+HeKAEY+a3QzTXebiIHyiZ+DfpAtI
Hrj8U7lQYaLYOm0yM1wLju+Qu3k0S7ZdRglmV8fjp6YtB26iNJxLW/1fA4j45+uF
6+3vBT/f7OJax4IkDdMVNWpX/qXLn4ocu5Ao+TVCA0YqyHiaoyzqcNOJZYe18Hpv
rAMUm3w7TcvhMKQzK+NpnJxGpqKm1GfFoyl4Y2nnNUwFr3La2o0Me5j8+2aqn+93
IHHUXCYrSWyO4MyCc64sPu4GMdiw6Pw0H4Urs6b31dFKiFS8IxYOs5kyMnic/9YL
z10smrM7yn1cCVFKdhKTfDHSAtJKZBArJcuk7EtOUbVxaLKgm8rzTum1lUc1dw+x
adfZEQ1/djyB4oRTkhJmLv2lZE+fllVbvzOCodJ9CLTGsmuGMgs=
=6yEa
-----END PGP SIGNATURE-----

--=-sKgfnBDcmcgZXelLkGxX--



--===============7044594111039577544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7044594111039577544==--
