From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 10/10] xen/arm: Enable errata for
 secondary CPU on hotplug after the boot
Date: Thu, 10 May 2018 15:33:49 +0200
Message-ID: <31f115c166226c8e6a9db3c84229593bedf4ddbd.camel@suse.com>
References: <20180427171258.28852-1-mirela.simonovic@aggios.com>
 <20180427171258.28852-11-mirela.simonovic@aggios.com>
 <ffc6351e-350c-b1c9-ea3e-fd4936701eb1@arm.com>
 <CAKPH-NiTLoOdYgpcWiM1qXHXaC=znAvMp0HHGQo-9mfegz2LcA@mail.gmail.com>
 <c713cc00-ace2-f528-563f-175657dccb12@arm.com>
 <CAKPH-NhUyxO1vOJnJPFayw71F5SfY87vWchoQybcH1e6Z4Mg2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8227992205398459726=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-NhUyxO1vOJnJPFayw71F5SfY87vWchoQybcH1e6Z4Mg2A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>, Julien Grall <julien.grall@arm.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============8227992205398459726==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-fB+CZmy8jiVUdraLdkAb"


--=-fB+CZmy8jiVUdraLdkAb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-05-10 at 13:57 +0200, Mirela Simonovic wrote:
> Hi,
>=20
> +Dario
>=20
Thanks.

> On Wed, May 9, 2018 at 6:32 PM, Julien Grall <julien.grall@arm.com>
> wrote:
> > If there is a bug in the scheduler it should be fixed rather trying
> > to
> > workaround with a panic in the code. If you provide more details,
> > we might
> > be able to help here.
> >=20
>=20
> This flow seems to have several bugs. Lets start from here:
>=20
> Please take a look at function cpu_schedule_callback in schedule.c.
> Within switch, case CPU_DEAD doesn't have a break, causing the bellow
> CPU_UP_CANCELED to execute as well when the CPU goes down. This looks
> wrong to me.
> Dario, could you please confirm that this is a bug?=20
>
No, that is entirely on purpose (as you can tell from the
"/* Fallthrough */" comment).

> Otherwise could
> you please confirm the reasoning beyond?
>=20
Well, the idea is that the CPU_UP_CANCELLED notifier should _only_
invoke cpu_schedule_down(). On the other hand, the CPU_DEAD notifier
should invoke both:
 SCHED_OP(deinit_pdata)
 cpu_schedule_down()

and the fallthrough is the way we achieve that.

On x86, the shutdown/suspend path is as follows:

    XENPF_enter_acpi_sleep (platform_hypercall.c)
      acpi_enter_sleep()
        continue_hypercall_on_cpu(0, enter_state_helper)
          enter_state()
            system_state =3D SYS_STATE_suspend
            disable_nonboot_cpus()
              for_each_online_cpu ( cpu ) {=20
                cpu_down(cpu) }
                  notifier_call_chain(CPU_DOWN_PREPARE)
                    cpu_callback(CPU_DOWN_PREPARE)
                      cpupool_cpu_remove(cpu)
                      cpufreq_del_cpu(cpu)
                      stop_machine_run(take_cpu_down, cpu)
                        __cpu_disable();
                          notifier_call_chain(CPU_DYING)
                            ...
                          cpumask_clear_cpu(cpu, &cpu_online_map);
                            cpu_disable_scheduler(cpu);
                  __cpu_die(cpu)
                    while ( (seen_state =3D cpu_state) !=3D CPU_STATE_DEAD =
) { ... }
                    notifier_call_chain(CPU_DEAD)
                      cpu_schedule_callback(CPU_DEAD)
                        ...
                        ...
                        cpu_schedule_callback(CPU_DEAD)
                          SCHED_OP(deinit_pdata)
                          cpu_schedule_down(cpu)
                            SCHED_OP(free_pdata)
                            SCHED_OP(free_vdata)


If you see a BUG_ON triggering, please provide details about that, and
we'll try to figure out what's causing it.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-fB+CZmy8jiVUdraLdkAb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlr0Sj4ACgkQFkJ4iaW4
c+606A//VFp1jDYoQb8ts9oE86CASfrE8CO8oJrN6PchYSvhkubDGfC+tHEkAAeg
/AW7RE16Cn0Nden2mdHpTDum5Nzj2NY6wnHRIPEs7O9AGgS/CJnyGbwq/JZATKNg
hnt94IqMaZT0wlaeZa5bp75131+7hngDKZUTXOJudSioT7U+YNQqGtss6ZMLIjzm
pLV8c1Wci1e+ppBNDaeYJ5SfOpVy9A0WjcmDVEsBIhb/2RL+uuHWVaMbab6HmJ3h
j4YYIuubpBra8eYJlYB/Emuq6oSDFUCcwsKeXHJIzjiE3qapG7e9X/CpA70IjzB6
reR3ifvg+adOtPr7buDgIwQp56PJpb2pRUOEiFRkOZiagKqIK3wMtsYhPuApJoVa
hqKCGZnmk6n6+GQf7zRX60+uSK+WjxZCjzCrqK8nmwgLw/Ju+KucKBo3i0NWuaGR
Y0ljFYrREt6l4WXHC7fpzH450gLg33X4qr913LW2lo1HTftQZcfhk4F24MUOZrjp
6xU+gYHOSjz3h+s5mYcuj5pr661QZYDFIxBCjmywyYnNUrwNSIxzJ+Gf+nKVHLGQ
TZXkwMMKjMKo7vMy8zkPyQESMp2+LQEpHt0lD8btxjE2xDcj5XN5Mm/qGUsXRMU2
HbzgNjz2tRXW5N6pGbD6aqP4nV9QXIKC1kSBirOLk++h/hPxVDs=
=fSnS
-----END PGP SIGNATURE-----

--=-fB+CZmy8jiVUdraLdkAb--



--===============8227992205398459726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8227992205398459726==--
