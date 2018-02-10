From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: RTDS with extra time issue
Date: Sat, 10 Feb 2018 01:14:12 +0100
Message-ID: <1518221652.4261.33.camel@suse.com>
References: <762ccb02-b758-1636-fddc-f4e6a3ca19d0@epam.com>
 <1518182334.5019.15.camel@suse.com>
 <39c08b88-c951-2779-34f6-31e4b6c0dd0f@epam.com>
 <1518189527.5019.28.camel@suse.com>
 <CAENZ-+n1y24akrJZvmkh1eh5exHhr3NQ+33PgjCvNKcFEb74EA@mail.gmail.com>
 <af089b54-1078-681b-430f-c4b2a1a7779d@epam.com>
 <CAENZ-+k547y9V8TCQ7YdYz4-E=TDQ04omtDfwT+zP6ezv6KL1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5525032811399376183=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=+mta=fe=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ekIoS-0005Dw-R9
 for xen-devel@lists.xenproject.org; Sat, 10 Feb 2018 00:14:40 +0000
In-Reply-To: <CAENZ-+k547y9V8TCQ7YdYz4-E=TDQ04omtDfwT+zP6ezv6KL1g@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Meng Xu <xumengpanda@gmail.com>, Andrii Anisov <andrii_anisov@epam.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============5525032811399376183==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-fzPnsdTR2Q73HfCb9YOS"


--=-fzPnsdTR2Q73HfCb9YOS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-09 at 12:51 -0500, Meng Xu wrote:
> > On 09.02.18 17:36, Meng Xu wrote:
> > > Another way to check if there is interference from services in
> > > domR is
> > > to set period =3D budget for the domR's VCPUs.
> >=20
> > Could you please explain how setting budget equal to period would
> > help
> > discover any interferences from services in the domain?
> >=20
> Basically, setting period =3D budget is similar to what Dario suggests.
>
The goal is to figure out where the problem is.

It looks like DomR's vCPU does get 50% of CPU time, so it's not that
other vCPUs are preventing it to exploit all its own reservation. If
that would have not been the case, there'd be a bug in the scheduler.

By giving the vCPU 100% (either via "budget =3D=3D period" or with
extratime), we will figure out if the real-time applications inside can
actually meet their deadline. If they can't even with such setup, it
would mean the problem is somewhere else (virtualization overhead, IRQ
latency, etc).

If the applications can meet their deadline with 100% CPU time, but not
with 50%, then there are two possibilities:
1) they need more than 50%;
2) you're having "period synchronization" issues, as Meng was
describing.

Figuring out if you're on 1, should be as easy as trying to five DomR
55%, then 60%, then 65%, etc. And see when it happens that the deadline
misses are gone forever and for good.

If you can't get rid of deadline misses, it probably means you are in
case 2, and you need to find a way to make sure that your real-time
applications inside the domain are able to actually exploit the
domain's vCPU's budget when it's there. I.e., you don't want them to
activate when the budget is about to finish, and hence suffer from the
"blackout" shown in Meng's diagram.

Unfortunately, that's not really trivial to do. If the workload is
really periodic, it may be enough to find a way to do some kind of
"calibration" at the beginning. But I'm not sure how robust this will
actually be.

Perhaps Meng has some more ideas on this as well. :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-fzPnsdTR2Q73HfCb9YOS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlp+OVQACgkQFkJ4iaW4
c+7oNA/9EX4ZQwgaPvuRLvBVh4z3yoSMqWJqNPxfIAcfYtNg7aG5zwxwBloVKBJ4
s3EAvIfJf0MhhF6pLjnjMTssL06UJCP4caxCXuTG956Eh6V4q4tFgiWEuKp8NJMB
c8gepFal7bug3CtyMItuDJ7hhT3/567ERVO0qAxK+qZke9ix7pQ5HNpp2fzBmI+U
friIimb4gdLgjpK4Ry/6LNVWh9hsVcsVyGaoSGXJLoECbBFL0hXjizxvfLZIimy6
OCLK/3lwN6p4knHf2lLijp3hVUjs7PggYsOz/Az/rJsJt9GCyijdsEiDN5Q/NbIS
lTa4qp6DyB+cqtrD8QbksbQNn8ICdvEoYUhlDU3V6DkFFr4yzyQes/2mqKTl44KI
4iwmrslQ7/3+j7kCyNqYPQouHHJYP2mhmrQ/T4VCFF05HiPgQtF7Zc7AVntU9lLr
ZGMulJtzyI/794pOuTr45XAkmVLVBLdKpJc5ROZuYOU/T8gLn96oTEc0LGjHGMLn
DKap9nowZyFL/lxGC0ZxIJLjaoybeeH3BrKKqBgAfpFOB5BxBk5DfALnsRNn5BIg
wIKh/ehHAF7P4B8tDKjSb1IHW3MHRILsqTQBXJqcKZAsUizT75No3VQPvovPtlnX
Yfu49LdnP8eUTz8tyT32qDlR2awGntlwIQZdDIMWnz5CpTOHbJ8=
=oXqb
-----END PGP SIGNATURE-----

--=-fzPnsdTR2Q73HfCb9YOS--



--===============5525032811399376183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5525032811399376183==--
