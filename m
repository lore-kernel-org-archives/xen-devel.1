From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 09/12] tools/xl: add support for setting
 generic per-cpupool parameters
Date: Wed, 26 Sep 2018 19:17:19 +0200
Message-ID: <cdc18de846c159661ff7a76298d43a47fb00a9e0.camel@suse.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <20180918060309.7186-10-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7869319352003970821=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8mt=mi=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g5DRX-0007it-Ny
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 17:17:43 +0000
In-Reply-To: <20180918060309.7186-10-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7869319352003970821==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-k0ZvH50ZzWEhRWZPBOKC"


--=-k0ZvH50ZzWEhRWZPBOKC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-09-18 at 08:03 +0200, Juergen Gross wrote:
> Add a new xl command "cpupool-set-parameters" and cpupool config file
> support for setting per-cpupool generic parameters.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Seems good to me. Couple of questions.

Question one: what about getting (and displaying, I guess in
cpupoolinfo) the cpupool parameters?

> --- a/tools/xl/xl_cpupool.c
> +++ b/tools/xl/xl_cpupool.c
> @@ -615,6 +625,35 @@ out:
>      return rc;
>  }
> =20
> +int main_cpupoolsetparameters(int argc, char **argv)
> +{
> +    int opt;
> +    const char *pool;
> +    char *params;
> +    uint32_t poolid;
> +
> +    SWITCH_FOREACH_OPT(opt, "", NULL, "cpupool-set-parameters", 2) {
> +        /* No options */
> +    }
> +
> +    pool =3D argv[optind++];
> +    if (libxl_cpupool_qualifier_to_cpupoolid(ctx, pool, &poolid,
> NULL) ||
> +        !libxl_cpupoolid_is_valid(ctx, poolid)) {
> +        fprintf(stderr, "unknown cpupool '%s'\n", pool);
> +        return EXIT_FAILURE;
> +    }
> +
Since we know that we, AFAIUI, never allow changing the parameters for
a cpupool with domains in it already, shall we test this here, and bail
early, with a specific error message, without even trying going down in
Xen?

I know it's sort-of duplicating checks with what's in the hypervisor,
but I think it would be a common mistake, that it's worth trying to
prevent/address specifically.

> +    params =3D argv[optind];
> +
> +    if (libxl_cpupool_set_parameters(ctx, poolid, params)) {
> +        fprintf(stderr, "cannot set parameters: %s\n", params);
> +        fprintf(stderr, "Use \"xl dmesg\" to look for possible
> reason.\n");
> +        return EXIT_FAILURE;
> +    }
> +
> +    return EXIT_SUCCESS;
> +}
>
Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-k0ZvH50ZzWEhRWZPBOKC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlurvyAACgkQFkJ4iaW4
c+71TxAA4X2cberjr702znnnPV5y6Jf6HU2qdWLGLCUyb/N26TZonzUC8qb4sU3M
ChtGKGORqG6TxNYhS5rzE7d/SmMjIAiIs76QXxe78jCHtbs1CoMZsTCzaGdxJzqq
U9McELGuiP2xKtTypZvCZIHoYDyWOI+cC1d9xC7DFqkWFUCNljJFzpSXtneSKC1J
+wEitTts6SW2J8TWssaWd2zRZtmswnuHjmDyib4hlXLRc5C3/XwCaI8J/HljyU3O
YIJ6sLhlvsmIFIEWkZJ/wES3tmlWg+/LnTOgL1M2iXR+eNksIAJdv3EseCN2Tgu7
+4dZkZr0iY8Bzm0CDCIJC98etGkWz0VypSo4ctoGxAYxW6CgILnTtUwivxZAARrn
wz0AwwFPMrJtkgO/mzK2oz8vCB6hF/OnAybDkupJB++SikyyXcxT3kluKH36/ago
OZmjmbZBV8Y0AnHHvCl0RIAG9gW+24oYN/QD3/2vr6FOIPXFCNVktQP2RXL8JNID
BsWXmv4+PQUI30USNPHk1z0WXdd2T1dU3YBwFYPRbzGCT+ENfO90PJp9I5nNUWPW
zVzWPFu3RiMv4JwKUrfD7JTHyqpG63bK0xEh+3sLsZmMf/MhvMjTeJ9axJantmRC
ynNPHtkZk95ZpCtXviL3m7CTuDlLrZRahXk4SkDVzhmu/LZXYpc=
=dacK
-----END PGP SIGNATURE-----

--=-k0ZvH50ZzWEhRWZPBOKC--



--===============7869319352003970821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7869319352003970821==--
