From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v9 01/11] x86/thunk: Fix GEN_INDIRECT_THUNK
	comment
Date: Thu, 18 Jan 2018 15:46:00 +0000
Message-ID: <1516290370-14958-2-git-send-email-andrew.cooper3@citrix.com>
References: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBhIHJlYmFzaW5nIGVycm9yIGluIGMvcyA4NThjYmEwZDRjNmIgIng4NjogSW50cm9k
dWNlIGFsdGVybmF0aXZlCmluZGlyZWN0IHRodW5rcyIgaGlkZGVuIGJ5IG90aGVyIGNoYW5nZXMg
aW4gdGhlIHNhbWUgc2VudGVuY2UuCgpUaGUgbmFtZSB3aXRoIGRvdHMgcmF0aGVyIHRoYW4gdW5k
ZXJzY29yZXMgd2FzIHRoZSBwcmVyZWxlYXNlIEdDQyBBQkkuCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNo
IDxKQmV1bGljaEBzdXNlLmNvbT4KCnY5OiBOZXcuCi0tLQogeGVuL2FyY2gveDg2L2luZGlyZWN0
LXRodW5rLlMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaW5kaXJlY3QtdGh1bmsuUyBiL3hlbi9h
cmNoL3g4Ni9pbmRpcmVjdC10aHVuay5TCmluZGV4IDdkMzQ3MDcuLmUwM2ZjMTQgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9pbmRpcmVjdC10aHVuay5TCisrKyBiL3hlbi9hcmNoL3g4Ni9pbmRp
cmVjdC10aHVuay5TCkBAIC0zMSw3ICszMSw3IEBACiAuZW5kbQogCiAvKgotICogQnVpbGQgdGhl
IF9feDg2LmluZGlyZWN0X3RodW5rLiogc3ltYm9scy4gIEV4ZWN1dGlvbiBsYW5kcyBvbiBhbgor
ICogQnVpbGQgdGhlIF9feDg2X2luZGlyZWN0X3RodW5rXyogc3ltYm9scy4gIEV4ZWN1dGlvbiBs
YW5kcyBvbiBhbgogICogYWx0ZXJuYXRpdmUgcGF0Y2ggcG9pbnQgd2hpY2ggaW1wbGVtZW50cyBv
bmUgb2YgdGhlIGFib3ZlIFRIVU5LXyoncwogICovCiAubWFjcm8gR0VOX0lORElSRUNUX1RIVU5L
IHJlZzpyZXEKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
