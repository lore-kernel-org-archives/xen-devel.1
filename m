From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v5 05/15] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Tue, 7 Aug 2018 02:55:50 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912AC0E6@SHSMSX101.ccr.corp.intel.com>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tozp=kw=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fmsAA-0005lQ-Ce
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 02:55:58 +0000
In-Reply-To: <20180803172220.1657-6-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0KPiBT
ZW50OiBTYXR1cmRheSwgQXVndXN0IDQsIDIwMTggMToyMiBBTQo+IAo+IFR1cm4gaW9tbXVfbWFw
L3VubWFwX3BhZ2UoKSBpbnRvIHN0cmFpZ2h0Zm9yd2FyZCB3cmFwcGVycyB0aGF0IGNoZWNrCj4g
dGhlCgppb21tdV9pb3RsYl9mbHVzaCBpcyBhbHNvIGNoYW5nZWQuCgo+IGV4aXN0ZW5jZSBvZiB0
aGUgcmVsZXZhbnQgaW9tbXVfb3AgYW5kIGNhbGwgdGhyb3VnaCB0byBpdC4gVGhpcyBtYWtlcyB0
aGVtCj4gdXNhYmxlIGJ5IFBWIElPTU1VIGNvZGUgdG8gYmUgZGVsaXZlcmVkIGluIGZ1dHVyZSBw
YXRjaGVzLgo+IExlYXZlIHRoZSBkZWNpc2lvbiBvbiB3aGV0aGVyIHRvIGludm9rZSBkb21haW5f
Y3Jhc2goKSB1cCB0byB0aGUgY2FsbGVyLgo+IFRoaXMgaGFzIHRoZSBhZGRlZCBiZW5lZml0IHRo
YXQgdGhlIChtb2R1bGUvbGluZSBudW1iZXIpIG1lc3NhZ2UgdGhhdAo+IGRvbWFpbl9jcmFzaCgp
IHNwaXRzIG91dCB3aWxsIGJlIG1vcmUgaW5kaWNhdGl2ZSBvZiB3aGVyZSB0aGUgcHJvYmxlbSBs
aWVzLgo+IAo+IE5PVEU6IFRoaXMgcGF0Y2ggaW5jbHVkZXMgb25lIGJpdCBvZiBjbGVhbi11cCBp
biBzZXRfaWRlbnRpdHlfcDJtX2VudHJ5KCkKPiAgICAgICByZXBsYWNpbmcgdXNlIG9mIHAybS0+
ZG9tYWluIHdpdGggdGhlIGRvbWFpbiBwb2ludGVyIHBhc3NlZCBpbnRvIHRoZQo+ICAgICAgIGZ1
bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNp
dHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUu
Y2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4sIHdpdGggb25l
IHNtYWxsIGNvbW1lbnQ6Cgo+IAo+ICAgICAgaWYgKCBuZWVkX2lvbW11KHAybS0+ZG9tYWluKSAm
Jgo+ICAgICAgICAgICAobHBhZV92YWxpZChvcmlnX3B0ZSkgfHwgbHBhZV92YWxpZCgqZW50cnkp
KSApCj4gKyAgICB7Cj4gICAgICAgICAgcmMgPSBpb21tdV9pb3RsYl9mbHVzaChwMm0tPmRvbWFp
biwgX2JmbihnZm5feChzZ2ZuKSksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAx
VUwgPDwgcGFnZV9vcmRlcik7Cj4gKyAgICAgICAgaWYgKCB1bmxpa2VseShyYykgJiYgIWlzX2hh
cmR3YXJlX2RvbWFpbihwMm0tPmRvbWFpbikgKQo+ICsgICAgICAgICAgICBkb21haW5fY3Jhc2go
cDJtLT5kb21haW4pOwo+ICsgICAgfQoKdG8gcmVkdWNlIGR1cGxpY2F0aW9uLCBkb2VzIGl0IG1h
a2Ugc2Vuc2UgdG8gaW50cm9kdWNlIGEgd3JhcHBlcgpsaWtlIGRvbWFpbl9jcmFzaF9uZCAoJ25k
JyBpbmRpY2F0ZSAhaXNfaGFyZHdhcmVfZG9tYWluLCBhbmQKYmVjb21lcyBhIG5vcCBmb3IgaGFy
ZHdhcmUgZG9tYWluKT8gVGhlbiBpdCBiZWNvbWVzOgoKCWlmICggdW5saWtlbHkocmMpICkKCQlk
b21haW5fY3Jhc2hfbmQocDJtLT5kb21haW4pOwoKVGhhbmtzCktldmluCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
