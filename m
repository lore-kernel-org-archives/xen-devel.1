From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 24/34] x86/mem_access: put HVM only function
 under CONFIG_HVM
Date: Fri, 17 Aug 2018 16:12:42 +0100
Message-ID: <32a9abc8421e09b6807aa93024f40f0535202bbc.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqgfz-0001T3-Mc
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:28:35 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvbW0vbWVtX2FjY2Vzcy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgYi94ZW4vYXJj
aC94ODYvbW0vbWVtX2FjY2Vzcy5jCmluZGV4IDAzYTg2NDEuLmUxNTI1ZmQgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9h
Y2Nlc3MuYwpAQCAtMTM4LDYgKzEzOCw3IEBAIGJvb2wgcDJtX21lbV9hY2Nlc3NfZW11bGF0ZV9j
aGVjayhzdHJ1Y3QgdmNwdSAqdiwKICAgICByZXR1cm4gdmlvbGF0aW9uOwogfQogCisjaWYgQ09O
RklHX0hWTQogYm9vbCBwMm1fbWVtX2FjY2Vzc19jaGVjayhwYWRkcl90IGdwYSwgdW5zaWduZWQg
bG9uZyBnbGEsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBucGZlYyBucGZlYywK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdm1fZXZlbnRfcmVxdWVzdF90ICoqcmVxX3B0cikK
QEAgLTI0NCw2ICsyNDUsNyBAQCBib29sIHAybV9tZW1fYWNjZXNzX2NoZWNrKHBhZGRyX3QgZ3Bh
LCB1bnNpZ25lZCBsb25nIGdsYSwKICAgICAvKiBSZXR1cm4gd2hldGhlciB2Q1BVIHBhdXNlIGlz
IHJlcXVpcmVkIChha2EuIHN5bmMgZXZlbnQpICovCiAgICAgcmV0dXJuIChwMm1hICE9IHAybV9h
Y2Nlc3NfbjJyd3gpOwogfQorI2VuZGlmCiAKIGludCBwMm1fc2V0X2FsdHAybV9tZW1fYWNjZXNz
KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwMm1fZG9tYWluICpocDJtLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHAybV9kb21haW4gKmFwMm0sIHAybV9hY2Nlc3NfdCBh
LAotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
