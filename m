From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] x86/mtrr: fix build with gcc9
Date: Thu, 7 Mar 2019 11:55:54 +0100
Message-ID: <20190307105554.42ek2lerz7nujfef@Air-de-Roger>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
 <5C80F32C020000780021C626@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZO0X=RK=citrix.com=prvs=96265d518=roger.pau@srs-us1.protection.inumbo.net>)
 id 1h1qh0-0002ah-0Y
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 10:56:02 +0000
Content-Disposition: inline
In-Reply-To: <5C80F32C020000780021C626@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Charles Arnold <CARNOLD@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMDM6MzI6MTJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gZ2VuZXJpYy5jOiBJbiBmdW5jdGlvbiDigJhwcmludF9tdHJyX3N0YXRl4oCZOgo+IGdl
bmVyaWMuYzoyMTA6MTE6IGVycm9yOiDigJglMCpseOKAmSBkaXJlY3RpdmUgb3V0cHV0IGJldHdl
ZW4gMSBhbmQgMTA3Mzc0MTgyMyBieXRlcyBtYXkgY2F1c2UgcmVzdWx0IHRvIGV4Y2VlZAo+IOKA
mElOVF9NQVjigJkgWy1XZXJyb3I9Zm9ybWF0LW92ZXJmbG93PV0KPiAgIDIxMCB8ICAgIHByaW50
aygiJXMgICV1IGJhc2UgJTAqIlBSSXg2NCIwMDAgbWFzayAlMCoiUFJJeDY0IjAwMCAlc1xuIiwK
PiAgICAgICB8ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgo+IGdlbmVyaWMuYzoyMTA6NDQ6
IG5vdGU6IGZvcm1hdCBzdHJpbmcgaXMgZGVmaW5lZCBoZXJlCj4gICAyMTAgfCAgICBwcmludGso
IiVzICAldSBiYXNlICUwKiJQUkl4NjQiMDAwIG1hc2sgJTAqIlBSSXg2NCIwMDAgJXNcbiIsCj4g
Z2VuZXJpYy5jOjIxMDoxMTogbm90ZTogZGlyZWN0aXZlIGFyZ3VtZW50IGluIHRoZSByYW5nZSBb
MCwgNDUwMzU5OTYyNzM3MDQ5NV0KPiAgIDIxMCB8ICAgIHByaW50aygiJXMgICV1IGJhc2UgJTAq
IlBSSXg2NCIwMDAgbWFzayAlMCoiUFJJeDY0IjAwMCAlc1xuIiwKPiAgICAgICB8ICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fn5+fgo+IGdlbmVyaWMuYzoyMTA6MTE6IG5vdGU6IGFzc3VtaW5nIGRp
cmVjdGl2ZSBvdXRwdXQgb2YgMSBieXRlCj4gCj4gUmVzdHJpY3QgdGhlIHdpZHRoIG9mIHRoZSB2
YXJpYWJsZSAid2lkdGgiIGNvbnRyb2xsaW5nIHRoZSBudW1iZXIgb2YKPiBhZGRyZXNzIGRpZ2l0
cyBvdXRwdXQuCgpJIGhhdmUgdG8gYWRtaXQgSSdtIG5vdCBzdXJlIHdoeSBnY2MgY29tcGxhaW5z
IGhlcmUsIGFuZCB3aHkgc3dpdGNoaW5nCnRvIHVuc2lnbmVkIGNoYXIgZml4ZXMgaXQuIHVuc2ln
bmVkIGNoYXIgbWF4IHZhbHVlIHdvdWxkIGJlIDI1NSwgd2hpY2gKd2hlbiB1c2VkIGFzIGEgd2lk
dGggdG8gcHJpbnQgYW4gdW5zaWduZWQgbG9uZyBpdCdzIGFsc28gdG9vIGhpZ2g/CgpEb2VzIGNo
ZWNraW5nIHRoYXQgd2lkdGggPD0gMTYgYWxzbyBwbGFjYXRlIGdjYz8KCk9yIG1heWJlIEknbSBq
dXN0IG5vdCB1bmRlcnN0YW5kaW5nIHdoYXQgZ2NjIGNvbXBsYWlucyBhYm91dC4KClRoYW5rcy4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
