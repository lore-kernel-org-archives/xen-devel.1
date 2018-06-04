From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 02/11] x86/vmx: Don't clobber %dr6 while
 debugging state is lazy
Date: Mon, 4 Jun 2018 14:59:06 +0100
Message-ID: <1528120755-17455-3-git-send-email-andrew.cooper3@citrix.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Yy9zIDRmMzY0NTJiNjMgaW50cm9kdWNlZCBhIHdyaXRlIHRvICVkcjYgaW4gdGhlICNEQiBpbnRl
cmNlcHQgY2FzZSwgYnV0IHRoZQpndWVzdHMgZGVidWcgcmVnaXN0ZXJzIG1heSBiZSBsYXp5IGF0
IHRoaXMgcG9pbnQsIGF0IHdoaWNoIHBvaW50IHRoZSBndWVzdHMKbGF0ZXIgYXR0ZW1wdCB0byBy
ZWFkICVkcjYgd2lsbCBkaXNjYXJkIHRoaXMgdmFsdWUgYW5kIHVzZSB0aGUgb2xkZXIgc3RhbGUK
dmFsdWUuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KQ0M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KQ0M6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0v
dm14L3ZteC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Zt
eC5jCmluZGV4IDMzZDM5ZjYuLjhkYmU4MzggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
dm14L3ZteC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCkBAIC0zNjk2LDYgKzM2
OTYsNyBAQCB2b2lkIHZteF92bWV4aXRfaGFuZGxlcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVn
cykKICAgICAgICAgICAgICAqLwogICAgICAgICAgICAgX192bXJlYWQoRVhJVF9RVUFMSUZJQ0FU
SU9OLCAmZXhpdF9xdWFsaWZpY2F0aW9uKTsKICAgICAgICAgICAgIEhWTVRSQUNFXzFEKFRSQVBf
REVCVUcsIGV4aXRfcXVhbGlmaWNhdGlvbik7CisgICAgICAgICAgICBfX3Jlc3RvcmVfZGVidWdf
cmVnaXN0ZXJzKHYpOwogICAgICAgICAgICAgd3JpdGVfZGVidWdyZWcoNiwgZXhpdF9xdWFsaWZp
Y2F0aW9uIHwgRFJfU1RBVFVTX1JFU0VSVkVEX09ORSk7CiAgICAgICAgICAgICBpZiAoICF2LT5k
b21haW4tPmRlYnVnZ2VyX2F0dGFjaGVkICkKICAgICAgICAgICAgIHsKLS0gCjIuMS40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
