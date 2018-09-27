From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: null scheduler bug
Date: Thu, 27 Sep 2018 19:06:03 +0200
Message-ID: <44ddd615b15ffb6034c2cfe1c4133dac9f40cc0e.camel@suse.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
 <44174941bcd8f250a6ecd42ea10a78bf12453134.camel@suse.com>
 <CADJ6SV2wis2kOz9j4OGTzRLd+2O2f_SuxktFWRq2A_tbng_3Ug@mail.gmail.com>
 <529d38d04b140d90d33e424a064d401cf06f14cf.camel@suse.com>
 <CADJ6SV09MS1x+qGJOu71W8M6cVhRaVuODBYDReHWmOm4c1NEfQ@mail.gmail.com>
 <CADJ6SV0+O5c52_qwOUEakuX82C2+8Z-M4mKj0x+13GXjaiJjvw@mail.gmail.com>
 <a468e3dfc55bb6a421d47b908f89d9112075cc04.camel@suse.com>
 <CADJ6SV0=p3efMNmdx5ud8BAPscOZpSBqBZ2LJieE3M+Rq3phNQ@mail.gmail.com>
 <b9c1a71c455e8a1682bb13527503c7c0f0135887.camel@suse.com>
 <2ec1f6c5-df53-fce3-9062-123832ae8e6a@arm.com>
 <2bb4df76339b020351720927d05f2d1e565cebbc.camel@suse.com>
 <04bed226-f787-e86f-4373-d05186ab03cf@arm.com>
 <d8d276a20e4567e427ad48d5dd494366dde4f963.camel@suse.com>
 <39666f3710ae7adfbb43c9dc0efac0d60245c411.camel@suse.com>
 <CADJ6SV2FP6Deu7SevTDNjT2sOJ2nQMeAOUS0J8jemamONfftiA@mail.gmail.com>
 <86360891f996bdb078a5eff7f860fbbb39fbc5ac.camel@suse.com>
 <acbeae1c-fda1-a079-322a-786d7528ecfc@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8765978049509795911=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=r25c=mj=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g5Zjx-0000E0-Gs
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 17:06:13 +0000
In-Reply-To: <acbeae1c-fda1-a079-322a-786d7528ecfc@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefano@stabellini.net>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, tim@xen.org, Milan Boberic <milanboberic94@gmail.com>, JBeulich@suse.com, Andrew Cooper <Andrew.Cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8765978049509795911==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-CW/pdGxL88i63t8en995"


--=-CW/pdGxL88i63t8en995
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-09-27 at 16:09 +0100, Julien Grall wrote:
> Hi Dario,
>=20
Hi,

> On 09/27/2018 03:32 PM, Dario Faggioli wrote:
> > On Thu, 2018-09-27 at 15:15 +0200, Milan Boberic wrote:
> > >=20
> In one of your e-mail, you wrote:
>=20
> "Well, our implementation of RCU requires that, from time to time,
> the
> various physical CPUs of your box become idle, or get an interrupt,
> or
> go executing inside Xen (for hypercalls, vmexits, etc). In fact, a
> CPU
> going through Xen is what allow us to tell that it reached a so-
> called
> 'quiescent state', which in turns is necessary for declaring a so-
> called 'RCU grace period' over."
>=20
> I don't quite agree with you on the definition of "quiescent state"=20
> here.=20
>
Hehe... I was trying to be both quick and accurate. It's more than
possible that I failed. :-)

> To take the domain example, we want to wait until all the CPU has=20
> stopped using the pointer (an hypercall could race put_domain).=20
>
I'm not sure what you mean with "an hypercall could race put_domain".
What we want is to wait until all the CPUs that are involved in the
grace period, have gone through rcupdate.c:cpu_quiet(), or have become
idle.

Receiving an interrupt, or experiencing a context switch, or even going
idle, it's "just" how it happens that these CPUs have their chance to
go through cpu_quiet(). It is in this sense that I meant that those
events are used as markers of a quiescent state.

And "wfi=3Dnative" (in particular in combination with the null scheduler,
but I guess also with other ones, at least to a certain extent) makes
figuring out the "or have become idle" part tricky. That is the problem
here, isn't it?

> That=20
> pointer will not be in-use if the CPU is in kernel-mode/user-mode or
> in=20
> the idle loop. Am I correct?
>=20
Right.

So, we want that all the CPUs that were in Xen to have either left Xen
at least once or, if they're still there and have never left, that must
be because they've become idle.

And currently we treat all the CPUs that have not told the RCU
subsystem that they're idle (via rcu_idle_enter()) as busy, without
distinguishing between the ones that are busy in Xen from the one which
are busy in guest (kernel or user) mode.

> So I am wondering whether we could:
> 	- Mark any CPU in kernel-mode/user-mode quiet
>
Right. We'd need something like a rcu_guest_enter()/rcu_guest_exit()
(or a rcu_xen_exit()/rcu_xen_enter()), which works for all combination
of arches and guest types.

It looks to me too that this would help in this case, as the vCPU that
stays in guest mode because of wfi=3Didle would be counted as quiet, and
we won't have to wait for it.

> 	- Raise a RCU_SOFTIRQ in call_rcu?
>=20
Mmm... what would be the point of this?

> With that solution, it may even be possible to avoid the timer in
> the=20
> idle loop.
>=20
Not sure. The timer is there to deal with the case when a CPU which has
a callback queued wants to go idle. It may have quiesced already, but
if there are others which have not, either:
1) we let it go idle, but then the callback will run only when it=20
   wakes up from idle which, without the timer, could be far ahead in=20
   time;
2) we don't let it go idle, but we waste resources;
3) we let it go idle and keep the timer. :-)

But anyway, even if it would not let us get rid of the timer, it seems
like it could be nicer than any other approaches. I accept
help/suggestions about the "let's intercept guest-Xen and Xen-guest
transitions, and track that inside RCU code.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-CW/pdGxL88i63t8en995
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlutDf8ACgkQFkJ4iaW4
c+5b8g/+JsGilR/O0rtCQfnbfSOzfx++wR6ResjEknY7k2nPdtEBRYkwgSsVN6sz
T3xE6louhVQx46iY574uDj6s/WoZ/NqX87KlZvvrMltzZYF+9ozcLdk4wr6g8XiF
Xo25drL6IG0rPek5gUymFoqdrkRzkgZ1ux2Ub+d7X2OIgzfYF1hhZlFOGH3qXdoz
EeRarDw90mIxd6rXnbr6/dgV3EYTwIbSQbddIYzRODcA0SseoBktprGA+q0PpCWq
OM63eISk0LJpA3JqpMfTHVBYd3waHMcHAGQMtx76tPGO2YdRomQyEsF6Vlo7q5hi
Xey8n5Iki7v/ag5fPyKUcAxHte+pz+V8oi+3dkyTQblQWtDNCaY4Pt7R2OCltk3+
sVlkqeYafGBoslgb82y/KGplLdeuJ56PPFvyGLzHlAf/PjM35vTjbkKHgHuL3/zI
H/32TmxyLcEY/wywuolC0jaz6CxyIwiO18DJQ5U0Dr8bjOSgJifqPM62mlqkyE5R
+pCI0/HqlSrimb2GQJ2gCCH54+KRjIsvC4TpyjPee1P6bv71dg+n5z3l3iPGZthS
CTdwP7dqXCmLJDYNcJdawei4iIq0Wv4bTQw8qwbyIDW+WcYiyzdPlorlL6N1FBjA
y87CaticFPSgM/NzkPlJI/WGGiuuJaMUILcnIh2VQMnvyQmB9Sg=
=lNoo
-----END PGP SIGNATURE-----

--=-CW/pdGxL88i63t8en995--



--===============8765978049509795911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8765978049509795911==--
