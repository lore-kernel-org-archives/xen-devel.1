From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v14 2/9] iommu: make use of type-safe DFN
 and MFN in exported functions
Date: Thu, 4 Oct 2018 16:14:18 +0100
Message-ID: <54190530-659d-acc8-1147-4f6e0892fc04@citrix.com>
References: <20181004104547.32316-1-paul.durrant@citrix.com>
 <20181004104547.32316-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wqag=mq=citrix.com=prvs=8089523ff=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g85Nc-0002M5-Rz
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:17:32 +0000
In-Reply-To: <20181004104547.32316-3-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDQvMjAxOCAxMTo0NSBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoaXMgcGF0Y2gg
bW9kaWZpZXMgdGhlIGRlY2xhcmF0aW9uIG9mIHRoZSBlbnRyeSBwb2ludHMgdG8gdGhlIElPTU1V
Cj4gc3ViLXN5c3RlbSB0byB1c2UgZGZuX3QgYW5kIG1mbl90IGluIHBsYWNlIG9mIHVuc2lnbmVk
IGxvbmcuIEEgc3Vic2VxdWVudAo+IHBhdGNoIHdpbGwgc2ltaWxhcmx5IG1vZGlmeSB0aGUgbWV0
aG9kcyBpbiB0aGUgaW9tbXVfb3BzIHN0cnVjdHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVs
IER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQt
Ynk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
