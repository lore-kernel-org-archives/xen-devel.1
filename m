From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 8/8] x86: avoid double CR3 reload when
 switching to guest user mode
Date: Thu, 22 Mar 2018 07:31:56 -0600
Message-ID: <5AB3BE5C02000078001B515D@prv-mh.provo.novell.com>
References: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
 <5AAFCC2602000078001B3735@prv-mh.provo.novell.com>
 <20180322132046.n3tnarzzuprgjkxk@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ez0K0-0006qy-HW
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 13:32:00 +0000
In-Reply-To: <20180322132046.n3tnarzzuprgjkxk@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAzLjE4IGF0IDE0OjIwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBNYXIgMTksIDIwMTggYXQgMDc6NDE6NDJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4uYwo+PiArKysgYi94ZW4vYXJjaC94
ODYvcHYvZG9tYWluLmMKPj4gQEAgLTIxOSwxMCArMjE5LDIyIEBAIGludCBwdl9kb21haW5faW5p
dGlhbGlzZShzdHJ1Y3QgZG9tYWluICoKPj4gICAgICByZXR1cm4gcmM7Cj4+ICB9Cj4+ICAKPj4g
LXN0YXRpYyB2b2lkIF90b2dnbGVfZ3Vlc3RfcHQoc3RydWN0IHZjcHUgKnYpCj4+ICtzdGF0aWMg
dm9pZCBfdG9nZ2xlX2d1ZXN0X3B0KHN0cnVjdCB2Y3B1ICp2LCBib29sIGZvcmNlX2NyMykKPj4g
IHsKPj4gKyAgICBBU1NFUlQoIWluX2lycSgpKTsKPj4gKwo+PiAgICAgIHYtPmFyY2guZmxhZ3Mg
Xj0gVEZfa2VybmVsX21vZGU7Cj4+ICAgICAgdXBkYXRlX2NyMyh2KTsKPj4gKwo+PiArICAgIC8q
Cj4+ICsgICAgICogVGhlcmUncyBubyBuZWVkIHRvIGxvYWQgQ1IzIGhlcmUgd2hlbiBpdCBpcyBn
b2luZyB0byBiZSBsb2FkZWQgb24gdGhlCj4+ICsgICAgICogd2F5IG91dCB0byBndWVzdCBtb2Rl
IGFnYWluIGFueXdheSwgYW5kIHdoZW4gdGhlIHBhZ2UgdGFibGVzIHdlJ3JlCj4+ICsgICAgICog
Y3VycmVudGx5IG9uIGFyZSB0aGUga2VybmVsIG9uZXMgKHdoZXJlYXMgd2hlbiBzd2l0Y2hpbmcg
dG8ga2VybmVsCj4+ICsgICAgICogbW9kZSB3ZSBuZWVkIHRvIGJlIGFibGUgdG8gd3JpdGUgYSBi
b3VuY2UgZnJhbWUgb250byB0aGUga2VybmVsIHN0YWNrKS4KPj4gKyAgICAgKi8KPiAKPiBOb3Qg
c3VyZSBJIGZvbGxvdyB0aGUgY29tbWVudC4gSWYgeW91J3JlIHRhbGtpbmcgYWJvdXQKPiBjcmVh
dGVfYm91bmNlX2ZyYW1lLCBpdCB3b3VsZG4ndCBjYWxsIHRoaXMgZnVuY3Rpb24gaW4gdGhlIGZp
cnN0IHBsYWNlLAo+IHJpZ2h0PwoKUmlnaHQuIFRoZSBjb21tZW50IGlzIHRhbGtpbmcgYWJvdXQg
d2hhdCBtYXkgaGFwcGVuIGFmdGVyIHdlCnJldHVybiBmcm9tIGhlcmUuCgo+PiArICAgIGlmICgg
IWZvcmNlX2NyMyAmJiAhKHYtPmFyY2guZmxhZ3MgJiBURl9rZXJuZWxfbW9kZSkgKQo+IAo+IEFs
c28sIGl0IHRha2VzIGEgYml0IG9mIG1lbnRhbCBwb3dlciB0byBzZWUgISh2LT5hcmNoLmZsYWdz
ICYKPiBURl9rZXJuZWxfbW9kZSkgbWVhbnMgdGhlIG1vZGUgWGVuIGlzIHVzaW5nLiBDYW4geW91
IG1heWJlIGp1c3QgdXNlIGEKPiB2YXJpYWJsZSBhdCB0aGUgYmVnaW5uaW5nIGxpa2UKPiAKPiAg
ICBib29sIGtlcm5lbF9tb2RlID0gdi0+YXJjaC5mbGFncyAmIFRGX2tlcm5lbF9tb2RlOwo+IAo+
IGFuZCB0aGVuIHVzZSBpdCBoZXJlPwoKRXhjZXB0IGZvciB0aGUgKGhvdyBJIHdvdWxkIHNheSkg
Y2x1dHRlciBieSB0aGUgZXh0cmEgbG9jYWwgdmFyaWFibGUKSSBkb24ndCBzZWUgbXVjaCBvZiBh
IGRpZmZlcmVuY2UuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
