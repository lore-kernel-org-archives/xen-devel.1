From: Bruno Alvisio <bruno.alvisio@gmail.com>
Subject: [PATCH RFC 09/16] Save/Restore Support: Disable/enable
	IRQs during suspend/restore
Date: Tue, 19 Dec 2017 15:42:04 -0800
Message-ID: <1513726931-7516-10-git-send-email-bruno.alvisio@gmail.com>
References: <1513726931-7516-1-git-send-email-bruno.alvisio@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=2vxx=dp=balvisio-mac.localdomain=balvisio@srs-us1.protection.inumbo.net>)
 id 1eRRXv-0004vP-Jx
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 23:43:39 +0000
In-Reply-To: <1513726931-7516-1-git-send-email-bruno.alvisio@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: jgross@suse.com, samuel.thibault@ens-lyon.org, wei.liu2@citrix.com, Bruno Alvisio <bruno.alvisio@gmail.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQnJ1bm8gQWx2aXNpbyA8YnJ1bm8uYWx2aXNpb0BnbWFpbC5jb20+Ci0t
LQoga2VybmVsLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsLmMgYi9rZXJuZWwuYwppbmRleCAxY2Q0
MGU4Li43ODJlYjc5IDEwMDY0NAotLS0gYS9rZXJuZWwuYworKysgYi9rZXJuZWwuYwpAQCAtMTE5
LDEyICsxMTksMTIgQEAgdm9pZCBzdGFydF9rZXJuZWwodm9pZCogcGFyKQogCiB2b2lkIHByZV9z
dXNwZW5kKHZvaWQpCiB7Ci0KKyAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOwogfQogCiB2b2lkIHBv
c3Rfc3VzcGVuZChpbnQgY2FuY2VsZWQpCiB7Ci0KKyAgICBsb2NhbF9pcnFfZW5hYmxlKCk7CiB9
CiAKIHZvaWQgc3RvcF9rZXJuZWwodm9pZCkKLS0gCjIuMy4yIChBcHBsZSBHaXQtNTUpCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
