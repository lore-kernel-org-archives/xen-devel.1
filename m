From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [RFC PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Mon, 2 Jul 2018 13:54:23 +0200
Message-ID: <20180702115423.GK19043__30771.8898206533$1530532386$gmane$org@dhcp22.suse.cz>
References: <20180622150242.16558-1-mhocko@kernel.org>
 <20180627074421.GF32348@dhcp22.suse.cz>
 <71f4184c-21ea-5af1-eeb6-bf7787614e2d@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/git=js=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1fZxPW-0003Kc-Vr
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 11:54:27 +0000
Content-Disposition: inline
In-Reply-To: <71f4184c-21ea-5af1-eeb6-bf7787614e2d@amd.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Dennis
List-Id: xen-devel@lists.xenproject.org

T24gTW9uIDAyLTA3LTE4IDExOjE0OjU4LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDI3
LjA2LjIwMTggdW0gMDk6NDQgc2NocmllYiBNaWNoYWwgSG9ja286Cj4gPiBUaGlzIGlzIHRoZSB2
MiBvZiBSRkMgYmFzZWQgb24gdGhlIGZlZWRiYWNrIEkndmUgcmVjZWl2ZWQgc28gZmFyLiBUaGUK
PiA+IGNvZGUgZXZlbiBjb21waWxlcyBhcyBhIGJvbnVzIDspIEkgaGF2ZW4ndCBydW50aW1lIHRl
c3RlZCBpdCB5ZXQsIG1vc3RseQo+ID4gYmVjYXVzZSBJIGhhdmUgbm8gaWRlYSBob3cuCj4gPiAK
PiA+IEFueSBmdXJ0aGVyIGZlZWRiYWNrIGlzIGhpZ2hseSBhcHByZWNpYXRlZCBvZiBjb3Vyc2Uu
Cj4gCj4gVGhhdCBzb3VuZHMgbGlrZSBpdCBzaG91bGQgd29yayBhbmQgYXQgbGVhc3QgdGhlIGFt
ZGdwdSBjaGFuZ2VzIG5vdyBsb29rCj4gZ29vZCB0byBtZSBvbiBmaXJzdCBnbGFuY2UuCj4gCj4g
Q2FuIHlvdSBzcGxpdCB0aGF0IHVwIGZ1cnRoZXIgaW4gdGhlIHVzdWFsIHdheT8gRS5nLiBhZGRp
bmcgdGhlIGJsb2NrYWJsZQo+IGZsYWcgaW4gb25lIHBhdGNoIGFuZCBmaXhpbmcgYWxsIGltcGxl
bWVudGF0aW9ucyBvZiB0aGUgTU1VIG5vdGlmaWVyIGluCj4gZm9sbG93IHVwIHBhdGNoZXMuCgpC
dXQgc3VjaCBhIGNvZGUgd291bGQgYmUgYnJva2VuLCBubz8gSWdub3JpbmcgdGhlIGJsb2NrYWJs
ZSBzdGF0ZSB3aWxsCnNpbXBseSBsZWFkIHRvIGxvY2t1cHMgdW50aWwgdGhlIGZpeHVwIHBhcnRz
IGdldCBhcHBsaWVkLgpJcyB0aGUgc3BsaXQgdXAgcmVhbGx5IHdvcnRoIGl0PyBJIHdhcyB0aGlu
a2luZyBhYm91dCB0aGF0IGJ1dCBoYWQgaGFyZAp0aW1lcyB0byBlbmQgdXAgd2l0aCBzb21ldGhp
bmcgdGhhdCB3b3VsZCBiZSBiaXNlY3RhYmxlLiBXZWxsLCBleGNlcHQKZm9yIHJldHVybmluZyAt
RUJVU1kgdW50aWwgYWxsIG5vdGlmaWVycyBhcmUgaW1wbGVtZW50ZWQuIFdoaWNoIEkgZm91bmQK
Y29uZnVzaW5nLgoKPiBUaGlzIHdheSBJJ20gcHJldHR5IHN1cmUgRmVsaXggYW5kIEkgY2FuIGdp
dmUgYW4gcmIgb24gdGhlIGFtZGdwdS9hbWRrZmQKPiBjaGFuZ2VzLgoKSWYgeW91IGFyZSB3b3Jy
aWVkIHRvIGdpdmUgci1iIG9ubHkgZm9yIHRob3NlIHRoZW4gdGhpcyBjYW4gYmUgZG9uZSBldmVu
CmZvciBsYXJnZXIgcGF0Y2hlcy4gSnVzdCBtYWtlIHlvdXIgUmV2aWV3ZC1ieSBtb3JlIHNwZWNp
ZmljClItYjogbmFtZSAjIEZvciBCTEEgQkxBCi0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
