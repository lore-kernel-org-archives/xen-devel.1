From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/3] libx86: Remaining serialisation logic
Date: Mon, 25 Feb 2019 15:47:12 +0000
Message-ID: <1551109635-4716-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW5kcmV3IENvb3BlciAoMik6CiAgbGlieDg2OiBJbnRyb2R1Y2UgYSBoZWxwZXIgdG8gZGVzZXJp
YWxpc2UgY3B1aWRfcG9saWN5IG9iamVjdHMKICB0b29scy9jcHUtcG9saWN5OiBBZGQgdW5pdCB0
ZXN0cwoKUm9nZXIgUGF1IE1vbm7DqSAoMSk6CiAgbGlieDg2OiBpbnRyb2R1Y2UgYSBoZWxwZXIg
dG8gZGVzZXJpYWxpc2UgbXNyX3BvbGljeSBvYmplY3RzCgogdG9vbHMvdGVzdHMvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiB0b29scy90ZXN0cy9jcHUtcG9saWN5Ly5naXRp
Z25vcmUgICAgICAgIHwgICAxICsKIHRvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvTWFrZWZpbGUgICAg
ICAgICAgfCAgMjggKysrKwogdG9vbHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3ku
YyB8IDI1OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS94ZW4v
bGliL3g4Ni9jcHVpZC5oICAgICAgICAgIHwgIDIzICsrLQogeGVuL2luY2x1ZGUveGVuL2xpYi94
ODYvbXNyLmggICAgICAgICAgICB8ICAyMSArKysKIHhlbi9saWIveDg2L2NwdWlkLmMgICAgICAg
ICAgICAgICAgICAgICAgfCAxMDkgKysrKysrKysrKysrKwogeGVuL2xpYi94ODYvbXNyLmMgICAg
ICAgICAgICAgICAgICAgICAgICB8ICA2NyArKysrKysrKwogeGVuL2xpYi94ODYvcHJpdmF0ZS5o
ICAgICAgICAgICAgICAgICAgICB8ICAxNyArKwogOSBmaWxlcyBjaGFuZ2VkLCA1MjQgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3RzL2Nw
dS1wb2xpY3kvLmdpdGlnbm9yZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3RzL2NwdS1w
b2xpY3kvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0cy9jcHUtcG9saWN5
L3Rlc3QtY3B1LXBvbGljeS5jCgotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
