From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 04/10] x86/passthrough: arch_pci_clean_irqs
	is HVM only
Date: Wed, 21 Feb 2018 21:46:55 +0000
Message-ID: <20180221214701.1646-5-wei.liu2@citrix.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=igdh=fp=citrix.com=prvs=5836394aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eocEE-0001fo-5Y
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2018 21:47:06 +0000
In-Reply-To: <20180221214701.1646-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

UHJvdmlkZSBhICFDT05GSUdfSFZNIHN0dWIgaW4gcHJlcGFyYXRpb24gZm9yIGZ1dHVyZSB1c2Fn
ZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L3BjaS5jIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3g4Ni9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9wY2kuYwppbmRl
eCBlMGE3ZTQ3M2IxLi5jZGJhOTA1NDY2IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC94ODYvcGNpLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L3BjaS5jCkBA
IC00LDYgKzQsOCBAQAogCiAjaW5jbHVkZSA8YXNtL2h2bS9pcnEuaD4KIAorI2lmZGVmIENPTkZJ
R19IVk0KKwogc3RhdGljIGludCBwY2lfY2xlYW5fZHBjaV9pcnEoc3RydWN0IGRvbWFpbiAqZCwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBodm1fcGlycV9kcGNpICpwaXJx
X2RwY2ksIHZvaWQgKmFyZykKIHsKQEAgLTUyLDYgKzU0LDE2IEBAIGludCBhcmNoX3BjaV9jbGVh
bl9pcnFzKHN0cnVjdCBkb21haW4gKmQpCiAgICAgcmV0dXJuIDA7CiB9CiAKKyNlbHNlCisKK2lu
dCBhcmNoX3BjaV9jbGVhbl9pcnFzKHN0cnVjdCBkb21haW4gKmQpCit7CisgICAgQVNTRVJUKCFp
c19odm1fZG9tYWluKGQpKTsKKyAgICByZXR1cm4gMDsKK30KKworI2VuZGlmCisKIC8qCiAgKiBM
b2NhbCB2YXJpYWJsZXM6CiAgKiBtb2RlOiBDCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
