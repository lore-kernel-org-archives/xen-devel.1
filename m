From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 3/6] xen: add new cpu notifier action
 CPU_RESUME_FAILED
Date: Mon, 25 Mar 2019 13:21:05 +0100
Message-ID: <37954eb9e9efb9b95c603458b298bc1a51b6354f.camel@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-4-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4963492277176228911=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ytoJ=R4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h8Obe-0005LG-Ha
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 12:21:34 +0000
In-Reply-To: <20190318131155.29450-4-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============4963492277176228911==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-VuhymKjD0SG1VKpyvi77"


--=-VuhymKjD0SG1VKpyvi77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-03-18 at 14:11 +0100, Juergen Gross wrote:
> --- a/xen/include/xen/cpu.h
> +++ b/xen/include/xen/cpu.h
> @@ -32,23 +32,25 @@ void register_cpu_notifier(struct notifier_block
> *nb);
>   *  (a) A CPU is going down; or (b) CPU_UP_CANCELED
>   */
>  /* CPU_UP_PREPARE: Preparing to bring CPU online. */
> -#define CPU_UP_PREPARE   (0x0001 | NOTIFY_FORWARD)
> +#define CPU_UP_PREPARE    (0x0001 | NOTIFY_FORWARD)
>
In the comment block before these definitions, there's this:

 * Possible event sequences for a given CPU:
 *  CPU_UP_PREPARE -> CPU_UP_CANCELLED           -- failed CPU up
 *  CPU_UP_PREPARE -> CPU_STARTING -> CPU_ONLINE -- successful CPU up
 *  CPU_DOWN_PREPARE -> CPU_DOWN_FAILED          -- failed CPU down
 *  CPU_DOWN_PREPARE -> CPU_DYING -> CPU_DEAD    -- successful CPU down

Shouldn't we add a line for this new hook? Something, IIUIC, like:

 CPU_UP_PREPARE -> CPU_UP_CANCELLED -> CPU_RESUME_FAILED --CPU not resuming

With this, FWIW,

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

One more (minor) thing...

>  /* CPU_REMOVE: CPU was removed. */
> -#define CPU_REMOVE       (0x0009 | NOTIFY_REVERSE)
> +#define CPU_REMOVE        (0x0009 | NOTIFY_REVERSE)
> +/* CPU_RESUME_FAILED: CPU failed to come up in resume, all other CPUs up=
. */
> +#define CPU_RESUME_FAILED (0x000a | NOTIFY_REVERSE)
> =20
... technically, when we're dealing with CPU_RESUME_FAILED on one CPU,
we don't know if _all_ others really went up, so I think I'd remove
what follows the ','.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-VuhymKjD0SG1VKpyvi77
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyYx7EACgkQFkJ4iaW4
c+4LiQ/9FzJVZjL1m6NAsrbXb8RmKyiLiZHrnVzn+RczPC87aRqW6U+Knk4GwHAW
Vx8t3rS1nvEtZTiNM+NmjV7eMaQUL1AN/GNGtNAjMXiKHGoDJu4lAAiqu2uFaOrx
GuwNzLkK3e2dEEI5KIOHAWNpf/Yhb3S9kCNKSj3q8PVfrLV/V6f2w8r8SfWk/qnd
9+Zv0VUMkoCuTkFnVwAp/ItsK6OgMM3iB/R89piZFu0D3Bql5Od3dtSCbXkvViaO
SN3htrmQcClFu9Wb8Jpx08TCf4VuXx6x58OkhAL9IN+w1Cu9kQxuHXZbjl603mNe
jmXOJbt5bLUywsMKffzmnFXOwcXnWbJ3znug4lP7KNYuFH1b0NteuYs/kn/WdG9m
//na1VfDj5NwqIMrZpVY5fP6SKik6KtAGILswoGlAMeQWJ2Z8p7DQEKp3gVkLV7d
DmG9rCCUdT3lFOT0EJ+BKK60ZLlN3e5yg0UdhJpxEKsE4t13Qk3i/cWGUipELWfb
MtEhu7HaSlZseDbEKG0R0bFMWplDwM0Or86L5dx9c20M90s+DObKDcSuYtgApeaY
miIS4iPM0i8kIy/D3JbeWbFrH/jbN/astyJZ7NgT5EUIZsdN8ibLWETBI7Zd6zkt
VSVoczoTAjh0jAfeCUi2UoeHukZDIHpcYk2m/EhSPmPSb2xIT0U=
=zytV
-----END PGP SIGNATURE-----

--=-VuhymKjD0SG1VKpyvi77--



--===============4963492277176228911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4963492277176228911==--
