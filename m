From: Arun KS <arunks@codeaurora.org>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Tue, 06 Nov 2018 11:01:53 +0530
Message-ID: <7bfdb58cbd896a9f62c7dc2219ea1c08__36611.5462304608$1541482252$gmane$org@codeaurora.org>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <72215e75-6c7e-0aef-c06e-e3aba47cf806@suse.cz>
 <efb65160af41d0e18cb2dcb30c2fb86a@codeaurora.org>
 <20181010173334.GL5873@dhcp22.suse.cz>
 <a2d576a5fc82cdf54fc89409686e58f5@codeaurora.org>
 <20181011075503.GQ5873@dhcp22.suse.cz>
 <20181018191825.fcad6e28f32a3686f201acdf@linux-foundation.org>
 <20181019080755.GK18839@dhcp22.suse.cz>
 <c6289fada694462ed708174f9a1f3b6c@codeaurora.org>
 <beaa1acf7423da7ee0f9bbc4cee2d14a@codeaurora.org>
 <20181105134400.f6f52f4db0f8d6a21446476e@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=om/v=nr=codeaurora.org=arunks@srs-us1.protection.inumbo.net>)
 id 1gJty1-0003yQ-E1
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 05:31:57 +0000
In-Reply-To: <20181105134400.f6f52f4db0f8d6a21446476e@linux-foundation.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: vatsa@codeaurora.org, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, dan.j.williams@intel.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, boris.ostrovsky@oracle.com, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC0xMS0wNiAwMzoxNCwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPiBPbiBNb24sIDA1IE5v
diAyMDE4IDE1OjEyOjI3ICswNTMwIEFydW4gS1MgPGFydW5rc0Bjb2RlYXVyb3JhLm9yZz4gCj4g
d3JvdGU6Cj4gCj4+IE9uIDIwMTgtMTAtMjIgMTY6MDMsIEFydW4gS1Mgd3JvdGU6Cj4+ID4gT24g
MjAxOC0xMC0xOSAxMzozNywgTWljaGFsIEhvY2tvIHdyb3RlOgo+PiA+PiBPbiBUaHUgMTgtMTAt
MTggMTk6MTg6MjUsIEFuZHJldyBNb3J0b24gd3JvdGU6Cj4+ID4+IFsuLi5dCj4+ID4+PiBTbyB0
aGlzIHBhdGNoIG5lZWRzIG1vcmUgd29yaywgeWVzPwo+PiA+Pgo+PiA+PiBZZXMsIEkndmUgdGFs
a2VkIHRvIEFydW4gKGhlIGlzIG9mZmxpbmUgdW50aWwgbmV4dCB3ZWVrKSBvZmZsaXN0IGFuZAo+
PiA+PiBoZQo+PiA+PiB3aWxsIHBsYXkgd2l0aCB0aGlzIHNvbWUgbW9yZS4KPj4gPgo+PiA+IENv
bnZlcnRlZCB0b3RhbGhpZ2hfcGFnZXMsIHRvdGFscmFtX3BhZ2VzIGFuZCB6b25lLT5tYW5hZ2Vk
X3BhZ2UgdG8KPj4gPiBhdG9taWMgYW5kIHRlc3RlZCBob3QgYWRkLiBMYXRlbmN5IGlzIG5vdCBl
ZmZlY3RlZCB3aXRoIHRoaXMgY2hhbmdlLgo+PiA+IFdpbGwgc2VuZCBvdXQgYSBzZXBhcmF0ZSBw
YXRjaCBvbiB0b3Agb2YgdGhpcyBvbmUuCj4+IEhlbGxvIEFuZHJldy9NaWNoYWwsCj4+IAo+PiBX
aWxsIHRoaXMgYmUgZ29pbmcgaW4gc3Vic2VxdWVudCAtcmNzPwo+IAo+IEkgdGhvdWdodCB3ZXJl
IGF3YWl0aW5nIGEgbmV3IHZlcnNpb24/ICAiV2lsbCBzZW5kIG91dCBhIHNlcGFyYXRlIHBhdGNo
Cj4gb24gdG9wIG9mIHRoaXMgb25lIj8KClNvcnJ5IGZvciBjb25mdXNpb24uIEkgc2VudCBvdXQg
YW4gaW5jcmVtZW50YWwgcGF0Y2ggY29udmVydGluZyBjb3VudGVycyAKdG8gYXRvbWljcy4KCmh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTA2NTcyMTcvCgoKPiAKPiBJIGRvIHRo
aW5rIGEgcmVzZW5kIHdvdWxkIGJlIHVzZWZ1bCwgcGxlYXNlLiAgRW5zdXJlIHRoZSBjaGFuZ2Vs
b2cgaXMKPiB1cGRhdGVkIHRvIGNhcHR1cmUgdGhlIGFib3ZlIGluZm8gYW5kIGFueSBvdGhlciB3
b3J0aHkgaXNzdWVzIHdoaWNoCj4gYXJvc2UgZHVyaW5nIHJldmlldy4KCldpbGwgZG8gdGhhdC4K
ClJlZ2FyZHMsCkFydW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
