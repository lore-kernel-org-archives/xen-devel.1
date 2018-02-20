From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 3/4] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Tue, 20 Feb 2018 05:53:08 -0700
Message-ID: <5A8C284402000078001A996C@prv-mh.provo.novell.com>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-4-roger.pau@citrix.com>
 <5A8BF53C02000078001A97CE@prv-mh.provo.novell.com>
 <20180220101916.ve5gcjq6c53tkiey@MacBook-Pro-de-Roger.local>
 <20180220110108.tsekpststokuw5mo@MacBook-Pro-de-Roger.local>
 <5A8C10F602000078001A9895@prv-mh.provo.novell.com>
 <20180220112231.o56tu5issvljuxxn@MacBook-Pro-de-Roger.local>
 <5A8C236102000078001A994B@prv-mh.provo.novell.com>
 <20180220124226.iqamqhek3lgkxlad@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wunw=fo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eo7Q7-0000oR-Q5
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 12:53:19 +0000
In-Reply-To: <20180220124226.iqamqhek3lgkxlad@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE4IGF0IDEzOjQyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgRmViIDIwLCAyMDE4IGF0IDA1OjMyOjE3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjAuMDIuMTggYXQgMTI6MjIsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMDQ6MTM6NDJBTSAtMDcwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAyMC4wMi4xOCBhdCAxMjowMSwgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2Fz
bV9kZWZucy5oCj4+ID4+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaAo+
PiA+PiA+IEBAIC0xNSw2ICsxNSw5IEBACj4+ID4+ID4gICNpbmNsdWRlIDxhc20vYWx0ZXJuYXRp
dmUuaD4KPj4gPj4gPiAKPj4gPj4gPiAgI2lmZGVmIF9fQVNTRU1CTFlfXwo+PiA+PiA+ICsjaWZu
ZGVmIENPTkZJR19JTkRJUkVDVF9USFVOSwo+PiA+PiA+ICsuZXF1IENPTkZJR19JTkRJUkVDVF9U
SFVOSywgMAo+PiA+PiA+ICsjZW5kaWYKPj4gPj4gPiAgIyBpbmNsdWRlIDxhc20vaW5kaXJlY3Rf
dGh1bmtfYXNtLmg+Cj4+ID4+ID4gICNlbHNlCj4+ID4+ID4gIGFzbSAoICJcdC5lcXUgQ09ORklH
X0lORElSRUNUX1RIVU5LLCAiCj4+ID4+ID4gCj4+ID4+ID4gSXQncyBmYWlybHkgc2ltaWxhciB0
byBteSBmaXJzdCBhcHByb2FjaCwgYnV0IGF0IGxlYXN0ICIjaWZkZWYKPj4gPj4gPiBDT05GSUdf
SU5ESVJFQ1RfVEhVTksiIHdpbGwgc3RpbGwgd29yayBhcyBleHBlY3RlZCBhZnRlciB0aGlzIGZp
eC4KPj4gPj4gCj4+ID4+IEkndmUgdXNlZCBzb21ldGhpbmcgc2ltaWxhciBpbiBiYWNrcG9ydHMg
dG8gb2xkIHZlcnNpb25zLCBzbyBJCj4+ID4+IHdvbmRlciB3aGV0aGVyIHdoYXQgeW91IHF1b3Rl
IGFib3ZlIGlzIHJpZ2h0OiBBc3NlbWJseSBmaWxlcwo+PiA+PiBkb24ndCBnZXQgaGFuZGVkIHRv
IGNsYW5nIGFueXdheSBpaXJjLCBzbyB0aGUgY2hhbmdlIHdvdWxkCj4+ID4+IHNlZW0gdG8gYmUg
bmVlZGVkIGluIHRoZSAjZWxzZSBwYXJ0IG9mIHRoZSBjb25kaXRpb25hbC4KPj4gPiAKPj4gPiBB
c3NlbWJseSBmaWxlcyBkbyBnZXQgaGFuZGVkIHRvIGNsYW5nLCBmcm9tIHhlbi9SdWxlcy5tazoK
Pj4gPiAKPj4gPiAlLm86ICUuUyBNYWtlZmlsZQo+PiA+IAkkKENDKSAkKEFGTEFHUykgLWMgJDwg
LW8gJEAKPj4gPiAKPj4gPiBYZW4gZG9lc24ndCBjYWxsIGFzIGRpcmVjdGx5IHRvIGNvbXBpbGUg
dGhvc2UsIG9yIGFtIEkgbWlzc2luZwo+PiA+IHNvbWV0aGluZz8KPj4gCj4+IE9oLCBJIHdhcyBy
ZWZlcnJpbmcgdG8gdGhlIC1tbm8taW50ZWdyYXRlZC1hcyAob3Igd2hhdGV2ZXIgaXQncwo+PiBj
YWxsZWQpIG9wdGlvbi4gIkhhbmRlZCB0byBjbGFuZyIgd2Fzbid0IHRoZSBiZXN0IHdheSB0byBw
dXQgaXQsCj4+IEkgYWdyZWUuIEJ1dCBpdCdzIGNsYW5nJ3MgaW50ZWdyYXRlZCBhc3NlbWJsZXIg
d2hpY2ggdGhlIHByb2JsZW0KPj4gaXMgd2l0aC4KPiAKPiBPaCwgSSBzZWUuIFlvdSBhcmUgcmln
aHQsIHRoaXMgaXMganVzdCBhIHByZXBhcmF0b3J5IGNoYW5nZSBmb3IgcGF0Y2gKPiA0LCB3aGlj
aCBkb2VzIGVuYWJsZSBjbGFuZydzIGludGVncmF0ZWQgYXNzZW1ibGVyIGlmIHRoZSByaWdodAo+
IGZlYXR1cmVzIGFyZSBwcmVzZW50Lgo+IAo+IExldCBtZSBrbm93IGlmIHlvdSB0aGluayB0aGUg
YWJvdmUgY2h1bmsgaXMgYWNjZXB0YWJsZS4KCkl0IGlzIGNlcnRhaW5seSBhY2NlcHRhYmxlIGlm
IGl0IGhlbHBzOyB5b3Ugbm93IGFwcGFyZW50bHkgYWdyZWVpbmcKSSdtIG1vcmUgY29uZnVzZWQg
dGhvdWdoIGJ5IHRoaXMgcXVlc3Rpb24uIElpcmMgeW91IGRvbid0IGVuYWJsZQp0aGUgaW50ZWdy
YXRlZCBhc3NlbWJsZXIgZm9yIGFzc2VtYmx5IHNvdXJjZXMsIGJ1dCBvbmx5IGZvciBDIG9uZXMu
CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
