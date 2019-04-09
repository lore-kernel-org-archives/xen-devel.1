From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] x86/IOMMU: abstract Intel-specific
 adjust_vtd_irq_affinities()
Date: Tue, 9 Apr 2019 03:13:40 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C9D570C@SHSMSX104.ccr.corp.intel.com>
References: <5CAB2DAA02000078002254F3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X9g6=SL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hDhCn-00070W-7u
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:13:49 +0000
In-Reply-To: <5CAB2DAA02000078002254F3@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IE1v
bmRheSwgQXByaWwgOCwgMjAxOSA3OjE3IFBNCj4gCj4gVGhpcyBjYW4ndCBiZSBmb2xkZWQgaW50
byB0aGUgcmVzdW1lIGhvb2ssIGFzIHRoYXQgcnVucyBiZWZvcmUgYnJpbmdpbgo+IGJhY2sgdXAg
QVBzLCBidXQgdGhlIGFmZmluaXR5IGFkanVzdG1lbnQgd2FudHMgdG8gaGFwcGVuIHdpdGggYWxs
IENQVXMKPiBiYWNrIG9ubGluZS4gSGVuY2UgYSBzZXBhcmF0ZSBob29rIGlzIG5lZWRlZCBzdWNo
IHRoYXQgQU1EIGNhbiB0aGVuCj4gbGV2ZXJhZ2UgaXQgYXMgd2VsbC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCgpSZXZpZXdlZC1ieTogS2V2
aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
