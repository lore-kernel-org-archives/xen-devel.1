From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH] x86/mtrr: recalculate P2M type for domains with
 iocaps
Date: Tue, 23 Apr 2019 12:37:58 +0100
Message-ID: <1556019478-10835-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6DT4=SZ=citrix.com=prvs=009047f5f=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hItkp-0003FH-DA
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 11:38:27 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>, wei.liu2@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBjaGFuZ2UgcmVmbGVjdHMgdGhlIGxvZ2ljIGluIGVwdGVfZ2V0X2VudHJ5X2VtdCgpIGFu
ZCBhbGxvd3MKY2hhbmdlcyBpbiBndWVzdCBNVFRScyB0byBiZSByZWZsZWN0ZWQgaW4gRVBUIGZv
ciBkb21haW5zIGhhdmluZwpkaXJlY3QgYWNjZXNzIHRvIGNlcnRhaW4gaGFyZHdhcmUgbWVtb3J5
IHJlZ2lvbnMgYnV0IHdpdGhvdXQgSU9NTVUKY29udGV4dCBhc3NpZ25lZCAoZS5nLiBYZW5HVCku
CgpTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNv
bT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL210cnIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9o
dm0vbXRyci5jIGIveGVuL2FyY2gveDg2L2h2bS9tdHJyLmMKaW5kZXggYjhmYTM0MC4uN2NjZDg1
YiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9tdHJyLmMKKysrIGIveGVuL2FyY2gveDg2
L2h2bS9tdHJyLmMKQEAgLTc4Myw3ICs3ODMsNyBAQCBIVk1fUkVHSVNURVJfU0FWRV9SRVNUT1JF
KE1UUlIsIGh2bV9zYXZlX210cnJfbXNyLCBodm1fbG9hZF9tdHJyX21zciwgMSwKIAogdm9pZCBt
ZW1vcnlfdHlwZV9jaGFuZ2VkKHN0cnVjdCBkb21haW4gKmQpCiB7Ci0gICAgaWYgKCBoYXNfaW9t
bXVfcHQoZCkgJiYgZC0+dmNwdSAmJiBkLT52Y3B1WzBdICkKKyAgICBpZiAoIChoYXNfaW9tbXVf
cHQoZCkgfHwgY2FjaGVfZmx1c2hfcGVybWl0dGVkKGQpKSAmJiBkLT52Y3B1ICYmIGQtPnZjcHVb
MF0gKQogICAgIHsKICAgICAgICAgcDJtX21lbW9yeV90eXBlX2NoYW5nZWQoZCk7CiAgICAgICAg
IGZsdXNoX2FsbChGTFVTSF9DQUNIRSk7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
