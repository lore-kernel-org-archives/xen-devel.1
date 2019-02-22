From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: =?utf-8?q?Fwd=3A___xen=3A_credit2=3A_credit2_can?=
 =?utf-8?q?=E2=80=99t_reach_the_throughput_as_expected?=
Date: Fri, 22 Feb 2019 15:28:52 +0100
Message-ID: <a461b35eb82ac1d8c0c4da0501a25144af174d0a.camel@suse.com>
References: <0E8924944E28FD4A97A19E5A680D8A82368B9F52@DGGEML521-MBX.china.huawei.com>
 <SG2PR01MB330235FAA52917279AD6587797630@SG2PR01MB3302.apcprd01.prod.exchangelabs.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4901724011016238971=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YHMC=Q5=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gxBnw-0005l1-Hp
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 14:27:56 +0000
In-Reply-To: <SG2PR01MB330235FAA52917279AD6587797630@SG2PR01MB3302.apcprd01.prod.exchangelabs.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: zheng chuan <jason.zhengchuan@hotmail.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: jgross <jgross@suse.com>, "andrew.cooper3" <andrew.cooper3@citrix.com>, "frank.yangjie" <frank.yangjie@gmail.com>, "wei.liu2" <wei.liu2@citrix.com>, "george.dunlap" <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============4901724011016238971==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-t/eYS2vzx8zD9Vo2kl9K"


--=-t/eYS2vzx8zD9Vo2kl9K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-02-18 at 14:04 +0000, zheng chuan wrote:
> Hi, Dario
>
Hi,

> [sorry for the html email format, resend by text.]
>=20
Thanks! :-)

> > On Fri, 2019-02-15 at 06:15 +0000, zheng chuan wrote:
> > >=20
> > Now, can I ask you a favour? Can you rerun with:
> >=20
> > sched_credit2_migrate_resist=3D0
> >=20
> > added to Xen's boot command line?
> >=20
> Unfortunately, sched_credit2_migrate_resist=3D0 seems do not work :(
> It still around 60% and 120% for guest_1 and guest_2 with
> ratelimiting of 1ms, respectively
>=20
Ok, I was just curios. Thanks for doing the test.

> > But can we actually try to measure latency as well? Because it
> > looks to me that
> > we're discussing while having only half of the picture available.
> >=20
> Sure, but due to my lack of knowledge, does xen have sched_latency
> measurement
> tools like perf sched_latency for CFS ? I will give it try to do it
> if I get it.
>=20
No, we don't have anything like that. When speaking of measuring
latencies, I was mainly thinking to logging some timestamps from your
app.

Anyway, I just wanted to let you know that I'm looking into this, but
it's a few days that I don't feel very well, that's why I wasn't
replying to emails.

I'll get back to it when I'm better.

> What I am tried is rude and empirical, which is shown as bellow:
>=20
> diff --git a/xen/common/sched_credit2.c b/xen/common/sched_credit2.c
> index 9a3e71f..b781ebe 100644
> --- a/xen/common/sched_credit2.c
> +++ b/xen/common/sched_credit2.c
> @@ -1642,13 +1642,13 @@ static void reset_credit(const struct
> scheduler *ops, int cpu, s_time_t now,
> if ( snext->credit < -CSCHED2_CREDIT_INIT )
> m +=3D (-snext->credit) / CSCHED2_CREDIT_INIT;
>=20
> - list_for_each( iter, &rqd->svc )
> + list_for_each( iter, &rqd->runq )
> {
>
Ok, I see. Well, if we do something like this, we'll have to figure out
what happens when one of the vcpu which didn't get the credit reset,
wakes up, and how that influence the algorithm.

I was thinking more to have csched2_runtime() return something
"clever", but I have no precise idea yet.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-t/eYS2vzx8zD9Vo2kl9K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlxwByQACgkQFkJ4iaW4
c+7rew/8C2BwXQBNo/562S9IXL9zvuMY/6xpYAwltGpws83d+dBM1Qoiel0imsPe
zUFHeokyutVsEfuQGwXfWpb5qP1Twp35mbH3pMo5A5aXLq8CwJ2szVT/3rw1ATPX
d7gDOIvzO9SgIPx7jT6Mb+UUHsTSjYQziaBrxLRmh9jG8rMX7rA8ZXwUowniwxIG
hIn8yIfylUSV9iPENkgMy+Jb6ww+fNhQnP9QRhCy2hK4cjCXkiy8oifXXaSIphov
ttz6DP4KDNn4e0gLGmNiXOeQxt2FG6LLIDocqWIxG2d+VHpAunjhHMt3WDPzYdso
+VYTfQOU/XhM9ovgq3XOo7godJyA4PIeLAHWb0o1++mPSLV6OVP1Xx7CE/v62LiR
pcCvYv6Zl3+fFecQWi8+0hCXJCJyEjEA8Y/oBhU9jhy5W8GkiC6s9/oJWQzmwmR4
4CwZKVOCwFG7tSJ36a63C0oQn/xWaIGeNQzaVpSUV9zTOAi+YW9QtxxgfGHZob9b
10F3m9NyeCIpf1AImV9PpPOVx8TJNgJB/ropSqtiLOy8l6u6pT2lBtNYI/dWgVVI
Ee9n1OVRyWBqcK490ZejXAVQ8EaTuUGGIiEQY5CrNDZlnKF2+X7gSaye9uPAE4Q2
+T3l7cuYmBR/QnDrWShBxBeL/jI2ndUsWBGGCzYL0nDML/9pjJ0=
=EVA1
-----END PGP SIGNATURE-----

--=-t/eYS2vzx8zD9Vo2kl9K--



--===============4901724011016238971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4901724011016238971==--
