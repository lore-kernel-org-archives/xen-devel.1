From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: =?utf-8?q?Fwd=3A___xen=3A_credit2=3A_credit2_can?=
 =?utf-8?q?=E2=80=99t_reach_the_throughput_as_expected?=
Date: Fri, 15 Feb 2019 18:36:32 +0100
Message-ID: <f513e123f670226a94fab0ecf9b1dd624deae981.camel@suse.com>
References: <0E8924944E28FD4A97A19E5A680D8A82368B9AD2@DGGEML521-MBX.china.huawei.com>
 <SG2PR01MB3302D03BCF4B4353EC397FF797600@SG2PR01MB3302.apcprd01.prod.exchangelabs.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0797953716960613661=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ffup=QW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1guhOr-0005It-1z
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 17:35:45 +0000
In-Reply-To: <SG2PR01MB3302D03BCF4B4353EC397FF797600@SG2PR01MB3302.apcprd01.prod.exchangelabs.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: zheng chuan <jason.zhengchuan@hotmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "jgross@suse.com" <jgross@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "frank.yangjie@gmail.com" <frank.yangjie@gmail.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============0797953716960613661==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-uVqFRMw8gAFUmxbmUpfY"


--=-uVqFRMw8gAFUmxbmUpfY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Hey, these email are still in HTML. Please check your mail program]

On Fri, 2019-02-15 at 06:15 +0000, zheng chuan wrote:
> Hi, Dario,
>
Hi,

> Here is the xentrace in credit2 with ratelimiting 1 ms and 30ms by
> observing 1 seconds both.
>=20
Ok, thanks a lot for doing this! I'm doing my own experiments, but
slower than I wanted to, as I am also a little busy with other
things... so I really appreciate your efforts. :-)

> Roughly, we can see the frequency of the context switch.
> The context switch decreases significantly when the ratelimiting
> changes from 1ms to 30ms
> linux-EBkjWt:/home # cat credit2_r_1000.log | grep __enter_scheduler
> | wc -l
> 2407
> linux-EBkjWt:/home # cat credit2_r_30000.log | grep __enter_scheduler
> | wc -l
> 714
>=20
Well, sure, that's expected. It is, indeed, the intended effect of
having ratelimiting in the first place.

Now, can I ask you a favour? Can you rerun with:

 sched_credit2_migrate_resist=3D0

added to Xen's boot command line?

Not that I expect "miracles" (things might even get worse!), but
looking at the traces, I got curios of what kind of effect that could
have.

Also, for both the Credit1 and Credit2 cases, are you touching power
management(like with `xenpm`)?

> Since we also complement credit for sleeper vcpus to guarantee the
> fairness (also sched_latency of sleeper vcpus) once we trigger the
> reset_credit.
> it does not look like suitable for some workload such like the case
> in this issue,=20
> Is that possible we try to do some punishment for the sleepers or
> complement credit in other policy to avoid too much preemption?
>=20
You keep mentioning "sleepers" or "sleeping vcpus", but I don't
understand this part. A sleeping vcpu, even if it has the highest
credits, due to a reset, won't preempt any running vcpus.

It will (likely) preempt one when it wakes up, but that also happens on
Credit1  due to boosting (well, in theory... unless everyone is always
boosted, at which point things are hard to predict).

> We sacrifice throughput for the sched_latency by theory, However,
> what's interesting is that, as I said before, if I don't complement
> credit for sleepers
> or enlarge the ratelimiting, the sched_latency may not get worse
> If the vcpus runs staggeredly which spread into pCPUs when they are
> in idle at most of time due to the stable running pattern in my demo.
>=20
But can we actually try to measure latency as well? Because it looks to
me that we're discussing while having only half of the picture
available.

Also, since you said you tried, can you show me (in code, I mean) what
you mean with "if I don't complement credit for sleepers", in order for
me to better understand what you mean with that?

Thanks again for you work and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-uVqFRMw8gAFUmxbmUpfY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlxm+KAACgkQFkJ4iaW4
c+6P4BAA2sMDfskoLlCL3VPMiZER/Il+gN1Ft/n3DFiYNHyFe1BD5ki2kY09gLse
c9u/oR9E1ypfgEkw+MgS1agE/1xWuQJob5CY2NvRZ8DqQcR+3h/RX8Bzu46/ZBB9
FNrcVmugmKgfWFhEhKdm39RIhR6p79GDvNPjIBNGO70W3odTMgxkobUFYaJAh+OS
0NfLfuqA7sFdy9639uzZWpIFLmwaKKODytjWpx0nLPbtmdRrzLwHZcDwPcVmJGO6
J9c3WTgqtouTLzF9uyAKWvE1zxlTIABBichvxu+DbYLgh45HLeHdXOQAi+65C89p
oy61gTqIsSFUt3izgve+7XroniyOw+K7AdypOJkP6fJMfjLWbVHsbLbGid3qTpCy
q/zGq075ZLXo+Ei3EW8FQxxn6dnKlEWxRZrpn18xAXlb+05KVx9ZUn/2ZfC0E19h
ZaWhicDUYQyEaTiNrBtkO48io7hFBZi7v3x5yyBK2XOchw/0oyBb1oKspnvmb9+r
1p6Ta8GJneXicrwCmcfbpdt2MIgC58j9syUdcPQroMVEtUnyeIXvXft40i/80lSV
sXJSD0oVUlM14djnltELXIfd2c66+JQ/za0/els81XJuLuJpmamK3pD7uVH/AViL
auEDV29H1XGQaXW+u2ysBH8EVL8lC4FIl+3TQyJz7ORfL2L+0So=
=8xHK
-----END PGP SIGNATURE-----

--=-uVqFRMw8gAFUmxbmUpfY--



--===============0797953716960613661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0797953716960613661==--
