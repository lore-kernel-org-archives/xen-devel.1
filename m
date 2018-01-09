From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC v1 49/74] x86/guest: map per-cpu
 vcpu_info area.
Date: Tue, 9 Jan 2018 12:08:44 +0000
Message-ID: <20180109120844.si4yr6ndommi3hlx@MacBook-Pro-de-Roger.local>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-50-wei.liu2@citrix.com>
 <5A537E50020000780019C3A8@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yc+y=ee=citrix.com=prvs=540dc162b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eYsi5-0005a2-NP
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 12:08:53 +0000
Content-Disposition: inline
In-Reply-To: <5A537E50020000780019C3A8@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMDgsIDIwMTggYXQgMDY6MjE6MDRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiArICAgIGxvbmcgcmM7Cj4gPiArCj4gPiArICAgIGlmICggIXZjcHVfaW5mbyApCj4g
PiArICAgIHsKPiA+ICsgICAgICAgIHRoaXNfY3B1KHZjcHVfaW5mbykgPSAmWEVOX3NoYXJlZF9p
bmZvLT52Y3B1X2luZm9bdmNwdV07Cj4gPiArICAgICAgICByZXR1cm4gMDsKPiA+ICsgICAgfQo+
ID4gKwo+ID4gKyAgICBpZiAoIHRlc3RfYml0KHZjcHUsIHZjcHVfaW5mb19tYXBwZWQpICkKPiA+
ICsgICAgewo+ID4gKyAgICAgICAgdGhpc19jcHUodmNwdV9pbmZvKSA9ICZ2Y3B1X2luZm9bdmNw
dV07Cj4gPiArICAgICAgICByZXR1cm4gMDsKPiA+ICsgICAgfQo+ID4gKwo+ID4gKyAgICBpbmZv
Lm1mbiA9IHZpcnRfdG9fbWZuKCZ2Y3B1X2luZm9bdmNwdV0pOwo+ID4gKyAgICBpbmZvLm9mZnNl
dCA9ICh1bnNpZ25lZCBsb25nKSZ2Y3B1X2luZm9bdmNwdV0gJiB+UEFHRV9NQVNLOwo+ID4gKyAg
ICByYyA9IHhlbl9oeXBlcmNhbGxfdmNwdV9vcChWQ1BVT1BfcmVnaXN0ZXJfdmNwdV9pbmZvLCB2
Y3B1LCAmaW5mbyk7Cj4gPiArICAgIGlmICggcmMgKQo+ID4gKyAgICAgICAgdGhpc19jcHUodmNw
dV9pbmZvKSA9ICZYRU5fc2hhcmVkX2luZm8tPnZjcHVfaW5mb1t2Y3B1XTsKPiAKPiBZb3UgbmVl
ZCB0byBhdm9pZCBwcm9kdWNpbmcgYW4gb3V0IG9mIGJvdW5kcyBwb2ludGVyIGhlcmUgZm9yCj4g
bGFyZ2UgdmNwdSB2YWx1ZXMuCgpJIGd1ZXNzIGEgQlVHIGlzIHRoZSBvbmx5IHNlbnNpYmxlIG91
dGNvbWUgaGVyZSBpbiB0aGF0IGNhc2UuIFRoZSBCU1AKc2hvdWxkIGhhdmUgYWxyZWFkeSBsaW1p
dGVkIHRoZSBudW1iZXIgb2YgcG9zc2libGUgQ1BVcyBpZiBtYXBwaW5nIHRoZQp2Y3B1X2luZm8g
ZmFpbGVkLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
