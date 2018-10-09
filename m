From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] libxl: Restore scheduling parameters after
 migrate in best-effort fashion
Date: Tue, 09 Oct 2018 12:21:25 +0200
Message-ID: <d0e34ec3963464e5d0da957e5bdb5e479aa87d88.camel@suse.com>
References: <20181002154926.24280-1-george.dunlap@citrix.com>
 <04dfacd1-4ff2-20b4-2bcd-df24ebe10ad6@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7399756514243627770=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fq0i=mv=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g9p8u-0001pf-5N
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 10:21:32 +0000
In-Reply-To: <04dfacd1-4ff2-20b4-2bcd-df24ebe10ad6@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============7399756514243627770==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-a9uL6N69JMNBSo/ax9UE"


--=-a9uL6N69JMNBSo/ax9UE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-10-03 at 12:53 +0200, Juergen Gross wrote:
> On 02/10/2018 17:49, George Dunlap wrote:
> > Commit 3b4adba ("tools/libxl: include scheduler parameters in the
> > output of xl list -l") added scheduling parameters to the set of
> > information collected by libxl_retrieve_domain_configuration(), in
> > order to report that information in `xl list -l`.
> >=20
> > Unfortunately, libxl_retrieve_domain_configuration() is also called
> > by
> > the migration / save code, and the results passed to the restore /
> > receive code.  This meant scheduler parameters were inadvertently
> > added to the migration stream, without proper consideration for how
> > to
> > handle corner cases.  The result was that if migrating from a host
> > running one scheduler to a host running a different scheduler, the
> > migration would fail with an error like the following:
> >=20
> > libxl: error: libxl_sched.c:232:sched_credit_domain_set: Domain
> > 1:Getting domain sched credit: Invalid argument
> > libxl: error: libxl_create.c:1275:domcreate_rebuild_done: Domain
> > 1:cannot (re-)build domain: -3
> >=20
> > Luckily there's a fairly straightforward way to set parameters in a
> > "best-effort" fashion.  libxl provides a single struct containing
> > the
> > parameters of all schedulers, as well as a parameter specifying
> > which
> > scheduler.  Parameters not used by a given scheduler are ignored.
> > Additionally, the struct contains a parameter to specify the
> > scheduler.  If you specify a specific scheduler,
> > libxl_domain_sched_params_set() will fail if there's a different
> > scheduler.  However, if you pass LIBXL_SCHEDULER_UNKNOWN, it will
> > use
> > the value of the current scheduler for that domain.
> >=20
> > In domcreate_stream_done(), before calling libxl__build_post(), set
> > the scheduler to LIBXL_SCHEDULER_UNKNOWN.  This will propagate
> > scheduler parameters from the previous instantiation on a best-
> > effort
> > basis.
> >=20
> > Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>=20
> Acked-by: Juergen Gross <jgross@suse.com>
>=20
Wei, Ian, ping?

We've reverted Credit2 as default scheduler, not because of a Credit2
own issue, but because of the bug fixed by this patch.

I think it would be both fair and appropriate to re-instate it (i.e.,
Credit2 as default), as soon as possible.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-a9uL6N69JMNBSo/ax9UE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlu8gSUACgkQFkJ4iaW4
c+591BAAyNTnHhzR1YW+2wo330O1fEU6te5nQ5bpVhUBDD00jGis1BJ0hZl3Q99A
IT5QoTJYmKJSovdKKVNIa3smPvK80vd91WZKqYihhYZnoPi5yFLGgHcT0kbSrcuz
R2AEp9xqmtEWhQcR0lOyFx5nSEzWBkad631Hrc3kPRmKvailVc4L8azLceCYxIj6
5WjLNXBRaOAfWTxAPg5ouiyDIuaeFSNZ9C3QZuJBWrSUM/gHnk6c76wZiOta3QJ6
HDm0aOoR78bED3sqRsbQHljHoE6LfFPp5qHZkiMeAyKYKyPfQwShhoglezfcLsfB
3KTNaeKZUUb4pJaVwijQ832WYaCBa0rMoIrMnTAbnCdUHn0/bs7pg9PBGZMOX+ey
JPiV4CNB+pd7/KuEhpte6z48ZNtCAkAnflDdCIVzDq2OCm8TckFuEKSu36Rh4Oyq
z9t5E6madRrv92W5jxADki6kicosgF/pbQJIfbX2XimhIBwm6RAajMDMl5Wf+cu2
rqsxQTSPukxAMgOhRqKNjbQMRRW5EsnWJmAzhjyk1ARm4+MS8311mDWXpsEgt9aC
/VIo9LrWqHFPBvYpKhvemprjGYuQOtwuef8cR8jZX1zVXG35XsyRyhNIL3H9G4Mo
IqSd1n04Nfa62ui9kjq4noMRdxaNOFsAmly/R8iV0OifNtRfuiQ=
=ffEY
-----END PGP SIGNATURE-----

--=-a9uL6N69JMNBSo/ax9UE--



--===============7399756514243627770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7399756514243627770==--
