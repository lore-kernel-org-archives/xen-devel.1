From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 2/6] xen/sched: Use %*pb[l] instead of
 cpumask_scn{, list}printf()
Date: Wed, 12 Sep 2018 10:05:17 +0200
Message-ID: <171096f2e3d18d1afc0223d9af14948ad7eb0ab8.camel@suse.com>
References: <1536235696-31359-1-git-send-email-andrew.cooper3@citrix.com>
 <1536235696-31359-3-git-send-email-andrew.cooper3@citrix.com>
 <abc71be6-4a76-23e5-4988-889715cf48ae@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3854709599817731071=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <abc71be6-4a76-23e5-4988-889715cf48ae@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Robert VanVossen <robert.vanvossen@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org


--===============3854709599817731071==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/AYp/khW+5/l26yP/VRH"


--=-/AYp/khW+5/l26yP/VRH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-09-07 at 15:42 +0100, George Dunlap wrote:
> On 09/06/2018 01:08 PM, Andrew Cooper wrote:
> > This removes all use of keyhandler_scratch as a bounce-buffer for
> > the rendered
> > string.  In some cases, collapse combine adjacent printk()'s which
> > are writing
> > parts of the same line.
> >=20
> > No functional change.
> >=20
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Acked-by: George Dunlap <george.dunlap@citrix.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

As it's a clear improvement wrt current state of things, IMO.

I agree with Jan that having to remember to always pass nr_cpu_ids is
unideal.

I'm fine with adding trying to find a solution to this to my todo-list
(although, not on the top of it, probably :-D ).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-/AYp/khW+5/l26yP/VRH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluYyL4ACgkQFkJ4iaW4
c+5Zqw/9GecjLQ64GPp/TPHzui2tHwJu6yTZGYygK45FyWCo4KagOfgE5Kb3NfMg
BPf34ZByqeCpQ2tJh2XWtC2UrtlHvgrP3VwRyYjlJJD1GClRy39uHWzp8e2kUuc8
qDH/SAh8fVjlgtopKV7zWxSO0KnT33TurvVwS0U/dwnk9ALVQRVRrAJeFLtXu15f
lHkMtTYQeJQWH9+pVYGCrNlyR0NsIUNdhFfSv2kzQ/SWtIlC5Qt/tId/m0o0cU1p
QaJx2+wcULrN0hbgxFigM+LWtfqSwiyKROWujIsitlIjlqTrt12JoQFZMrR1o5FQ
BUREGPePWSFVW8ynFhbBK6mdm5sYa3P2IvHo/i9mfNBeRnnioij3NWVhzHmAqor8
57YvDeufxF1C22A6y4wz/iJRebYci8wmE0O90mP/2cR4damkJOpSh5gRC+KlgC1w
cXTTaX6EtkD7DCp3H0Kj8fSszEELmJU5ylISc5PX8oHCZ+MWqmQf3OdRr6AKv1Lp
80IbyPpH4qVz/h9xwuseG48iWwg9rtk+4uKGYhTw0eH4BzTSAoWSobQV3g5cJ4Kr
6bRo2KbdgJFnLy+Rmq6kfubtkO79zJzDrJ7R6bxC566YXF2UzvcU62uz3gWDkW3S
ahsoj47/kOuVjgYcqT1BW6dt5Jl/Y/wIepK9ILd//bikmBYfYPY=
=l/gj
-----END PGP SIGNATURE-----

--=-/AYp/khW+5/l26yP/VRH--



--===============3854709599817731071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3854709599817731071==--
