From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 5/8] pvh/dom0: warn when dom0_mem
 is not set to a fixed value
Date: Thu, 07 Feb 2019 09:47:09 -0700
Message-ID: <5C5C610D0200007800214C1C@prv1-mh.provo.novell.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-6-roger.pau@citrix.com>
 <5C5AE70F02000078002144E9@prv1-mh.provo.novell.com>
 <20190207153926.sxzpv5ansoa6azg2@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grmpU-0007VD-7k
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 16:47:12 +0000
In-Reply-To: <20190207153926.sxzpv5ansoa6azg2@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE5IGF0IDE2OjM5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgRmViIDA2LCAyMDE5IGF0IDA2OjU0OjIzQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMzAuMDEuMTkgYXQgMTE6MzYsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gVGhlcmUgaGF2ZSBiZWVuIHNldmVyYWwgcmVwb3J0cyBvZiB0aGUgZG9tMCBi
dWlsZGVyIHJ1bm5pbmcgb3V0IG9mCj4+ID4gbWVtb3J5IHdoZW4gYnVpbGRpZ24gYSBQVkggZG9t
MCB3aXRob3V0IGhhdmluZ2Ygc3BlY2lmaWVkIGEgZG9tMF9tZW0KPj4gCj4+ICJidWlsZGluZyIg
YW5kICJoYXZpbmciCj4+IAo+PiA+IHZhbHVlLiBQcmludCBhIHdhcm5pbmcgbWVzc2FnZSBpZiBk
b20wX21lbSBpcyBub3Qgc2V0IHRvIGEgZml4ZWQgdmFsdWUKPj4gPiB3aGVuIGJvb3RpbmcgaW4g
UFZIIG1vZGUuCj4+IAo+PiBXaHkgZG9lcyBpdCBuZWVkIHRvIGJlIGEgZml4ZWQgdmFsdWU/IEku
ZS4gd2h5IGNhbid0IHlvdSBzaW1wbHkKPj4gcHV0IHRoaXMgd2FybmluZyBuZXh0IHRvIHdoZXJl
IHRoZSBkZWZhdWx0IGdldHMgZXN0YWJsaXNoZWQsCj4+IHdoZW4gbnJfcGFnZXMgaXMgemVybz8K
PiAKPiBBY2ssIGJ1dCBJIGd1ZXNzIHlvdSBsaWtlbHkgYWxzbyB3YW50IHRvIGNoYW5nZSB0aGUg
cHJpbnRlZCB3YXJuaW5nIHNvCj4gaXQgZG9lcyBzYXkgImZpeGVkIj8KCkRpZCB5b3UgbWVhbiAn
Li4uIHNvIGl0IGRvZXNuJ3Qgc2F5ICJmaXhlZCInPyBJZiBzbyAtIHN1cmUsIHRoZSBtZXNzYWdl
Cm9mIGNvdXJzZSBzaG91bGQgcmVmbGVjdCB3aGF0IGlzIGhhcHBlbmluZy4KCj4+ID4gLS0tIGEv
eGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYwo+PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb20wX2J1
aWxkLmMKPj4gPiBAQCAtMzQ0LDYgKzM0NCwxMCBAQCB1bnNpZ25lZCBsb25nIF9faW5pdCBkb20w
X2NvbXB1dGVfbnJfcGFnZXMoCj4+ID4gICAgICBpZiAoICFkb20wX21lbV9zZXQgJiYgQ09ORklH
X0RPTTBfTUVNWzBdICkKPj4gPiAgICAgICAgICBwYXJzZV9kb20wX21lbShDT05GSUdfRE9NMF9N
RU0pOwo+PiA+ICAKPj4gPiArICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSAmJiAhZG9tMF9zaXpl
Lm5yX3BhZ2VzICkKPj4gPiArICAgICAgICBwcmludGsoCj4+ID4gKyJXQVJOSU5HOiBjb25zaWRl
ciBzZXR0aW5nIGRvbTBfbWVtIHRvIGEgZml4ZWQgdmFsdWUgd2hlbiB1c2luZyBQVkggbW9kZVxu
Iik7Cj4+IAo+PiBQcmV0dHkgdW51c3VhbCBpbmRlbnRhdGlvbi4gSXMgdGhlcmUgYW55IHJlYXNv
biBmb3IgeW91IGRvaW5nIHNvPwo+IAo+IERpZCBpdCB0aGF0IHdheSB0byBhdm9pZCBzcGxpdHRp
bmcgYW5kIHRvIGF0dGVtcHQgdG8ga2VlcCB0aGUgbGluZSBhcwo+IHNob3J0IGFzIHBvc3NpYmxl
LiBXb3VsZCB5b3UgcHJlZmVyIG1lIHRvIHNwbGl0IHRoZSBtZXNzYWdlPwoKV2VsbCwgc3BsaXR0
aW5nIGFmdGVyIFdBUk5JTkc6IHNlZW1zIHJlYXNvbmFibGUgYW5kIHVubGlrZWx5IHRvIGdldApp
biB0aGUgd2F5IG9mIGdyZXAtaW5nIGZvciB0aGUgbWVzc2FnZS4gQnV0IGlmIHlvdSB0aGluayBh
IHNwbGl0IHRoZXJlCmlzIHVuZGVzaXJhYmxlLCB0aGVuIHB1dCBpdCBhbGwgb24gb25lIGxpbmUu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
