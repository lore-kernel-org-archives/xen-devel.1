From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v11 4/7] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Wed, 19 Sep 2018 17:18:18 +0100
Message-ID: <20180919161818.ta6ldzri6lyrihog@zion.uk.xensource.com>
References: <20180919083602.8201-1-paul.durrant@citrix.com>
 <20180919083602.8201-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2fBG-0004sJ-2b
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 16:18:22 +0000
Content-Disposition: inline
In-Reply-To: <20180919083602.8201-5-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMDk6MzU6NTlBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgaW1wbGljaXQgZG9tYWluX2NyYXNoKCkgZnJv
bSBpb21tdV9tYXAoKSwKPiB1bm1hcF9wYWdlKCkgYW5kIGlvbW11X2lvdGxiX2ZsdXNoKCkgYW5k
IHR1cm5zIHRoZW0gaW50byBzdHJhaWdodGZvcndhcmQKPiB3cmFwcGVycyB0aGF0IGNoZWNrIHRo
ZSBleGlzdGVuY2Ugb2YgdGhlIHJlbGV2YW50IGlvbW11X29wIGFuZCBjYWxsCj4gdGhyb3VnaCB0
byBpdC4gVGhpcyBtYWtlcyB0aGVtIHVzYWJsZSBieSBQViBJT01NVSBjb2RlIHRvIGJlIGRlbGl2
ZXJlZCBpbgo+IGZ1dHVyZSBwYXRjaGVzLgo+IFRoaXMgcGF0Y2ggYWRkcyBhIGhlbHBlciBtYWNy
bywgZG9tdV9jcmFzaCgpLCB0aGF0IHdpbGwgb25seSBpbnZva2UKPiBkb21haW5fY3Jhc2goKSBp
ZiB0aGUgZG9tYWluIGlzIG5vdCB0aGUgaGFyZHdhcmUgZG9tYWluIGFuZCBtb2RpZmllcwo+IGNh
bGxlcnMgb2YgaW9tbXVfbWFwKCksIHVubWFwX3BhZ2UoKSBhbmQgaW9tbXVfaW90bGJfZmx1c2go
KSB0byB1c2UgdGhpcwo+IHNob3VsZCBhbiBvcGVyYXRpb24gZmFpbC4KPiAKPiBOT1RFOiBUaGlz
IHBhdGNoIGluY2x1ZGVzIG9uZSBiaXQgb2YgY2xlYW4tdXAgaW4gc2V0X2lkZW50aXR5X3AybV9l
bnRyeSgpCj4gICAgICAgcmVwbGFjaW5nIHVzZSBvZiBwMm0tPmRvbWFpbiB3aXRoIHRoZSBkb21h
aW4gcG9pbnRlciBwYXNzZWQgaW50byB0aGUKPiAgICAgICBmdW5jdGlvbi4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtldmlu
IFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
