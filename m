From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] schedule: move last_run_time to the credit
 scheduler privates
Date: Wed, 12 Sep 2018 10:14:47 +0200
Message-ID: <024b940b55adc6f904a4abea68569103607d3a2a.camel@suse.com>
References: <1536653449-26496-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6558939866696342066=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1536653449-26496-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6558939866696342066==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-KyAyOs+0B5P+g5jtihE8"


--=-KyAyOs+0B5P+g5jtihE8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-09-11 at 11:10 +0300, Andrii Anisov wrote:
> From: Andrii Anisov <andrii_anisov@epam.com>
>=20
> The structure member last_run_time is used by a credit scheduler
> only.
> So move it from a generic vcpu sctructure to the credit scheduler
> private
> vcpu definition.
>=20
> Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
> ---
>=20
> index 84e744b..7170172 100644
> --- a/xen/common/sched_credit.c
> +++ b/xen/common/sched_credit.c
> @@ -175,6 +175,9 @@ struct csched_vcpu {
>      atomic_t credit;
>      unsigned int residual;
> =20
> +    /* last time when vCPU is scheduled out */
> +    uint64_t last_run_time;
> +
>
I think that, while we're doing this, we should take the chance to
convert the type to s_time_t too.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-KyAyOs+0B5P+g5jtihE8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluYyvgACgkQFkJ4iaW4
c+56ZRAAhdP9eqFev9w/J3B18EWU6L0NXNMcAzrUOnf0bBQUIEwQexsELZz6ijKO
2S5r02kH69XCYdK6iXGvCs/xUs/JKTd91j3vqf1h77qazgAXHZYYWvrSaXWLMvK5
3MqF5bv16CkMG75SvMrMitnH9wubYt69RMKtQ8ArBaIHz7OqXqB042ChcVkpUnio
Xlvfvgez0Vuqz6fjLlcAN33GHdDqzygQ1YG7elh/SpgcKEHOW+sE+g99gGVHyALh
fl0xhavVZVLrpmWEk/ygnP9SBr8UJnKDEap1Q0O2m3Ul4vw/hCrahrilwMC6OVgP
R0Jg/l6YvH/f+wUf0HYk1bd79T4iJOwdweMMNyL2Hj8WM6B0QYVQM5pjfvrqMVok
Qm0LoM65VK/UWMeUedxd2YXtLDQlq9pRP2o+q8iwfhYslRK1HYc0hojrB0ezqVQ2
8PIbh6GXhBbNwSh54VtEMMmpg/Th+1hnlPlFg133n3xw9AcTdAm7HDhz/VY/Mlme
XxJOBNEX38jFvuLFdLMTqefXoZPVu/y0ykWHRY/3VPyTfoBNlAHiPH8KPeHlMf9+
gohVyUSgGr8Y7Lh+PeNYUs/HFQGuOlb2xZt1cF4VOhtiXkvxb8zJQLuqbOV73CYK
crv6kV3KDBtdRKW9RCF9SedMrWF1eABowU/M0yCAIOBAb03yNhk=
=80b1
-----END PGP SIGNATURE-----

--=-KyAyOs+0B5P+g5jtihE8--



--===============6558939866696342066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6558939866696342066==--
