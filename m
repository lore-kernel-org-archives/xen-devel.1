From: Bruno Alvisio <bruno.alvisio@gmail.com>
Subject: [PATCH v2 09/17] Save/Restore Support: Disable/enable
	IRQs during suspend/restore
Date: Tue, 13 Feb 2018 18:25:53 -0800
Message-ID: <1518575161-70717-10-git-send-email-bruno.alvisio@gmail.com>
References: <1518575161-70717-1-git-send-email-bruno.alvisio@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=cyps=fi=gmail.com=bruno.alvisio@srs-us1.protection.inumbo.net>)
 id 1elmm9-0002rV-N7
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2018 02:26:25 +0000
In-Reply-To: <1518575161-70717-1-git-send-email-bruno.alvisio@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: jgross@suse.com, samuel.thibault@ens-lyon.org, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQnJ1bm8gQWx2aXNpbyA8YnJ1bm8uYWx2aXNpb0BnbWFpbC5jb20+ClJl
dmlld2VkLWJ5OiBTYW11ZWwgVGhpYmF1bHQgPHNhbXVlbC50aGliYXVsdEBlbnMtbHlvbi5vcmc+
Ci0tLQoga2VybmVsLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsLmMgYi9rZXJuZWwuYwppbmRleCAx
Y2Q0MGU4Li43ODJlYjc5IDEwMDY0NAotLS0gYS9rZXJuZWwuYworKysgYi9rZXJuZWwuYwpAQCAt
MTE5LDEyICsxMTksMTIgQEAgdm9pZCBzdGFydF9rZXJuZWwodm9pZCogcGFyKQogCiB2b2lkIHBy
ZV9zdXNwZW5kKHZvaWQpCiB7Ci0KKyAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOwogfQogCiB2b2lk
IHBvc3Rfc3VzcGVuZChpbnQgY2FuY2VsZWQpCiB7Ci0KKyAgICBsb2NhbF9pcnFfZW5hYmxlKCk7
CiB9CiAKIHZvaWQgc3RvcF9rZXJuZWwodm9pZCkKLS0gCjIuMy4yIChBcHBsZSBHaXQtNTUpCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
