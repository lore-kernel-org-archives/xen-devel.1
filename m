From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Fri, 13 Apr 2018 12:47:42 +0200
Message-ID: <673b50835fd30d53c9c7dad43e68efe551876d5b.camel@suse.com>
References: <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de> <20180411150312.GL7177@aepfle.de>
 <20180411152745.GM7177@aepfle.de>
 <eb978b7160b9e2d54f56c088e0e7a24f1ec813c3.camel@suse.com>
 <20180411204359.GP7177@aepfle.de>
 <CAAWQectJz5nGbMQJMsgv2MVE4DRwAw5DOA+roT5TFadO06TTHg@mail.gmail.com>
 <862386BF-2092-428A-AE9E-766D109EF7DC@citrix.com>
 <b4e178344a2923404528bd0af07d583fc011b9ab.camel@suse.com>
 <20180412144553.74da01bc.olaf@aepfle.de>
 <95725e3ecc825da13f9c0ab01ba74b11ed678d33.camel@suse.com>
 <a6057cd8eadc20b04797a4a8fc9cb5570d44544d.camel@suse.com>
 <6b119ba762dbad0c1949bf814694ffbfd39d16c4.camel@suse.com>
 <070DC511-31E1-4C0C-BFD0-C49590FDE54B@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3498497812398294564=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <070DC511-31E1-4C0C-BFD0-C49590FDE54B@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============3498497812398294564==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-fUNajUCp8QdDEc6DkPlM"


--=-fUNajUCp8QdDEc6DkPlM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-04-13 at 09:03 +0000, George Dunlap wrote:
> > On Apr 12, 2018, at 6:25 PM, Dario Faggioli <dfaggioli@suse.com>
> > wrote:
> >=20
> > On the "other CPU", we might be around here [**]:
> >=20
> > static void vcpu_migrate(struct vcpu *v)
> > {
> >    ...
> >    if ( v->is_running ||
> >         !test_and_clear_bit(_VPF_migrating, &v->pause_flags) )n
>=20
> I think the bottom line is, for this test to be valid, then at this
> point test_bit(VPF_migrating) *must* imply !vcpu_on_runqueue(v), but
> at this point it doesn=E2=80=99t: If someone else has come by and cleared=
 the
> bit, done migration, and woken it up, and then someone *else* set the
> bit again without taking it off the runqueue, it may still be on the
> runqueue.
>=20
BTW, I suddenly realized that Olaf, in his reproducer, is changing both
hard and soft-affinity.

That means two calls to vcpu_set_affinity(). And here's the race
(beware, it's a bit of a long chain of events! :-P):

 CPU A                                  CPU B
 .                                      .
 schedule(current =3D=3D v)                 vcpu_set_affinity(v) <-- for ha=
rd affinity
  prev =3D current     // =3D=3D v             .
  schedule_lock(CPU A)                   .
   csched_schedule()                     schedule_lock(CPU A)
   if (runnable(v))  //YES               x
    runq_insert(v)                       x
   return next !=3D v                      x
  schedule_unlock(CPU A)                 x // takes the lock
  context_switch(prev,next)              set_bit(v, VPF_migrating)
   context_saved(prev) // still =3D=3D v     .
    v->is_running =3D 0                    schedule_unlock(CPU A)
    SMP_MB                               domain_update_node_affinity(v->d)
    .                                    if (test_bit(v, VPF_migrating) // =
YES
    .                                     vcpu_sleep_nosync(v)
    .                                      schedule_lock(CPU A)
    .                                      if (!vcpu_runnable(v)) // YES
    .                                       SCHED_OP(v, sleep)
    .                                        if (curr_on_cpu(v, CPU A)) // =
NO
    .                                         ---
    .                                        else if (__vcpu_on_runq(v)) //=
 YES
    .                                         runq_remove(v)
    .                                       schedule_unlock(CPU A)
    .                                     vcpu_migrate(v)
    .                                      for {
    .                                       schedule_lock(CPU A)
    .                                       SCHED_OP(v, pick_cpu)
    .                                        set_bit(v, CSCHED_MIGRATING)
    .                                        return CPU D
    .                                       pick_called =3D 1
    .                                       schedule_unlock(CPU A)
    if (test_bit(v, VPF_migrating)) // YES  schedule_lock(CPU A + CPU D)
     vcpu_sleep_nosync(v)                   if (pick_called && ) // YES
      schedule_lock(CPU A)                   break
      x                                    }
      x // CPU B clears VPF_migrating!     if (v->is_running || !test_and_c=
lear(v, VPF_migrating)) // NO
      x                                     ---
      x                                    vcpu_move_locked(v)
      x                                     v->processor =3D CPU D
      x                                    schedule_unlock(CPU A + CPU D)
      x // takes *CPU D* lock              .
      if (!vcpu_runnable(v)) // FALSE, as VPF_migrating is now clear
       ---                                 vcpu_wake(v)
      schedule_unlock(CPU D)                .
      vcpu_migrate(v)                       schedule_lock(CPU D)
        for {                               if (vcpu_runnable(v)) // YES
         schedule_lock(CPU D)                SCHED_OP(v, wake)
         x                                    runq_insert(v) // v is now in=
 CPU D's runqueue
         x                                    runq_tickle(v)
         x                                  schedule_unlock(CPU D)
         x // takes the lock                .
         SCHED_OP(v, pick_cpu)              .
          set_bit(v, CSCHED_MIGRATING)      .
          return CPU C                      .
         pick_called =3D 1                    .
         schedule_unlock(CPU D)             .
         .                                  vcpu_set_affinity(v) <-- for so=
ft-affinity
         .                                  schedule_lock(CPU D)
         schedule_lock(CPU D + CPU C)       set_bit(v, VPF_migrating)
         x                                  schedule_unlock(CPU D)
         x // takes the lock                .
         if (pick_called && ...) // YES     .
          break                             .
        }                                   .
        if ( v->is_running || !test_and_clear(v, VPF_migrating)) // FALSE !=
!
         vcpu_move_locked(v, CPU C)         .
         BUG_ON(__vcpu_on_runq(v))          .

It appears that changing hard-affinity only does not trigger the bug,
which would mean this is correct.

Also, as Olaf just reported, running with your series (and changing
both hard and soft-affinity), also work.

Now we have to decide if take your series and backport it (which is
what I'm leaning toward), or do something else.

But if you don't mind, we'd have to do it on Monday, as I have to run
right now. :-P

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-fUNajUCp8QdDEc6DkPlM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrQis4ACgkQFkJ4iaW4
c+7CnRAA8CC3+n0lnbL3xOixIrGLPkn30OeBMDImG3f82+1E9Fk+cSbQTbNQ4/6P
0AVsGzqHXjEsT3IpLqOMMQzMp1ofIuGFL0ESsW6+67TdX0VJy0yVjIAGQ+JVORpu
HbmYrxxfVCEN71lB7edP8VWS26BNVwN5k8O0lrDFCk36N3aleMjd2qp726ZSnnZ0
/Ctt0HDusi4055+f/+m+K7zzTdlawGUuEVONY8hjI85bXrZ0NM7ODI5wuWJLPOrN
KB5K+wdQivm1BH2xXZjgmYk0t240sLh5kNxxJqwc3r81/FfR+O6M62Spr9w9190o
Tpjj+HRE0vlxqOKOylgIGjVaC7rB974PovMX9bVZrx01jS+/P0gufmTWyq0fMdoZ
C1FiJ7wl4WCd7bJJnTYiXnCPEFBBXVTivHAU9BK2fnh390UOWKqxJiY4uTSPE+tb
L3fDCtN+T4gtLKvOzEUUfuud/t7+lflNNF+iUvUITUguMMCS6dBkFcF4cwg5CZeT
XJplB+dQ7M0jvm8zYcR8gjLIBEq0N8bkxWtsNhyOZsmRSoPPdpTLDX0yVNBngyfJ
b4Ne6dTtyfDGYNnyaRsrMH2bI+nnY1jhDWAmLPmU3KI3elhr6FqmylC5owKbHZGh
KJLI6IEvBK+1Oo2ciwdKvqFZy/OGh0L0tD16DNZEL7w0vnWVSqg=
=De7g
-----END PGP SIGNATURE-----

--=-fUNajUCp8QdDEc6DkPlM--



--===============3498497812398294564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3498497812398294564==--
