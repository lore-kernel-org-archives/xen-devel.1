From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/6] libxl: add backend type and id to vkb
Date: Thu, 5 Jul 2018 16:06:35 +0100
Message-ID: <20180705150635.cfozvvficshbfzpv@citrix.com>
References: <20180612133147.807-1-al1img@gmail.com>
 <20180612133147.807-3-al1img@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzas=jv=citrix.com=prvs=717a9f9c1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fb5qC-0003xk-5Q
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 15:06:40 +0000
Content-Disposition: inline
In-Reply-To: <20180612133147.807-3-al1img@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Grytsov <al1img@gmail.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdW4gMTIsIDIwMTggYXQgMDQ6MzE6NDNQTSArMDMwMCwgT2xla3NhbmRyIEdyeXRz
b3Ygd3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVw
YW0uY29tPgpbLi4uXQo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF92a2IuYyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX3ZrYi5jCj4gaW5kZXggNzY1MmFkMjNjZS4uYmVhZjE3NDc1ZCAxMDA2
NDQKPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF92a2IuYwo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX3ZrYi5jCj4gQEAgLTE0LDEyICsxNCw0MiBAQAo+ICAKPiAgI2luY2x1ZGUgImxpYnhsX2lu
dGVybmFsLmgiCj4gIAo+ICsjaW5jbHVkZSA8eGVuL2lvL2tiZGlmLmg+Cj4gKwo+ICBzdGF0aWMg
aW50IGxpYnhsX19kZXZpY2VfdmtiX3NldGRlZmF1bHQobGlieGxfX2djICpnYywgdWludDMyX3Qg
ZG9taWQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9k
ZXZpY2VfdmtiICp2a2IsIGJvb2wgaG90cGx1ZykKPiAgewo+ICsgICAgaWYgKHZrYi0+YmFja2Vu
ZF90eXBlID09IExJQlhMX1ZLQl9CQUNLRU5EX1VOS05PV04pIHsKPiArICAgICAgICB2a2ItPmJh
Y2tlbmRfdHlwZSA9IExJQlhMX1ZLQl9CQUNLRU5EX1FFTVU7Cj4gKyAgICB9Cj4gKwo+ICAgICAg
cmV0dXJuIGxpYnhsX19yZXNvbHZlX2RvbWlkKGdjLCB2a2ItPmJhY2tlbmRfZG9tbmFtZSwgJnZr
Yi0+YmFja2VuZF9kb21pZCk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgbGlieGxfX2RldmljZV92
a2JfZG1fbmVlZGVkKGxpYnhsX2RldmljZV92a2IgKnZrYiwgdWludDMyX3QgZG9taWQpCj4gK3sK
PiArICAgaWYgKHZrYi0+YmFja2VuZF90eXBlID09IExJQlhMX1ZLQl9CQUNLRU5EX1FFTVUpIHsK
PiArICAgICAgICByZXR1cm4gMTsKPiArICAgfQoKSW5kZW50YXRpb24gaXMgd3JvbmcgaGVyZS4K
Cj4gKwo+ICsgICAgcmV0dXJuIDA7CgpUaGlzIGZ1bmN0aW9uIGNhbiBiZSBzaW1wbGlmaWVkIGFz
CgogICByZXR1cm4gdmtiLT5iYWNrZW5kX3R5cGUgPT0gTElCWExfVktCX0JBQ0tFTkRfUUVNVTsK
CkkgdGhpbmsgdGhpcyBwYXRjaCBpcyBhbHNvIG1pc3NpbmcgYWRkaW5nIExJQlhMX0hBVkUgaW4g
bGlieGwuaC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
