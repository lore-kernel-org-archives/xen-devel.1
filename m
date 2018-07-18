From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 3/6] x86/AMD: distinguish compute units
 from hyper-threads
Date: Wed, 18 Jul 2018 13:45:16 +0200
Message-ID: <20180718114516.dcpxn6sgzb4j2tri@mac>
References: <5B4EF70702000078001D53C7@prv1-mh.provo.novell.com>
 <5B4EF84D02000078001D53D7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lpv/=kc=citrix.com=prvs=730b0b06a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ffkta-00071P-0E
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 11:45:26 +0000
Content-Disposition: inline
In-Reply-To: <5B4EF84D02000078001D53D7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTgsIDIwMTggYXQgMDI6MjA6MjlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRmFtMTcgcmVwbGFjZXMgQ1VzIGJ5IEhUcywgd2hpY2ggd2Ugc2hvdWxkIHJlZmxlY3Qg
YWNjb3JkaW5nbHksIGV2ZW4gaWYKPiB0aGUgZGlmZmVyZW5jZSBpcyBub3QgdmVyeSBiaWcuIFRo
ZSBtb3N0IHJlbGV2YW50IGNoYW5nZSAocmVxdWlyaW5nIHNvbWUKPiBjb2RlIHJlc3RydWN0dXJp
bmcpIGlzIHRoYXQgdGhlIHRvcG9leHQgZmVhdHVyZSBubyBsb25nZXIgbWVhbnMgdGhlcmUgaXMK
PiBhIHZhbGlkIENVIElELgo+IAo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBjb252ZXJ0IHdy
b25nbHkgcGxhaW4gaW50IHZhcmlhYmxlcyBpbgo+IHNldF9jcHVfc2libGluZ19tYXAoKSB0byB1
bnNpZ25lZCBpbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+IFJldmlld2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4K
ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCj4g
LS0tCj4gdjI6IERvbid0IGJyZWFrIChib2d1cykgaW5kZW50YXRpb24gc3R5bGUgaW4gYW1kX2dl
dF90b3BvbG9neSgpLgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKPiArKysgYi94
ZW4vYXJjaC94ODYvY3B1L2FtZC5jCj4gQEAgLTUwNCwxNyArNTA0LDIzIEBAIHN0YXRpYyB2b2lk
IGFtZF9nZXRfdG9wb2xvZ3koc3RydWN0IGNwdWkKPiAgICAgICAgICAgICAgICAgIHUzMiBlYXgs
IGVieCwgZWN4LCBlZHg7Cj4gIAo+ICAgICAgICAgICAgICAgICAgY3B1aWQoMHg4MDAwMDAxZSwg
JmVheCwgJmVieCwgJmVjeCwgJmVkeCk7Cj4gLSAgICAgICAgICAgICAgICBjLT5jb21wdXRlX3Vu
aXRfaWQgPSBlYnggJiAweEZGOwo+ICAgICAgICAgICAgICAgICAgYy0+eDg2X251bV9zaWJsaW5n
cyA9ICgoZWJ4ID4+IDgpICYgMHgzKSArIDE7Cj4gKwo+ICsgICAgICAgICAgICAgICAgaWYgKGMt
Png4NiA8IDB4MTcpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGMtPmNvbXB1dGVfdW5pdF9p
ZCA9IGVieCAmIDB4RkY7Cj4gKyAgICAgICAgICAgICAgICBlbHNlIHsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgYy0+Y3B1X2NvcmVfaWQgPSBlYnggJiAweEZGOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICBjLT54ODZfbWF4X2NvcmVzIC89IGMtPng4Nl9udW1fc2libGluZ3M7Cj4gKyAg
ICAgICAgICAgICAgICB9CgpTaG91bGQgY29tcHV0ZV91bml0X2lkIGFuZCBjcHVfY29yZV9pZCBi
ZSBpbnNpZGUgb2YgYW4gdW5pb24gaW4KY3B1aW5mb194ODY/CgpSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
