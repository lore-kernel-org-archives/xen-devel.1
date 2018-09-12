From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v8 1/6] iommu: rename iommu_dom0_strict and
 iommu_passthrough
Date: Wed, 12 Sep 2018 10:22:25 +0200
Message-ID: <20180912082225.yaicpyz5gmog4lvq@mac.bytemobile.com>
References: <20180907090739.56652-1-roger.pau@citrix.com>
 <20180907090739.56652-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nh++=l2=citrix.com=prvs=7864c2456=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g00Py-0002vb-Jy
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 08:22:34 +0000
Content-Disposition: inline
In-Reply-To: <20180907090739.56652-2-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMTE6MDc6MzRBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRvIGlvbW11X2h3ZG9tX3N0cmljdCBhbmQgaW9tbXVfaHdkb21fcGFzc3Rocm91
Z2ggd2hpY2ggaXMgbW9yZQo+IGRlc2NyaXB0aXZlIG9mIHRoZWlyIHVzYWdlLiBBbHNvIGNoYW5n
ZSB0aGVpciB0eXBlIGZyb20gYm9vbF90IHRvCj4gYm9vbC4KPiAKPiBObyBmdW5jdGlvbmFsIGNo
YW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPiBSZXZpZXdl
ZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgo+IENjOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlr
dWxwYW5pdEBhbWQuY29tPgo+IENjOiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4K
ClBpbmc/CgpDYW4gSSBwbGVhc2UgZ2V0IGFuIEFjayBvciBvdGhlcndpc2UgZnJvbSB0aGUgQU1E
IElPTU1VIG1haW50YWluZXJzPwoKVGhhbmtzLiBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
