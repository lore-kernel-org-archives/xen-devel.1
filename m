From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen/sched: fix credit2 smt idle handling
Date: Sat, 23 Mar 2019 03:32:29 +0100
Message-ID: <2bd3783c9eb5e87a1e0a19acacc193a29fec3120.camel@suse.com>
References: <20190322090431.28112-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8744364657233918461=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MgHg=R2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h7WSn-0006At-5C
 for xen-devel@lists.xenproject.org; Sat, 23 Mar 2019 02:32:49 +0000
In-Reply-To: <20190322090431.28112-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8744364657233918461==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-w8MYSHuTL9pbRs9iMBv9"


--=-w8MYSHuTL9pbRs9iMBv9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-03-22 at 10:04 +0100, Juergen Gross wrote:
> Credit2's smt_idle_mask_set() and smt_idle_mask_clear() are used to
> identify idle cores where vcpus can be moved to. A core is thought to
> be idle when all siblings are known to have the idle vcpu running on
> them.
>=20
> Unfortunately the information of a vcpu running on a cpu is per
> runqueue. So in case not all siblings are in the same runqueue a core
> will never be regarded to be idle, as the sibling not in the runqueue
> is never known to run the idle vcpu.
>=20
Good catch.

I apparently forgot to take care of this, when introduced the
possibility of having per single CPU runqueue (which, in an SMT enabled
system, would mean per-thread runqs).

> This problem can be solved by and-ing the core's sibling cpumask with
> the runqueue's active mask before doing the idle test.
>=20
Right. There's one thing, though. Using one runq per CPU, in this
scheduler, is a really poor choice, and I basically would recommend it
only for testing or debugging (and this should probably be highlighted
a lot better in the docs).

Therefore, I'm a bit reluctant at adding another cpumask bitwise
operation, in hot paths, just for taking care of it.

Note that this also applies to cpupools, i.e., I also consider a very
poor choice putting two sibling hyperthreads in different pools. If you
recall, I even sent a patch to forbid doing that (which is still
blocked on a series of yours for passing parameters from the tools to
the hypervisor).

The only case I care, is a CPU being off-lined.

So, one thing that we could do is to put credit2_runqueue=3Dcpu inside
such #ifdef-s too (and I can prepare a patch to that effect myself, if
you want).

To properly deal with offline CPUs, I think we can change the logic a
little, i.e., we initialize the smt_idle mask to all-1 (all CPUs idle),
and we also make sure that we set the CPU bit (instead of learing it)
in smt_idle, when we remove the CPU from the scheduler.

Does doing these things (negatively) affect the other patch series
you're working on?

> In order for not having to allocate another cpumask the interfaces of
> smt_idle_mask_set() and smt_idle_mask_clear() are modified to not
> take
> a mask as input, but the runqueue data pointer, as those functions
> are
> always called with the same masks as parameters.
>=20
The interface change, I'm happy with it.

Oh, and the other patches you sent, as you know, I've been travelling
this week, so I couldn't look at them.

I will let you have my comment ASAP next week.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-w8MYSHuTL9pbRs9iMBv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyVmr0ACgkQFkJ4iaW4
c+799g//eOew5tpQQ5r0gBaP9Sh1cAKrsUxdvk4IHNMtr7OQvlU9LTP9+Hq9Qn2/
yXCx2+tYSWz813LQh275l9Ogr06dxT+6paEeK0GBPtchXfLuBRStSH1fFUgnw7L4
VWkSdYzSr3/Bkn0MLKvo6VEL7aiNQLUssL0/LrOkdzudl2ioKSzePqEKsfiSwJvk
m59HelzzHp0o8UIDBVr+L5F+kXBPVJbTFItcqwrpb+lAbuUuKGmaecbWLCylvjRT
Z7Kjv92HRCaoBy/l0bVQ+Hq3yc1eZfvkVRQlfR7JTqctn45QKuyfK30viKGz9PqO
8Y6Ormvr7tLg/KhnQKKalneN9HUIYneW02Kcd8UkbTBxQsHfkq6Ajp6o615RCBfj
1OZ90QGM2eoCLaBZwmgeiiMzmAADEuiKoMG5qh0JmoL/wTcODPBvgvDd/E+iw/6X
n9CrShr+EplEGn+H6oDebtcOiL8Zt0LNpyr9CKCx/Py9HnQX7xPrOUiEMJAj6H5T
qBWp1q6zBowd92euJ3d/O3gI93FAMvtLi16LWfrrcdBfmFGRHS6fdU+ywxYFtRDj
X7ZSEc6h7bbrm5o7l38QW4aWQGKVgQh5wZ7t0sgY02D8kP60/Bfn+SSFbBNHKoB8
dBK8brQA5ldK9Ib101jpzy+U8gJH7DOzG3HQyisjDID83IQIbvc=
=fsuu
-----END PGP SIGNATURE-----

--=-w8MYSHuTL9pbRs9iMBv9--



--===============8744364657233918461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8744364657233918461==--
