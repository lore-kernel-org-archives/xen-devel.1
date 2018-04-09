From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH 3/4] xen: xen-pciback: Replace GFP_ATOMIC with
 GFP_KERNEL in pcistub_device_alloc
Date: Mon,  9 Apr 2018 23:04:12 +0800
Message-ID: <1523286252-26455-1-git-send-email-baijiaju1990__29819.8816170499$1523286245$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nvpu=g6=gmail.com=baijiaju1990@srs-us1.protection.inumbo.net>)
 id 1f5YLE-0002KS-Ep
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 15:04:20 +0000
Received: by mail-pl0-x243.google.com with SMTP id t20-v6so2476624ply.9
 for <xen-devel@lists.xenproject.org>; Mon, 09 Apr 2018 08:04:19 -0700 (PDT)
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

cGNpc3R1Yl9kZXZpY2VfYWxsb2MoKSBpcyBuZXZlciBjYWxsZWQgaW4gYXRvbWljIGNvbnRleHQu
CgpUaGUgY2FsbCBjaGFpbiBlbmRpbmcgdXAgYXQgcGNpc3R1Yl9kZXZpY2VfYWxsb2MoKSBpczoK
WzFdIHBjaXN0dWJfZGV2aWNlX2FsbG9jKCkgPC0gcGNpc3R1Yl9zZWl6ZSgpIDwtIHBjaXN0dWJf
cHJvYmUoKQpwY2lzdHViX3Byb2JlKCkgaXMgb25seSBzZXQgYXMgIi5wcm9iZSIgaW4gc3RydWN0
IHBjaV9kcml2ZXIuClRoaXMgZnVuY3Rpb24gaXMgbm90IGNhbGxlZCBpbiBhdG9taWMgY29udGV4
dC4KCkRlc3BpdGUgbmV2ZXIgZ2V0dGluZyBjYWxsZWQgZnJvbSBhdG9taWMgY29udGV4dCwKcGNp
c3R1Yl9kZXZpY2VfYWxsb2MoKSBjYWxscyBremFsbG9jKCkgd2l0aCBHRlBfQVRPTUlDLAp3aGlj
aCBkb2VzIG5vdCBzbGVlcCBmb3IgYWxsb2NhdGlvbi4KR0ZQX0FUT01JQyBpcyBub3QgbmVjZXNz
YXJ5IGFuZCBjYW4gYmUgcmVwbGFjZWQgd2l0aCBHRlBfS0VSTkVMLAp3aGljaCBjYW4gc2xlZXAg
YW5kIGltcHJvdmUgdGhlIHBvc3NpYmlsaXR5IG9mIHN1Y2Vzc2Z1bCBhbGxvY2F0aW9uLgoKU2ln
bmVkLW9mZi1ieTogSmlhLUp1IEJhaSA8YmFpamlhanUxOTkwQGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVu
LXBjaWJhY2svcGNpX3N0dWIuYyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMK
aW5kZXggOWU0ODBmZC4uZmVjYzUzNiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4veGVuLXBjaWJh
Y2svcGNpX3N0dWIuYworKysgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jCkBA
IC03MSw3ICs3MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpc3R1Yl9kZXZpY2UgKnBjaXN0dWJfZGV2
aWNlX2FsbG9jKHN0cnVjdCBwY2lfZGV2ICpkZXYpCiAKIAlkZXZfZGJnKCZkZXYtPmRldiwgInBj
aXN0dWJfZGV2aWNlX2FsbG9jXG4iKTsKIAotCXBzZGV2ID0ga3phbGxvYyhzaXplb2YoKnBzZGV2
KSwgR0ZQX0FUT01JQyk7CisJcHNkZXYgPSBremFsbG9jKHNpemVvZigqcHNkZXYpLCBHRlBfS0VS
TkVMKTsKIAlpZiAoIXBzZGV2KQogCQlyZXR1cm4gTlVMTDsKIAotLSAKMS45LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
