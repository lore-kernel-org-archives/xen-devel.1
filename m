From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v17 13/13] x86/domctl: Don't pause the whole
 domain if only getting vcpu state
Date: Wed, 29 Aug 2018 08:13:20 -0600
Message-ID: <5B86AA0002000078001E31D3@prv1-mh.provo.novell.com>
References: <1534946563-12084-1-git-send-email-aisaila@bitdefender.com>
 <1534946563-12084-14-git-send-email-aisaila@bitdefender.com>
 <20180822144129.uxe5plthp4fxyxqe@mac>
 <1534950925.20997.8.camel@bitdefender.com>
 <1535551353.20997.18.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535551353.20997.18.camel@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA4LjE4IGF0IDE2OjAyLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIE1pLCAyMDE4LTA4LTIyIGF0IDE4OjE1ICswMzAwLCBJc2FpbGEgQWxleGFuZHJ1IHdy
b3RlOgo+PiBPbiBNaSwgMjAxOC0wOC0yMiBhdCAxNjo0MSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPj4gPiBJZiB5b3UgbG9vayBhdCB2Y3B1X2h2bSBpbiB0b29scy9saWJ4Yy94Y19k
b21feDg2LmMgaXQgc2F2ZXMgdGhlCj4+ID4gZnVsbAo+PiA+IGRvbWFpbiBjb250ZXh0IGp1c3Qg
dG8gZ2V0IHRoZSBDUFUgYW5kIHRoZSBNVFJSIHN0YXRlIG9mIFZDUFUjMC4gRG8KPj4gPiB5b3Ug
dGhpbmsgeW91IGNvdWxkIHN3aXRjaCB0aGlzIGNvZGUgdG8gdXNlIHRoZSBuZXdseSBpbnRyb2R1
Y2VkCj4+ID4gbWFjaGluZXJ5IHRvIHNhdmUgYSBzaW5nbGUgaW5zdGFuY2Ugb2YgYSBzcGVjaWZp
YyB0eXBlPwo+PiBTdXJlLCBJIHdpbGwgYWRkIGEgdG9vbCBwYXRjaCBhdCB0aGUgZW5kIG9mIHRo
ZSBzZXJpZXMKPiAKPiBJcyB0aGlzIHVyZ2VudCB0byBiZSBpbiB0aGlzIHNlcmllcz8gSWYgbm90
IEkgd2lsbCBhZGQgYSBuZXcgcGF0Y2gKPiBhZnRlciBpdCBpcyBhbGwgaW4uIAoKQ29uc2lkZXJp
bmcgdGhlIHByb2JsZW1zIHRoYXQgdGhlcmUgaGF2ZSBiZWVuIHdpdGggdGhpcyBzZXJpZXMsCmFu
eXRoaW5nIHRvIGhlbHAgYnVpbGQgY29uZmlkZW5jZSBpbiB0aGluZ3Mgc3RpbGwgd29ya2luZyBm
b3IgYWxsCmNhc2VzIHdvdWxkIGhlbHAgaGVyZSwgc28gSSdtIHByZXR0eSBnbGFkIFJvZ2VyIHRo
b3VnaHQgb2YgdGhpcywKYW5kIHdoaWxlIEkgd291bGRuJ3QgbWFrZSBpdCBhcyBzdHJvbmcgYXMg
InRoZSBzZXJpZXMgY2FuJ3QgZ28KaW4gd2l0aG91dCB0aGlzIiwgSSdkIHN0aWxsIG11Y2ggcHJl
ZmVyIGlmIHlvdSB0b28gdGhlIHRpbWUuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
