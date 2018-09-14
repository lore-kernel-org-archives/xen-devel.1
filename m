From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] Make credit2 the default scheduler
Date: Fri, 14 Sep 2018 14:29:11 +0200
Message-ID: <448fbac9df715f26058701653faa2a7f4d7d04f9.camel@suse.com>
References: <20180913163848.32216„1„george.dunlap@citrix.com>
	 <cc2e661cc8543353929aebf1f190abd109ff2b82.camel@suse.com>
	 <5B9B752F02000078001E88AD@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0738892517640507951=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fooi=l4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g0nEX-0003pr-QU
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 12:30:01 +0000
In-Reply-To: <5B9B752F02000078001E88AD@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, "Ian Jackson <ian.jackson@citrix.com>" <ian.jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============0738892517640507951==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-NafU10tOB6iH3gpc4zQE"


--=-NafU10tOB6iH3gpc4zQE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-09-14 at 09:45 +0100, Jan Beulich wrote:
> > > > On 13.09.18 at 18:51, <dfaggioli@suse.com> wrote:
> > I fully agree with and second George's reasoning, and feel 100%
> > like
> > providing my:
> >=20
> > Acked-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> And that's despite "sched=3Dcredit2 crashes system when using
> cpupools"?=20
>
Well, considering that, as you say, there's a fix on the mailing list
already, yes.

And I'm guessing George must feel kind of the same, as he sent this
patch, before reviewing/committing the other.

In fact, the sooner we switch, the earlier OSSTest will start use
Credit2 for everything, and show us whether or not there are other
issues. And, speaking about that specific bug, OSSTest does not [sic!]
test cpupools, so it's not even like it'll block pushes.

That being said...

> While I agree that we shouldn't delay the switch for
> much longer, in particular with there already being a fix available
> from you I think that one should go in before the one here.
>=20
... I'm fine if maintainers/committers feels like waiting for the other
patch to go in. The order in which they're committed, is something I
have no control on. I don't think it's strictly necessary for this
patch and the fix to hit the repo in a particular order. But if others
do, no problem.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-NafU10tOB6iH3gpc4zQE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlubqZ0ACgkQFkJ4iaW4
c+5GnxAA0GFdBrnvQkmDru8xJ3DOZxJYOUoehCHYGa2WyW5nL4+by5CNL0s1O3Rq
MoUvqoB4reyb4ZCXkDnNS8/YMEQn38Qugra61w0bZ5lQGIZIQAAPx4gm1cBt5G3x
n0DIaq7+xTyTwY2Q+/kIDKAdr1EQplfSctMOsOgbyLl/Ym+35v1TPOxt7RanuF1J
Axal9obj9PwA4bt1NQ3kNPrluPWBOB9sGig/q6ugLFcLEdlDE3C+Rlos9gppjIUR
XkFd4xKDnCox+i75vR1gYc1bVsalsCOrQcCTKQfMHiC9JUtJXGWHXh4gbW7lPXZY
N5ckfJfuQbjLsSI/Qy4MWR45lFiQQPAM/k7kmdwBSmqQSGjV46p9gXa3LBvPmYsz
yVw3+Drtsj1LX1lO0491LA56/gG3CPIt5aU6wIrORTcZ/e+HYr4kLPnl1bOF+E3C
6P7H75FHytAwQHHk7cfg5tzZl9x4rRInPA+zVoFMAzEncAL8YZ3Mnkr+lnozobJi
Ow1FXc2otIkg3ElRw/OwwqZ6T33/9NXmbiiM6fO/dllIFgk9giYr9UhbvalZtgYu
WHAaYw+XsC+3z/ohKhbD/aj7CIJychWD6H54LxlKjvY19p43WwRoZqAzfK8kEcz1
zLJ3qwl2YrAEhEg0WVPtrXORF9l8GUd0Qi49S0CpnX3H1dUb/14=
=2dWE
-----END PGP SIGNATURE-----

--=-NafU10tOB6iH3gpc4zQE--



--===============0738892517640507951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0738892517640507951==--
