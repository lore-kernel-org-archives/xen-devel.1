From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v4 1/6] xen/sched: call
 cpu_disable_scheduler() via cpu notifier
Date: Thu, 04 Apr 2019 15:06:48 +0200
Message-ID: <6e010569fa02b1e673ad781a1b70fd7306d5afc6.camel@suse.com>
References: <20190402161910.14860-1-jgross@suse.com>
 <20190402161910.14860-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2065065002352493547=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QUiE=SG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hC25H-00034n-R9
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 13:07:11 +0000
In-Reply-To: <20190402161910.14860-2-jgross@suse.com>
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


--===============2065065002352493547==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-wXCf3NpPHAjnHUh+bj2b"


--=-wXCf3NpPHAjnHUh+bj2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-02 at 18:19 +0200, Juergen Gross wrote:
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
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Julien Grall <julien.grall@arm.com>
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


--=-wXCf3NpPHAjnHUh+bj2b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlymAWgACgkQFkJ4iaW4
c+694g//W+jHR3PUgUNYDsDzuMb4eVnzicejhTxIeUPAt3RhYKyZSTspyRIZX3cA
VBkc91PuVYYMt3Q+njABGz1uaQxrET/UmKtMtmzuDWqvaDYYr2idduG1PcIwZKAJ
N9N4rqi1OofvlOZ8rxTQnVd1dJNO/KiTovYlobHUr/9/BbR9lnV7oH5Dx3BtVNqn
5AMgzogz5A6QoYHN7bCWF8YaavPmx+DG3Cut4CI0eSwjAkBmq4MnJ4XZvjKUsk7S
K01GHJr4g7Jb+gbtzCX3JGs1NLkezPVEBnO9qGIzjsTBKgqeCBV6kurWyg8ZZzJT
6rfN+j/8KFq7H0Fm3N2hJtpnriXEzsR/XPBJqiiMf41AKoNb+kB7zTk47PMnryZr
z9YqT3qtNLJNQ4XWULHKgOHXXnZnFV0LXx6U1jO7zla0mEVdSWXbL5fQlc9a7cKY
je6oVY/F5YqT28ZUH4ADsguPQayTSLTxY7qn7VeGLYXiq1mv0annC9BXKdR59LKC
hYZkrh/VT08ZhSzU8/iCZKS55d+q963m8XmN2xgadYyjQTKNlA++gZXFIBxa1BRQ
7zTBESY/ivzb7C/wtSz0d2NavUOpTTOrEUeeT1SY63y1qDfcjbhnwkHann7ZNeXA
6UDhR5aTVL2gb1W8HXzNdGnnkHDpqJsriIDaJCXD0vbYeo2KqJM=
=f3Q2
-----END PGP SIGNATURE-----

--=-wXCf3NpPHAjnHUh+bj2b--



--===============2065065002352493547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2065065002352493547==--
