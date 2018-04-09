From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH 1/4] xen: xen-pciback: Replace GFP_ATOMIC with
 GFP_KERNEL in pcistub_probe
Date: Mon,  9 Apr 2018 23:03:36 +0800
Message-ID: <1523286216-26345-1-git-send-email-baijiaju1990__45400.2222083092$1523286253$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nvpu=g6=gmail.com=baijiaju1990@srs-us1.protection.inumbo.net>)
 id 1f5YKj-0002HS-3S
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 15:03:49 +0000
Received: by mail-pf0-x241.google.com with SMTP id o16so5875984pfk.9
 for <xen-devel@lists.xenproject.org>; Mon, 09 Apr 2018 08:03:47 -0700 (PDT)
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

cGNpc3R1Yl9wcm9iZSgpIGlzIG5ldmVyIGNhbGxlZCBpbiBhdG9taWMgY29udGV4dC4KVGhpcyBm
dW5jdGlvbiBpcyBvbmx5IHNldCBhcyAiLnByb2JlIiBpbiBzdHJ1Y3QgcGNpX2RyaXZlci4KCkRl
c3BpdGUgbmV2ZXIgZ2V0dGluZyBjYWxsZWQgZnJvbSBhdG9taWMgY29udGV4dCwKcGNpc3R1Yl9w
cm9iZSgpIGNhbGxzIGttYWxsb2MoKSB3aXRoIEdGUF9BVE9NSUMsCndoaWNoIGRvZXMgbm90IHNs
ZWVwIGZvciBhbGxvY2F0aW9uLgpHRlBfQVRPTUlDIGlzIG5vdCBuZWNlc3NhcnkgYW5kIGNhbiBi
ZSByZXBsYWNlZCB3aXRoIEdGUF9LRVJORUwsCndoaWNoIGNhbiBzbGVlcCBhbmQgaW1wcm92ZSB0
aGUgcG9zc2liaWxpdHkgb2Ygc3VjZXNzZnVsIGFsbG9jYXRpb24uCgpUaGlzIGlzIGZvdW5kIGJ5
IGEgc3RhdGljIGFuYWx5c2lzIHRvb2wgbmFtZWQgRENOUyB3cml0dGVuIGJ5IG15c2VsZi4KQW5k
IEkgYWxzbyBtYW51YWxseSBjaGVjayBpdC4KClNpZ25lZC1vZmYtYnk6IEppYS1KdSBCYWkgPGJh
aWppYWp1MTk5MEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0
dWIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMgYi9kcml2
ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jCmluZGV4IDllNDgwZmQuLjk1ZTZkZGQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMKKysrIGIvZHJpdmVy
cy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYwpAQCAtNTc3LDcgKzU3Nyw3IEBAIHN0YXRpYyBp
bnQgcGNpc3R1Yl9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2Rl
dmljZV9pZCAqaWQpCiAJCX0KIAogCQlpZiAoIW1hdGNoKSB7Ci0JCQlwY2lfZGV2X2lkID0ga21h
bGxvYyhzaXplb2YoKnBjaV9kZXZfaWQpLCBHRlBfQVRPTUlDKTsKKwkJCXBjaV9kZXZfaWQgPSBr
bWFsbG9jKHNpemVvZigqcGNpX2Rldl9pZCksIEdGUF9LRVJORUwpOwogCQkJaWYgKCFwY2lfZGV2
X2lkKSB7CiAJCQkJZXJyID0gLUVOT01FTTsKIAkJCQlnb3RvIG91dDsKLS0gCjEuOS4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
