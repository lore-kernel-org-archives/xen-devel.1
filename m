From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: assert MBI is large enough in
 pvh-boot.c
Date: Thu, 27 Sep 2018 17:06:43 +0100
Message-ID: <20180927160643.unqfqns7khrkkav7@zion.uk.xensource.com>
References: <20180926110000.9764-1-wei.liu2@citrix.com>
 <5BAB768202000078001EC2A8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ygxm=mj=citrix.com=prvs=801769520=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5YoX-0004FI-8U
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 16:06:53 +0000
Content-Disposition: inline
In-Reply-To: <5BAB768202000078001EC2A8@prv1-mh.provo.novell.com>
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

T24gV2VkLCBTZXAgMjYsIDIwMTggYXQgMDY6MDc6MzBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjA5LjE4IGF0IDEzOjAwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvcHZoLWJvb3QuYwo+ID4gKysrIGIveGVu
L2FyY2gveDg2L2d1ZXN0L3B2aC1ib290LmMKPiA+IEBAIC00NCw2ICs0NCwxMyBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgY29udmVydF9wdmhfaW5mbyh2b2lkKQo+ID4gIAo+ID4gICAgICBBU1NFUlQo
cHZoX2luZm8tPm1hZ2ljID09IFhFTl9IVk1fU1RBUlRfTUFHSUNfVkFMVUUpOwo+ID4gIAo+ID4g
KyAgICAvKgo+ID4gKyAgICAgKiBUZW1wb3JhcnkgTUJJIGFycmF5IG5lZWRzIHRvIGJlIGF0IGxl
YXN0IG9uZSBlbGVtZW50IGJpZ2dlciB0aGFuCj4gPiArICAgICAqIHJlcXVpcmVkLiBUaGUgZXh0
cmEgZWxlbWVudCBpcyB1c2VkIHRvIGFpZCByZWxvY2F0aW9uLiBTZWUKPiA+ICsgICAgICogYXJj
aC94ODYvc2V0dXAuYzpfX3N0YXJ0X3hlbigpLgo+ID4gKyAgICAgKi8KPiA+ICsgICAgQVNTRVJU
KEFSUkFZX1NJWkUocHZoX21iaV9tb2RzKSA+IHB2aF9pbmZvLT5ucl9tb2R1bGVzKTsKPiAKPiBB
cmUgQVNTRVJUKClzIChhbHNvIHRoZSBvdGhlciBvbmUgaW4gY29udGV4dCkgYWN0dWFsbHkgdGhl
IHJpZ2h0IHRoaW5nCj4gaGVyZT8gSSB0aGluayB3ZSdkIGJldHRlciBwYW5pYygpOiBUaGF0J2xs
IGFsc28gY292ZXIgcmVsZWFzZSBidWlsZHMgYW5kCj4gaXMgaW1vIG1vcmUgYXBwcm9wcmlhdGUg
Zm9yIGRhdGEgY29taW5nIGZyb20gdGhlIG91dHNpZGUuCgpPa2F5LgoKV2VpLgoKPiAKPiBKYW4K
PiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
