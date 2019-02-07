From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 10/55] x86/mm: change pl2e to l2t in
 virt_to_xen_l2e
Date: Thu, 7 Feb 2019 16:44:11 +0000
Message-ID: <20190207164456.9260-11-wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBy9=QO=citrix.com=prvs=93456468f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1grn28-0002PG-3l
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 17:00:16 +0000
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

V2Ugd2lsbCBuZWVkIHRvIGhhdmUgYSB2YXJpYWJsZSBuYW1lZCBwbDJlIHdoZW4gd2UgcmV3cml0
ZQp2aXJ0X3RvX3hlbl9sMmUuIENoYW5nZSBwbDJlIHRvIGwydCB0byByZWZsZWN0IGJldHRlciBp
dHMgcHVycG9zZS4KVGhpcyB3aWxsIG1ha2UgcmV2aWV3aW5nIGxhdGVyIHBhdGNoIGVhc2llci4K
Ck5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyB8IDE0ICsrKysrKystLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggYTE1YWE4MGUx
Ni4uZjNhODYwNTJlMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2Fy
Y2gveDg2L21tLmMKQEAgLTQ4MTIsMjIgKzQ4MTIsMjIgQEAgc3RhdGljIGwyX3BnZW50cnlfdCAq
dmlydF90b194ZW5fbDJlKHVuc2lnbmVkIGxvbmcgdikKICAgICBpZiAoICEobDNlX2dldF9mbGFn
cygqcGwzZSkgJiBfUEFHRV9QUkVTRU5UKSApCiAgICAgewogICAgICAgICBib29sIGxvY2tpbmcg
PSBzeXN0ZW1fc3RhdGUgPiBTWVNfU1RBVEVfYm9vdDsKLSAgICAgICAgbDJfcGdlbnRyeV90ICpw
bDJlID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOworICAgICAgICBsMl9wZ2VudHJ5X3QgKmwydCA9
IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKIAotICAgICAgICBpZiAoICFwbDJlICkKKyAgICAgICAg
aWYgKCAhbDJ0ICkKICAgICAgICAgICAgIHJldHVybiBOVUxMOwogICAgICAgICBpZiAoIGxvY2tp
bmcgKQogICAgICAgICAgICAgc3Bpbl9sb2NrKCZtYXBfcGdkaXJfbG9jayk7CiAgICAgICAgIGlm
ICggIShsM2VfZ2V0X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgewot
ICAgICAgICAgICAgY2xlYXJfcGFnZShwbDJlKTsKLSAgICAgICAgICAgIGwzZV93cml0ZShwbDNl
LCBsM2VfZnJvbV9wYWRkcihfX3BhKHBsMmUpLCBfX1BBR0VfSFlQRVJWSVNPUikpOwotICAgICAg
ICAgICAgcGwyZSA9IE5VTEw7CisgICAgICAgICAgICBjbGVhcl9wYWdlKGwydCk7CisgICAgICAg
ICAgICBsM2Vfd3JpdGUocGwzZSwgbDNlX2Zyb21fcGFkZHIoX19wYShsMnQpLCBfX1BBR0VfSFlQ
RVJWSVNPUikpOworICAgICAgICAgICAgbDJ0ID0gTlVMTDsKICAgICAgICAgfQogICAgICAgICBp
ZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsK
LSAgICAgICAgaWYgKCBwbDJlICkKLSAgICAgICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShwbDJl
KTsKKyAgICAgICAgaWYgKCBsMnQgKQorICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKGwy
dCk7CiAgICAgfQogCiAgICAgQlVHX09OKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNF
KTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
