From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/5] x86: Implement interrupt-safe livepatching
Date: Mon, 29 Jan 2018 15:38:06 +0000
Message-ID: <1517240291-32409-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U28gaXQgdHVybnMgb3V0IHRoYXQgdGhpcyBpcyBxdWl0ZSBhIGxvdCBlYXNpZXIgdGhhbiBJIGZl
YXJlZC4KCk9ubHkgY29tcGlsZS10ZXN0ZWQgb24gQVJNLCBidXQgZnVuY3Rpb25hbGx5IHRlc3Rl
ZCBvbiB4ODYuCgpBbmRyZXcgQ29vcGVyICg1KToKICBhcm0vYWx0ZXJuYXRpdmVzOiBGaXggYXBw
bHlfYWx0ZXJuYXRpdmVzKCkgQVBJCiAgeGVuL2FsdGVybmF0aXZlczogUGx1bWIgYSAnbGl2ZScg
cGFyYW1ldGVyIHRocm91Z2ggYXBwbHlfYWx0ZXJuYXRpdmVzKCkKICB4ODYvbGl2ZXBhdGNoOiBV
c2UgdGV4dF9wb2tlKCkgYW5kIHBsdW1iIGEgbGl2ZSBwYXJhbWV0ZXIgdGhyb3VnaAogIHg4Ni9h
bHRlcm5hdGl2ZTogSW1wbGVtZW50IE5NSS8jTUMtc2FmZSBwYXRjaGluZwogIERPLU5PVC1BUFBM
WSAtIERlbW9uc3RyYXRlcyBhbiBOTUkgaGl0dGluZyBhbiBpbi1wcm9ncmVzcyBwYXRjaAoKIHhl
bi9hcmNoL2FybS9hbHRlcm5hdGl2ZS5jICAgICAgICB8ICAyMCArKystLS0KIHhlbi9hcmNoL3g4
Ni9hbHRlcm5hdGl2ZS5jICAgICAgICB8IDEzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLQogeGVuL2FyY2gveDg2L2xpdmVwYXRjaC5jICAgICAgICAgIHwgICA4ICstLQog
eGVuL2FyY2gveDg2L3RyYXBzLmMgICAgICAgICAgICAgIHwgICAyICsKIHhlbi9hcmNoL3g4Ni94
ODZfNjQvZW50cnkuUyAgICAgICB8ICAzOCArKysrKysrKysrLQogeGVuL2NvbW1vbi9saXZlcGF0
Y2guYyAgICAgICAgICAgIHwgICAyICstCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2FsdGVybmF0aXZl
LmggfCAgIDkgKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L2FsdGVybmF0aXZlLmggfCAgIDUgKy0K
IHhlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmggICB8ICAgMiArCiA5IGZpbGVzIGNoYW5n
ZWQsIDE4NyBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCi0tIAoyLjEuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
