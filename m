From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] x86/xen: Add "xen_timer_slop" command line
 option
Date: Sat, 23 Mar 2019 03:58:16 +0100
Message-ID: <52bfeae7c256faec444b69efe58d363ad60c3fc5.camel__4495.11141502939$1553309990$gmane$org@suse.com>
References: <1553279397-130201-1-git-send-email-ryan.thibodeaux@starlab.io>
 <abf65a68-9463-0f0e-1f51-6eefd3cacc88@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0368794656853357770=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MgHg=R2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h7Wrt-0007xP-NP
 for xen-devel@lists.xenproject.org; Sat, 23 Mar 2019 02:58:45 +0000
In-Reply-To: <abf65a68-9463-0f0e-1f51-6eefd3cacc88@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, thibodux@gmail.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, ryan.thibodeaux@starlab.io, tglx@linutronix.de, luca abeni <luca.abeni@santannapisa.it>, oleksandr_andrushchenko@epam.com
List-Id: xen-devel@lists.xenproject.org


--===============0368794656853357770==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-HnIYLTilu4YL1C/gCxSx"


--=-HnIYLTilu4YL1C/gCxSx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-03-22 at 18:10 -0400, Boris Ostrovsky wrote:
> On 3/22/19 2:29 PM, thibodux@gmail.com wrote:
> > From: Ryan Thibodeaux <ryan.thibodeaux@starlab.io>
> >=20
> > The original timer slop value has not changed since the
> > introduction
> > of the Xen-aware Linux kernel code. This commit provides users an
> > opportunity to tune timer performance given the refinements to
> > hardware and the Xen event channel processing. It also mirrors
> > a feature in the Xen hypervisor - the "timer_slop" Xen command line
> > option.
>=20
> Is there any data that shows effects of using this new parameter?
>=20
Yes, I've done some research and experiments on this. I did it together
with a friend, which I'm Cc-ing, as I'm not sure we're ready/capable to
share the results, yet (Luca?).

What I think I can anticipate is that having such a high value for
timer slop in the kernel, for the Xen clockevent device is (together
with the also quite high default value of timer_slop in Xen itself)
responsible for really high vcpu wakeup latencies.

Lowering those two values, reduces such latencies dramatically.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-HnIYLTilu4YL1C/gCxSx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyVoMgACgkQFkJ4iaW4
c+52Kg//eFjYf2HKPb7vNVUox18exTWL9qtU97e92MAVB/ikaUUucDfysCqZdSob
6b2tkrUBpM3D3691Ro4715p0dRhXubMRit08Y91La9UcGuamaXgECnHep0EoN3lw
CKh6PLUwu4OIfZ5fElhO3ZbMzBW4k2aHTnLCq5h9fZF1DqfOTXhu19K5DREHb+FH
Qlbok5iT+zIaRdWr+UHU4XJ+pTL8Nj1Pc1VsOq8iyKSA6152xDQ/oCYh9M5MT4UE
io1s0Kf7xKkF6msKQSQu3iLsLXboxRZmlW0QeTv0pA48MOB2NWQDYqPb23kLVy4v
W9zGzHAxJcfqT6+RbfFResGfn8W92St2EGsP9PkN/dM4L4ZDZidXYtyXAToNAdqC
kNwpJ0ezplM7/1x++tGhWRQLAKYNRKgfRTrPuIdMELQz9z1ZD/Mo8nmBeBj6YC+j
LLyT7n+BqGjE66kdo1Hghl1ZxdTrQYaC9xSH/P0NvaMCNll7HbOPKPSU19WySzZn
Is+N9yUf9NG2uxNRva/0b8GMGvKZH3DgrOs+O9rEkkCvArTyJZleuZjrC92fU5uf
kq0BPNPcIMc/d+jaUIsToJetlpB2jFpCiSAE9duEWpPZcsB2JUEEcNsvJkqxluhj
n2fjWizfFbMYip6wUckcbI4D6BxTcRy6DnjICQLIs5GK4aqyYnM=
=Ujww
-----END PGP SIGNATURE-----

--=-HnIYLTilu4YL1C/gCxSx--



--===============0368794656853357770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0368794656853357770==--
