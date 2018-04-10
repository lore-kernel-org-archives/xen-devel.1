From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 00:59:08 +0200
Message-ID: <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
References: <20180410085729.GA472@aepfle.de>
 <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
 <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5135219738528110142=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180410203741.GF7177@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============5135219738528110142==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-TDyc1MJIN7h11qx9Z68L"


--=-TDyc1MJIN7h11qx9Z68L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Adding Andrew, not because I expect anything, but just because we've=20
 chatted about this issue on IRC :-) ]

On Tue, 2018-04-10 at 22:37 +0200, Olaf Hering wrote:
> On Tue, Apr 10, Dario Faggioli wrote:
>=20
>     BUG_ON(__vcpu_on_runq(CSCHED_VCPU(vc)));
>
> (XEN) Xen BUG at sched_credit.c:876
> (XEN) ----[ Xen-4.11.20180410T125709.50f8ba84a5-
> 3.bug1087289_411  x86_64  debug=3Dy   Not tainted ]----
> (XEN) CPU:    118
> (XEN) RIP:    e008:[<ffff82d080229ab4>]
> sched_credit.c#csched_vcpu_migrate+0x27/0x51
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d080229ab4>]
> sched_credit.c#csched_vcpu_migrate+0x27/0x51
> (XEN)    [<ffff82d080236348>] schedule.c#vcpu_move_locked+0xbb/0xc2
> (XEN)    [<ffff82d08023764c>] schedule.c#vcpu_migrate+0x226/0x25b
> (XEN)    [<ffff82d08023935f>] context_saved+0x8d/0x94
> (XEN)    [<ffff82d08027797d>] context_switch+0xe66/0xeb0
> (XEN)    [<ffff82d080236943>] schedule.c#schedule+0x5f4/0x627
> (XEN)    [<ffff82d080239f15>] softirq.c#__do_softirq+0x85/0x90
> (XEN)    [<ffff82d080239f6a>] do_softirq+0x13/0x15
> (XEN)    [<ffff82d08031f5db>] vmx_asm_do_vmentry+0x2b/0x30
>
Hey... unless I've really put there a totally bogous BUG_ON(), this
looks interesting and potentially useful.

It says that the vcpu which is being context switched out, and on which
we are calling vcpu_migrate() on, because we found it to be
VPF_migrating, is actually in the runqueue already when we actually get
to execute vcpu_migrate()->vcpu_move_locked().

Mmm... let's see.

 CPU A                                  CPU B
 .                                      .
 schedule(current =3D=3D v)                 vcpu_set_affinity(v)
  prev =3D current     // =3D=3D v             .
  schedule_lock(CPU A)                   .
   csched_schedule()                     schedule_lock(CPU A)
   if (runnable(v))  //YES               x
    runq_insert(v)                       x
   return next !=3D v                      x
  schedule_unlock(CPU A)                 x // takes the lock
  context_switch(prev,next)              set_bit(v, VPF_migrating)  [*]
   context_saved(prev) // still =3D=3D v     .
    v->is_running =3D 0                    schedule_unlock(CPU A)
    SMP_MB                               .
    if (test_bit(v, VPF_migrating)) // YES!!
     vcpu_migrate(v)                     .
      for {                              .
       schedule_lock(CPU A)              .
       SCHED_OP(v, pick_cpu)             .
        set_bit(v, CSCHED_MIGRATING)     .
        return CPU C                     .
       pick_called =3D 1                   .
       schedule_unlock(CPU A)            .
       schedule_lock(CPU A + CPU C)      .
       if (pick_called && ...) // YES    .
        break                            .
      }                                  .
      // v->is_running is 0              .
      //!test_and_clear(v, VPF_migrating)) is false!!
      clear_bit(v, VPF_migrating)        .
      vcpu_move_locked(v, CPU C)         .
      BUG_ON(__vcpu_on_runq(v))          .

[*] after this point, and until someone manages to call vcpu_sleep(), =20
      v sits in CPU A's runqueue with the VPF_migrating pause flag set

So, basically, the race is between context_saved() and
vcpu_set_affinity(). Basically, vcpu_set_affinity() sets the
VPF_migrating pause flags on a vcpu in a runqueue, with the intent of
letting either a vcpu_sleep_nosync() or a reschedule remove it from
there, but context_saved() manage to see the flag, before the removal
can happen.

And I think this explains also the original BUG at sched_credit.c:1694
(it's just a bit more involved).

As it can be seen above (and also in the code comment in ) there is a
barrier (which further testify that this is indeed a tricky passage),
but I guess it is not that effective! :-/

TBH, I have actually never fully understood what that comment really
meant, what the barrier was protecting, and how... e.g., isn't it
missing its paired one? In fact, there's another comment, clearly
related, right in vcpu_set_affinity(). But again I'm a bit at loss at
properly figuring out what the big idea is.

George, what do you think? Does this make sense?

Well, I'll think more about this, and to a possible fix, tomorrow
morning.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-TDyc1MJIN7h11qx9Z68L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrNQbwACgkQFkJ4iaW4
c+4cOxAA3DzxEtATsCO+PWbPIiT0FZzlcxcCdSAbsfaZ33M8JbqiqVdiwIFdOW0K
3jlNblw/GjcZoEDge21eWqoxeLtS672GN2m1P7hMUWYs+xsFXrRY2MVwDVX42i4E
xvtK0gYIKCRsxkYuWgHxCj7NMhKly5anHr+n2FSdptRn/VYNyf5yKDkWlmUqKE2E
cMWI32Np79NJ7fYhZnO28VToFRf25ixn1lR70geeBMhfEtwwxizCSTCi5iWvDL8d
RzcVk8IsFAjvfF+JFFafH9V2ncdwvqTPElfcwCmWICR08IFOrtLNcx9ScKnFhDGy
q4Bk/bdMQpOA1AswoStnFfBBa3SIDrVD3PfbEKDObN6prJVMKCGwiDYA5wHpW7th
lkqeXFLqnBQYJFxzrhR8vftpn8w8UOoCBHaCqAXWdI56Xv4RvKF5f6OYbGyMdFJr
gAesSn23Em1ShUMqRRHwQJ4xD1jYrp2+QGgkunonifEojzAtIYnczfuy3TnwmAE4
8bC84nwPICu24bnG7/lSvJhSZsIS6jRx4Rn9TK+zcWk78aqguknDm2wbWLITD2sq
XsJ7uB5+8GkGyK2NvsMGsRZnCFGRPTCcdLiLRmWTNvkHEm4mM3qFMxmdKexzwtgi
Mb6b+uCxnZEZEMiiJTxLB64dR90oJ4JQ4cjX4bE3I5nTRnPNjvI=
=y7qR
-----END PGP SIGNATURE-----

--=-TDyc1MJIN7h11qx9Z68L--



--===============5135219738528110142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5135219738528110142==--
