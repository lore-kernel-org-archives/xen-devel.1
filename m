From: Bruno Alvisio <bruno.alvisio@gmail.com>
Subject: [PATCH RFC 10/16] Save/Restore Support: Add
	suspend/resume support for timers
Date: Tue, 19 Dec 2017 15:42:05 -0800
Message-ID: <1513726931-7516-11-git-send-email-bruno.alvisio@gmail.com>
References: <1513726931-7516-1-git-send-email-bruno.alvisio@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=2vxx=dp=balvisio-mac.localdomain=balvisio@srs-us1.protection.inumbo.net>)
 id 1eRRWm-0004Fb-E3
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 23:42:28 +0000
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
LQogYXJjaC94ODYvdGltZS5jIHwgMTMgKysrKysrKysrKysrKwogaW5jbHVkZS90aW1lLmggIHwg
IDIgKysKIGtlcm5lbC5jICAgICAgICB8ICA0ICsrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3RpbWUuYyBiL2FyY2gveDg2L3RpbWUu
YwppbmRleCAzNjU4MTQyLi44Zjc5ZDY5IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni90aW1lLmMKKysr
IGIvYXJjaC94ODYvdGltZS5jCkBAIC0yNDQsMyArMjQ0LDE2IEBAIHZvaWQgZmluaV90aW1lKHZv
aWQpCiAgICAgSFlQRVJWSVNPUl9zZXRfdGltZXJfb3AoMCk7CiAgICAgdW5iaW5kX2V2dGNobihw
b3J0KTsKIH0KKwordm9pZCBzdXNwZW5kX3RpbWUodm9pZCkKK3sKKyAgICAvKiBDbGVhciBhbnkg
cGVuZGluZyB0aW1lciAqLworICAgIEhZUEVSVklTT1Jfc2V0X3RpbWVyX29wKDApOworICAgIHVu
YmluZF9ldnRjaG4ocG9ydCk7Cit9CisKK3ZvaWQgcmVzdW1lX3RpbWUodm9pZCkKK3sKKyAgICBw
b3J0ID0gYmluZF92aXJxKFZJUlFfVElNRVIsICZ0aW1lcl9oYW5kbGVyLCBOVUxMKTsKKyAgICB1
bm1hc2tfZXZ0Y2huKHBvcnQpOworfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS90aW1lLmggYi9pbmNs
dWRlL3RpbWUuaAppbmRleCA1ZDZlZDY3Li4yZTA2ZDU4IDEwMDY0NAotLS0gYS9pbmNsdWRlL3Rp
bWUuaAorKysgYi9pbmNsdWRlL3RpbWUuaApAQCAtNTUsNiArNTUsOCBAQCB0eXBlZGVmIGxvbmcg
c3VzZWNvbmRzX3Q7CiAvKiBwcm90b3R5cGVzICovCiB2b2lkICAgICBpbml0X3RpbWUodm9pZCk7
CiB2b2lkICAgICBmaW5pX3RpbWUodm9pZCk7Cit2b2lkICAgICBzdXNwZW5kX3RpbWUodm9pZCk7
Cit2b2lkICAgICByZXN1bWVfdGltZSh2b2lkKTsKIHNfdGltZV90IGdldF9zX3RpbWUodm9pZCk7
CiBzX3RpbWVfdCBnZXRfdl90aW1lKHZvaWQpOwogdWludDY0X3QgbW9ub3RvbmljX2Nsb2NrKHZv
aWQpOwpkaWZmIC0tZ2l0IGEva2VybmVsLmMgYi9rZXJuZWwuYwppbmRleCA3ODJlYjc5Li5hMTZi
MWJhIDEwMDY0NAotLS0gYS9rZXJuZWwuYworKysgYi9rZXJuZWwuYwpAQCAtMTIwLDEwICsxMjAs
MTQgQEAgdm9pZCBzdGFydF9rZXJuZWwodm9pZCogcGFyKQogdm9pZCBwcmVfc3VzcGVuZCh2b2lk
KQogewogICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7CisKKyAgICBzdXNwZW5kX3RpbWUoKTsKIH0K
IAogdm9pZCBwb3N0X3N1c3BlbmQoaW50IGNhbmNlbGVkKQogeworICAgIHJlc3VtZV90aW1lKCk7
CisKICAgICBsb2NhbF9pcnFfZW5hYmxlKCk7CiB9CiAKLS0gCjIuMy4yIChBcHBsZSBHaXQtNTUp
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
