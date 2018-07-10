From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [RFC PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Tue, 10 Jul 2018 16:14:10 +0200
Message-ID: <20180710141410.GP14284__25372.1312540167$1531231975$gmane$org@dhcp22.suse.cz>
References: <20180622150242.16558-1-mhocko@kernel.org>
 <20180627074421.GF32348@dhcp22.suse.cz>
 <20180709122908.GJ22049@dhcp22.suse.cz>
 <20180710134040.GG3014@mtr-leonro.mtl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=trys=j2=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1fctPD-0002D5-7N
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 14:14:15 +0000
Content-Disposition: inline
In-Reply-To: <20180710134040.GG3014@mtr-leonro.mtl.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Felix Kuehling <felix.kuehling@amd.com>, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>Mike Marciniszyn <mi>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlIDEwLTA3LTE4IDE2OjQwOjQwLCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6Cj4gT24gTW9u
LCBKdWwgMDksIDIwMTggYXQgMDI6Mjk6MDhQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+
ID4gT24gV2VkIDI3LTA2LTE4IDA5OjQ0OjIxLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gPiA+IFRo
aXMgaXMgdGhlIHYyIG9mIFJGQyBiYXNlZCBvbiB0aGUgZmVlZGJhY2sgSSd2ZSByZWNlaXZlZCBz
byBmYXIuIFRoZQo+ID4gPiBjb2RlIGV2ZW4gY29tcGlsZXMgYXMgYSBib251cyA7KSBJIGhhdmVu
J3QgcnVudGltZSB0ZXN0ZWQgaXQgeWV0LCBtb3N0bHkKPiA+ID4gYmVjYXVzZSBJIGhhdmUgbm8g
aWRlYSBob3cuCj4gPiA+Cj4gPiA+IEFueSBmdXJ0aGVyIGZlZWRiYWNrIGlzIGhpZ2hseSBhcHBy
ZWNpYXRlZCBvZiBjb3Vyc2UuCj4gPgo+ID4gQW55IG90aGVyIGZlZWRiYWNrIGJlZm9yZSBJIHBv
c3QgdGhpcyBhcyBub24tUkZDPwo+IAo+IEZyb20gbWx4NSBwZXJzcGVjdGl2ZSwgd2hvIGlzIHBy
aW1hcnkgdXNlciBvZiB1bWVtX29kcC5jIHlvdXIgY2hhbmdlIGxvb2tzIG9rLgoKQ2FuIEkgYXNz
dW1lIHlvdXIgQWNrZWQtYnk/CgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IQotLSAKTWljaGFsIEhv
Y2tvClNVU0UgTGFicwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
