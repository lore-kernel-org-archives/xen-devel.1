From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 7/7] xen/arm: Restore IRQ affinity after
 hotplugging a CPU
Date: Thu, 12 Apr 2018 18:49:21 +0200
Message-ID: <3c33657b63a04a466028b02ce52d8777bbbfbf04.camel@suse.com>
References: <20180411131927.27083-1-mirela.simonovic@aggios.com>
 <20180411131927.27083-8-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0833053541457870984=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180411131927.27083-8-mirela.simonovic@aggios.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>, xen-devel@lists.xen.org
Cc: edgar.iglesias@xilinx.com, sstabellini@kernel.org, dm@aggios.com, julien.grall@arm.org
List-Id: xen-devel@lists.xenproject.org


--===============0833053541457870984==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-6lnU5lRo1K2impfO8knK"


--=-6lnU5lRo1K2impfO8knK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-04-11 at 15:19 +0200, Mirela Simonovic wrote:
> Secondary pCPUs will be offlined on system suspend and hotplugged
> on resume. When offlining secondary CPUs all interrupts targeted
> to those CPUs will be routed to the boot CPU. The boot CPU
> is responsible for finalizing suspend procedure. All wake-up
> interrupts are therefore targeted to the boot CPU.=20
>
There is no wake-up interrupt involved in the process of unpausing
domains during resume. So, I that that what you mean is "the interrups
that the vcpus receive once they're running again. And even in that
case, rather than "All", is it "The interrupts received until the first
time the vcpu goes through vcpu_migrate()", as vcpu_migrate() does call
sched_move_irq()?

Note that I'm not (trying to) being picky, I'm just trying to
undestand. :-)

> Existing code
> was missing the restoration of interrupts affinity after
> hotplugging a CPU.
>
Either use hot-unplug and hotplug, or offline and online. I think the
latter is better in this case.

>  This patch restores the IRQ affinity after
> a CPU is hotplugged.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>

> diff --git a/xen/common/schedule.c b/xen/common/schedule.c
> index 343ab6306e..e3956019bc 100644
> --- a/xen/common/schedule.c
> +++ b/xen/common/schedule.c
> @@ -724,6 +725,9 @@ void restore_vcpu_affinity(struct domain *d)
>          lock =3D vcpu_schedule_lock_irq(v);
>          v->processor =3D SCHED_OP(vcpu_scheduler(v), pick_cpu, v);
>          spin_unlock_irq(lock);
> +
> +        if ( affinity_was_broken )
> +            sched_move_irqs(v);
>
But I guess that, more than on whether or not the affinity was broken,
you are interested in whether or not v->processor changed.

In fact, for the vcpus that had 0 in v->processor at the beginning of
this function, and also have 0 in there now, there is no need to call
sched_move_irq(), is there?

Similarly, if the affinity of a vcpu has not been broken, but pick_cpu
end up selecting a different v->processor, you do want to call
sched_move_irq(), I think.

If I'm right, I think it would be better to do, at the beginning of the
for:

 unsigned int old_cpu =3D v->processor;

And here:

 if (old_cpu !=3D v->processor)
   sched_move_irqs(v);

And I'd also add a comment (above the if()), briefly saying how this is
necessary to match/undo the call work of vcpu_move_nosched() in
cpu_disable_scheduler().=20

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-6lnU5lRo1K2impfO8knK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrPjhIACgkQFkJ4iaW4
c+6Ouw/8C+svOznABT4N5Ta3nJ4NCr4VhLJI+Ajjg5nx1QqRr4jXe3nN5CRe2ms5
iufUnFlMybY2j+UkqdBzFyps86i95uwQ8wrT5y1yDd0+3DXmQNsp+yyXC9wMbf77
rj8/Qq8QZ4JTXh1xyhP6yczTI1qLmNlvaouscnzqeu+asQnDoWCIYqIaT+FhMnA+
JzE4qFIwHDxRXP6/GfdEtm6qG+CdX5dfUOkCj8mN/VOENTJDuvHn0jlVb/9NMtzG
WOmgQuyYPnPwXe4xdDT4/7JW97vJSImJYT6uEd5HIHBi72WGi/tj6k1EEO6qrPcK
gYix9Bsq65jLN+uoAEX4k4acmjwdTeKgbDrrA+stAYeRePVphHEfB3Qc2W5zz5J0
W9SzIeOriqux91ufKjh7yF9j25LeYobABnj0y82vy5CORIj0AZFq3oxULWemPbd9
F7j0m6EzSikv8WgybTWf60ukLA310zdG3jqUPYxTndbF2iiTaAGuLlhL+LrZ97fJ
Dyn8EC/PfHTeaAHkl7f8KR2jXmV3KI6q7EzVOgFmBF9Z5AjTWbeMnCywqt3Bm4fJ
YBR7pRdhh9ATrAr6DqFEDYGCQfknOOWezMPMrx9Ji7/69omXHmIB8Thi+ES+/cDU
Hdb+0E8bc9VJOvG61JKJRAtX776ety20PajUHgeyetBClAQbRWM=
=DEGY
-----END PGP SIGNATURE-----

--=-6lnU5lRo1K2impfO8knK--



--===============0833053541457870984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0833053541457870984==--
