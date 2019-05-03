From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 05/11] mg-repro-setup: Break out
 compute_adjusts
Date: Fri, 3 May 2019 17:59:51 +0100
Message-ID: <20190503165957.5960-6-ian.jackson@eu.citrix.com>
References: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lZ0l=TD=citrix.com=prvs=019b86d19=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMbXk-00086o-4i
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:00:16 +0000
In-Reply-To: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBtZy1yZXByby1zZXR1cCB8IDIwICsrKysrKysrKysr
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9tZy1yZXByby1zZXR1cCBiL21nLXJlcHJvLXNldHVwCmluZGV4IGM4
YmNhZDMzLi4xMGFiNjVhOCAxMDA3NTUKLS0tIGEvbWctcmVwcm8tc2V0dXAKKysrIGIvbWctcmVw
cm8tc2V0dXAKQEAgLTU0LDcgKzU0LDYgQEAgc2V0IC1lIC1vIHBvc2l4CiAKIG1nZXhlY2ZsYWdz
PSgpCiBhZGp1c3RzZXRzPSgpCi1hZGp1c3RzPSgpCiBhbGxvY3M9KCkKIGxvZ2ZpbGU9dG1wL21n
LXJlcHJvLXNldHVwLmxvZwogZHVyYXRpb249MjhkCkBAIC0xMDQsMTQgKzEwMywxNyBAQCBhZGpy
dW52YXIgKCkgewogCWRlbHJ1bnZhciAiJDEiCiAJYWRqdXN0cys9KHJ1bnZhci1zZXQgIiRqb2Ii
ICIkMSIgIiQyIikKIH0KLQotZm9yIGFyZyBpbiAiJHthZGp1c3RzZXRzW0BdfSI7IGRvCi0JY2Fz
ZSAiJGFyZyIgaW4KLQkhKnxeKikJZGVscnVudmFyICIke2FyZyM/fSIJCTs7Ci0JKj0qKQlhZGpy
dW52YXIgIiR7YXJnJSU9Kn0iICIke2FyZyMqPX0iCTs7Ci0JKikJYmFkLWFkanVpc3RzZXQtcGF0
dGVybgkJCTs7Ci0JZXNhYwotZG9uZQorY29tcHV0ZV9hZGp1c3RzICgpIHsKKwlhZGp1c3RzPSgp
CisJZm9yIGFyZyBpbiAiJEAiOyBkbworCQljYXNlICIkYXJnIiBpbgorCQkhKnxeKikJZGVscnVu
dmFyICIke2FyZyM/fSIJCTs7CisJCSo9KikJYWRqcnVudmFyICIke2FyZyUlPSp9IiAiJHthcmcj
Kj19Igk7OworCQkqKQliYWQtYWRqdWlzdHNldC1wYXR0ZXJuCQkJOzsKKwkJZXNhYworCWRvbmUK
K30KK2NvbXB1dGVfYWRqdXN0cyAiJHthZGp1c3RzZXRzW0BdfSIKIAogd2hpbGUgWyAkIyAtbmUg
MCBdOyBkbwogCWFyZz0kMTsgc2hpZnQKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
