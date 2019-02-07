From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 11/55] x86/mm: change pl1e to l1t in
 virt_to_xen_l1e
Date: Thu, 7 Feb 2019 16:44:12 +0000
Message-ID: <20190207164456.9260-12-wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBy9=QO=citrix.com=prvs=93456468f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1grn2L-0003C9-0r
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 17:00:29 +0000
In-Reply-To: <20190207164456.9260-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2Ugd2lsbCBuZWVkIHRvIGhhdmUgYSB2YXJpYWJsZSBuYW1lZCBwbDFlIHdoZW4gd2UgcmV3cml0
ZQp2aXJ0X3RvX3hlbl9sMWUuIENoYW5nZSBwbDFlIHRvIGwxdCB0byByZWZsZWN0IGJldHRlciBp
dHMgcHVycG9zZS4KVGhpcyB3aWxsIG1ha2UgcmV2aWV3aW5nIGxhdGVyIHBhdGNoIGVhc2llci4K
Ck5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyB8IDE0ICsrKysrKystLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggZjNhODYwNTJl
Mi4uMjYwNmIzMDdlYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2Fy
Y2gveDg2L21tLmMKQEAgLTQ4NDUsMjIgKzQ4NDUsMjIgQEAgbDFfcGdlbnRyeV90ICp2aXJ0X3Rv
X3hlbl9sMWUodW5zaWduZWQgbG9uZyB2KQogICAgIGlmICggIShsMmVfZ2V0X2ZsYWdzKCpwbDJl
KSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICB7CiAgICAgICAgIGJvb2wgbG9ja2luZyA9IHN5c3Rl
bV9zdGF0ZSA+IFNZU19TVEFURV9ib290OwotICAgICAgICBsMV9wZ2VudHJ5X3QgKnBsMWUgPSBh
bGxvY194ZW5fcGFnZXRhYmxlKCk7CisgICAgICAgIGwxX3BnZW50cnlfdCAqbDF0ID0gYWxsb2Nf
eGVuX3BhZ2V0YWJsZSgpOwogCi0gICAgICAgIGlmICggIXBsMWUgKQorICAgICAgICBpZiAoICFs
MXQgKQogICAgICAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgICAgIGlmICggbG9ja2luZyApCiAg
ICAgICAgICAgICBzcGluX2xvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKICAgICAgICAgaWYgKCAhKGwy
ZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFJFU0VOVCkgKQogICAgICAgICB7Ci0gICAgICAg
ICAgICBjbGVhcl9wYWdlKHBsMWUpOwotICAgICAgICAgICAgbDJlX3dyaXRlKHBsMmUsIGwyZV9m
cm9tX3BhZGRyKF9fcGEocGwxZSksIF9fUEFHRV9IWVBFUlZJU09SKSk7Ci0gICAgICAgICAgICBw
bDFlID0gTlVMTDsKKyAgICAgICAgICAgIGNsZWFyX3BhZ2UobDF0KTsKKyAgICAgICAgICAgIGwy
ZV93cml0ZShwbDJlLCBsMmVfZnJvbV9wYWRkcihfX3BhKGwxdCksIF9fUEFHRV9IWVBFUlZJU09S
KSk7CisgICAgICAgICAgICBsMXQgPSBOVUxMOwogICAgICAgICB9CiAgICAgICAgIGlmICggbG9j
a2luZyApCiAgICAgICAgICAgICBzcGluX3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwotICAgICAg
ICBpZiAoIHBsMWUgKQotICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKHBsMWUpOworICAg
ICAgICBpZiAoIGwxdCApCisgICAgICAgICAgICBmcmVlX3hlbl9wYWdldGFibGUobDF0KTsKICAg
ICB9CiAKICAgICBCVUdfT04obDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9QU0UpOwotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
