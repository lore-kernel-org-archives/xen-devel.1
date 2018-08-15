From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH for-4.7] arm: constify atomic_read parameter
Date: Wed, 15 Aug 2018 09:28:36 +0100
Message-ID: <20180815082836.6046-1-wei.liu2@citrix.com>
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
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

ZGVkMmEzN2Q2MyBhZGRlZCBjb25zdCB0byBhdG9taWNfcmVhZC4gRG8gdGhlIHNhbWUgZm9yIEFy
bQpjb3VudGVycGFydC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+Ci0tLQpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpD
YzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpCcmVha2FnZSBkdWUgdG8gWFNBLTI3MyBjaGFuZ2VzLgotLS0KIHhlbi9pbmNsdWRl
L2FzbS1hcm0vYXRvbWljLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2F0b21pYy5o
IGIveGVuL2luY2x1ZGUvYXNtLWFybS9hdG9taWMuaAppbmRleCAyOWFiMjY1ZjAwLi5kZTIyZmQ1
NWQ3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2F0b21pYy5oCisrKyBiL3hlbi9p
bmNsdWRlL2FzbS1hcm0vYXRvbWljLmgKQEAgLTExMCw3ICsxMTAsNyBAQCB0eXBlZGVmIHN0cnVj
dCB7IGludCBjb3VudGVyOyB9IGF0b21pY190OwogICogc3RyZXgvbGRyZXggbW9uaXRvciBvbiBz
b21lIGltcGxlbWVudGF0aW9ucy4gVGhlIHJlYXNvbiB3ZSBjYW4gdXNlIGl0IGZvcgogICogYXRv
bWljX3NldCgpIGlzIHRoZSBjbHJleCBvciBkdW1teSBzdHJleCBkb25lIG9uIGV2ZXJ5IGV4Y2Vw
dGlvbiByZXR1cm4uCiAgKi8KLXN0YXRpYyBpbmxpbmUgaW50IGF0b21pY19yZWFkKGF0b21pY190
ICp2KQorc3RhdGljIGlubGluZSBpbnQgYXRvbWljX3JlYWQoY29uc3QgYXRvbWljX3QgKnYpCiB7
CiAgICAgcmV0dXJuICoodm9sYXRpbGUgaW50ICopJnYtPmNvdW50ZXI7CiB9Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
