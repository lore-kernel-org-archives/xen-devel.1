From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/2] clang: fixes for the indirect thunk
Date: Wed, 24 Jan 2018 15:48:47 +0000
Message-ID: <20180124154849.84889-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rcjb=et=citrix.com=prvs=555701784=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eeNIi-0008EF-Cp
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 15:49:24 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHR3byBwYXRjaGVzIGZpeCBidWlsZGluZyBYZW4gd2l0aCBj
bGFuZyBhbmQgdGhlIGluZGlyZWN0CnRodW5rLgoKUGF0Y2ggMiBpcyBub3Qgc3RyaWN0bHkgbmVl
ZGVkLCBiZWNhdXNlIHdoZW4gYnVpbGRpbmcgd2l0aCBjbGFuZyB3ZQpzdGlsbCBjb21waWxlIGFz
c2VtYmx5IG9ubHkgZmlsZXMgd2l0aCAtbm8taW50ZWdyYXRlZC1hcywgYnV0IGl0J3MgYQpuaWNl
IHRvIGhhdmUgc28gdGhhdCB3ZSBkb24ndCByZWdyZXNzIG1vcmUgaW4gYXNzZW1ibHkgb25seSBj
b2RlLgoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAoMik6CiAgeDg2L2NsYW5nOiBm
aXggYnVpbGQgd2l0aCBpbmRpcmVjdCB0aHVua3MKICB4ODY6IGZpeCBpbmRpcmVjdCB0aHVuayB1
c2FnZSBvZiBDT05GSUdfSU5ESVJFQ1RfVEhVTksKCiB4ZW4vUnVsZXMubWsgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA2ICsrKystLQogeGVuL2FyY2gveDg2L2V4dGFibGUuYyAgICAgICAg
ICAgICAgICAgfCAgMyArKy0KIHhlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5j
IHwgIDMgKystCiB4ZW4vY29tbW9uL3dhaXQuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxICsK
IHhlbi9pbmNsdWRlL2FzbS14ODYvYXNtX2RlZm5zLmggICAgICAgIHwgMTAgKysrKysrKy0tLQog
NSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKLS0gCjIu
MTUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
