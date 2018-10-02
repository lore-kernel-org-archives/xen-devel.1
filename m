From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [xen-unstable test] 128240: regressions - FAIL
Date: Tue, 02 Oct 2018 11:24:09 +0200
Message-ID: <dd29bed2a805194f2319ffe209790b6f5d7ac56d.camel@suse.com>
References: <osstest„128240„mainreport@xen.org>
	 <5BB1E30202000078001ED16E@prv1„mh.provo.novell.com>
	 <20181001143324.n6ghsnarvq6xslqt@zion.uk.xensource.com>
	 <5BB238E102000078001ED56E@prv1„mh.provo.novell.com>
	 <20181001151716.snpgmxh77crrmihq@zion.uk.xensource.com>
	 <15ad853f„b9ac„ba0b„3cc6„457b61ec787e@citrix.com>
	 <20181001153557.y4jgo37xzbaa5tgg@zion.uk.xensource.com>
	 <fc2bbc89„cfc7„d906„6fe0„b1fd76ddd2ff@citrix.com>
	 <26110706„a183„0c11„1efd„93ec76accd40@citrix.com>
	 <ffd0c284-c1c9-680c-564a-ce066a1fb210@suse.com>
	 <5BB32C7802000078001ED8FA@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8970691701013489610=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hhua=mo=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g7Gue-0003hA-CG
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 09:24:16 +0000
In-Reply-To: <5BB32C7802000078001ED8FA@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, osstest service owner <osstest-admin@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============8970691701013489610==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-iVtOjWQNclV03oTU5bYp"


--=-iVtOjWQNclV03oTU5bYp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-10-02 at 09:29 +0100, Jan Beulich wrote:
> > > > On 01.10.18 at 18:07, <jgross@suse.com> wrote:
> >=20
> > We should ignore a mismatch of the scheduler. Failures when setting
> > parameters for a matching scheduler should not be ignored IMO.
>=20
> Well, depends on whether the scheduler was explicitly chosen.
> I don't think migration should succeed when e.g. RTDS was used
> and isn't available on the destination host.
>=20
I'm not sure I'm understanding.

You're saying, that, e.g., the migration of a VM between, for instance:

- a Xen 4.11 host, booted without any sched=3D, and hence running Credit,
  and another Xen 4.11 host, booted with sched=3Dcredit2,

should fail _while_ :

- a migration between a Xen 4.11 host, booted without any sched=3D, and=20
  hence using Credit, and a Xen 4.12 host, booted without any sched=3D,=20
  and hence using Credit2 (if we switch),

should succeed ?

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-iVtOjWQNclV03oTU5bYp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluzOTkACgkQFkJ4iaW4
c+6NAxAAmHK/XaQSIGo57V9Xzo+nRADwbl7ImIIMHtryRa/g7GVAShzT4F/+lpTr
hntA5T1dwRV57oQY8KIjVKZZT0ntT1gOtbdoM9xh/I3V4BLI9BHSVzgVoE/ABosE
0wQiQhZzaUyoSkeQs/gVZ96EIUWIShG7FhPw0FUYrVM6gEeNf6O3eni13NyZ+S0d
mHaEd/HZ1ZlGmKU3h5NoZ7HKD5MIveXtDA3Nsm5KCVv7dZGt7aFbXmH5XkvGXCta
k9E6IFFZF/T+0eknt+xGJdA8R8xygSsc1V7zbP4b/f/EsXfU6EQBJvlnUB7uLmJx
a624pB2LFl+tOIh/93Lb4jJ1dxz52cf+3og6wACndpKu1oxTYjp2el04xOYsIsc4
XtBkTx3+zD/BwewWJGRiNKe52rpqkzsbvnWvxVwxHJYN3doFubhyu1w6SyPFg0pc
tbQwgR4YAaNQ1el5IuvTe5ebhxFl+TpNUEtg0KZi03qnY/p/NANvzVeEwzdc7+f6
WcG99h8VDVDk+4KmoWU06Nkc2F3xqi6UioH0zA9tWLD+KccPuw1vrOp2P5HBzYCn
NrZ+LzJ3szxviffU03llLCszf5LP7lyWlZdXZeVj2jfCJtqGpLVCloiJ5GwVGv/h
EmnTOJCm4+lYt+vF3pRH8jhleSaII7Tn1VeX+qvFZwSsCRPbRXE=
=rID1
-----END PGP SIGNATURE-----

--=-iVtOjWQNclV03oTU5bYp--



--===============8970691701013489610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8970691701013489610==--
