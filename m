From: Joshua Otto <joshua.t.otto@gmail.com>
Subject: [PATCH RFC v2 11/23] libxc/migration: correct hvm
 record ordering specification
Date: Sun, 17 Jun 2018 03:18:22 -0700
Message-ID: <1529230714-30455-12-git-send-email-joshua.t.otto@gmail.com>
References: <1529230714-30455-1-git-send-email-joshua.t.otto@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pz+g=jd=gmail.com=joshua.t.otto@srs-us1.protection.inumbo.net>)
 id 1fUUnU-00051r-O6
 for xen-devel@lists.xenproject.org; Sun, 17 Jun 2018 10:20:36 +0000
Received: by mail-pf0-x241.google.com with SMTP id h12-v6so6805141pfk.11
 for <xen-devel@lists.xenproject.org>; Sun, 17 Jun 2018 03:20:36 -0700 (PDT)
In-Reply-To: <1529230714-30455-1-git-send-email-joshua.t.otto@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, Joshua Otto <jtotto@uwaterloo.ca>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSm9zaHVhIE90dG8gPGp0b3R0b0B1d2F0ZXJsb28uY2E+CgpUaGUgbGlieGMgbWlncmF0
aW9uIHN0cmVhbSBzcGVjaWZpY2F0aW9uIGRvY3VtZW50IGFzc2VydHMgdGhhdCwgd2l0aGluCmFu
IGh2bSBtaWdyYXRpb24gc3RyZWFtLCAiSFZNX1BBUkFNUyBtdXN0IHByZWNlZGUgSFZNX0NPTlRF
WFQsIGFzCmNlcnRhaW4gcGFyYW1ldGVycyBjYW4gYWZmZWN0IHRoZSB2YWxpZGl0eSBvZiBhcmNo
aXRlY3R1cmFsIHN0YXRlIGluIHRoZQpjb250ZXh0LiIgIFRoaXMgc291bmRzIHJlYXNvbmFibGUs
IGJ1dCB0aGUgaW4tdHJlZSBpbXBsZW1lbnRhdGlvbiBvZiBodm0KZG9tYWluIHNhdmUgYWN0dWFs
bHkgd3JpdGVzIHRoZXNlIHJlY29yZHMgaW4gdGhlIF9yZXZlcnNlXyBvcmRlciwgd2l0aApIVk1f
Q09OVEVYVCBmaXJzdCBhbmQgSFZNX1BBUkFNUyBuZXh0LiAgVGhpcyBoYXMgYmVlbiB0aGUgY2Fz
ZSBmb3IgdGhlCmVudGlyZSBoaXN0b3J5IG9mIHRoYXQgaW1wbGVtZW50YXRpb24sIHNlZW1pbmds
eSB0byBubyBpbGwgZWZmZWN0LCBzbwp1cGRhdGUgdGhlIHNwZWMgdG8gcmVmbGVjdCB0aGlzLgoK
U2lnbmVkLW9mZi1ieTogSm9zaHVhIE90dG8gPGp0b3R0b0B1d2F0ZXJsb28uY2E+Ci0tLQogZG9j
cy9zcGVjcy9saWJ4Yy1taWdyYXRpb24tc3RyZWFtLnBhbmRvYyB8IDcgKystLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
b2NzL3NwZWNzL2xpYnhjLW1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jIGIvZG9jcy9zcGVjcy9saWJ4
Yy1taWdyYXRpb24tc3RyZWFtLnBhbmRvYwppbmRleCA3MzQyMWZmLi44MzQyZDg4IDEwMDY0NAot
LS0gYS9kb2NzL3NwZWNzL2xpYnhjLW1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jCisrKyBiL2RvY3Mv
c3BlY3MvbGlieGMtbWlncmF0aW9uLXN0cmVhbS5wYW5kb2MKQEAgLTY3MywxMSArNjczLDggQEAg
QSB0eXBpY2FsIHNhdmUgcmVjb3JkIGZvciBhbiB4ODYgSFZNIGd1ZXN0IGltYWdlIHdvdWxkIGxv
b2sgbGlrZToKIDIuIERvbWFpbiBoZWFkZXIKIDMuIE1hbnkgUEFHRVxfREFUQSByZWNvcmRzCiA0
LiBUU0NcX0lORk8KLTUuIEhWTVxfUEFSQU1TCi02LiBIVk1cX0NPTlRFWFQKLQotSFZNXF9QQVJB
TVMgbXVzdCBwcmVjZWRlIEhWTVxfQ09OVEVYVCwgYXMgY2VydGFpbiBwYXJhbWV0ZXJzIGNhbiBh
ZmZlY3QKLXRoZSB2YWxpZGl0eSBvZiBhcmNoaXRlY3R1cmFsIHN0YXRlIGluIHRoZSBjb250ZXh0
LgorNS4gSFZNXF9DT05URVhUCis2LiBIVk1cX1BBUkFNUwogCiAKIExlZ2FjeSBJbWFnZXMgKHg4
NiBvbmx5KQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
