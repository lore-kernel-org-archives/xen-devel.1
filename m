From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] xen: xen-pciback: Replace GFP_ATOMIC with
 GFP_KERNEL in pcistub_reg_add
Date: Wed, 11 Apr 2018 09:15:31 +0800
Message-ID: <1523409331-1214-1-git-send-email-baijiaju1990__17405.720431316$1523409368$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+c8v=ha=gmail.com=baijiaju1990@srs-us1.protection.inumbo.net>)
 id 1f64Ns-00053E-V1
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 01:17:13 +0000
Received: by mail-pg0-x241.google.com with SMTP id d6so27469pgt.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Apr 2018 18:17:11 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com, gregkh@linuxfoundation.org
Cc: xen-devel@lists.xenproject.org, Jia-Ju Bai <baijiaju1990@gmail.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

cGNpc3R1Yl9yZWdfYWRkKCkgaXMgbmV2ZXIgY2FsbGVkIGluIGF0b21pYyBjb250ZXh0LgoKcGNp
c3R1Yl9yZWdfYWRkKCkgaXMgb25seSBjYWxsZWQgYnkgcGNpc3R1Yl9xdWlya19hZGQsIHdoaWNo
IGlzIApvbmx5IHNldCBpbiBEUklWRVJfQVRUUigpLgoKRGVzcGl0ZSBuZXZlciBnZXR0aW5nIGNh
bGxlZCBmcm9tIGF0b21pYyBjb250ZXh0LApwY2lzdHViX3JlZ19hZGQoKSBjYWxscyBremFsbG9j
KCkgd2l0aCBHRlBfQVRPTUlDLAp3aGljaCBkb2VzIG5vdCBzbGVlcCBmb3IgYWxsb2NhdGlvbi4K
R0ZQX0FUT01JQyBpcyBub3QgbmVjZXNzYXJ5IGFuZCBjYW4gYmUgcmVwbGFjZWQgd2l0aCBHRlBf
S0VSTkVMLAp3aGljaCBjYW4gc2xlZXAgYW5kIGltcHJvdmUgdGhlIHBvc3NpYmlsaXR5IG9mIHN1
Y2Vzc2Z1bCBhbGxvY2F0aW9uLgoKVGhpcyBpcyBmb3VuZCBieSBhIHN0YXRpYyBhbmFseXNpcyB0
b29sIG5hbWVkIERDTlMgd3JpdHRlbiBieSBteXNlbGYuCkFuZCBJIGFsc28gbWFudWFsbHkgY2hl
Y2sgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKaWEtSnUgQmFpIDxiYWlqaWFqdTE5OTBAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2sv
cGNpX3N0dWIuYwppbmRleCA5ZTQ4MGZkLi45ZDkyYmVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hl
bi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jCisrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3Bj
aV9zdHViLmMKQEAgLTExNDksNyArMTE0OSw3IEBAIHN0YXRpYyBpbnQgcGNpc3R1Yl9yZWdfYWRk
KGludCBkb21haW4sIGludCBidXMsIGludCBzbG90LCBpbnQgZnVuYywKIAl9CiAJZGV2ID0gcHNk
ZXYtPmRldjsKIAotCWZpZWxkID0ga3phbGxvYyhzaXplb2YoKmZpZWxkKSwgR0ZQX0FUT01JQyk7
CisJZmllbGQgPSBremFsbG9jKHNpemVvZigqZmllbGQpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWZp
ZWxkKSB7CiAJCWVyciA9IC1FTk9NRU07CiAJCWdvdG8gb3V0OwotLSAKMS45LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
