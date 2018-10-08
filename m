From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/vtd: fix iommu_share_p2m_table
Date: Mon, 8 Oct 2018 12:50:33 +0200
Message-ID: <20181008105033.yahoyswwjui7u7tg@mac.bytemobile.com>
References: <20181008101445.38735-1-roger.pau@citrix.com>
 <5BBB326002000078001EF7D2@prv1-mh.provo.novell.com>
 <20181008103739.zlou3uwv7mlevrn6@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/pwx=mu=citrix.com=prvs=812c9b64b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g9T7a-0006uN-SB
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 10:50:42 +0000
Content-Disposition: inline
In-Reply-To: <20181008103739.zlou3uwv7mlevrn6@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMDgsIDIwMTggYXQgMTI6Mzc6MzlQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIE9jdCAwOCwgMjAxOCBhdCAwNDozMzowNEFNIC0wNjAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+ID4+PiBPbiAwOC4xMC4xOCBhdCAxMjoxNCwgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPiA+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9t
bXUuYwo+ID4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gPiA+IEBA
IC01MDUsNyArNTA1LDcgQEAgaW50IGlvbW11X2RvX2RvbWN0bCgKPiA+ID4gIAo+ID4gPiAgdm9p
ZCBpb21tdV9zaGFyZV9wMm1fdGFibGVpb21tdV9zaGFyZV9wMm1fdGFibGUoc3RydWN0IGRvbWFp
biogZCkKPiA+ID4gIHsKPiA+ID4gLSAgICBpZiAoIGlvbW11X3VzZV9oYXBfcHQoZCkgKQo+ID4g
PiArICAgIGlmICggaW9tbXVfZW5hYmxlZCAmJiBoYXBfZW5hYmxlZChkKSAmJiBpb21tdV9oYXBf
cHRfc2hhcmUgKQo+ID4gCj4gPiBDb25zaWRlcmluZyB0aGUgb25seSBjYWxsZXIsIHRoZSBoYXBf
ZW5hYmxlZCgpIHBhcnQgaXMgKGFuZCB3YXMpIG5vdAo+ID4gbmVlZGVkIGhlcmUuCj4gCj4gV291
bGQgeW91IGxpa2UgbWUgdG8gcmVtb3ZlIGl0IGluIHRoaXMgcGF0Y2g/CgpJJ3ZlIGNvbnZlcnRl
ZCBpdCB0byBhbiBBU1NFUlQgaW5zdGVhZCBvZiBqdXN0IHJlbW92aW5nIGl0LgoKUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
