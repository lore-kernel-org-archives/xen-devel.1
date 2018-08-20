From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 16/34] x86/hvm: enclose hvm_enabled and
 hvm_funcs in CONFIG_HVM
Date: Mon, 20 Aug 2018 07:04:09 -0600
Message-ID: <5B7ABC4902000078001E0100@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <f0815f2aea320a634f63f503534d0e8abdc2c1ee.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1frjqz-0001Ch-Ic
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 13:04:17 +0000
In-Reply-To: <f0815f2aea320a634f63f503534d0e8abdc2c1ee.1534518694.git-series.wei.liu2@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhpcyBoZWxwcyB0byB0YWtlIGFkdmFudGFnZSBvZiBkZWFkIGNvZGUgZWxpbWluYXRpb24uIFR1
cm4KPiBodm1fZW5hYmxlZCBpbnRvIHByb3BlciBib29sIHdoaWxlIGF0IGl0Lgo+IAo+IFByb3Zp
ZGluZyBhbiBlbXB0eSBodm1fZnVuY3MgcmVzb2x2ZXMgYSBsb3Qgb2YgdW5kZWZpbmVkIHJlZmVy
ZW5jZXMgdG8KPiBpdCBpbiB0aGUgaGVhZGVyLiBJdCBpcyBzYWZlIHRvIGRvIHNvIGJlY2F1c2Ug
dGhvc2UgZnVuY3Rpb25zIC8gbWFjcm9zCj4gYXJlIG5vdCBleHBlY3RlZCB0byBiZSB1c2VkLgoK
Im5vdCBleHBlY3RlZCB0byBiZSB1c2VkIiAhPSAibm90IHVzZWQiLiBUaGlzIC4uLgoKPiAtLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvaHZtL2h2bS5oCj4gQEAgLTIzNCw4ICsyMzQsMTQgQEAgc3RydWN0IGh2bV9mdW5jdGlvbl90
YWJsZSB7Cj4gICAgICB9IHRzY19zY2FsaW5nOwo+ICB9Owo+ICAKPiArI2lmIENPTkZJR19IVk0K
PiArZXh0ZXJuIGJvb2wgaHZtX2VuYWJsZWQ7Cj4gIGV4dGVybiBzdHJ1Y3QgaHZtX2Z1bmN0aW9u
X3RhYmxlIGh2bV9mdW5jczsKPiAtZXh0ZXJuIGJvb2xfdCBodm1fZW5hYmxlZDsKPiArI2Vsc2UK
PiArI2RlZmluZSBodm1fZW5hYmxlZCBmYWxzZQo+ICtzdGF0aWMgc3RydWN0IGh2bV9mdW5jdGlv
bl90YWJsZSBodm1fZnVuY3MgPSB7fTsKCi4uLiBpcyBhIG5vLWdvIGltby4gRWl0aGVyIGtlZXAg
dGhlIGV4dGVybiB2aXNpYmxlIChidXQgZG9uJ3QgaGF2ZSBhCmRlZmluaXRpb24gYW55d2hlcmUs
IHJlbHlpbmcgb24gRENFIG9uY2UgYWdhaW4pLCBvciBtYWtlIHN1cmUgdGhlCnN0cnVjdHVyZSBo
YXMgbm8gbWVtYmVycyBhdCBhbGwgaW4gdGhlICFIVk0gY2FzZSAoYnV0IHRoYXQgd291bGQKYXNz
dW1lIHRoZSByZWZlcmVuY2VzIHlvdSB0YWxrIGFib3V0IGFyZW4ndCBmaWVsZCBhY2Nlc3Nlcywg
YnV0Cm9ubHkgYWNjZXNzZXMgdG8gdGhlIGVudGlyZSBzdHJ1Y3R1cmUpLiBPdGhlcndpc2Ugd2Un
ZCBlbmQgdXAKd2l0aCBhIHNpZ25pZmljYW50IGFtb3VudCBvZiBOVUxMIHBvaW50ZXJzLgoKQnV0
IGluIHRoZSBlbmQgaXQncyBub3QgcmVhbGx5IGNsZWFyIHRvIG1lIHdoYXQgcHJvYmxlbSB5b3Un
cmUgdHJ5aW5nCnRvIHNvbHZlOiBUaGUgaGVhZGVyIGhlcmUgc2hvdWxkIG5vdCBiZSBpbmNsdWRl
ZCBhdCBhbGwgd2hlbiBIVk0KaXMgbm90IGVuYWJsZWQgKG9yIG1vc3Qgb2YgaXQgYmUgaW5zaWRl
ICIjaWZkZWYgQ09ORklHX0hWTSIpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
