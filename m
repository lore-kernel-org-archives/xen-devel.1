From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 2/2] xen/sched: don't disable scheduler on
 cpus during suspend
Date: Mon, 25 Mar 2019 12:49:15 +0100
Message-ID: <2d3fb840e0cfcb5722bcef32f071ebf583ab6e7c.camel@suse.com>
References: <20190314095953.11752-1-jgross@suse.com>
 <20190314095953.11752-3-jgross@suse.com>
 <57ef1a53000330818c8216c3680f64def410f201.camel@suse.com>
 <0be8c4b8-b842-5626-1922-03ce46cf58ce@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8537564213640219315=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ytoJ=R4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h8O6f-0001xq-U9
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 11:49:33 +0000
In-Reply-To: <0be8c4b8-b842-5626-1922-03ce46cf58ce@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8537564213640219315==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-v9Mnk9eSiqcPLx19D/aY"


--=-v9Mnk9eSiqcPLx19D/aY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-03-16 at 14:14 +0100, Juergen Gross wrote:
> On 16/03/2019 04:01, Dario Faggioli wrote:

> > > So we can just omit the call of cpu_disable_scheduler() when
> > > offlining
> > > a cpu due to suspend and on resuming we can omit taking the
> > > schedule
> > > lock for selecting the new processor.
> > >=20
> > Well, in theory, we should hold the lock when for using
> > 'cpumask_scratch_cpu(cpu)'. Not sure this is an actual problem in
> > this
> > case, but still...
>=20
> I think there is no problem as there is no scheduling activity.
>=20
I concur. I'm wondering whether it's worth adding a brief comment about
it. If it were me doing this, I most likely would.

> > > In restore_vcpu_affinity() we should be careful when applying
> > > affinity
> > > as the cpu might not have come back to life.=20
> > >=20
> > But restore_vcpu_affinity() is done, in a loop, for all vcpus of
> > all
> > domains, in thaw_domains(), which in turn comes after
> > enable_nonboot_cpus(), which I think is supposed to bring every CPU
> > back up.... What am I missing?
>=20
> There is no guarantee all cpus will be up after suspend. Some might
> fail coming up.
>=20
Ah, ok, that's the case we're trying to address. I didn't get it in the
first place.

And this, in fact, was what I was missing, and the reason why I was
finding some aspects of the patch a little weird. :-P

So, can we state this a bit better in the changelog, and also in a
comment? I'd like the reason why we break the affinity in a function
called "repair_affinity" to be more obvious. :-P

> > > diff --git a/xen/common/cpupool.c b/xen/common/cpupool.c
> > > index e89bb67e71..7b5ce18426 100644
> > > --- a/xen/common/cpupool.c
> > > +++ b/xen/common/cpupool.c
> > > @@ -313,7 +313,7 @@ static long cpupool_unassign_cpu_helper(void
> > > *info)
> > >       * cpu_disable_scheduler(), and at the bottom of this
> > > function.
> > >       */
> > >      rcu_read_lock(&domlist_read_lock);
> > > -    ret =3D cpu_disable_scheduler(cpu);
> > > +    ret =3D (system_state =3D=3D SYS_STATE_suspend) ? 0 :
> > > cpu_disable_scheduler(cpu);
> > >=20
> > Mmm... How can this function be called with state =3D STATE_suspend ?
>=20
> Meh, my bad. I masked the wrong call of cpu_disable_scheduler().
> Should
> have been that from __cpu_disable().
>=20
Yes, that should be the one.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-v9Mnk9eSiqcPLx19D/aY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyYwDsACgkQFkJ4iaW4
c+7MxRAAgDIJWyOlzL4zgE71r8SZDWBhhQfUaY/sAPHs1yR1P/tGVLpsnqv2A3Ha
27KhG9bm4y/vnmpnFeISJ3tVeKKT7bfBb7sTTzwLEZDrdwrx7vSjqZnDHQsmo+gT
qHrpX/K7NRebp6WCfi+9/j5Ofwd1udYFIgzCcBLJ+4f39QQZzFPyAKNohr+zG8DE
/6UNc00/IS/QRmUR3kYdqfYOvG+6ZnoZUKnyjggjzZ0YnkIUAOBVVbvmwfm3HkQi
yNtEQjij654fAzI/KEedQ3KoJBoHjyietmrcFFZQX0VFRFYRT0iKz/vA8NOiqUyh
QoaP3KiQYx1ttcwYYysCMJAKdO7uRsaXSs/G86gaJYj7e8QKsEgDogkA27vIveUM
D5eR/h22LWED1zDwu0k4AZN5nmzHzN8Tma6cvf7+0RNw4QXFseEFGwx3JQDpW0aK
AN6tNGBakOsSrcD65KgjHH6axRTobhoRWYY4lWDXVQWQztY76tLm8Ipf8WXtNPBt
B5fGjDeNHRoXar4NpUpVijNh949+9ryI3GC3ceH4vZhCzxSM1TjM5EHojpFljv9f
zUHWDYgJNKx5hAYBj47THj3qyzXrVgd25O6GRkNc4JZjis3Wy69u4zkZg3Hdhflv
WhtktM8vrI1TQ1EGd04xafJd3ijFq34jdqehoFnfIzonG1MQdrw=
=podk
-----END PGP SIGNATURE-----

--=-v9Mnk9eSiqcPLx19D/aY--



--===============8537564213640219315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8537564213640219315==--
