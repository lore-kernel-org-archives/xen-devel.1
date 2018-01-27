From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v10 09/11] x86/ctxt: Issue a speculation
 barrier between vcpu contexts
Date: Sat, 27 Jan 2018 02:27:49 +0100
Message-ID: <1517016469.15341.153.camel@suse.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-10-git-send-email-andrew.cooper3@citrix.com>
 <5A6A0C7A02000078001A275A@prv-mh.provo.novell.com>
 <345bd2ef-1319-d9a6-522c-31e42bcd2c2e@citrix.com>
 <be65dc15-ab25-8522-8720-1ab64c6ef959@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1483894778277268813=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <be65dc15-ab25-8522-8720-1ab64c6ef959@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, David Woodhouse <dwmw@amazon.co.uk>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============1483894778277268813==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-DSo3QSR8GgBJyFm7H+4H"


--=-DSo3QSR8GgBJyFm7H+4H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On 25/01/18 16:09, Andrew Cooper wrote:
> > On 25/01/18 15:57, Jan Beulich wrote:
> > > > > >=20
> > > For the record, the overwhelming majority of calls to
> > > __sync_local_execstate() being responsible for the behavior
> > > come from invalidate_interrupt(), which suggests to me that
> > > there's a meaningful number of cases where a vCPU is migrated
> > > to another CPU and then back, without another vCPU having
> > > run on the original CPU in between. If I'm not wrong with this,
> > > I have to question why the vCPU is migrated then in the first
> > > place.
> >=20
So, about this. I haven't applied Jan's measurement patch yet (I'm
doing some reshuffling of my dev and test hardware here), but I have
given a look at traces.

So, Jan, a question: why are you saying "migrated to another CPU **and
then back**"? I'm asking because, AFAICT, the fact that
__sync_local_execstate() is called from invalidate_interrupt() means
that:
* a vCPU is running on a pCPU
* the vCPU is migrated, and the pCPU became idle
* the vCPU starts to run where it was migrated, while its 'original'
  pCPU is still idle =3D=3D> inv. IPI =3D=3D> sync state.

So there seems to me to be no need for the vCPU to actually "go back",
is there it?

Anyway, looking at traces, I observed the following:

    28.371352689 --|------x------ d32767v9 csched:schedule cpu 9, idle
    28.371354095 --|------x------ d32767v9 sched_switch prev d32767v9, run =
for 3412.789us
    28.371354475 --|------x------ d32767v9 sched_switch next d3v8, was runn=
able for 59.917us, next slice 30000.0us
    28.371354752 --|------x------ d32767v9 sched_switch prev d32767v9 next =
d3v8
    28.371355267 --|------x------ d32767v9 runstate_change d32767v9 running=
->runnable
(1) 28.371355728 --|------x------ d?v? runstate_change d3v8 runnable->runni=
ng
    ............ ................ ...
(2) 28.375501037 -----|||-x----|- d3v8 vcpu_wake d3v5
    28.375501540 -----|||-x----|- d3v8 runstate_change d3v5 blocked->runnab=
le
(3) 28.375502300 -----|||-x----|- d3v8 csched:runq_tickle, cpu 8
    ............ ................ ...
    28.375509472 --|--|||x|----|- d32767v8 csched:schedule cpu 8, idle
    28.375510682 --|--|||x|----|- d32767v8 sched_switch prev d32767v8, run =
for 724.165us
    28.375511034 --|--|||x|----|- d32767v8 sched_switch next d3v5, was runn=
able for 7.396us, next slice 30000.0us
    28.375511300 --|--|||x|----|- d32767v8 sched_switch prev d32767v8 next =
d3v5
    28.375511640 --|--|||x|----|- d32767v8 runstate_change d32767v8 running=
->runnable
(4) 28.375512060 --|--|||x|----|- d?v? runstate_change d3v5 runnable->runni=
ng
    ............ ................ ...
(5) 28.375624977 ----|-|||x----|- d3v8 csched: d3v8 unboosted
(6) 28.375628208 ----|-|||x----|- d3v8 csched:pick_cpu 11 for d3v8

At (1) d3v8 starts running on CPU 9. Then, at (2), d3v5 wakes up, and
at (3) CPU 8 (which is idle) is tickled, as a consequence of that. At
(4), CPU 8 picks up d3v5 and run it (this may seem unrelated, but bear
with me a little).

At (5), a periodic tick arrives on CPU 9. Periodic ticks are a core
part of the Credit1 algorithm, and are used for accounting and load
balancing. In fact, csched_tick() calls csched_vcpu_acct() which, at
(6), calls _csched_cpu_pick().

Pick realizes that d3v8 is running on CPU 9, and that CPU 8 is also
busy. Now, since CPU 8 and 9 are hyperthreads of the same core, and
since there are fully idle cores, Credit1 decides that it's better to
kick d3v8 to one of those fully idle cores, so both d3v5 and d3v8
itslef can run at full "core speed". In fact, we see that CPU 11 is
picked, as both the hyperthreads --CPU 10 and CPU 11 itself-- are idle.
(To be continued, below)

(7) 28.375630686 ----|-|||x----|- d3v8 csched:schedule cpu 9, busy
(*) 28.375631619 ----|-|||x----|- d3v8 csched:load_balance skipping 14
    28.375632094 ----|-|||x----|- d3v8 csched:load_balance skipping 8
    28.375632612 ----|-|||x----|- d3v8 csched:load_balance skipping 4
    28.375633004 ----|-|||x----|- d3v8 csched:load_balance skipping 6
    28.375633364 ----|-|||x----|- d3v8 csched:load_balance skipping 7
    28.375633960 ----|-|||x------ d3v8 csched:load_balance skipping 8
    28.375634470 ----|-|||x------ d3v8 csched:load_balance skipping 4
    28.375634820 ----|-|||x------ d3v8 csched:load_balance skipping 6
(**)28.375635067 ----|-|||x------ d3v8 csched:load_balance skipping 7
    28.375635560 ----|-|||x------ d3v8 sched_switch prev d3v8, run for 4288=
.140us
    28.375635988 ----|-|||x------ d3v8 sched_switch next d32767v9, was runn=
able for 4288.140us
    28.375636233 ----|-|||x------ d3v8 sched_switch prev d3v8 next d32767v9
    28.375636615 ----|-|||x------ d3v8 runstate_change d3v8 running->offlin=
e
(8) 28.375637015 ----|-|||x------ d?v? runstate_change d32767v9 runnable->r=
unning
    28.375638146 ----|-x||------- d3v2 vcpu_block d3v2
    ............ ................ ...
    28.375645627 ----|--||x------ d32767v9 csched:pick_cpu 11 for d3v8
    28.375647138 ----|--||x------ d32767v9 vcpu_wake d3v8
    28.375647640 ----|--||x------ d32767v9 runstate_change d3v8 offline->ru=
nnable
(9) 28.375648353 ----|--||x------ d32767v9 csched:runq_tickle, cpu 11
    ............ ................ ...
    28.375709505 ----|--||--x---- d32767v11 sched_switch prev d32767v11, ru=
n for 2320182.912us
    28.375709778 ----|--||--x---- d32767v11 sched_switch next d3v8, was run=
nable for 59.670us, next slice 30000.0us
    28.375710001 ----|--||--x---- d32767v11 sched_switch prev d32767v11 nex=
t d3v8
    28.375710501 ----|--||--x---- d32767v11 runstate_change d32767v11 runni=
ng->runnable
(10)28.375710858 ----|--||--x---- d?v? runstate_change d3v8 runnable->runni=
ng

At (7) we see that CPU 9 re-schedules, as a consequence of pick
deciding to migrate d3v8. As a side note, all the "load_balance
skipping xx" lines between (*) and (**) show that stealing work
attempts are actually prevented on all those CPUs, because they have
only 1 runnable (either running or ready to do so) vCPU. I.e., my patch
 works and achieves its goal of avoiding even trying to steal (which
means avoiding having to take a lock!), when there's no need. :-)

Anyway, at (8) d3v8 is gone, and CPU 9 eventually becomes idle. At (9),
another call to pick_cpu() confirms that d3v8 will land on CPU 11, and
at (10) we see it starting to run there. It should be at this point
that the invalidate IPI is sent, which causes the state sync request
(note, in fact, that CPU 8 is still idle).

Now, this is just _one_ example, but I am quite convinced that this may
actually be one of the most prominent causes of the behavior Jan
reported.

The problem, as I was expecting, is not work stealing, the problem is,
well... Credit1! :-/

In fact, when d3v5 wakes up, why, at point (3), CPU 8 is tickled,
instead of, for instance, CPU 10 (or 11, or 12, or 13)? CPU 8 and CPU 9
are hyperthread siblings, and CPU 9 is busy, so it would have been
better to try to leave CPU 8 alone. And that would have been possible,
as both the core of CPUs 10 and 11, and of CPUs 12 or 13 are fully
idle.

Well, point is, tickling in Credit1 does not check/consider
hyperthreading. Can it then start doing so? Not easily, IMO, and at an
added cost --which will be payed on the vCPU wakeup path (which is
already quite convoluted and complex, in that scheduler).

Credit2, for instance, does not suffer from this issue. In fact,
hyperthreading, there, is considered during wakeup/tickling already.

Hope this helps clarifying things a bit,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-DSo3QSR8GgBJyFm7H+4H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpr1ZYACgkQFkJ4iaW4
c+7Qvw/+PxjGsGyhVesXt7mil/jyxfVodkX61oYLwuW4zBehPTcp5w7D5p08eOfJ
ATUnoP+o79hfjDhE0WDcTIiobcJOMdrQWMkp9x4TLN/Mm6+3CRUX6v6HQ2RbapzP
rWDoY5cRSA6b/8PLLViiJzFvRs2YHq6IeHD5TrGyzeUVNB7ETWKAP3J35xLbLd/T
AHLr9wY27Kwgc5cWC9A1xcZrK0xCKatnzE7hXUkml5oUmg+VKn5zx/VaJTy4bd/J
5CKVXUP7l8F4FkDjiuFmd9V88xm7OqOqeakFCuD0EIcliDrFhQ/1wpchhCcX7bTd
AO5msjWTzkbU89c+mx/3FagVo7Ng+2DrBhQQnh+Tur5kp6RBkIxieArDgd6cYLwN
bkA8xh7gUSJOxUGTP7Xap1YgPNaJ7dfqfF6VSq80/l+3tLuFD4EfOYSKITnvm3rZ
fryL8Ty/OVcUDICltrioM2BIFxuICzlEP0pCg119dq2S6b6WSRjeJNW3YJRV3b8q
J+4Ef5iSvpf88ExkRiiwfoIVS0OYk+SGqiwz7G/wOGvsItZQobEw0Z2cgSXK35o3
VcOhewxhHbudETUeP6sld7sGE+DYRurYjSk8tdQCjZmKxM5iny4j6bE1izmo9HkZ
wNrJIyqalBt6/oe+AE96NftjZvLoR360kCN+vxqwaF3l42k28KE=
=Z6pf
-----END PGP SIGNATURE-----

--=-DSo3QSR8GgBJyFm7H+4H--



--===============1483894778277268813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1483894778277268813==--
