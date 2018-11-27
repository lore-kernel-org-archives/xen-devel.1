From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] CODING_STYLE: explicitly call out label
 indentation
Date: Tue, 27 Nov 2018 15:23:13 +0000
Message-ID: <20181127152313.aicyygwdipch3fbf@zion.uk.xensource.com>
References: <5BFBB70502000078001FFBDC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q9xt=og=citrix.com=prvs=862b52565=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gRfCn-0006j0-Uc
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 15:23:17 +0000
Content-Disposition: inline
In-Reply-To: <5BFBB70502000078001FFBDC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMjYsIDIwMTggYXQgMDI6MDQ6MDVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gU2luY2UgdGhlIGJlaGF2aW9yIG9mICJkaWZmIC1wIiB0byB1c2UgYW4gdW5pbmRlbnRl
ZCBsYWJlbCBhcyBjb250ZXh0Cj4gaWRlbnRpZmllciBvZnRlbiBtYWtlcyBpdCBoYXJkZXIgdG8g
cmV2aWV3IHBhdGNoZXMsIG1ha2UgZXhwbGljaXQgdGhlCj4gcmVxdWlyZW1lbnQgZm9yIGxhYmVs
cyB0byBiZSBpbmRlbnRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gCj4gLS0tIGEvQ09ESU5HX1NUWUxFCj4gKysrIGIvQ09ESU5HX1NUWUxF
Cj4gQEAgLTMxLDYgKzMxLDEwIEBAIHZvaWQgZnVuKHZvaWQpCj4gICAgICB9Cj4gIH0KPiAgCj4g
K0R1ZSB0byB0aGUgYmVoYXZpb3Igb2YgR05VIGRpZmZ1dGlscyAiZGlmZiAtcCIsIGxhYmVscyBz
aG91bGQgYmUKPiAraW5kZW50ZWQgYnkgYXQgbGVhc3Qgb25lIGJsYW5rLiAgTm9uLWNhc2UgbGFi
ZWxzIGluc2lkZSBzd2l0Y2goKSBib2RpZXMKPiArYXJlIHByZWZlcnJlZCB0byBiZSBpbmRlbnRl
ZCB0aGUgc2FtZSBhcyB0aGUgYmxvY2sncyBjYXNlIGxhYmVscy4KPiArCgpTb3JyeSwgSSBkb24n
dCBmb2xsb3cgdGhpcyByYXRpb25hbGUuCgpJIGFjdHVhbGx5IHRyaWVkIGBkaWZmIC1wYCB3aXRo
IGFuZCB3aXRob3V0IGluZGVudGluZyB0aGUgbGFiZWwuIEhlcmUgaXMKdGhlIHJlc3VsdC4KCldp
dGg6CgoqKioga2VybmVsLmMub3JpZyAgICAgICAyMDE4LTExLTI3IDE1OjE1OjIwLjg0MTI5NjA4
OSArMDAwMAotLS0ga2VybmVsLmMgICAgMjAxOC0xMS0yNyAxNToyMDoyMy4xOTIwMjIwNjQgKzAw
MDAKKioqKioqKioqKioqKioqIHN0YXRpYyBpbnQgYXNzaWduX2ludGVnZXJfcGFyYW0oY29uc3Qg
c3QKKioqIDQ4LDU0ICoqKioKICAgICAgZGVmYXVsdDoKICAgICAgICAgIEJVRygpOwogICAgICB9
CiEKICAgICAgcmV0dXJuIDA7CiAgfQoKLS0tIDQ4LDU0IC0tLS0KICAgICAgZGVmYXVsdDoKICAg
ICAgICAgIEJVRygpOwogICAgICB9CiEgIGxhYmVsOgogICAgICByZXR1cm4gMDsKICB9CgoKV2l0
aG91dDoKCioqKiBrZXJuZWwuYy5vcmlnICAgICAgIDIwMTgtMTEtMjcgMTU6MTU6MjAuODQxMjk2
MDg5ICswMDAwCi0tLSBrZXJuZWwuYyAgICAyMDE4LTExLTI3IDE1OjIxOjAxLjQ1NjM2MDEyOCAr
MDAwMAoqKioqKioqKioqKioqKiogc3RhdGljIGludCBhc3NpZ25faW50ZWdlcl9wYXJhbShjb25z
dCBzdAoqKiogNDgsNTQgKioqKgogICAgICBkZWZhdWx0OgogICAgICAgICAgQlVHKCk7CiAgICAg
IH0KIQogICAgICByZXR1cm4gMDsKICB9CgotLS0gNDgsNTQgLS0tLQogICAgICBkZWZhdWx0Ogog
ICAgICAgICAgQlVHKCk7CiAgICAgIH0KISBsYWJlbDoKICAgICAgcmV0dXJuIDA7CiAgfQoKClRo
ZXkgbG9vayB0aGUgc2FtZSB0byBtZS4gQW5kIGZyYW5rbHkgaGF2aW5nIGFuIGV4dHJhIHNwYWNl
IGluIGZyb250IG1ha2UgWGVuCnJhdGhlciB0b28gdW5pcXVlLiBUaGF0J3MgYW4gaXNzdWUgZm9y
IG5ldyBjb21lcnMgYW5kIHdyaXRpbmcgYXV0b21hdGVkIHRvb2wKdG8gY2hlY2sgcGF0Y2guCgpX
ZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
