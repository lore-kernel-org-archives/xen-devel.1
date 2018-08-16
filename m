From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxl: fix ARM build after 54ed251dc7
Date: Thu, 16 Aug 2018 08:41:55 +0100
Message-ID: <9297c93c-5fcc-a817-578d-71ec0bdb49bb@citrix.com>
References: <5B751E7902000078001DEB43@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rytq=k7=citrix.com=prvs=759b2abc3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fqCut-0004tI-6r
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 07:41:59 +0000
In-Reply-To: <5B751E7902000078001DEB43@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDgvMjAxOCAwNzo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQ29tbWl0ICJ0b29sczog
UmV3b3JrIHhjX2RvbWFpbl9jcmVhdGUoKSB0byB0YWtlIGEgZnVsbAo+IHhlbl9kb21jdGxfY3Jl
YXRlZG9tYWluIiAgZmFpbGVkIHRvIHJlcGxhY2Ugb25lIGZ1cnRoZXIgaW5zdGFuY2Ugb2YKPiB4
Y19jb25maWcgaW4gbGlieGxfX2FyY2hfZG9tYWluX3NhdmVfY29uZmlnKCkuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gSSBoYXZlIG5v
IGVudmlyb25tZW50IHNldCB1cCB0byBkbyBjcm9zcyB0b29sIHN0YWNrIGJ1aWxkcywgc28gdGhl
IHBhdGNoCj4gaXMgc29sZWx5IGJhc2VkIG9uIG9zc3Rlc3QgcmVwb3J0IGFuZCBjb2RlIGluc3Bl
Y3Rpb24uCgpOb3IgZG8gSSBzYWRseSwgYW5kIHdlIGRvbid0IHlldCBoYXZlIHRoaXMgd29ya2lu
ZyBpbiBUcmF2aXMvZ2l0bGFiCndoaWNoIGlzIHRoYXQgdGVzdGluZyBtaXNzZWQgaXQuCgpBY2tl
ZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCj4KPiAtLS0g
YS90b29scy9saWJ4bC9saWJ4bF9hcm0uYwo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5j
Cj4gQEAgLTEyNSw3ICsxMjUsNyBAQCBpbnQgbGlieGxfX2FyY2hfZG9tYWluX3NhdmVfY29uZmln
KGxpYnhsX19nYyAqZ2MsCj4gICAgICAgICAgcmV0dXJuIEVSUk9SX0ZBSUw7Cj4gICAgICB9Cj4g
IAo+IC0gICAgc3RhdGUtPmNsb2NrX2ZyZXF1ZW5jeSA9IHhjX2NvbmZpZy0+Y2xvY2tfZnJlcXVl
bmN5Owo+ICsgICAgc3RhdGUtPmNsb2NrX2ZyZXF1ZW5jeSA9IGNvbmZpZy0+YXJjaC5jbG9ja19m
cmVxdWVuY3k7Cj4gIAo+ICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
