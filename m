From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Mon, 23 Jul 2018 09:11:54 +0200
Message-ID: <20180723071154.GC17905__10490.352768875$1532329846$gmane$org@dhcp22.suse.cz>
References: <20180716115058.5559-1-mhocko@kernel.org>
 <20180720170902.d1137060c23802d55426aa03@linux-foundation.org>
 <20180723070306.GB17905@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qqcr=kh=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1fhV0f-0004Hd-VB
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 07:11:57 +0000
Content-Disposition: inline
In-Reply-To: <20180723070306.GB17905@dhcp22.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Leon Romanovsky <leonro@mellanox.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uIDIzLTA3LTE4IDA5OjAzOjA2LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gT24gRnJpIDIw
LTA3LTE4IDE3OjA5OjAyLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+IFsuLi5dCj4gPiBQbGVhc2Ug
dGFrZSBhIGxvb2s/Cj4gCj4gQXJlIHlvdSBPSyB0byBoYXZlIHRoZXNlIGluIGEgc2VwYXJhdGUg
cGF0Y2g/CgpCdHcuIEkgd2lsbCByZWJhc2UgdGhpcyBwYXRjaCBvbmNlIG9vbSBzdHVmZiBpbiBs
aW51eC1uZXh0IHNldHRsZXMuIEF0CmxlYXN0IG9vbV9sb2NrIHJlbW92YWwgZnJvbSBvb21fcmVh
cGVyIHdpbGwgY29uZmxpY3QuCgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFicwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
