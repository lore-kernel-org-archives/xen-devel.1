From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/arm: skip first page when RAM starts at 0x0
Date: Thu, 25 Apr 2019 10:51:55 -0700
Message-ID: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xa9b=S3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hJiXP-0005EA-Ni
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 17:51:59 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com, sstabellini@kernel.org, 206497@studenti.unimore.it
List-Id: xen-devel@lists.xenproject.org

WGVuIGFzc3VtZXMgdGhhdCBSQU0gc3RhcnRzIGF0IGFkZHJlc3NlcyBncmVhdGVyIHRoYW4gMHgw
IGluIGEgZmV3CnBsYWNlcy4gVGhlIFBEWCBjb2RlIGlzIG9uZSBvZiB0aGVtIGJ1dCB0aGVyZSBh
cmUgbW9yZS4KCkZvciBub3csIHNraXAgdGhlIGZpcnN0IHBhZ2UgaW4gbWVtb3J5IHdoZW4gdGhl
IHN0YXJ0IGFkZGVzcyBpcyAweDAuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHN0ZWZhbm9zQHhpbGlueC5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyB8IDcgKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCmluZGV4IDg5MWI0YjYu
LjJhZTQyMzggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKKysrIGIveGVuL2Fy
Y2gvYXJtL2Jvb3RmZHQuYwpAQCAtMTU3LDYgKzE1NywxMyBAQCBzdGF0aWMgdm9pZCBfX2luaXQg
cHJvY2Vzc19tZW1vcnlfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAogICAgICAgICBk
ZXZpY2VfdHJlZV9nZXRfcmVnKCZjZWxsLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzLCAmc3Rh
cnQsICZzaXplKTsKICAgICAgICAgaWYgKCAhc2l6ZSApCiAgICAgICAgICAgICBjb250aW51ZTsK
KworICAgICAgICAvKgorICAgICAgICAgKiBYZW4gY2Fubm90IGRlYWwgd2l0aCBtZW1vcnkgc3Rh
cnRpbmcgYXQgMHgwLiBCdXJuIHRoZSBmaXJzdAorICAgICAgICAgKiBwYWdlLgorICAgICAgICAg
Ki8KKyAgICAgICAgaWYgKCBzdGFydCA9PSAwICkKKyAgICAgICAgICAgIHN0YXJ0ICs9IFBBR0Vf
U0laRTsKICAgICAgICAgYm9vdGluZm8ubWVtLmJhbmtbYm9vdGluZm8ubWVtLm5yX2JhbmtzXS5z
dGFydCA9IHN0YXJ0OwogICAgICAgICBib290aW5mby5tZW0uYmFua1tib290aW5mby5tZW0ubnJf
YmFua3NdLnNpemUgPSBzaXplOwogICAgICAgICBib290aW5mby5tZW0ubnJfYmFua3MrKzsKLS0g
CjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
