From: Leon Romanovsky <leon@kernel.org>
Subject: Re: [RFC PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Mon, 16 Jul 2018 10:59:29 +0300
Message-ID: <20180716075929.GF3152__27370.3166087673$1531727896$gmane$org@mtr-leonro.mtl.com>
References: <20180622150242.16558-1-mhocko@kernel.org>
 <20180627074421.GF32348@dhcp22.suse.cz>
 <20180709122908.GJ22049@dhcp22.suse.cz>
 <20180710134040.GG3014@mtr-leonro.mtl.com>
 <20180710141410.GP14284@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6089111044142307884=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/bnx=ka=kernel.org=leon@srs-us1.protection.inumbo.net>)
 id 1feyPv-0006y9-Al
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 07:59:35 +0000
In-Reply-To: <20180710141410.GP14284@dhcp22.suse.cz>
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


--===============6089111044142307884==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 10, 2018 at 04:14:10PM +0200, Michal Hocko wrote:
> On Tue 10-07-18 16:40:40, Leon Romanovsky wrote:
> > On Mon, Jul 09, 2018 at 02:29:08PM +0200, Michal Hocko wrote:
> > > On Wed 27-06-18 09:44:21, Michal Hocko wrote:
> > > > This is the v2 of RFC based on the feedback I've received so far. The
> > > > code even compiles as a bonus ;) I haven't runtime tested it yet, mostly
> > > > because I have no idea how.
> > > >
> > > > Any further feedback is highly appreciated of course.
> > >
> > > Any other feedback before I post this as non-RFC?
> >
> > From mlx5 perspective, who is primary user of umem_odp.c your change looks ok.
>
> Can I assume your Acked-by?
>
> Thanks for your review!

For mlx and umem_odp pieces,
Acked-by: Leon Romanovsky <leonro@mellanox.com>

Thanks

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJbTFBhAAoJEORje4g2clinrPEQAM3K+7WNo+Ro9U49mpUc8xr/
MGGxTsfNW12jUSp6FCTQU6e53hUr+Xkr7HLA9V2PRM848OAOjQlBUKgCGQ4Mb1hQ
jaWFDf5PTXMiSwutJGhqJXuaYkFyLiR6oE0hdGoaPFRQ6TDkWeqXmP7MDOvJe9ml
Ea4dAgif8LEjYjGNOCUGJ6Ur89jJmf4D6EFcWhHyin7XejnD3z4vX0VcRbVwY8tl
H7w7S/TRXNE9gGUTid8i6eC81IG+p+xOaG0JhLcf95F0/sz7Y2gwWUzHWUScrn7A
m7mLXJf+hMGM6oVYxE224xTUbKkVXfYjYLzY9BZ7NB9ycKdi6aDL4diB2w+83acB
SplvTEfXKFVQtSKVyo24NoxEIscZyIHrJu0BaE8d002tvAcE2uiSmgUbQ/grXooe
8Fl8vyau1974/hx4bP6/Fclol25CUtqCatVw+x4vysEqferddvmFW0xOTzUorpTP
bI7zb9Ozs3icZ90Hhxk1jBe1Jmw8XIPGTCv06yDQOufFHxi2UnL2qKVxIrPLh/s5
xkJzguy/TxXk210mWnbWmpmytgKNsUQSMmYqyUEfxtzWlRHYWD3Z6KVUAsPsuy8J
b/fCbYfHzCTP2X4Vm4eoYTxI7YzByBnyIK/eAz1eKVlYbJb8yXx0bqzRbmn6gizc
jWDNXsZCJJ8q58BpwivZ
=YBIL
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--


--===============6089111044142307884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6089111044142307884==--
