From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 02/14] x86/mem-sharing: Don't leave the altp2m
 lock held when nominating a page
Date: Wed, 21 Nov 2018 13:21:10 +0000
Message-ID: <1542806482-24030-3-git-send-email-andrew.cooper3@citrix.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Z2V0X2dmbl90eXBlX2FjY2VzcygpIGludGVybmFsbHkgdGFrZXMgdGhlIHAybSBsb2NrLCBhbmQg
bm90aGluZyBldmVyIHVubG9ja3MKaXQuICBTd2l0Y2ggdG8gdXNpbmcgdGhlIHVubG9ja2VkIGFj
Y2Vzc29yIGluc3RlYWQuCgpUaGlzIHdhc24ndCBpbmNsdWRlZCBpbiBYU0EtMjc3IGJlY2F1c2Ug
bmVpdGhlciBtZW0tc2hhcmluZyBub3IgYWx0cDJtIGFyZQpzdXBwb3J0ZWQuCgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEph
biBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IFRh
bWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0v
bWVtX3NoYXJpbmcuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMg
Yi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwppbmRleCBmNGM1MDc0Li43N2YwZDNmIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94
ODYvbW0vbWVtX3NoYXJpbmcuYwpAQCAtODIwLDcgKzgyMCw4IEBAIHN0YXRpYyBpbnQgbm9taW5h
dGVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sCiAgICAgICAgICAgICBpZiAoICFh
cDJtICkKICAgICAgICAgICAgICAgICBjb250aW51ZTsKIAotICAgICAgICAgICAgYW1mbiA9IGdl
dF9nZm5fdHlwZV9hY2Nlc3MoYXAybSwgZ2ZuX3goZ2ZuKSwgJmFwMm10LCAmYXAybWEsIDAsIE5V
TEwpOworICAgICAgICAgICAgYW1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhhcDJtLCBnZm5f
eChnZm4pLCAmYXAybXQsICZhcDJtYSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMCwgTlVMTCwgZmFsc2UpOwogICAgICAgICAgICAgaWYgKCBtZm5fdmFsaWQoYW1m
bikgJiYgKCFtZm5fZXEoYW1mbiwgbWZuKSB8fCBhcDJtYSAhPSBwMm1hKSApCiAgICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICAgYWx0cDJtX2xpc3RfdW5sb2NrKGQpOwotLSAKMi4xLjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
