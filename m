From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/9] x86/guest: clean up guest/xen.h
Date: Fri, 19 Jan 2018 10:21:46 +0000
Message-ID: <20180119102146.v5fjl5url2m4wh2p@MacBook-Pro-de-Roger.local>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
 <20180118181652.26397-4-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zmcs=eo=citrix.com=prvs=55082200c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ecTo7-0000Jw-1g
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 10:21:59 +0000
Content-Disposition: inline
In-Reply-To: <20180118181652.26397-4-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTgsIDIwMTggYXQgMDY6MTY6NDZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBSZW1vdmUgZXh0cmFuZW91cyBzZW1pY29sb24uIEFkZCBibGFuayBsaW5lcy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVu
LmggfCAxMiArKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVz
dC94ZW4uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmgKPiBpbmRleCAxMTI0M2Zl
NjBkLi4zMTMyNjQ0MmY3IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3Qv
eGVuLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCj4gQEAgLTQ5LDcg
KzQ5LDggQEAgREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCB2Y3B1X2luZm8gKiwgdmNwdV9pbmZvKTsK
PiAgI2RlZmluZSB4ZW5fZ3Vlc3QgMAo+ICAjZGVmaW5lIHB2X2NvbnNvbGUgMAo+ICAKPiAtc3Rh
dGljIGlubGluZSB2b2lkIHByb2JlX2h5cGVydmlzb3Iodm9pZCkge307Cj4gK3N0YXRpYyBpbmxp
bmUgdm9pZCBwcm9iZV9oeXBlcnZpc29yKHZvaWQpIHt9Cj4gKwo+ICBzdGF0aWMgaW5saW5lIHZv
aWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKQo+ICB7Cj4gICAgICBBU1NFUlRfVU5SRUFDSEFCTEUo
KTsKPiBAQCAtNjMsMjAgKzY0LDIzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX2Zp
eHVwX2U4MjAoc3RydWN0IGU4MjBtYXAgKmU4MjApCj4gIHsKPiAgICAgIEFTU0VSVF9VTlJFQUNI
QUJMRSgpOwo+ICB9Cj4gKwo+ICBzdGF0aWMgaW5saW5lIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmh5
cGVydmlzb3JfcmVzZXJ2ZWRfcGFnZXModW5zaWduZWQgaW50ICpzaXplKQo+ICB7Cj4gICAgICBB
U1NFUlRfVU5SRUFDSEFCTEUoKTsKPiAgICAgIHJldHVybiBOVUxMOwo+IC19Owo+ICt9Cj4gKwo+
ICBzdGF0aWMgaW5saW5lIHVpbnQzMl90IGh5cGVydmlzb3JfY3B1aWRfYmFzZSh2b2lkKQo+ICB7
Cj4gICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPiAgICAgIHJldHVybiAwOwo+IC19Owo+ICt9
Cj4gKwo+ICBzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCkKPiAgewo+
ICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4gLX07Cj4gK30KCkFGQUlDVCBoeXBlcnZpc29y
X2NwdWlkX2Jhc2UgYW5kIGh5cGVydmlzb3JfcmVzdW1lIGNvdWxkIGJlIHJlbW92ZWQsCmJlY2F1
c2UgdGhvc2UgYXJlIG9ubHkgY2FsbGVkIGZyb20gc2hpbSBjb2RlLCBhbmQgaXQncyBub3QgZXZl
bgpwb3NzaWJsZSB0byBjb21waWxlIHRoZSBzaGltIGNvZGUgd2l0aG91dCBoYXZpbmcgWGVuIGd1
ZXN0IHN1cHBvcnQKZW5hYmxlZC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
