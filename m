From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen: sched: Credit2: avoid looping too much
 (over runqueues) during load balancing
Date: Wed, 07 Nov 2018 18:58:48 +0100
Message-ID: <b39fcd273e09b82c9c65dbee68114203a347de3e.camel@suse.com>
References: <153926567611.23011.10706214055586822546.stgit@wayrath>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7694788955899277836=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3bvd=ns=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gKS6Y-0001id-GA
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 17:59:02 +0000
In-Reply-To: <153926567611.23011.10706214055586822546.stgit@wayrath>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7694788955899277836==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-QkAJpfqZ3HxS0xt/xwUq"


--=-QkAJpfqZ3HxS0xt/xwUq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-10-11 at 15:47 +0200, Dario Faggioli wrote:
> For doing load balancing between runqueues, we check the load of each
> runqueue, select the one more "distant" than our own load, and then
> take
> the proper runq lock and attempt vcpu migrations.
>=20
> If we fail to take such lock, we try again, and the idea was to give
> up
> and bail if, during the checking phase, we can't take the lock of any
> runqueue (check the comment near to the 'goto retry;', in the middle
> of
> balance_load())
>=20
> However, the variable that controls the "give up and bail" part, is
> not
> reset upon retries. Therefore, provided we did manage to check the
> load of
> at least one runqueue during the first pass, if we can't get any runq
> lock,
> we don't bail, but we try again taking the lock of that same runqueue
> (and that may even more than once).
>=20
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> Cc: George Dunlap <george.dunlap@citrix.com>
>
Ping?

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-QkAJpfqZ3HxS0xt/xwUq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvjJ9gACgkQFkJ4iaW4
c+6i3xAAuVp9fJvMYeaJDHCUNL4fjMfJI2lRsg5sl7U4AuOow3bo/6bmpb0KU1qN
k6UayEpiSsHHf2039JtpXR6aIvQYw2xINmmBhU+AdXVm9WEdBPdThCqp5qxRfWTo
zD2XaN+Moin6+1sVxZfXlWcFIOr6yHXXl99OJ6qXKcOfdEM8Jzkz2eliGKjnzwlS
H+g+Sy/tQTzDmPwzUyXpoDrJyf6DGiYVu3Z7a6AHYqp0b7jOBrwW2Vlb7569VxBH
dNF4dDXaj02HwpvNAPKADrigZugnP+3ohicjozshAS0f3TognufhAYwMmZOvcwmC
DILPQKSFyEOHZKspz94W24ZOACAbf1siuiZDfuejPpcvPjtvy/aQt4/lLFJHmUFF
3AMg6qlPBSWv1SPIZ3yYwwgg441xKPD7Ohv8J1gaODa9emLv7O8/bK61NV98yanq
vlBp2of6vl6nlkRez/nlF/Cz3lSVBE/Sc7H2Y9JGhrCJEk9xQ4PoHGX7KVIa0PnP
bglsfffpFzJA+LOhQ/f7+K8tWu7my9A8uCCFxOS9usj+BhJaiJl4EhfPOQth8xH9
9J2ALHnVwiQzzzqAtOZgENjl/N//CfYl6v9nv4BUu3IG21aHB/FFJrwTFNi5Ichm
8VmJzg2/exAsae0TcE8pXM/HtR37qiYJlYxBAJZmscGvEPW+iuE=
=mKOE
-----END PGP SIGNATURE-----

--=-QkAJpfqZ3HxS0xt/xwUq--



--===============7694788955899277836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7694788955899277836==--
