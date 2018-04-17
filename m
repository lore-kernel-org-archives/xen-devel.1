From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 2/3] xen: Refactor migration
Date: Tue, 17 Apr 2018 09:20:33 +0200
Message-ID: <b7df732fe16bd1fa91608837371a37cc2233f5ec.camel@suse.com>
References: <20180411122518.26270-1-george.dunlap@citrix.com>
 <20180411122518.26270-3-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7211195849941985921=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yslv=hg=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1f8Kv8-0001Xz-PH
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 07:20:54 +0000
In-Reply-To: <20180411122518.26270-3-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>
List-Id: xen-devel@lists.xenproject.org


--===============7211195849941985921==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-T7LVN8/c9F3m5miRBoyB"


--=-T7LVN8/c9F3m5miRBoyB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-04-11 at 13:25 +0100, George Dunlap wrote:
> The current sequence to initiate vcpu migration is inefficent and
> error-prone:
>=20
> - The initiator sets VPF_migraging with the lock held, then drops the
>   lock and calls vcpu_sleep_nosync(), which immediately grabs the
> lock
>   again
>=20
> - A number of places unnecessarily check for v->pause_flags in
> between
>   those two
>=20
> - Every call to vcpu_migrate() must be prefaced with
>   vcpu_sleep_nosync() or introduce a race condition; this code
>   duplication is error-prone
>=20
It's not only error prone, it's the cause of actual bugs! :-P

That's why I would also change the subject of the series into something
like "fix races happening during vcpu migration"

> - In the event that v->is_running is true at the beginning of
>   vcpu_migrate(), it's almost certain that vcpu_migrate() will end up
>   being called in context_switch() as well; we might as well simply
>   let it run there and save the duplicated effort (which will be
>   non-negligible).
>=20
> Instead, introduce vcpu_migrate_start() to initiate the process.
> vcpu_migrate_start() is called with the scheduling lock held.  It not
> only sets VPF_migrating, but also calls vcpu_sleep_nosync_locked()
> (which will automatically do nothing if there's nothing to do).
>=20
> Rename vcpu_migrate() to vcpu_migrate_finish().  Check for v-
> >is_running and
> pause_flags & VPF_migrating at the top and return if appropriate.
>=20
> Then the way to initiate migration is consistently:
>=20
> * Grab lock
> * vcpu_migrate_start()
> * Release lock
> * vcpu_migrate_finish()
>=20
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

> --- a/xen/common/schedule.c
> +++ b/xen/common/schedule.c
> @@ -593,13 +593,33 @@ static void vcpu_move_nosched(struct vcpu *v,
> unsigned int new_cpu)
>      sched_move_irqs(v);
>  }
> =20
> -static void vcpu_migrate(struct vcpu *v)
> +/*
> + * Initiating migration
> + *=20
> + * In order to migrate, we need the vcpu in question to have stopped
> + * running and be taken off the runqueues; we also need to hold the
> lock=20
> + */
>
Perhaps "and SCHED_OP(sleep) to have been called on it", instead of
"and be taken off the runqueues", if we don't want to even mention
runqueues in schedule.c.

And there are a couple of instances of whitespace damaging.

Nevertheless,

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

And I guess we can add a 'Tested-by: Olaf Hering', as he actually did
that, what do you say Olaf?

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-T7LVN8/c9F3m5miRBoyB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrVoEEACgkQFkJ4iaW4
c+4UUhAA5zPwspYWYIq62Ck4OQGBv3tV6emx74yGy8edvyHc8Ai318mMK3wbk4vU
RRd1dMkUUXKRyB7nTDCbG+tEJ+NRJaJkRVWfM84/RsKcXM4AceBwC7/I6CI/LfgM
v5p5NlQ0AuOufDs7qPse7RKJO0JOgGtC/ejWpKgC9BWtyc6W33FAbFkA3YiPHw0J
xCjjkKnV0nvWdsLcNk4ND63BnalyEH8cwNMpt6v23/4fpKUNiKDny4pFLa5grWez
7nXo61ijf3S0kqXx+Rx6x56+w2jea0l7hWUMfLvGTwdjx3cdmHrzTaRfn0N+Kftx
ujwQ0yvwIzodXP8cqYT4MMp8dLBDwx1HoHiZV3v5Xnnig1JpYzyUBK8ayD8v0ZuI
u9LN3QtsN1vHkc7Rjn0AIwcGgnaf8G2K8RtOv6TNzfjY3h+pv2QMo1sm8K09YSKj
0/W2MwJ/MuazNueEJrRdpz1yzMrT1c6SF7QBpeLwUXITCTUpG6PQbyWvRqM8CB6U
Vyoah15jywZlh75ly4zdorLyJnWp0DrbMPNdj5yRGD2N8Ot3jmecve+TJ+yEDfok
CfhkRvdnOjHY7sjaWLX6ihxBXLin9NayrGpXuwOObER1dtk90gRcQmFN2P/Hqjs7
ujOQ3Ekl/IIyA4aQnNQnyFPtJu7WJb581D7c8fTT4y5xO1bu8aE=
=IUi4
-----END PGP SIGNATURE-----

--=-T7LVN8/c9F3m5miRBoyB--



--===============7211195849941985921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7211195849941985921==--
