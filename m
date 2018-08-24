From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Fri, 24 Aug 2018 15:01:32 +0200
Message-ID: <20180824130132.GP29735__12207.6763342649$1535115630$gmane$org@dhcp22.suse.cz>
References: <20180716115058.5559-1-mhocko@kernel.org>
 <8cbfb09f-0c5a-8d43-1f5e-f3ff7612e289@I-love.SAKURA.ne.jp>
 <20180824113248.GH29735@dhcp22.suse.cz>
 <b088e382-e90e-df63-a079-19b2ae2b985d@gmail.com>
 <20180824115226.GK29735@dhcp22.suse.cz>
 <a27ad1a3-34bd-6b7d-fd09-7737ec3c888d@gmail.com>
 <20180824120339.GL29735@dhcp22.suse.cz>
 <eb546bcb-9c5f-7d5d-43a7-bfde489f0e7f@amd.com>
 <20180824123341.GN29735@dhcp22.suse.cz>
 <b11df415-baf8-0a41-3c16-60dfe8d32bd3@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qojz=lh=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1ftBib-000772-S4
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 13:01:37 +0000
Content-Disposition: inline
In-Reply-To: <b11df415-baf8-0a41-3c16-60dfe8d32bd3@amd.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Leon Romanovsky <leonro@mellanox.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juerg
List-Id: xen-devel@lists.xenproject.org

T24gRnJpIDI0LTA4LTE4IDE0OjUyOjI2LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDI0
LjA4LjIwMTggdW0gMTQ6MzMgc2NocmllYiBNaWNoYWwgSG9ja286ClsuLi5dCj4gPiBUaGlraW5n
IGFib3V0IGl0IHNvbWUgbW9yZSwgSSBjYW4gaW1hZ2luZSB0aGF0IGEgbm90aWZpZXIgY2FsbGJh
Y2sgd2hpY2gKPiA+IHBlcmZvcm1zIGFuIGFsbG9jYXRpb24gbWlnaHQgdHJpZ2dlciBhIG1lbW9y
eSByZWNsYWltIGFuZCB0aGF0IGluIHR1cm4KPiA+IG1pZ2h0IHRyaWdnZXIgYSBub3RpZmllciB0
byBiZSBpbnZva2VkIGFuZCByZWN1cnNlLiBCdXQgbm90aWZpZXIKPiA+IHNob3VsZG4ndCByZWFs
bHkgYWxsb2NhdGUgbWVtb3J5LiBUaGV5IGFyZSBjYWxsZWQgZnJvbSBkZWVwIE1NIGNvZGUKPiA+
IHBhdGhzIGFuZCB0aGlzIHdvdWxkIGJlIGV4dHJlbWVseSBkZWFkbG9jayBwcm9uZS4gTWF5YmUg
SmVyb21lIGNhbiBjb21lCj4gPiB1cCBzb21lIG1vcmUgcmVhbGlzdGljIHNjZW5hcmlvLiBJZiBu
b3QgdGhlbiBJIHdvdWxkIHByb3Bvc2UgdG8gc2ltcGxpZnkKPiA+IHRoZSBsb2NraW5nIGhlcmUu
IFdlIGhhdmUgbG9ja2RlcCB0byBjYXRjaCBzZWxmIGRlYWRsb2NrcyBhbmQgaXQgaXMKPiA+IGFs
d2F5cyBiZXR0ZXIgdG8gaGFuZGxlIGEgc3BlY2lmaWMgaXNzdWUgcmF0aGVyIHRoYW4gaGF2aW5n
IGEgY29kZQo+ID4gd2l0aG91dCBhIGNsZWFyIGluZGljYXRpb24gaG93IGl0IGNhbiByZWN1cnNl
Lgo+IAo+IFdlbGwgSSBhZ3JlZSB0aGF0IHdlIHNob3VsZCBwcm9iYWJseSBmaXggdGhhdCwgYnV0
IEkgaGF2ZSBzb21lIGNvbmNlcm5zIHRvCj4gcmVtb3ZlIHRoZSBleGlzdGluZyB3b3JrYXJvdW5k
Lgo+IAo+IFNlZSB3ZSBhZGRlZCB0aGF0IHRvIGdldCByaWQgb2YgYSByZWFsIHByb2JsZW0gaW4g
YSBjdXN0b21lciBlbnZpcm9ubWVudCBhbmQKPiBJIGRvbid0IHdhbnQgdG8gdGhhdCB0byBzaG93
IHVwIGFnYWluLgoKSXQgd291bGQgcmVhbGx5IGhlbHAgdG8ga25vdyBtb3JlIGFib3V0IHRoYXQg
Y2FzZSBhbmQgZml4IGl0IHByb3Blcmx5CnJhdGhlciB0aGFuIHdvcmthcm91bmQgaXQgbGlrZSB0
aGlzLiBBbnl3YXksIGxldCBtZSB0aGluayBob3cgdG8gaGFuZGxlCnRoZSBub24tYmxvY2tpbmcg
bm90aWZpZXIgaW52b2NhdGlvbiB0aGVuLiBJIHdhcyBub3QgYWJsZSB0byBjb21lIHVwCndpdGgg
YW55dGhpbmcgcmVtb3RlbHkgc2FuZSB5ZXQuCi0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
