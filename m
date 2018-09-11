From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] schedule: move last_run_time to the credit
 scheduler privates
Date: Tue, 11 Sep 2018 18:08:49 +0200
Message-ID: <ffb0573275ab8116bcf1057effa4c1ab8e3f7fda.camel@suse.com>
References: <1536653449-26496-1-git-send-email-andrii.anisov@gmail.com>
 <5B977CFF02000078001E70C1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7426384328975841415=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3zb0=lz=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1fzlEH-0001xd-HN
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 16:09:29 +0000
In-Reply-To: <5B977CFF02000078001E70C1@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andrii.anisov@gmail.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7426384328975841415==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-wkfCkGtfsymswIrv9xTY"


--=-wkfCkGtfsymswIrv9xTY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-09-11 at 02:29 -0600, Jan Beulich wrote:
> > > > On 11.09.18 at 10:10, <andrii.anisov@gmail.com> wrote:
> >=20
> > From: Andrii Anisov <andrii_anisov@epam.com>
> >=20
> > diff --git a/xen/common/sched_credit.c b/xen/common/sched_credit.c
> > index 84e744b..7170172 100644
> >=20
> > @@ -701,10 +704,11 @@ static unsigned int vcpu_migration_delay_us;
> >  integer_param("vcpu_migration_delay", vcpu_migration_delay_us);
> > =20
> >  static inline bool
> > -__csched_vcpu_is_cache_hot(const struct csched_private *prv,
> > struct vcpu *v)
> > +__csched_vcpu_is_cache_hot(const struct csched_private *prv,
> > +                           struct csched_vcpu * scurr)
>=20
> Stray blank, and it looks like the parameter can be pointer to const.
> Similar further down.
>=20
And besides this that Jan is saying, I'd name the parameter 'svc'
rather than 'scurr'.

Calling it scurr makes one think that it is always a vcpu that is
currently running on a pcpu which is being passed to the function. But
that, not only is not at all required, but it is not even the case
right now.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-wkfCkGtfsymswIrv9xTY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluX6JEACgkQFkJ4iaW4
c+7p6A/9GHbZEhWK2F5PJ853iIjNGvtRXPDiPyfd7nO8RQg0fAtHlMh7RdmnGwi1
xUe4PNUYCHxVt9eUjfAGiKOM84TT0igM8c4Z+L3YolqlvrmcKDSJSmAk9ehdfx5G
/YpGmb7eeFYV2DlI8sE6ifMqN4G+QdTLabCrrspFxXrszTttuEu2a9WQBlAnpSeX
U3apy2PloEQOsRJfsujtuIGQQVCV+y2Z51b3t5mmdPbpT0GROgMgfMLls+bpOI2w
pZ7VZDaEe/5emkFVeWPPs4/8jJYua9tXjVj7tnXNgQ1YbMsyBkvIFTbwcfh/4gzo
U8VoxN6G8AKwG7Nf5ZdwWVo3QIRe7PQC0kDz+2vvC/HeDwG5skYzlMYAMTi1+JUy
RKiyNjZo7Y4Y4ANUDj5mkxUPqt0kFf9uzxvn5rHCqi5+3pDneW9Tak03jBdFxyTn
hrckl8Ce/fAuzYe9tQSBvPiKN9qpp8J5obiysuz+DzHWFlBThE0yao3ovIpqgDfJ
6nZk+JBqRHQrjHCnMY2Sj7bINP/yDCGA2yFo4hI2t5N7GlIOUxAYWP7bQ1nsDx6j
1s+TZejv2lN21GV0mrLNZfBMmhDWwxzgH+GGyZx4x4UdL+1nTFfIuEGAexIpnFfO
pGOJsOWXhnQACzFCkp2ibjJxBHzip6yBs//Txh8UcVaJJJzerhU=
=DsZC
-----END PGP SIGNATURE-----

--=-wkfCkGtfsymswIrv9xTY--



--===============7426384328975841415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7426384328975841415==--
