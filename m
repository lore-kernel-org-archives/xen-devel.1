From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 8/8] microcode: update microcode on cores
 in parallel
Date: Tue, 12 Feb 2019 14:25:07 +0100
Message-ID: <20190212132507.mwp4yyf22oslc7d4@mac>
References: <1548659210-16870-1-git-send-email-chao.gao@intel.com>
 <1548659210-16870-9-git-send-email-chao.gao@intel.com>
 <5C62C15D0200007800215E2E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PtAC=QT=citrix.com=prvs=9396ac657=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gtY3m-0000MU-Og
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 13:25:14 +0000
Content-Disposition: inline
In-Reply-To: <5C62C15D0200007800215E2E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMTIsIDIwMTkgYXQgMDU6NTE6NDFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjAxLjE5IGF0IDA4OjA2LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90
ZToKPiA+IEBAIC0zMTQsOSArMzEwLDcgQEAgc3RhdGljIGludCBhcHBseV9taWNyb2NvZGUodW5z
aWduZWQgaW50IGNwdSkKPiA+ICAKPiA+ICAgICAgbWNfaW50ZWwgPSBwYXRjaC0+ZGF0YTsKPiA+
ICAgICAgQlVHX09OKCFtY19pbnRlbCk7Cj4gPiAtCj4gPiAtICAgIC8qIHNlcmlhbGl6ZSBhY2Nl
c3MgdG8gdGhlIHBoeXNpY2FsIHdyaXRlIHRvIE1TUiAweDc5ICovCj4gPiAtICAgIHNwaW5fbG9j
a19pcnFzYXZlKCZtaWNyb2NvZGVfdXBkYXRlX2xvY2ssIGZsYWdzKTsKPiA+ICsgICAgQlVHX09O
KGxvY2FsX2lycV9pc19lbmFibGVkKCkpOwo+ID4gIAo+ID4gICAgICAvKiB3cml0ZSBtaWNyb2Nv
ZGUgdmlhIE1TUiAweDc5ICovCj4gPiAgICAgIHdybXNybChNU1JfSUEzMl9VQ09ERV9XUklURSwg
KHVuc2lnbmVkIGxvbmcpbWNfaW50ZWwtPmJpdHMpOwo+ID4gQEAgLTMyOSw3ICszMjMsNiBAQCBz
dGF0aWMgaW50IGFwcGx5X21pY3JvY29kZSh1bnNpZ25lZCBpbnQgY3B1KQo+ID4gICAgICByZG1z
cmwoTVNSX0lBMzJfVUNPREVfUkVWLCBtc3JfY29udGVudCk7Cj4gPiAgICAgIHZhbFsxXSA9ICh1
aW50MzJfdCkobXNyX2NvbnRlbnQgPj4gMzIpOwo+ID4gIAo+ID4gLSAgICBzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZtaWNyb2NvZGVfdXBkYXRlX2xvY2ssIGZsYWdzKTsKPiA+ICAgICAgaWYgKCB2
YWxbMV0gIT0gbWNfaW50ZWwtPmhkci5yZXYgKQo+ID4gICAgICB7Cj4gPiAgICAgICAgICBwcmlu
dGsoS0VSTl9FUlIgIm1pY3JvY29kZTogQ1BVJWQgdXBkYXRlIGZyb20gcmV2aXNpb24gIgo+IAo+
IEFtIEkgdW5kZXJzdGFuZGluZyByaWdodCB0aGF0IHlvdSBub3cgcmVseSBvbiB1cHBlciBsYXll
cnMgaW4gdGhlCj4gY2FsbCB0cmVlIHRvIGF2b2lkIGNhbGxpbmcgaW50byBoZXJlIGluIHBhcmFs
bGVsIGZvciB0d28gaHlwZXJ0aHJlYWRzCj4gb2YgdGhlIHNhbWUgY29yZT8gSSBjYW4ndCBzZWUg
aG93IHlvdSBhdm9pZCB0aGlzIHNpdHVhdGlvbiBkdXJpbmcKPiBBUCBicmluZ3VwLCBmb3IgZXhh
bXBsZS4gRGlkIEkgb3Zlcmxvb2sgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQ/CgpJSVJDIG1pY3Jv
Y29kZSB1cGRhdGUgaXMgZG9uZSBpbiB0aGUgc2VyaWFsaXplZCBwYXJ0IG9mIEFQIGJyaW5ndXAs
CmJlZm9yZSB0aGUgY2FsbCB0byBzbXBfY2FsbGluLCB3aGljaCBndWFyYW50ZWVzIHNlcmlhbGl6
YXRpb24uCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
