From: Leon Romanovsky <leonro@mellanox.com>
Subject: Re: [PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Tue, 17 Jul 2018 07:03:47 +0300
Message-ID: <20180717040347.GT3152__3043.53114120222$1531803414$gmane$org@mtr-leonro.mtl.com>
References: <20180716115058.5559-1-mhocko@kernel.org>
 <20180716161249.c76240cd487c070fb271d529@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0787223169248974598=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=km7c=kb=mellanox.com=leonro@srs-us1.protection.inumbo.net>)
 id 1ffHDY-0007V3-QS
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 04:04:04 +0000
In-Reply-To: <20180716161249.c76240cd487c070fb271d529@linux-foundation.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.c>
List-Id: xen-devel@lists.xenproject.org


--===============0787223169248974598==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cW+P/jduATWpL925"
Content-Disposition: inline


--cW+P/jduATWpL925
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 16, 2018 at 04:12:49PM -0700, Andrew Morton wrote:
> On Mon, 16 Jul 2018 13:50:58 +0200 Michal Hocko <mhocko@kernel.org> wrote:
>
> > From: Michal Hocko <mhocko@suse.com>
> >
> > There are several blockable mmu notifiers which might sleep in
> > mmu_notifier_invalidate_range_start and that is a problem for the
> > oom_reaper because it needs to guarantee a forward progress so it cannot
> > depend on any sleepable locks.
> >
> > Currently we simply back off and mark an oom victim with blockable mmu
> > notifiers as done after a short sleep. That can result in selecting a
> > new oom victim prematurely because the previous one still hasn't torn
> > its memory down yet.
> >
> > We can do much better though. Even if mmu notifiers use sleepable locks
> > there is no reason to automatically assume those locks are held.
> > Moreover majority of notifiers only care about a portion of the address
> > space and there is absolutely zero reason to fail when we are unmapping an
> > unrelated range. Many notifiers do really block and wait for HW which is
> > harder to handle and we have to bail out though.
> >
> > This patch handles the low hanging fruid. __mmu_notifier_invalidate_range_start
> > gets a blockable flag and callbacks are not allowed to sleep if the
> > flag is set to false. This is achieved by using trylock instead of the
> > sleepable lock for most callbacks and continue as long as we do not
> > block down the call chain.
>
> I assume device driver developers are wondering "what does this mean
> for me".  As I understand it, the only time they will see
> blockable==false is when their driver is being called in response to an
> out-of-memory condition, yes?  So it is a very rare thing.

I can't say for everyone, but at least for me (mlx5), it is not rare event.
I'm seeing OOM very often while I'm running my tests in low memory VMs.

Thanks

>
> Any suggestions regarding how the driver developers can test this code
> path?  I don't think we presently have a way to fake an oom-killing
> event?  Perhaps we should add such a thing, given the problems we're
> having with that feature.

--cW+P/jduATWpL925
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJbTWqjAAoJEORje4g2clinGqAP+gKzC/GfmPDn9AVen4vgye2r
8ZHefQ6uHWv4nJE61TvooYoxviDwWVXtXhUT+MnvEvQ43UMMtfUc4ZyBaHovPPmr
a6eXZGQP9+08P4l3nl3dPg1H9D1ynkxSqKLJykEM+xSzWy16+F3JYQXUnTcujqrn
m/eiJ9hHXL2sS2w7Xwj1BLmCmeMJ/e7v6Og0eUkXeCIYHrtBfUziO+XhMwU6BEKE
uNsyROY/ua4XvzuHWwGmUbM0pT1Pk/qvkHGK8RP1jkBbzS0nlYZoKKtlgH0E3Cot
ifa7ZfLQT4kG1KttzXX7ZVuwxK+wyKHhykJxlJIRl/uDSbmdEjRcNPFwAwzAsQLG
ZMjnx2wo9tqlBMSdwlwtZBc8H8MPagM5pLypQTIFdMmvD/lGVGXk2/rwP2dixw/W
V/j9V5eWAkjkp2hg5KxZLSW0nK7e1bEreZesEejfWb/tZGpEWjOtDfv+F9drZZ8O
iqvT56/bALDpLSvSDaCTxbfVpZf6wm+eKE4DkwIBzl8cTyRp7136JKnDJ0FVse/Z
OGqa7WWV1LTVMAHzRsHpX9HrTPpRKxFuZYYB8Z5NTeHa0TVqjsuOYo5uf5SfVsS5
3BeOAh2ncekLrn5WyVnY78PaXLzJ1vUCtvQGOYMX6fwI15+63z3+BH8t46ulmJed
MuCRD555f27+kAwtDYmE
=gzyd
-----END PGP SIGNATURE-----

--cW+P/jduATWpL925--


--===============0787223169248974598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0787223169248974598==--
