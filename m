From: Juergen Gross <jgross@suse.com>
Subject: [PATCH-for-4.10] adapt SUPPORT.md to match 4.11
Date: Wed, 25 Apr 2018 16:02:09 +0200
Message-ID: <20180425140209.18825-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ddll=ho=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fBKzt-00026V-Ar
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 14:02:13 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

U29tZSB0YWdzIGhhdmUgYmVlbiBjaGFuZ2VkIGluIDQuMTEuIEFkYXB0IHRoZSA0LjEwIG9uZXMg
dG8gbWF0Y2ggaW4Kb3JkZXIgdG8gcHJvZHVjZSBhbiBlYXNpZXIgdG8gcmVhZCBzdXBwb3J0IEhU
TUwgdGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Ci0tLQogU1VQUE9SVC5tZCB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQu
bWQKaW5kZXggY2I4NjJiNTM4ZC4uMmIwZDU4ZmViMyAxMDA2NDQKLS0tIGEvU1VQUE9SVC5tZAor
KysgYi9TVVBQT1JULm1kCkBAIC03NCwxNSArNzQsMTUgQEAgTm8gaGFyZHdhcmUgcmVxdWlyZW1l
bnRzCiAKICMjIyB4ODYvSFZNCiAKLSAgICBTdGF0dXM6IFN1cHBvcnRlZAorICAgIFN0YXR1cywg
ZG9tVTogU3VwcG9ydGVkCiAKIEZ1bGx5IHZpcnR1YWxpc2VkIGd1ZXN0IHVzaW5nIGhhcmR3YXJl
IHZpcnR1YWxpc2F0aW9uIGV4dGVuc2lvbnMKIAogUmVxdWlyZXMgaGFyZHdhcmUgdmlydHVhbGlz
YXRpb24gc3VwcG9ydCAoSW50ZWwgVk1YIC8gQU1EIFNWTSkKIAotIyMjIHg4Ni9QVkggZ3Vlc3QK
KyMjIyB4ODYvUFZICiAKLSAgICBTdGF0dXM6IFN1cHBvcnRlZAorICAgIFN0YXR1cywgZG9tVTog
U3VwcG9ydGVkCiAKIFBWSCBpcyBhIG5leHQtZ2VuZXJhdGlvbiBwYXJhdmlydHVhbGl6ZWQgbW9k
ZQogZGVzaWduZWQgdG8gdGFrZSBhZHZhbnRhZ2Ugb2YgaGFyZHdhcmUgdmlydHVhbGl6YXRpb24g
c3VwcG9ydCB3aGVuIHBvc3NpYmxlLgpAQCAtOTAsNyArOTAsNyBAQCBEdXJpbmcgZGV2ZWxvcG1l
bnQgdGhpcyB3YXMgc29tZXRpbWVzIGNhbGxlZCBIVk1MaXRlIG9yIFBWSHYyLgogCiBSZXF1aXJl
cyBoYXJkd2FyZSB2aXJ0dWFsaXNhdGlvbiBzdXBwb3J0IChJbnRlbCBWTVggLyBBTUQgU1ZNKQog
Ci0jIyMgQVJNIGd1ZXN0CisjIyMgQVJNCiAKICAgICBTdGF0dXM6IFN1cHBvcnRlZAogCi0tIAoy
LjEzLjYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
