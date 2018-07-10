From: Leon Romanovsky <leon@kernel.org>
Subject: Re: [RFC PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Tue, 10 Jul 2018 16:40:40 +0300
Message-ID: <20180710134040.GG3014__49582.7785962776$1531230098$gmane$org@mtr-leonro.mtl.com>
References: <20180622150242.16558-1-mhocko@kernel.org>
 <20180627074421.GF32348@dhcp22.suse.cz>
 <20180709122908.GJ22049@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0714391357505905875=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=+kbi=j2=kernel.org=leon@srs-us1.protection.inumbo.net>)
 id 1fcssn-000687-6z
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 13:40:45 +0000
In-Reply-To: <20180709122908.GJ22049@dhcp22.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Felix Kuehling <felix.kuehling@amd.com>, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>Mike Marciniszyn <mi>
List-Id: xen-devel@lists.xenproject.org


--===============0714391357505905875==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xugVLPVe/nLWwmIL"
Content-Disposition: inline


--xugVLPVe/nLWwmIL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 09, 2018 at 02:29:08PM +0200, Michal Hocko wrote:
> On Wed 27-06-18 09:44:21, Michal Hocko wrote:
> > This is the v2 of RFC based on the feedback I've received so far. The
> > code even compiles as a bonus ;) I haven't runtime tested it yet, mostly
> > because I have no idea how.
> >
> > Any further feedback is highly appreciated of course.
>
> Any other feedback before I post this as non-RFC?

=46rom mlx5 perspective, who is primary user of umem_odp.c your change look=
s ok.

Thanks

--xugVLPVe/nLWwmIL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJbRLdYAAoJEORje4g2clinszcP/i1ZoA12tkJ+VFRkYqorF+9B
+Z2snjMkSjj9Nz8XeYAzlg1RSNNeiTtFsN7UKrr6X484ccyy7oT//Nj5gGcxyEo3
qzAxMgRyD+xTbV97YJEVXpo7T6euNyH2ajtBDVwHQo14A6ZK2SIETUh9ssJhCumQ
9rv/UBFiJ/PjODzYNulmHvhILOt5QQc0UxoC1ApoGddv5bj5eaQeQ1xIBigZ1lZp
HCr53Z4NZ2WXiwMpHomBcD+Z2ZD2lRPUVWKsUYn8mU7iLzYGWOE3h8Ca0lEK74On
MAxdJT2ywBGWQ7XaIDEmWPs2xsV18qDKaUj6T/b0V6LD8T6DNrwyrjCUOZg8K08I
SdoWhHm1JADzOzPDDh2aHBpkPC9oIlWYGnFgGra87G+wXmwvegYIi3wady1d7VzI
RHSDQzcRiZqhGivXZPCqffXicAC3/PTWaLB2v1sm9LK+s8DoUcxW67RPDQmvB2Jj
cgqDTLvw+ikvXAhHhI4wfqE3ITAg6sOgQIxo+395/30Y1/sHprvEQDcc1jVm5avw
ueFriLICm7Kb0pYY/fUH6JxxbqIGEFW8oLC0hqalbMsIKLabWTHbEWmbCLkKj1c0
z0B2Vo0GLbEKRBwtbelQP9KQcPCG4x0OKMnZQ8jfiDsWPmTXYOu7108rKOf98a6N
gnaRbmsYcsnBMQtUAzSx
=Dfrg
-----END PGP SIGNATURE-----

--xugVLPVe/nLWwmIL--


--===============0714391357505905875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0714391357505905875==--
