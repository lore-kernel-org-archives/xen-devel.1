From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/6] x86/mm: Minor non-functional cleanup
Date: Wed, 15 Aug 2018 19:34:31 +0100
Message-ID: <1534358077-24700-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

TWlub3IgY2xlYW51cCB3aGljaCBoYXMgYWNjdW11bGF0ZWQgd2hpbGUgZG9pbmcgb3RoZXIgd29y
ay4gIE5vIGZ1bmN0aW9uYWwKY2hhbmdlIGFueXdoZXJlLgoKQW5kcmV3IENvb3BlciAoNik6CiAg
eDg2L21tOiBVc2UgbWZuX2VxKCkvbWZuX2FkZCgpIHJhdGhlciB0aGFuIG9wZW5jb2RlZCB2YXJp
YXRpb25zCiAgeDg2L3NoYWRvdzogVXNlIG1vcmUgYXBwcm9wcmlhdGUgY29udmVyc2lvbiBmdW5j
dGlvbnMKICB4ODYvc2hhZG93OiBTd2l0Y2ggc2hhZG93X2RvbWFpbi5oYXNfZmFzdF9tbWlvX2Vu
dHJpZXMgdG8gYm9vbAogIHg4Ni9zaGFkb3c6IFVzZSBNQVNLXyogaGVscGVycyBmb3IgdGhlIE1N
SU8gZmFzdHBhdGggUFRFIG1hbmlwdWxhdGlvbgogIHg4Ni9zaGFkb3c6IENsZWFuIHVwIHRoZSBN
TUlPIGZhc3RwYXRoIGhlbHBlcnMKICB4ODYvc2hhZG93OiBVc2UgbWZuX3QgaW4gc2hhZG93X3Ry
YWNrX2RpcnR5X3ZyYW0oKQoKIHhlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL3ZtY2UuYyAgfCAgMiAr
LQogeGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYv
bW0vaGFwL2hhcC5jICAgICAgIHwgIDMgKystCiB4ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcu
YyAgIHwgIDQgKystLQogeGVuL2FyY2gveDg2L21tL3AybS1wb2QuYyAgICAgICB8ICAyICstCiB4
ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgICAgICAgIHwgIDQgKystLQogeGVuL2FyY2gveDg2L21t
L3NoYWRvdy9jb21tb24uYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMgIHwgMzcgKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L21tL3NoYWRvdy90eXBlcy5oICB8
IDI3ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWlu
LmggICAgfCAgMiArLQogMTAgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgNjMgZGVs
ZXRpb25zKC0pCgotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
