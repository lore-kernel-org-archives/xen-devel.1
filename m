From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v1] x86/domctl: remove impossible condition in
	XEN_DOMCTL_getpageframeinfo3
Date: Fri,  9 Mar 2018 17:01:16 +0100
Message-ID: <20180309160116.16298-1-olaf@aepfle.de>
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
To: xen-devel@lists.xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHZhbHVlIG9mIG51bSBpcyBhbHdheXMgdGhlIHNhbWUgYXMgZG9tY3RsLT51LmdldHBhZ2Vm
cmFtZWluZm8zLm51bSwKaXQgd2FzIGFzc2lnbmVkIGp1c3QgYSBmZXcgbGluZXMgYmVmb3JlLgoK
U2lnbmVkLW9mZi1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgotLS0KIHhlbi9hcmNo
L3g4Ni9kb21jdGwuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWN0bC5jIGIveGVuL2Fy
Y2gveDg2L2RvbWN0bC5jCmluZGV4IDhmYmJmM2FlYjMuLjQ2ZDI4OGE0OTAgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9kb21jdGwuYworKysgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKQEAgLTQy
MSw4ICs0MjEsNyBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKAogICAgICAgICAvKiBHYW1lcyB0byBh
bGxvdyB0aGlzIGNvZGUgYmxvY2sgdG8gaGFuZGxlIGEgY29tcGF0IGd1ZXN0LiAqLwogICAgICAg
ICB2b2lkIF9fdXNlciAqZ3Vlc3RfaGFuZGxlID0gZG9tY3RsLT51LmdldHBhZ2VmcmFtZWluZm8z
LmFycmF5LnA7CiAKLSAgICAgICAgaWYgKCB1bmxpa2VseShudW0gPiAxMDI0KSB8fAotICAgICAg
ICAgICAgIHVubGlrZWx5KG51bSAhPSBkb21jdGwtPnUuZ2V0cGFnZWZyYW1laW5mbzMubnVtKSAp
CisgICAgICAgIGlmICggdW5saWtlbHkobnVtID4gMTAyNCkgKQogICAgICAgICB7CiAgICAgICAg
ICAgICByZXQgPSAtRTJCSUc7CiAgICAgICAgICAgICBicmVhazsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
