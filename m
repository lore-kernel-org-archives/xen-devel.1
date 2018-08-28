From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 06/23] x86: don't call vpci function in
 physdev_op when !CONFIG_HAS_VPCI
Date: Tue, 28 Aug 2018 09:45:51 +0100
Message-ID: <20180828084551.3jtg4olva22mjqkt@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <9ba265aa00b8a2c0a97d192e267b237110c672a4.1535285866.git-series.wei.liu2@citrix.com>
 <5B840AC002000078001E2446@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fuZdK-00089F-BU
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 08:45:54 +0000
Content-Disposition: inline
In-Reply-To: <5B840AC002000078001E2446@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMDg6Mjk6MjBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvcGh5c2Rldi5jCj4gPiArKysgYi94ZW4vYXJjaC94
ODYvcGh5c2Rldi5jCj4gPiBAQCAtNTU3LDYgKzU1Nyw3IEBAIHJldF90IGRvX3BoeXNkZXZfb3Ao
aW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCj4gPiAgCj4gPiAgICAg
ICAgICByZXQgPSBwY2lfbW1jZmdfcmVzZXJ2ZWQoaW5mby5hZGRyZXNzLCBpbmZvLnNlZ21lbnQs
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5mby5zdGFydF9idXMsIGlu
Zm8uZW5kX2J1cywgaW5mby5mbGFncyk7Cj4gPiArI2lmZGVmIENPTkZJR19IQVNfVlBDSQo+ID4g
ICAgICAgICAgaWYgKCAhcmV0ICYmIGhhc192cGNpKGN1cnJkKSApCj4gPiAgICAgICAgICB7Cj4g
PiAgICAgICAgICAgICAgLyoKPiA+IEBAIC01NjcsNiArNTY4LDcgQEAgcmV0X3QgZG9fcGh5c2Rl
dl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5mby5zdGFydF9idXMs
IGluZm8uZW5kX2J1cywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaW5mby5zZWdtZW50KTsKPiA+ICAgICAgICAgIH0KPiA+ICsjZW5kaWYKPiAKPiBQ
ZXJoYXBzIGJldHRlciB0byBtYWtlIGhhc192cGNpKCkgZXZhbHVhdGUgdG8gZmFsc2UgaW4gdGhh
dCBjYXNlLAo+IGFuZCBvbmNlIGFnYWluIHJlbHkgb24gRENFPwoKQnV0IHRoZW4gdGhhdCBnb2Vz
IGJhY2sgdG8geW91ciBwcmV2aW91cyBhcmd1bWVudCB0aGF0IGl0IGNyZWF0ZXMKZGlzY29ubmVj
dGlvbiBiZXR3ZWVuIGVtdWxhdGlvbl9mbGFnc19vayBhbmQgaGFzXyouIElmIHdlIHdhbnQgdG8g
Y2hhbmdlCmhhc192cGNpIEkgd291bGQgYWxzbyBuZWVkIHRvIGNoYW5nZSBlbXVsYXRpb25fZmxh
Z3Nfb2suIElzIHRoYXQgd2hhdAp5b3UgcHJlZmVyPwoKV2VpLgoKPiAKPiBKYW4KPiAKPiAKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
