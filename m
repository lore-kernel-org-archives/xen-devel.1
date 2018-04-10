From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Tue, 10 Apr 2018 17:36:25 +0200
Message-ID: <0e6a5bedd2fbbdb87f14f9317badcae88af24870.camel@suse.com>
References: <20180410085729.GA472@aepfle.de>
 <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
 <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3867180755462381525=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Olaf Hering <olaf@aepfle.de>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============3867180755462381525==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dZKnS79jvw75LvxvCF0G"


--=-dZKnS79jvw75LvxvCF0G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-04-10 at 16:25 +0100, George Dunlap wrote:
> On 04/10/2018 12:29 PM, Dario Faggioli wrote:
> >=20
> whenever that is.  (Possibly at the end of the current call to
> vcpu_migrate(), possibly at the end of a vcpu_migrate() triggered in
> context_saved() due to VPF_migrating.)
>=20
> vcpu_migrate() is called from:
>  - vcpu_force_reschedule(), which is called from
> VCPUOP_{set,stop}_periodic_timer
>  - cpu_disable_schedler(), when doing hotplug or cpupool operations
> on a cpu
>  - vcpu_set_affinity()
>  - vcpu_pin_override()
>=20
> But in any case, v->processor is only set from vcpu_move_locked(),
> which
> is only called if v->is_running is false; if v->is_running is false,
> then one way or another v can't be on any runqueue.  And if v isn't
> on
> any runqueue, and we hold v's current processor lock, then it's safe
> to
> modify v->processor.
>=20
Indeed.

> But obviously there's a flaw in that logic somewhere. :-)
>=20
frustratingly, yes. :-/

> One thing we might consider doing is implementing the migrate()
> callback
> for the Credit scheduler, and just have it make a bunch of sanity
> checks
> (v->processor lock held, new_cpu lock held, vcpu not on any runqueue,
> &c).
>=20
Yep, and in fact, this is exactly what the debug patch that I will send
to Olaf (after I'll be out of a meeting) does. :-)

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-dZKnS79jvw75LvxvCF0G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrM2fkACgkQFkJ4iaW4
c+4GihAAlpnnmKj7j7xYwsCQkwCLSOZyEBb20w3aDeW5KrvXK+eYwD4vj1DwlYjJ
DzZKZzljsDNZXc1GZsCqu/UBf96zuOEnS64os5xa0lombG4JWIxjLVTrdV9T2ygh
nqzjLNsMXlPlWs8cdZ7gbYNxQlWc+XFuGKReZF2D2Z1+c+TK5Sg75AtK12ypLqCe
w6txWmtwSFj7yUzPG4r0MozOcQw0Mm43BfNzQPgiIUhJhPvImn7bHjKpunOufMbW
aiYllOWmkwCw6rJIl6RaJK2WTUv9Z+GhQU6a2OSJQV6E+g9G86GhC6FX5nxmu9uE
LJ1PNhTGmveLSDrfpUl2O1dLMjprA37NlybUR8k0jVCSHaucuWTSVu8GDMgncqWa
YeDJTs51q/q1Q7P2G0GZTmAlP9fuQF2EB8/PV1Sxe6nMgV7WfK5t1VmHyGqhQCoG
37CPeLwWA17JUC+SGWfb4tlpOvoDmuIDp/qWmOJqIwjFi7pkKGJBGy4pSbNYoq5N
tie7+VTqmIVW4oQg6YFqeh1Abk6f0HFHVb+9k/y8KLrXlMfNF2bOIRK0FM5Dkhf0
tDD80Yuhx6sb2qXmdFI3CLfNaEhWbt4Lg9mFGCCWB5Lm6IbWrpyZD6tcuzQJSYyK
/OlWdZJBJ/7sVqM4p5VD4JArtDVtd/bLZQlEXtbc1K7h6M/1hr0=
=GGZH
-----END PGP SIGNATURE-----

--=-dZKnS79jvw75LvxvCF0G--



--===============3867180755462381525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3867180755462381525==--
