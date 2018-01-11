From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen/sched_rt: Move repl_timer into struct
	rt_private
Date: Thu, 11 Jan 2018 19:18:52 +0100
Message-ID: <1515694732.30117.72.camel@suse.com>
References: <1515690052-4221-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8598113485717622384=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515690052-4221-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Meng Xu <mengxu@cis.upenn.edu>
List-Id: xen-devel@lists.xenproject.org


--===============8598113485717622384==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5AXSAdrKxG2FJTAUxW/m"


--=-5AXSAdrKxG2FJTAUxW/m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-01-11 at 17:00 +0000, Andrew Cooper wrote:
> struct timer is only 48 bytes and repl_timer has a 1-to-1
> correspondance with
> struct rt_private, so having it referenced by pointer is wasteful.
>=20
> This avoids one memory allocation in rt_init(), and the resulting
> diffstat is:
>=20
>   add/remove: 0/0 grow/shrink: 0/7 up/down: 0/-156 (-156)
>   function                                     old     new   delta
>   rt_switch_sched                              134     133      -1
>   rt_context_saved                             278     271      -7
>   rt_vcpu_remove                               253     245      -8
>   rt_vcpu_sleep                                234     218     -16
>   repl_timer_handler                           761     744     -17
>   rt_deinit                                     44      20     -24
>   rt_init                                      219     136     -83
>=20
> As an extra bit of cleanup noticed while making this change, there is
> no need
> to call cpumask_clear() on an zeroed memory allocation.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-5AXSAdrKxG2FJTAUxW/m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpXqowACgkQFkJ4iaW4
c+5Lew//XSkAAuQCAaX0cH6yMOLoJUmbTvHe2gx16x/WFMqwHj/fM+tfRR7tTULO
68pji1ZKVym1l1c6ttpsfqosaW7zcCFQXQG6JUfTk6732UDsB7/QmNoK4lc5PYdz
ifIKAmP1hHtxsoDROxqU38Ly7CH/rQNl2EwTR2rAFXkrzXR41DJYjEejrnk0k9wO
Njps9+B9t8NfNgSuqkWm0hd2Eks/RF+o5b5d6lrvJ6YMErSZQfR5Z8qUdyLMyLZt
tSiRVm2NUwZ2/jlO59nXcEj+Ea6cUiynj1e/40o2URn8rDE+kwIcWmfX5/igZIN4
ik3Tv9OkohXMqdM14qx5hl6iz1PDzhzVDd3VgomT+FQ3nHcWXWLPQetnz1gHbHqm
saziDb4A6L1ygc1fK5LHsd/qPtXLOnvcHZbZagzHmVC7TBijQWEE3xGXs2WKOz7H
lmmNo6CZMcGbbhJiLVkmSHbWFbJacn5bBIbBSidHM8+LGcsZEZ1cM51VSFkunwLN
OLY9lXhHDh+X8gIIsY1/CLi8tMbGbWSkam+4a99p2wGemyCN0ES9iBTF4mzFKyEk
QUPT5u1OvVJOCuKTQ7T+G1TDTcbw7XVYrXdNdJMu2JfSZCewwi8f1KHrSeexlwoF
UYUWddqkCSi/2cIy8EAMb6wcbyADA6tFYc3hkIWlLXalfco8auc=
=z8EN
-----END PGP SIGNATURE-----

--=-5AXSAdrKxG2FJTAUxW/m--



--===============8598113485717622384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8598113485717622384==--
