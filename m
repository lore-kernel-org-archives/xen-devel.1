From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/4] x86/mm: use optional cache in
 guest_walk_tables()
Date: Wed, 12 Sep 2018 02:30:57 -0600
Message-ID: <5B98CEC102000078001E7A45@prv1-mh.provo.novell.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <5B97BFC902000078001E740D@prv1-mh.provo.novell.com>
 <fd20bd8ab3a54decbb014b36cbfb5a5d@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mhj0=l2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g00YA-00043E-LG
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 08:31:02 +0000
In-Reply-To: <fd20bd8ab3a54decbb014b36cbfb5a5d@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA5LjE4IGF0IDE4OjE3LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAxMSBTZXB0ZW1iZXIgMjAxOCAxNDoxNQo+PiAKPj4gLS0tIGEveGVuL2FyY2gveDg2L21tL2d1
ZXN0X3dhbGsuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vZ3Vlc3Rfd2Fsay5jCj4+IEBAIC05
Miw4ICs5MiwxMyBAQCBndWVzdF93YWxrX3RhYmxlcyhzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0Cj4+
ICAjaWYgR1VFU1RfUEFHSU5HX0xFVkVMUyA+PSA0IC8qIDY0LWJpdCBvbmx5Li4uICovCj4+ICAg
ICAgZ3Vlc3RfbDNlX3QgKmwzcCA9IE5VTEw7Cj4gCj4gU2hvdWxkbid0IHRoZSBhYm92ZSBsaW5l
IGJlLi4uCj4gCj4+ICAgICAgZ3Vlc3RfbDRlX3QgKmw0cDsKPj4gKyAgICBwYWRkcl90IGw0Z3Bh
Owo+PiArI2VuZGlmCj4+ICsjaWYgR1VFU1RfUEFHSU5HX0xFVkVMUyA+PSAzIC8qIFBBRSBvciA2
NC4uLiAqLwo+IAo+IC4uLmhlcmU/CgpObyAoYW5kIG5vdGUgdGhhdCdzIG5vdCBjb2RlIEkgY2hh
bmdlKS4KCj4+IEBAIC0xMzQsNyArMTM5LDE1IEBAIGd1ZXN0X3dhbGtfdGFibGVzKHN0cnVjdCB2
Y3B1ICp2LCBzdHJ1Y3QKPj4gICAgICAvKiBHZXQgdGhlIGw0ZSBmcm9tIHRoZSB0b3AgbGV2ZWwg
dGFibGUgYW5kIGNoZWNrIGl0cyBmbGFncyovCj4+ICAgICAgZ3ctPmw0bWZuID0gdG9wX21mbjsK
Pj4gICAgICBsNHAgPSAoZ3Vlc3RfbDRlX3QgKikgdG9wX21hcDsKPj4gLSAgICBndy0+bDRlID0g
bDRwW2d1ZXN0X2w0X3RhYmxlX29mZnNldChnbGEpXTsKPj4gKyAgICBsNGdwYSA9IGdmbl90b19n
YWRkcih0b3BfZ2ZuKSArCj4+ICsgICAgICAgICAgICBndWVzdF9sNF90YWJsZV9vZmZzZXQoZ2xh
KSAqIHNpemVvZihndy0+bDRlKTsKPj4gKyAgICBpZiAoICFjYWNoZSB8fAo+PiArICAgICAgICAg
IWh2bWVtdWxfcmVhZF9jYWNoZShjYWNoZSwgbDRncGEsIDQsICZndy0+bDRlLCBzaXplb2YoZ3ct
Pmw0ZSkpICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIGd3LT5sNGUgPSBsNHBbZ3Vlc3RfbDRfdGFi
bGVfb2Zmc2V0KGdsYSldOwo+PiArICAgICAgICBpZiAoIGNhY2hlICkKPj4gKyAgICAgICAgICAg
IGh2bWVtdWxfd3JpdGVfY2FjaGUoY2FjaGUsIGw0Z3BhLCA0LCAmZ3ctPmw0ZSwgc2l6ZW9mKGd3
LT5sNGUpKTsKPiAKPiBObyBuZWVkIHRvIHRlc3QgY2FjaGUgaGVyZSBvciBiZWxvdyBzaW5jZSBu
ZWl0aGVyIHRoZSByZWFkIG9yIHdyaXRlIAo+IGZ1bmN0aW9ucyAoeWV0KSBkZXJlZmVyZW5jZSBp
dC4KCkkgZG9uJ3QgdW5kZXJzdGFuZDogVGhlIHBhdGNoIGhlcmUgaXMgdG8gcHJlcGFyZSBmb3Ig
YSBmdWxseQppbXBsZW1lbnRlZCBzZXQgb2YgYmFja2luZyBmdW5jdGlvbnMsIGkuZS4gSSBpbiBw
YXJ0aWN1bGFyIGRvbid0CndhbnQgdG8gdG91Y2ggdGhpcyBjb2RlIGFnYWluIG9uY2UgSSBhZGQg
YWN0dWFsIGJvZGllcyB0bwp0aGUgZnVuY3Rpb25zLiBBcGFydCBmcm9tIHRoaXMgSSBkb24ndCB0
aGluayBjYWxsZXJzIHNob3VsZCBtYWtlCmFzc3VtcHRpb25zIGxpa2UgdGhpcyBhYm91dCBjYWxs
ZWUgYmVoYXZpb3IuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
