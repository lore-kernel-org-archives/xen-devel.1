From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v10 09/11] x86/ctxt: Issue a speculation
 barrier between vcpu contexts
Date: Fri, 26 Jan 2018 02:08:05 +0100
Message-ID: <1516928885.15341.72.camel@suse.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-10-git-send-email-andrew.cooper3@citrix.com>
 <5A6A0C7A02000078001A275A@prv-mh.provo.novell.com>
 <345bd2ef-1319-d9a6-522c-31e42bcd2c2e@citrix.com>
 <1516906149.15341.66.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3096193069869434590=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1516906149.15341.66.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dario.faggioli@citrix.com>, David Woodhouse <dwmw@amazon.co.uk>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============3096193069869434590==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-tSXY/M90tX7raWgZMUYb"


--=-tSXY/M90tX7raWgZMUYb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-01-25 at 19:49 +0100, Dario Faggioli wrote:
> On Thu, 2018-01-25 at 16:09 +0000, Andrew Cooper wrote:
> > On 25/01/18 15:57, Jan Beulich wrote:
> > >
> > > For the record, the overwhelming majority of calls to
> > > __sync_local_execstate() being responsible for the behavior
> > > come from invalidate_interrupt(), which suggests to me that
> > > there's a meaningful number of cases where a vCPU is migrated
> > > to another CPU and then back, without another vCPU having
> > > run on the original CPU in between. If I'm not wrong with this,
> > > I have to question why the vCPU is migrated then in the first
> > > place.
> >=20
> > Dario made a different fix to Credit1 upstream which was supposed
> > to
> > resolve this behaviour (although I can't locate the patch by a list
> > of
> > titles), but based on these observations, I'd say the misfeature
> > hasn't
> > been fixed.
> >=20
> Yes, it's 341450eaf753 ("xen: credit1: increase efficiency and
> scalability of load balancing."), and that commit and the XenServer
> patch are functionally equivalent.
>=20
> So, I'm not convinced about that being the actual cause of the
> described behaviour. Tracing would be the way to tell (hopefully) for
> sure.
>=20
And in order to go and investigate this a bit further, Jan, what is it
that you were doing when you saw what you described above? AFAIUI,
that's booting an HVM guest, isn't it?

How many vCPUs on how many pCPUs? Basically, I would just need a
confirmation that the system was not oversubscribed, but if, while
we're here, you can tell me the details, I'll put together an as much
as possible similar scenario.

Thanks,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-tSXY/M90tX7raWgZMUYb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpqf3YACgkQFkJ4iaW4
c+5MLQ/9F34jxkgSA7NnwAlbsOwXJEN30/M+G8zol2PBgU85zfRRIFyYdzVKZvhK
il2ahtQEd567Cy9ljeo7cZ8CRS6wlfRowrfXe0au+mxos7b+0PsZscfR9Ie9ni64
iUtBWce3SMSjg5qRdR9plQhbPoKAZnu8ezWxD33EERSuopTZUmTNAUHNRGu/PIc5
k8BCD3h0QvhpFacMVEnDYnttiS1zz4JQUMbOhYc9Zny35SbD6VPLuMvH2OYELZj+
DcH58Cb7mJDRszTkYvnASI14Vsp+N89daKII41+VJKSH95EKS3iOKEwfVpfqmfw5
pqTfiJAe80SA19y0ZezidnLZQd5V5RLceeV/ffvbjxCpraftAdGsTLVabHvT9HPY
8BB8tWoUUrxRriZZtD7UrC053q9/MPw68pIhL5xFSiF/j/N5o+wNJibcZecrZnGQ
TPke8HkYAeR3tGTA5lhuNdl9OUZlAjTNE0xn1HTpKNvR6sUglBGtp3yHeE8WvHw6
XW2HTNwL3liMPNplM2rcPOtVHu7w6lbSCBj43WHbIcaHsoNg861u+xuow8zdOm8/
NcKKkiNJZk+OGHLtWRu0zDrFMuMAmaz68wHbyhG4JeY15Pri8I6IVlHeREvr5B6C
mJmjxR1VTtRFKrOYbdY/MMljMVosrhxA88Qze6eAxxd9P9YCLKg=
=r7xo
-----END PGP SIGNATURE-----

--=-tSXY/M90tX7raWgZMUYb--



--===============3096193069869434590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3096193069869434590==--
