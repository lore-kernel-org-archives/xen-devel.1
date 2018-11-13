From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] xen/keyhandler: Restore missing parenthesis in
 dump_domains()
Date: Tue, 13 Nov 2018 18:27:02 +0000
Message-ID: <1542133622-17035-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyB3YXMgYWNjaWRlbnRpYWxseSBkcm9wcGVkIGluIGMvcyA4ODliMjAwY2I1MiAiQ2hhbmdl
IHRpbWVzdGFtcHMKcmVwcmVzZW50YXRpb24gZm9yIGtleWhhbmRsZXJzIi4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNDOiBHZW9yZ2UgRHVubGFwIDxn
ZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+CkNDOiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5p
c292QGVwYW0uY29tPgotLS0KIHhlbi9jb21tb24va2V5aGFuZGxlci5jIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24va2V5aGFuZGxlci5jIGIveGVuL2NvbW1vbi9rZXloYW5kbGVyLmMKaW5kZXgg
NjBiYmVlYi4uOTQ5NTYwMSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9rZXloYW5kbGVyLmMKKysr
IGIveGVuL2NvbW1vbi9rZXloYW5kbGVyLmMKQEAgLTI4Niw4ICsyODYsOCBAQCBzdGF0aWMgdm9p
ZCBkdW1wX2RvbWFpbnModW5zaWduZWQgY2hhciBrZXkpCiAgICAgc190aW1lX3QgICAgICAgbm93
ID0gTk9XKCk7CiAjZGVmaW5lIHRtcHN0ciBrZXloYW5kbGVyX3NjcmF0Y2gKIAotICAgIHByaW50
aygiJyVjJyBwcmVzc2VkIC0+IGR1bXBpbmcgZG9tYWluIGluZm8gKG5vdyA9ICUiUFJJX3N0aW1l
IlxuIiwga2V5LAotICAgICAgICAgICBub3cpOworICAgIHByaW50aygiJyVjJyBwcmVzc2VkIC0+
IGR1bXBpbmcgZG9tYWluIGluZm8gKG5vdyA9ICUiUFJJX3N0aW1lIilcbiIsCisgICAgICAgICAg
IGtleSwgbm93KTsKIAogICAgIHJjdV9yZWFkX2xvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsKIAot
LSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
