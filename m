From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 3/4] x86/mem_sharing: enable mem_share
 audit mode only in debug builds
Date: Mon, 29 Apr 2019 09:31:49 -0600
Message-ID: <CABfawhmo7YeW-RGJtLN2pU7qVbgOzVUtGYbsUh=qN-K+xHDTeA@mail.gmail.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-3-tamas@tklengyel.com>
 <5CC710DC020000780022A102@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL8Gc-0007hi-8V
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:32:30 +0000
Received: by mail-wm1-f43.google.com with SMTP id h11so16416872wmb.5
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 08:32:27 -0700 (PDT)
In-Reply-To: <5CC710DC020000780022A102@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgODo1NyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5n
LmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaAo+ID4gQEAgLTI1
LDcgKzI1LDkgQEAKPiA+ICAjaW5jbHVkZSA8cHVibGljL21lbW9yeS5oPgo+ID4KPiA+ICAvKiBB
dWRpdGluZyBvZiBtZW1vcnkgc2hhcmluZyBjb2RlPyAqLwo+ID4gKyNpZm5kZWYgTkRFQlVHCj4g
PiAgI2RlZmluZSBNRU1fU0hBUklOR19BVURJVCAxCj4gPiArI2VuZGlmCj4KPiBTaW5jZSBjb25z
dW1lcnMgdXNlICNpZiAobm90ICNpZmRlZiksIEkgdGhpbmsgYW4gI2Vsc2Ugd291bGQKPiBiZSBv
biBvcmRlciBoZXJlLCBldmVuIGlmIChJIHRoaW5rKSBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5IHdp
dGgKPiBnY2MuCgpTdXJlLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
