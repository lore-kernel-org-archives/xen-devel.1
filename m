From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: RTDS with extra time issue
Date: Mon, 12 Feb 2018 11:17:18 +0100
Message-ID: <1518430638.16540.17.camel@suse.com>
References: <762ccb02-b758-1636-fddc-f4e6a3ca19d0@epam.com>
 <1518182334.5019.15.camel@suse.com>
 <39c08b88-c951-2779-34f6-31e4b6c0dd0f@epam.com>
 <1518189527.5019.28.camel@suse.com>
 <CAENZ-+n1y24akrJZvmkh1eh5exHhr3NQ+33PgjCvNKcFEb74EA@mail.gmail.com>
 <af089b54-1078-681b-430f-c4b2a1a7779d@epam.com>
 <CAENZ-+k547y9V8TCQ7YdYz4-E=TDQ04omtDfwT+zP6ezv6KL1g@mail.gmail.com>
 <1518221652.4261.33.camel@suse.com>
 <CAENZ-+k63FbKdfvaxxEb9UD0F=BQ-g=f1d=uR_VEEOBHr262Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7569635971859497917=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qkv9=fg=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1elBBK-0000kr-EG
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 10:17:54 +0000
In-Reply-To: <CAENZ-+k63FbKdfvaxxEb9UD0F=BQ-g=f1d=uR_VEEOBHr262Dg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Meng Xu <xumengpanda@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org


--===============7569635971859497917==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZoSjadYf7D9+lfpv+ZxZ"


--=-ZoSjadYf7D9+lfpv+ZxZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-09 at 23:53 -0500, Meng Xu wrote:
> >=20
> > Perhaps Meng has some more ideas on this as well. :-)
>=20
> If the RT VCPU has only one RT task on it, we can synchronize the
> release time of the VCPU and that of the RT task. In other words, the
> release offset of both the VCPU and the RT task are the same in terms
> of the wall clock. Then we can assign the task's parameter to the
> VCPU
> and guarantee the task has no deadline miss if the VCPU has no
> deadline miss.
> However, this observation only works when the assumption that one
> VCPU
> has only one task in the RT domain. I'm not sure how practical it is
> because the observation cannot be generalized for multiple tasks on
> one VCPU.
>=20
> Andrii and Dario,
> Do you think the assumption that one VCPU runs only one RT task is
> reasonable in practice?
> If it is, is there some use cases for this assumption?
>=20
Well, I'll let Andrii reply, but honestly, I don't think it is.

See, for instance, the fact that DomR has only 1 vCPU, so I find it
unlikely that the only thing that run there is *just* *one* real-time
task. :-/

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-ZoSjadYf7D9+lfpv+ZxZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqBaa4ACgkQFkJ4iaW4
c+5GSxAAl4J24Spln8LaHHukpLBJjjOfYaMqmYcLlKVM+nb4uE2DAv21kOxTYDbz
AoUQDBwEvOXUsst3/Asbo0P6OaklGxfzdLMPggDoez5PAPzl7uvm1YrjRgR20Dvz
hBeSmSGl7eWBsrPv+vUQ6HcPLGkI24sbvCfUBfqBQB1Rb5L86MZl734ROtYYyWsI
5Yt6g5/xd6MVoMXFibWgdWx0mvDpMnBgeoZ6dUawefuGEZ97n11pbrM/oSshwJEd
z3Vf0QnDQhFFHZcr6nQZH96EVCRd01yQO37oP93ubU9bK8Xonx/CpVdf33dYbY/e
F7EC9wpkbiZyz6lVD7yv5SLWXjN7vCyJsSJ1yEzLm7IdjhuQ8T8fGei2VmXlS1r6
6ykJZ4ZWDnmG82iwnefCQH/yWfu184UqxUEkwEfyF/SowfLlnhlPBWf80rj09TBu
kpAsRZfZeXZWCUyYUFF91BW8/Jk8aGWfz6Ocmn7ZLVVImnoj4i3/3qHG5qDku9wY
tH6GBo1IMFU4S8jbOzVLPepzNsg6V6d+BFAoFQaMTTwPzWon+m5oJoYknftRO/TT
cnj96b2pgk/XaiQ1HhTEV0LXtgmvgfLAwMQphiZJNi4BK1FjGYtrIixxip9EntUJ
t5qx2hLPdjVlVDm+7FGNRI6fguGe+AspKx3Q7Awr5yYj6vCUmak=
=Y+AG
-----END PGP SIGNATURE-----

--=-ZoSjadYf7D9+lfpv+ZxZ--



--===============7569635971859497917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7569635971859497917==--
