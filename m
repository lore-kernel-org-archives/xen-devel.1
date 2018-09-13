From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v7 2/6] iommu: make use of type-safe DFN and
 MFN in exported functions
Date: Thu, 13 Sep 2018 10:09:44 +0200
Message-ID: <20180913080944.l5dvayao32nhzwgv@mac.bytemobile.com>
References: <20180912113028.19610-1-paul.durrant@citrix.com>
 <20180912113028.19610-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m7pv=l3=citrix.com=prvs=787f1cd73=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g0MhQ-0003Mr-98
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 08:10:04 +0000
Content-Disposition: inline
In-Reply-To: <20180912113028.19610-3-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTIsIDIwMTggYXQgMTI6MzA6MjRQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggbW9kaWZpZXMgdGhlIGRlY2xhcmF0aW9uIG9mIHRoZSBlbnRyeSBw
b2ludHMgdG8gdGhlIElPTU1VCj4gc3ViLXN5c3RlbSB0byB1c2UgZGZuX3QgYW5kIG1mbl90IGlu
IHBsYWNlIG9mIHVuc2lnbmVkIGxvbmcuIEEgc3Vic2VxdWVudAo+IHBhdGNoIHdpbGwgc2ltaWxh
cmx5IG1vZGlmeSB0aGUgbWV0aG9kcyBpbiB0aGUgaW9tbXVfb3BzIHN0cnVjdHVyZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJl
dmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPiBBY2tlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
