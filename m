From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2 1/6] xen/sched: call
 cpu_disable_scheduler() via cpu notifier
Date: Fri, 29 Mar 2019 18:19:05 +0100
Message-ID: <f98e2a7bd40bd3809b382a0adf6b4c53832803a1.camel@suse.com>
References: <20190328120658.11083-1-jgross@suse.com>
 <20190328120658.11083-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8726096330664670720=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V2gX=SA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9vA2-0007bw-Ue
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 17:19:22 +0000
In-Reply-To: <20190328120658.11083-2-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8726096330664670720==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-nlCIqfyI5NPBCLxKQAcb"


--=-nlCIqfyI5NPBCLxKQAcb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-03-28 at 13:06 +0100, Juergen Gross wrote:
> cpu_disable_scheduler() is being called from __cpu_disable() today.
> There is no need to execute it on the cpu just being disabled, so use
> the CPU_DEAD case of the cpu notifier chain. Moving the call out of
> stop_machine() context is fine, as we just need to hold the domain
> RCU
> lock and need the scheduler percpu data to be still allocated.
>=20
> Add another hook for CPU_DOWN_PREPARE to bail out early in case
> cpu_disable_scheduler() would fail. This will avoid crashes in rare
> cases for cpu hotplug or suspend.
>=20
> While at it remove a superfluous smp_mb() in the ARM __cpu_disable()
> incarnation.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - add CPU_DOWN_PREPARE hook
> - BUG() in case of cpu_disable_scheduler() failing in CPU_DEAD
>   (Jan Beulich)
> - modify ARM __cpu_disable(), too (Andrew Cooper)
> ---
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-nlCIqfyI5NPBCLxKQAcb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyeU4kACgkQFkJ4iaW4
c+7SSg/+M2Gf/MJyZJxXK1U2RwxTNSpFCjKpiKcvn9BgIvdKf5dTQZbhXzqsm010
7JyT6OuB/U03KOXT1qiizsbvTUZlyE4Yrz3HNlX6fsmt/MYrpoaAOjuLDvm3l6ae
8UKghMD3M/Mwm8r7BFrMy2La2FSEQGzPjPpF5aAeyXNmhPn8gV7nFb/JnUzejEZC
RWVOkddJXe9txjz/fp9VqRTPOcoPxgwAOxcgCs8Cmszv7OB+LV2lm86f/cQaixgT
/enmKqTYkkbrFRgf0QDTpJsGl3cN493gwSd1aHxhyMJ9uyrvz1f4iRMvHggoWNGK
OiDe6K3OFIwIOhnmwVTl1xnmusQ1ryUk++MD0VxoNYscHf0QsEl3U221SoSw6oQV
dCqWW2Zw4IkQLFKHPi7W0ril1dT/4rB2fV3TLBknRS4pqj2OStwP8mYNFTsGnApu
szwE6KwNUXMMwmlceVp7fiXHxXQeSe0N5hxlbl6fck4A2YcQn8DtIeOh8LmRzCWA
pdMvdUUcJwY6uGWHQqsfjwxEy/k7eYUcnfVYG78XKF9uzZKWStbSHSfTcIkHN/jb
7xEXnfifQHZ6uAnIAKZGypnYa4H67CuZsc+g3HA/YmNycPxY6vUnQRMLADEid50m
sqcj8L2Qv7Z9d6dvbaqBdLMsr7dVM+FQDgB28TrQP0F0/0EZiEo=
=zjTO
-----END PGP SIGNATURE-----

--=-nlCIqfyI5NPBCLxKQAcb--



--===============8726096330664670720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8726096330664670720==--
