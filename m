From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.11 1/2] libxc/x86: fix mapping of the
 start_info area
Date: Wed, 28 Mar 2018 12:08:07 +0100
Message-ID: <20180328110807.hmludd4tpdusognn@citrix.com>
References: <20180321144211.57274-1-roger.pau@citrix.com>
 <20180321144211.57274-2-roger.pau@citrix.com>
 <20180321180957.v6unr7yhw564i2b4@citrix.com>
 <20180322091003.44yo2xopar2ktzoa@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=b9f4=gs=citrix.com=prvs=618f79229=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f18xo-0002lK-BU
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 11:09:56 +0000
Content-Disposition: inline
In-Reply-To: <20180322091003.44yo2xopar2ktzoa@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMjIsIDIwMTggYXQgMDk6MTA6MDNBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIE1hciAyMSwgMjAxOCBhdCAwNjowOTo1N1BNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gV2VkLCBNYXIgMjEsIDIwMTggYXQgMDI6NDI6MTBQTSArMDAwMCwg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiBUaGUgc3RhcnRfaW5mbyBzaXplIGNhbGN1bGF0
ZWQgaW4gYm9vdGxhdGVfaHZtIGlzIHdyb25nLiBJdCBzaG91bGQgdXNlCj4gPiA+IEhWTUxPQURF
Ul9NT0RVTEVfTUFYX0NPVU5UIGluc3RlYWQgb2YgZG9tLT5udW1fbW9kdWxlcyBhbmQgaXQgZG9l
c24ndAo+ID4gPiB0YWtlIGludG8gYWNjb3VudCB0aGUgc2l6ZSBvZiB0aGUgbW9kdWxlcyBjb21t
YW5kIGxpbmUuCj4gPiA+IAo+ID4gPiBUaGlzIGlzIG5vdCBhIHByb2JsZW0gc28gZmFyIGJlY2F1
c2UgdGhlIGFjdHVhbGx5IHVzZWQgYW1vdW50IG9mCj4gPiA+IG1lbW9yeSBkb2Vzbid0IGNyb3Nz
IGEgcGFnZSBib3VuZGFyeSwgYW5kIHNvIG5vIHBhZ2UtZmF1bHQgaXMKPiA+ID4gdHJpZ2dlcmVk
Lgo+ID4gCj4gPiBJIGdldCB0aGUgY21kbGluZSBiaXQuCj4gPiAKPiA+IFdoYXQgZG9lcyBpdCBu
ZWVkIHRvIGJlIEhWTUxPQURFUl9NT0RVTEVfTUFYX0NPVU5UPyBJc24ndCBiZXR0ZXIgdG8ganVz
dAo+ID4gbWFwIHdoYXQgd2UgbmVlZCBoZXJlPwo+IAo+IEJlY2F1c2UgdGhlIHBvc2l0aW9uIG9m
IHRoZSBtb2R1bGVzIGNvbW1hbmQgbGluZSBpczoKPiAKPiBtb2RsaXN0X3BhZGRyICsgc2l6ZW9m
KHN0cnVjdCBodm1fbW9kbGlzdF9lbnRyeSkgKiBIVk1MT0FERVJfTU9EVUxFX01BWF9DT1VOVDsK
PiAKPiAoVGhpcyBpcyBmcm9tIGFkZF9tb2R1bGVfdG9fbGlzdCkuCj4gCj4gU28gaWYgZG9tLT5u
dW1fbW9kdWxlcyA8IEhWTUxPQURFUl9NT0RVTEVfTUFYX0NPVU5UIHRoZSBtYXBwZWQgcmVnaW9u
Cj4gaXMgc21hbGxlciB0aGF0IHdoYXQgd2UgbWlnaHQgZW5kIHVwIHVzaW5nLgo+IAo+IEknbSBu
b3Qgc3VyZSB3aHkgSFZNTE9BREVSX01PRFVMRV9NQVhfQ09VTlQgaXMgdXNlZCB3aGVuIGFsbG9j
YXRpbmcKPiBtZW1vcnkgKGluIGFsbG9jX21hZ2ljX3BhZ2VzX2h2bSkgaW5zdGVhZCBvZiB0aGUg
YWN0dWFsIG51bWJlciBvZgo+IG1vZHVsZXMgKGRvbS0+bnVtX21vZHVsZXMpLCBidXQgdGhlIHBy
b3Bvc2VkIGNoYW5nZSBzZWVtcyB0byBiZSB0aGUKPiBlYXNpZXIgd2F5IHRvIGZpeCB0aGUgbWFw
cGluZyBpc3N1ZS4KPiAKClRoaXMgcGF0Y2ggaXMgY29ycmVjdCwgaW4gdGhlIHNlbnNlIHRoYXQg
aXQgcmVwbGljYXRlcyB0aGUgbG9naWMgZnJvbQphbGxvY19tYWdpY19wYWdlc19odm0gdG8gYm9v
dGxhdGVfaHZtLiBIb3dldmVyLCBJIGRvbid0IHRoaW5rCmJvb3RsYXRlX2h2bSBpcyBpbiB0aGUg
YnVzaW5lc3Mgb2YgY2FsY3VsYXRpbmcgdGhlIHNpemUgb25jZSBtb3JlLiBUaGlzCmlzIGJvdW5k
IHRvIGZhaWwgaW4gdGhlIGZ1dHVyZS4KCkluc3RlYWQsIHlvdSBjYW4gc3Rhc2ggdGhlIHNpemUg
dG8gZG9tIG9uY2UgdGhlIGNhbGN1bGF0aW9uIGluCmFsbG9jX21hZ2ljX3BhZ2VzX2h2bSBpcyBk
b25lLCBhbmQgdGhlbiB1c2UgaXQgaW4gYm9vdGxhdGVfaHZtLiBUaGlzIGlzCnRoZSBsZWFzdCBm
cmFnaWxlIHdheSBJIGNhbiB0aGluayBvZi4KCkRvZXMgdGhpcyBtYWtlIHNlbnNlPwoKV2VpLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
