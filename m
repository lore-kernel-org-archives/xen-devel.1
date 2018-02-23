From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 3/5] tools: libxl/xl: allow to get/set
 Credit1's vcpu_migration_delay
Date: Fri, 23 Feb 2018 15:26:42 +0100
Message-ID: <1519396002.5547.121.camel@suse.com>
References: <151931759370.5408.3600378338263227885.stgit@Solace.fritz.box>
 <151931851789.5408.6727951847305599062.stgit@Solace.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1985872688559422051=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zwdw=fr=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1epEJQ-0005IU-2y
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 14:27:00 +0000
In-Reply-To: <151931851789.5408.6727951847305599062.stgit@Solace.fritz.box>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1985872688559422051==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-PuaSZi3dP2eKM60bYTPV"


--=-PuaSZi3dP2eKM60bYTPV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-02-22 at 17:55 +0100, Dario Faggioli wrote:
> --- a/tools/libxl/libxl_sched.c
> +++ b/tools/libxl/libxl_sched.c
> @@ -505,6 +507,9 @@ int main_sched_credit(int argc, char **argv)
>          ratelimit =3D strtol(optarg, NULL, 10);
>          opt_r =3D true;
>          break;
> +    case 'm':
> +        migrdelay =3D strtol(optarg, NULL, 10);
> +        opt_m =3D true;
>
This is missing a 'break'.

>      case 's':
>          opt_s =3D true;
>          break;
> @@ -522,7 +527,7 @@ int main_sched_credit(int argc, char **argv)
>          fprintf(stderr, "Must specify a domain.\n");
>          return EXIT_FAILURE;
>      }
> -    if (!opt_s && (opt_t || opt_r)) {
> +    if (!opt_s && (opt_t || opt_r || opt_w)) {
>
And this is 'opt_m'.

I'll send a v2. :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-PuaSZi3dP2eKM60bYTPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqQJKIACgkQFkJ4iaW4
c+597Q/+PFC6tPp2uAmZbB3NJekULgNquwhpb174qqsgSFDR8GuXlqwjz3CDnOkU
luVj3Xzi9S1uAJvvqIEDXcblQP2i9NImXTur5kV669ZZEVpRBuJms98RPK4kyxaq
mQcoOlK2XiFRwua46IrofaNX+5gHge5HVWR9vWxVFDupCmtFDq6czPGebj3ONXP1
FWt039P9+5gSn88pdh5l+TYG0ZBQq7+n8fLfdosUsPQbDlpE+PhHXK/PGQfyQamV
ySZBGHZoYCE1KHggA0KTZ4LAfZAPMIrhndiCMV5rAQQec3+1LwUYbsC8fvPltY9i
UF9n7h4U//zoo8wqPB25jZjhTH8Pmp2RdvlPnsY4eR2MTwtYQ/T3lGXf6tqVhbvg
FigaJ/+QLvfWvq0ezlz2ExzQXIWumSSvvOa41JMJht47fzaVyS36GvBeBFqGlmeS
GCX8M6jnQwGYS6nqNScrZTpm7Yx6RSRgDDv0Uj8zoMjtqXHh1hIDSC1/uTT1YF0d
JOTqmGjInQ+kGBuWB8+hNdl0780pQ7fNT2NO9lfAssc5jV8Z+cg9iZFGXXX9IUdf
R0elLTzI4UeQUz3RrPBYbRRdTvGl0Dw2+E65fC6ux4oFmMANF3ikc+N04GjShB7O
+0psc/K049nXW18fTSpZCIqxXmRgoOVYU8zQZm5UFjlY7vN0t0k=
=iVE7
-----END PGP SIGNATURE-----

--=-PuaSZi3dP2eKM60bYTPV--



--===============1985872688559422051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1985872688559422051==--
