From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 1/5] xen: introduce ptrdiff_t, fix uintptr_t
Date: Mon, 11 Feb 2019 17:13:27 -0800
Message-ID: <1549934011-17624-1-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1902111631220.347@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mGt/=QT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gtMdm-0006Pj-E7
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 01:13:38 +0000
In-Reply-To: <alpine.DEB.2.10.1902111631220.347@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: stefanos@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

dWludHB0cl90IHNob3VsZCBiZSAidW5zaWduZWQgbG9uZyIgLS0gc2FtZSBzaXplIGFzIGEgcG9p
bnRlci4KCkludHJvZHVjZSB0aGUgbmV3IHR5cGUgInB0cmRpZmZfdCIgd2hpY2ggaXMgZGVmaW5l
ZCBhcyB0aGUgc2lnbmVkCmludGVnZXIgdHlwZSBvZiB0aGUgcmVzdWx0IG9mIHN1YnRyYWN0aW5n
IHR3byBwb2ludGVycy4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFu
b3NAeGlsaW54LmNvbT4KQ0M6IGpiZXVsaWNoQHN1c2UuY29tCkNDOiBhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tCkNDOiBqdWxpZW4uZ3JhbGxAYXJtLmNvbQpDQzogR2VvcmdlLkR1bmxhcEBldS5j
aXRyaXguY29tCkNDOiBpYW4uamFja3NvbkBldS5jaXRyaXguY29tCkNDOiBrb25yYWQud2lsa0Bv
cmFjbGUuY29tCkNDOiB0aW1AeGVuLm9yZwpDQzogd2VpLmxpdTJAY2l0cml4LmNvbQotLS0KQ2hh
bmdlcyBpbiB2OToKLSBuZXcgcGF0Y2gKLS0tCiB4ZW4vaW5jbHVkZS94ZW4vdHlwZXMuaCB8IDMg
KystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3R5cGVzLmggYi94ZW4vaW5jbHVkZS94ZW4vdHlwZXMu
aAppbmRleCAwM2YwZmU2Li5lNzBhZGFjIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vdHlw
ZXMuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vdHlwZXMuaApAQCAtNTIsNyArNTIsOCBAQCB0eXBl
ZGVmIF9fdTMyIF9fYmUzMjsKIHR5cGVkZWYgX191NjQgX19sZTY0OwogdHlwZWRlZiBfX3U2NCBf
X2JlNjQ7CiAKLXR5cGVkZWYgdW5zaWduZWQgaW50IF9fYXR0cmlidXRlX18oKF9fbW9kZV9fKF9f
cG9pbnRlcl9fKSkpIHVpbnRwdHJfdDsKK3R5cGVkZWYgdW5zaWduZWQgbG9uZyBfX2F0dHJpYnV0
ZV9fKChfX21vZGVfXyhfX3BvaW50ZXJfXykpKSB1aW50cHRyX3Q7Cit0eXBlZGVmIGxvbmcgcHRy
ZGlmZl90OwogCiB0eXBlZGVmIGJvb2wgYm9vbF90OwogI2RlZmluZSB0ZXN0X2FuZF9zZXRfYm9v
bChiKSAgIHhjaGcoJihiKSwgdHJ1ZSkKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
