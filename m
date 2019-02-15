From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH v4 9/9] xen/privcmd-buf.c: Convert to use
 vm_map_pages_zero()
Date: Fri, 15 Feb 2019 08:19:16 +0530
Message-ID: <20190215024916.GA26495__15284.7485894867$1550198749$gmane$org@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Kn9=QW=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1guTUp-0006my-03
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 02:44:59 +0000
Received: by mail-pl1-x644.google.com with SMTP id bj4so4178931plb.7
 for <xen-devel@lists.xenproject.org>; Thu, 14 Feb 2019 18:44:57 -0800 (PST)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, willy@infradead.org, mhocko@suse.com, boris.ostrovsky@oracle.com, jgross@suse.com, linux@armlinux.org.uk, robin.murphy@arm.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
List-Id: xen-devel@lists.xenproject.org

Q29udmVydCB0byB1c2Ugdm1fbWFwX3BhZ2VzX3plcm8oKSB0byBtYXAgcmFuZ2Ugb2Yga2VybmVs
Cm1lbW9yeSB0byB1c2VyIHZtYS4KClRoaXMgZHJpdmVyIGhhcyBpZ25vcmVkIHZtX3Bnb2ZmLiBX
ZSBjb3VsZCBsYXRlciAiZml4IiB0aGVzZSBkcml2ZXJzCnRvIGJlaGF2ZSBhY2NvcmRpbmcgdG8g
dGhlIG5vcm1hbCB2bV9wZ29mZiBvZmZzZXR0aW5nIHNpbXBseSBieQpyZW1vdmluZyB0aGUgX3pl
cm8gc3VmZml4IG9uIHRoZSBmdW5jdGlvbiBuYW1lIGFuZCBpZiB0aGF0IGNhdXNlcwpyZWdyZXNz
aW9ucywgaXQgZ2l2ZXMgdXMgYW4gZWFzeSB3YXkgdG8gcmV2ZXJ0LgoKU2lnbmVkLW9mZi1ieTog
U291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBCb3Jp
cyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgotLS0KIGRyaXZlcnMveGVu
L3ByaXZjbWQtYnVmLmMgfCA4ICsrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3ByaXZjbWQtYnVm
LmMgYi9kcml2ZXJzL3hlbi9wcml2Y21kLWJ1Zi5jCmluZGV4IGRlMDFhNmQuLmQwMmRjNDMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3ByaXZjbWQtYnVmLmMKKysrIGIvZHJpdmVycy94ZW4vcHJp
dmNtZC1idWYuYwpAQCAtMTY2LDEyICsxNjYsOCBAQCBzdGF0aWMgaW50IHByaXZjbWRfYnVmX21t
YXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCWlmICh2
bWFfcHJpdi0+bl9wYWdlcyAhPSBjb3VudCkKIAkJcmV0ID0gLUVOT01FTTsKIAllbHNlCi0JCWZv
ciAoaSA9IDA7IGkgPCB2bWFfcHJpdi0+bl9wYWdlczsgaSsrKSB7Ci0JCQlyZXQgPSB2bV9pbnNl
cnRfcGFnZSh2bWEsIHZtYS0+dm1fc3RhcnQgKyBpICogUEFHRV9TSVpFLAotCQkJCQkgICAgIHZt
YV9wcml2LT5wYWdlc1tpXSk7Ci0JCQlpZiAocmV0KQotCQkJCWJyZWFrOwotCQl9CisJCXJldCA9
IHZtX21hcF9wYWdlc196ZXJvKHZtYSwgdm1hX3ByaXYtPnBhZ2VzLAorCQkJCQkJdm1hX3ByaXYt
Pm5fcGFnZXMpOwogCiAJaWYgKHJldCkKIAkJcHJpdmNtZF9idWZfdm1hcHJpdl9mcmVlKHZtYV9w
cml2KTsKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
