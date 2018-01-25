From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v10 09/11] x86/ctxt: Issue a speculation
 barrier between vcpu contexts
Date: Thu, 25 Jan 2018 19:49:09 +0100
Message-ID: <1516906149.15341.66.camel@suse.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-10-git-send-email-andrew.cooper3@citrix.com>
 <5A6A0C7A02000078001A275A@prv-mh.provo.novell.com>
 <345bd2ef-1319-d9a6-522c-31e42bcd2c2e@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3244969468022536626=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <345bd2ef-1319-d9a6-522c-31e42bcd2c2e@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Dario Faggioli <dario.faggioli@citrix.com>, David Woodhouse <dwmw@amazon.co.uk>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============3244969468022536626==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-309L7EfwlZW/NsC2aNEC"


--=-309L7EfwlZW/NsC2aNEC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-01-25 at 16:09 +0000, Andrew Cooper wrote:
> On 25/01/18 15:57, Jan Beulich wrote:
> > > > >=20
> > For the record, the overwhelming majority of calls to
> > __sync_local_execstate() being responsible for the behavior
> > come from invalidate_interrupt(), which suggests to me that
> > there's a meaningful number of cases where a vCPU is migrated
> > to another CPU and then back, without another vCPU having
> > run on the original CPU in between. If I'm not wrong with this,
> > I have to question why the vCPU is migrated then in the first
> > place.
>=20
> This is a known (mis)feature of the Credit scheduler.  When a PCPU
> goes
> idle, it aggressively steals work from the adjacent cpus, even if the
> adjacent cpu only has a single vcpu to run and is running it.
>=20
> XenServer has this gross hack which makes aggregate networking
> measurements far far better
>=20
> https://github.com/xenserver/xen.pg/blob/XS-7.1.x/master/sched-credit
> 1-use-per-pcpu-runqueue-count.patch
>=20
> Dario made a different fix to Credit1 upstream which was supposed to
> resolve this behaviour (although I can't locate the patch by a list
> of
> titles), but based on these observations, I'd say the misfeature
> hasn't
> been fixed.
>=20
Yes, it's 341450eaf753 ("xen: credit1: increase efficiency and
scalability of load balancing."), and that commit and the XenServer
patch are functionally equivalent.

So, I'm not convinced about that being the actual cause of the
described behaviour. Tracing would be the way to tell (hopefully) for
sure.

Regards,
Dario
--=-309L7EfwlZW/NsC2aNEC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpqJqwACgkQFkJ4iaW4
c+7GlQ//fP8M2qUbZkYMQYqBhZq2DfzjJZEb35V8HPRAbX3g/inAw3MIK70qQJ2d
IdmAc9zPYMJcqZvd+CEh35pkzcooonfJju0gbSJb6REkuVnp4S+4vDqsMb28Yw1q
cd+Py+tCBostudoXgcN6KEbbUbqGC9DrY8IAcxjOiNahHs15T6ry/Sax5oFzoo5e
PfAEISLAff72YD9W0+0INUrv/lIiYCY9xU4Iu0djn7SbvYHayU8agMwQJwmuMZ36
DJKWFe7k9qrSCkQBxEj0yyCnpCcGRCVNySIBgcyMLjOiXC/vYEXxq6uv9mkCc0AX
W+2qKRJfm7BFF1C8b2FX9oCRUe8WNEoy00uThJ3nHpb+sx3AbD+PxGblXTCpoKNX
EeMWqaQgH1wA3O7XNVhVtOcZ6U1r9zR85trWoyOQVq0etWvHyjuPGPYiIanMw6Ut
PsFEJqS2jgHKM0Jx7tXTW5lG0+LgUltjGbD0h8s3x95LoMB4lha7EU4Iqi94CoNR
g6jPnCSWV7/7tQWNn6WIiOAMfPcl9vvVAxNcnh4ZvptbBTn62WRfG/XeviZsGKdz
HBrr8/7vfD/mNB07RpT1uWu7QTq/2VyZrMb3Z3nzQkz+BPALAsHWj0hHhkeZ3hsq
UG/6O+HHFFBe2afmC5z68EvSiYE6qwEkaSKmy2sbkJUXYroP6w8=
=UOEc
-----END PGP SIGNATURE-----

--=-309L7EfwlZW/NsC2aNEC--



--===============3244969468022536626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3244969468022536626==--
