From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH v1 0/8] Series short description
Date: Wed, 07 Nov 2018 18:58:35 +0100
Message-ID: <2ac529aea69ec34e08dbed2fedd614e4f69df7a0.camel@suse.com>
References: <153936590062.22652.12114301510794181099.stgit@wayrath>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3457295618795926511=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3bvd=ns=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gKS66-0001gP-6F
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 17:58:34 +0000
In-Reply-To: <153936590062.22652.12114301510794181099.stgit@wayrath>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bhavesh Davda <bhavesh.davda@oracle.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3457295618795926511==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-CAPQdSU1+NldscoRY7n2"


--=-CAPQdSU1+NldscoRY7n2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-10-12 at 19:43 +0200, Dario Faggioli wrote:
> Hello,
>=20
> Here it comes, core-scheduling for Credit2 as well. Well, this time,
> it's actually group-scheduling (see below).
>=20
>  git://xenbits.xen.org/people/dariof/xen.git rel/sched/credit2/group-
> scheduling-RFCv1
> =20
> http://xenbits.xen.org/gitweb/?p=3Dpeople/dariof/xen.git;a=3Dshortlog;h=
=3Drefs/heads/rel/sched/credit2/group-scheduling-RFCv1
>=20
>  (Or=20
> https://github.com/fdario/xen/tree/rel/sched/credit2/group-scheduling-RFC=
v1
> ,
>   Or=20
> https://gitlab.com/dfaggioli/xen/tree/rel/sched/credit2/group-scheduling-=
RFCv1
> )
>=20
> An RFC series implementing the same feature for Credit1 is here:
> https://lists.xenproject.org/archives/html/xen-devel/2018-08/msg02164.htm=
l
>=20
> The two series, however, are completely independent, and I'd
> recommend
> focusing on this one first. In fact, implementing the feature here in
> Credit2 was waaay simpler, and the result is, IMO, already a lot
> better.
>=20
> Therefore, I expect that the amount of effort required for making
> this
> very series upstreamable to be much smaller than for the Credit1 one.
> When this is in, we'll have one scheduler that supports
> group-scheduling, and we can focus on what to do with the others.
>=20
> Let me also point out, that there is some discussion (in the thread
> of
> the Credit1 RFC series [1]), about whether a different approach
> toward
> implementing core/group-scheduling wouldn't be better. I had this
> code
> almost ready already, and so I decided to send it out anyway. If it
> then
> turns out that we have to throw it away, then fine. But, so far, I'm
> all
> but convinced that the way things are done in this series is not our
> current best solution to deal with the problems we have at hand.
>=20
> So, what's in here? Well, we have a generic group scheduling
> implementation which seems to me to work reasonably well... For an
> RFC. ;-P
>=20
> I call it generic because, although the main aim is core-scheduling,
> it
> can be made to work (and in fact, it already kind of does) with
> different grouping (like node, socket, or arbitrary sets of CPUs).
>=20
> I does not have the fairness and starvation issues that the RFC
> series
> for Credit1 liked above has. I.e., it already sort-of works. :-D
>=20
> Some improvements are necessary, mostly because Credit2 is not a
> fully
> work conserving scheduler, and this hurts when we do things like
> group
> scheduling. So we need to add logic for doing some quick load-
> balancing,
> or work stealing, when a CPU goes idle, but that is not that much of
> a
> big deal (I was already thinking to add it anyway).
>=20
> Finding a way of considering group-scheduling while doing proper load
> balancing is also on my todo list. It is less easy than the work
> conserving-ification described above, but also less important, IMO.
>=20
So... Any idea? Thoughts? First impressions? :-D

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-CAPQdSU1+NldscoRY7n2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvjJ8sACgkQFkJ4iaW4
c+55ChAA3c2D2rHgwIAptSc8tqv6qIUTHJiqEDLFc9GbLVfNi56hd+tBGk7XPf3+
4QoKciWBl7zmBQ4n7NQndSugDIva99D7epVYb05XlGm5MzYNZgCyGq91pvzmpX77
Xtam/oBPqYHhrwZX51L/8zZVsjJE+yOkl7Y5BE9o03jzRCpKSMbiiV1n9hCtFlR1
bCR7m7aXrJXZGfG7lYZTu+HuOa+Mhmeq0LneWfME2jxyg1C7iZmxasxCCDxJK9iB
rkhailH3fHVN25/XWQwflmFP6ee+GRogXsAvhGs0sXTBrCNUsIlg37t4VxDxk85e
LQAL5Lb27ED6fdHGHnnkxT5HiBjSncmrc8fXziXSWI3AtZbJANTbAMEus1Z+jkuz
uhNqoPreAls2IdS7LnY2e4Vh5xVMjfQo8HUc4nVUjl4/C6PnxbaAqU9cun3C5Q4b
AZ5BOaPZt1NpPc62mIuUWuT0XSs5a9eqLy1F8y4sRmYam2DpXvIj5HTv2QGTy4E0
KhaeT0ipwNJNsszql3307Hw0VYYnEjqn3C6rIMjdtJSCGkMRIBc+baTOGPgyZ3cL
10M6OCAeT4aGPEjLiDTeWGV/h8sEQZ/bkSO5AGWSSdIYXgLYUmuytcG5l+8vcB4j
sUjNEfJu6M+EgYJRc+3GaJVBmJTydLXoryyEAYP9Q5iAqFECzk8=
=q9Lz
-----END PGP SIGNATURE-----

--=-CAPQdSU1+NldscoRY7n2--



--===============3457295618795926511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3457295618795926511==--
