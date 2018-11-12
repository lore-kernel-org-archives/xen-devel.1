From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: [PATCH 07/18] xen/arm: Freeze domains on suspend and
 thaw them on resume
Date: Mon, 12 Nov 2018 12:30:33 +0100
Message-ID: <1542022244-22977-8-git-send-email-mirela.simonovic@aggios.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, dm@aggios.com, saeed.nowshadi@xilinx.com, Julien Grall <julien.grall@arm.com>, stefano.stabellini@xilinx.com, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

RnJlZXplIGFuZCB0aGF3IG9mIGRvbWFpbnMgaXMgcmV1c2VkIGFzIGltcGxlbWVudGVkIGZvciB4
ODYuIEluCmFkZGl0aW9uLCBzeXN0ZW1fc3RhdGUgdmFyaWFibGUgaXMgdXBkYXRlZCB0byByZXBy
ZXNlbnQgdGhlIGFjdHVhbApzdGF0ZSBvZiB0aGUgc3lzdGVtLgoKU2lnbmVkLW9mZi1ieTogTWly
ZWxhIFNpbW9ub3ZpYyA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPgpTaWduZWQtb2ZmLWJ5
OiBTYWVlZCBOb3dzaGFkaSA8c2FlZWQubm93c2hhZGlAeGlsaW54LmNvbT4KLS0tCiB4ZW4vYXJj
aC9hcm0vc3VzcGVuZC5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zdXNwZW5kLmMgYi94ZW4vYXJjaC9hcm0v
c3VzcGVuZC5jCmluZGV4IDIxYjQ1ZjgyNDguLjU3NWFmZDVlYjggMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL2FybS9zdXNwZW5kLmMKKysrIGIveGVuL2FyY2gvYXJtL3N1c3BlbmQuYwpAQCAtMTE3LDYg
KzExNywxNCBAQCBzdGF0aWMgbG9uZyBzeXN0ZW1fc3VzcGVuZCh2b2lkICpkYXRhKQogewogICAg
IEJVR19PTihzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX2FjdGl2ZSk7CiAKKyAgICBzeXN0ZW1f
c3RhdGUgPSBTWVNfU1RBVEVfc3VzcGVuZDsKKyAgICBmcmVlemVfZG9tYWlucygpOworCisgICAg
c3lzdGVtX3N0YXRlID0gU1lTX1NUQVRFX3Jlc3VtZTsKKworICAgIHRoYXdfZG9tYWlucygpOwor
ICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9hY3RpdmU7CisKICAgICByZXR1cm4gLUVOT1NZ
UzsKIH0KIAotLSAKMi4xMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
