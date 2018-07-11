From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 07/16] x86/shadow: fetch CPL just once in
 sh_page_fault()
Date: Wed, 11 Jul 2018 07:50:22 -0600
Message-ID: <5B460B1E02000078001D3319@prv1-mh.provo.novell.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B46064302000078001D328C@prv1-mh.provo.novell.com>
 <20180711134646.GA2399@deinos.phlegethon.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t1xz=j3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fdFVh-0003Vm-TI
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 13:50:25 +0000
In-Reply-To: <20180711134646.GA2399@deinos.phlegethon.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tim Deegan <tim@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA3LjE4IGF0IDE1OjQ2LCA8dGltQHhlbi5vcmc+IHdyb3RlOgo+IEF0IDA3OjI5
IC0wNjAwIG9uIDExIEp1bCAoMTUzMTI5NDE3OSksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGlz
IGlzbid0IGFzIG11Y2ggb2YgYW4gb3B0aW1pemF0aW9uIHRoYW4gdG8gYXZvaWQgdHJpZ2dlcmlu
ZyBhIGdjYyBidWcKPj4gYWZmZWN0aW5nIDUueCAuLi4gNy54LCB0cmlnZ2VyZWQgYnkgYW55IGFz
bSgpIHB1dCBpbnNpZGUgdGhlIGFkIGhvYwo+PiAicmV3YWxrIiBsb29wIGFuZCB0YWtpbmcgYXMg
YW4gKG91dHB1dD8pIG9wZXJhbmQgYSByZWdpc3RlciB2YXJpYWJsZQo+PiB0aWVkIHRvICVyZHgg
KGFuICJyZHgiIGNsb2JiZXIgaXMgZmluZSkuIFRoZSBpc3N1ZSBpcyBkdWUgdG8gYW4gYXBwYXJl
bnQKPj4gY29sbGlzaW9uIGluIHJlZ2lzdGVyIHVzZSB3aXRoIHRoZSBtb2R1bG8gb3BlcmF0aW9u
IGluIHZ0bGJfaGFzaCgpLAo+PiB3aGljaCAod2l0aCBvcHRpbWl6YXRpb24gZW5hYmxlZCkgaW52
b2x2ZXMgYSBtdWx0aXBsaWNhdGlvbiBvZiB0d28KPj4gNjQtYml0IHZhbHVlcyB3aXRoIHRoZSB1
cHBlciBoYWxmIChpbiAlcmR4KSBvZiB0aGUgMTI4LWJpdCByZXN1bHQgYmVpbmcKPj4gb2YgaW50
ZXJlc3QuCj4+IAo+PiBTdWNoIGFuIGFzbSgpIHdhcyBvcmlnaW5hbGx5IG1lYW50IHRvIGJlIGlt
cGxpY2l0bHkgaW50cm9kdWNlZCBpbnRvIHRoZQo+PiBjb2RlIHdoZW4gY29udmVydGluZyBtb3N0
IGluZGlyZWN0IGNhbGxzIHRocm91Z2ggdGhlIGh2bV9mdW5jcyB0YWJsZSB0bwo+PiBkaXJlY3Qg
Y2FsbHMgKHZpYSBhbHRlcm5hdGl2ZSBpbnN0cnVjdGlvbiBwYXRjaGluZyk7IHRoYXQgbW9kZWwg
d2FzCj4+IHN3aXRjaGVkIHRvIGNsb2JiZXJzIGR1ZSB0byBmdXJ0aGVyIGNvbXBpbGVyIHByb2Js
ZW1zLCBidXQgSSB0aGluayB0aGUKPj4gY2hhbmdlIGhlcmUgaXMgd29ydGh3aGlsZSBuZXZlcnRo
ZWxlc3MuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4gCj4gSSBkb24ndCBxdWl0ZSBmb2xsb3cgd2hhdCB0aGUgY29tcGlsZXIgYnVnIGRvZXMg
aGVyZSAtLSBpdCB3b3VsZCBiZSBuaWNlCj4gdG8gc2F5IHdoYXQgZWZmZWN0IGl0IGhhcyBvbiB0
aGUgZmluYWwgY29kZS4gIEluIGFueSBjYXNlLCB0aGUgY29kZQo+IGNoYW5nZSBpcyBmaW5lLgoK
VGhlcmUgd2FzIG5vIGZpbmFsIGNvZGUgLSBpdCB3YXMgYW4gSW50ZXJuYWwgQ29tcGlsZXIgRXJy
b3IuCgo+IFJldmlld2VkLWJ5OiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KClRoYW5rcywgSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
