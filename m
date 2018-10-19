From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Fri, 19 Oct 2018 10:09:30 +0200
Message-ID: <0508ae79c8d74f6ebb7d1b239b2c3f0e428aca6b.camel@suse.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8690294613943063488=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List <xen-devel@lists.xen.org>
Cc: Juergen Gross <JGross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ross Philipson <ross.philipson@oracle.com>, Daniel Kiper <daniel.kiper@oracle.com>, Konrad Wilk <konrad.wilk@oracle.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, "Dannowski, Uwe" <uwed@amazon.de>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Mihai =?UTF-8?Q?Don=C8=9Bu?= <mdontu@bitdefender.com>, Matt Wilson <msw@amazon.com>, Joao Martins <joao.m.martins@oracle.com>, "Woodhouse, David" <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8690294613943063488==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/qr9/bcV2HMGbZTI3jSn"


--=-/qr9/bcV2HMGbZTI3jSn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-10-18 at 18:46 +0100, Andrew Cooper wrote:
> Hello,
>=20
Hey,

This is very accurate and useful... thanks for it. :-)

> 1) A secrets-free hypervisor.
>=20
> Basically every hypercall can be (ab)used by a guest, and used as an
> arbitrary cache-load gadget.  Logically, this is the first half of a
> Spectre SP1 gadget, and is usually the first stepping stone to
> exploiting one of the speculative sidechannels.
>=20
> Short of compiling Xen with LLVM's Speculative Load Hardening (which
> is
> still experimental, and comes with a ~30% perf hit in the common
> case),
> this is unavoidable.  Furthermore, throwing a few
> array_index_nospec()
> into the code isn't a viable solution to the problem.
>=20
> An alternative option is to have less data mapped into Xen's virtual
> address space - if a piece of memory isn't mapped, it can't be loaded
> into the cache.
>=20
> [...]
>=20
> 2) Scheduler improvements.
>=20
> (I'm afraid this is rather more sparse because I'm less familiar with
> the scheduler details.)
>=20
> At the moment, all of Xen's schedulers will happily put two vcpus
> from
> different domains on sibling hyperthreads.  There has been a lot of
> sidechannel research over the past decade demonstrating ways for one
> thread to infer what is going on the other, but L1TF is the first
> vulnerability I'm aware of which allows one thread to directly read
> data
> out of the other.
>=20
> Either way, it is now definitely a bad thing to run different guests
> concurrently on siblings. =20
>
Well, yes. But, as you say, L1TF, and I'd say TLBLeed as well, are the
first serious issues discovered so far and, for instance, even on x86,
not all Intel CPUs and none of the AMD ones, AFAIK, are affected.

Therefore, although I certainly think we _must_ have the proper
scheduler enhancements in place (and in fact I'm working on that :-D)
it should IMO still be possible for the user to decide whether or not
to use them (either by opting-in or opting-out, I don't care much at
this stage).

> Fixing this by simply not scheduling vcpus
> from a different guest on siblings does result in a lower resource
> utilisation, most notably when there are an odd number runable vcpus
> in
> a domain, as the other thread is forced to idle.
>=20
Right.

> A step beyond this is core-aware scheduling, where we schedule in
> units
> of a virtual core rather than a virtual thread.  This has much better
> behaviour from the guests point of view, as the actually-scheduled
> topology remains consistent, but does potentially come with even
> lower
> utilisation if every other thread in the guest is idle.
>=20
Yes, basically, what you describe as 'core-aware scheduling' here can
be build on top of what you had described above as 'not scheduling
vcpus from different guests'.

I mean, we can/should put ourselves in a position where the user can
choose if he/she wants:
- just 'plain scheduling', as we have now,
- "just" that only vcpus of the same domains are scheduled on siblings
hyperthread,
- full 'core-aware scheduling', i.e., only vcpus that the guest
actually sees as virtual hyperthread siblings, are scheduled on
hardware hyperthread siblings.

About the performance impact, indeed it's even higher with core-aware
scheduling. Something that we can see about doing, is acting on the
guest scheduler, e.g., telling it to try to "pack the load", and keep
siblings busy, instead of trying to avoid doing that (which is what
happens by default in most cases).

In Linux, this can be done by playing with the sched-flags (see, e.g.,
https://elixir.bootlin.com/linux/v4.18/source/include/linux/sched/topology.=
h#L20 ,
and /proc/sys/kernel/sched_domain/cpu*/domain*/flags ).

The idea would be to avoid, as much as possible, the case when "every
other thread is idle in the guest". I'm not sure about being able to do
something by default, but we can certainly document things (like "if
you enable core-scheduling, also do `echo 1234 > /proc/sys/.../flags'
in your Linux guests").

I haven't checked whether other OSs' schedulers have something similar.

> A side requirement for core-aware scheduling is for Xen to have an
> accurate idea of the topology presented to the guest.  I need to dust
> off my Toolstack CPUID/MSR improvement series and get that upstream.
>=20
Indeed. Without knowing which one of the guest's vcpus are to be
considered virtual hyperthread siblings, I can only get you as far as
"only scheduling vcpus of the same domain on siblings hyperthread". :-)

> One of the most insidious problems with L1TF is that, with
> hyperthreading enabled, a malicious guest kernel can engineer
> arbitrary
> data leakage by having one thread scanning the expected physical
> address, and the other thread using an arbitrary cache-load gadget in
> hypervisor context.  This occurs because the L1 data cache is shared
> by
> threads.
>
Right. So, sorry if this is a stupid question, but how does this relate
to the "secret-free hypervisor", and with the "if a piece of memory
isn't mapped, it can't be loaded into the cache".

So, basically, I'm asking whether I am understanding it correctly that
secret-free Xen + core-aware scheduling would *not* be enough for
mitigating L1TF properly (and if the answer is no, why... but only if
you have 5 mins to explain it to me :-P).

In fact, ISTR that core-scheduling plus something that looked to me
similar enough to "secret-free Xen", is how Microsoft claims to be
mitigating L1TF on hyper-v...

> A solution to this issue was proposed, whereby Xen synchronises
> siblings
> on vmexit/entry, so we are never executing code in two different
> privilege levels.  Getting this working would make it safe to
> continue
> using hyperthreading even in the presence of L1TF. =20
>
Err... ok, but we still want core-aware scheduling, or at least we want
to avoid having vcpus from different domains on siblings, don't we? In
order to avoid leaks between guests, I mean.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-/qr9/bcV2HMGbZTI3jSn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvJkToACgkQFkJ4iaW4
c+4qNg/+LwiVdN2HwO7L1UgBhlVXyN0ekelF2LTYm8nWsVI+7/y1CC+zHpT5P4Wr
DviPprcILj1ztkx/O3z8dpBx3r53cjyG71h+NUzEaAG7GjsFvXNKVNq/QPN6W3Lh
+AqnHO8BJny9yf1qEfKToCVMW+yaNbTrTw7upV2Wcifle0xLQKjwVVsJ68lDl903
TILs+K8QPyMrzwcJlwmfcZNTII2R0Mh8+xf6cBA80Y2F/2f1HSaIdy/Dsf3Bw8E2
n6s5RiFxuFO0M/403leYTRc2JDFig1osLaSv6BpdTl0XnhWITJ5rvw6jmzuIRflv
nYLOzp55YD4/FgR1vBL/q2vdymdraNXOzIhycm5vhpG4sDhXLFT4Ji9gG14H79LZ
dFUypw+cV6oE1cUFsn+lo4knzk4k0ls+QiNLionl31gF3nNeT8rrdOqkygsKNGhE
gqnmh0ZcBdzGIa/u0/lc+1G1mm0CSY8Tt1FFYh77qV0CXlBf7rGo1Ppoo9cFZBLC
YkpGf3WewSp5fdlBXHqAJ+pGekdnAZ0P7KZke2OSPff4aLC843J28xm7vv1dWxfA
tUklf4yv6uBmoWGcgA/xE/7KwwIkcuqrDw2+C7UdRWe8eZyOMwd4hZpj43dmQis7
khda4Ri49iuNGvBtSoU+vF1/TRN7zjF1kpIWTgukzOe1I0aTgYo=
=sQ3E
-----END PGP SIGNATURE-----

--=-/qr9/bcV2HMGbZTI3jSn--



--===============8690294613943063488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8690294613943063488==--
