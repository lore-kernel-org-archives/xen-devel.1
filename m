From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/6] x86/pvh: fix fixes for PVH Dom0
Date: Tue, 9 Oct 2018 11:42:30 +0200
Message-ID: <20181009094236.51522-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=av44=mv=citrix.com=prvs=81391bf32=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g9oXk-000623-Qv
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 09:43:08 +0000
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

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBjb250YWluIG1pc2NlbGxhbmVvdXMgZml4ZXMg
Zm9yIGEgUFZIIERvbTAuIEkndmUKZm91bmQgb3V0IHRoaXMgaXNzdWVzIHdoaWxlIHRyeWluZyB0
byBib290IG9uIGFuIEFNRCBFUFlDIGJveC4KClRoZSBzZXJpZXMgY2FuIGJlIGZvdW5kIG9uIG15
IGdpdCByZXBvIG9uIHRvcCBvZiAieDg2L3Z0ZDogZml4CmlvbW11X3NoYXJlX3AybV90YWJsZSI6
CgpnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL3JveWdlci94ZW4uZ2l0IGZpeGVzX3B2aAoK
VGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAoNik6CiAgeDg2L3B2aDogZml4IFRTQyBt
b2RlIHNldHVwIGZvciBQVkggRG9tMAogIHg4Ni9kb20wOiBzd2l0Y2ggcGFyc2VfZG9tMF9wYXJh
bSB0byB1c2UgcGFyc2VfYm9vbGVhbgogIHg4Ni9wdmg6IGFsbG93IFBWSCBEb20wIHRvIHVzZSB0
aGUgZGVidWcgSU8gcG9ydCBjb25zb2xlCiAgdnBjaTogZml4IHVwZGF0aW5nIHRoZSBjb21tYW5k
IHJlZ2lzdGVyCiAgdnBjaTogZml4IGV4ZWN1dGlvbiBvZiBsb25nIHJ1bm5pbmcgb3BlcmF0aW9u
cwogIHZwY2kvbXNpeDogY2FydmUgcDJtIGhvbGUgZm9yIE1TSVggTU1JTyByZWdpb25zCgogZG9j
cy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24gfCAxMSArKysrKysrKwogeGVuL2FyY2gv
eDg2L2RvbTBfYnVpbGQuYyAgICAgICAgICAgfCAyMiArKysrKysrKysrKysrLS0tCiB4ZW4vYXJj
aC94ODYvaHZtL2lvcmVxLmMgICAgICAgICAgICB8ICA2ICsrLS0tCiB4ZW4vYXJjaC94ODYvdGlt
ZS5jICAgICAgICAgICAgICAgICB8ICAyICstCiB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jICAg
ICAgICAgICB8IDMwICsrKysrKysrKysrKysrKystLS0tLS0KIHhlbi9kcml2ZXJzL3ZwY2kvbXNp
eC5jICAgICAgICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9p
bmNsdWRlL3hlbi92cGNpLmggICAgICAgICAgICAgIHwgIDkgKysrKy0tLQogNyBmaWxlcyBjaGFu
Z2VkLCAxMDEgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgotLSAKMi4xOS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
