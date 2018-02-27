From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] pvcalls-front: 64-bit align flags
Date: Tue, 27 Feb 2018 11:54:57 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802271150020.4239__49180.529456544$1519761240$gmane$org@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bhja=fv=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1eqlL6-00038Z-T8
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 19:55:04 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jgross@suse.com, boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

V2UgYXJlIHVzaW5nIHRlc3RfYW5kXyogb3BlcmF0aW9ucyBvbiB0aGUgc3RhdHVzIGFuZCBmbGFn
IGZpZWxkcyBvZgpzdHJ1Y3Qgc29ja19tYXBwaW5nLiBIb3dldmVyLCB0aGVzZSBmdW5jdGlvbnMg
cmVxdWlyZSB0aGUgb3BlcmFuZCB0byBiZQo2NC1iaXQgYWxpZ25lZCBvbiBhcm02NC4gQ3VycmVu
dGx5LCBvbmx5IHN0YXR1cyBpcyA2NC1iaXQgYWxpZ25lZC4KCk1ha2UgZmxhZ3MgNjQtYml0IGFs
aWduZWQgYnkgaW50cm9kdWNpbmcgYW4gZXhwbGljaXQgcGFkZGluZyBmaWVsZC4KClNpZ25lZC1v
ZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub0BhcG9yZXRvLmNvbT4KCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMgYi9kcml2ZXJzL3hlbi9wdmNhbGxzLWZy
b250LmMKaW5kZXggY2E1Yjc3My4uYWEwN2IyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vcHZj
YWxscy1mcm9udC5jCisrKyBiL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYwpAQCAtNzgsNiAr
NzgsNyBAQCBzdHJ1Y3Qgc29ja19tYXBwaW5nIHsKICNkZWZpbmUgUFZDQUxMU19TVEFUVVNfQklO
RCAgICAgICAgICAxCiAjZGVmaW5lIFBWQ0FMTFNfU1RBVFVTX0xJU1RFTiAgICAgICAgMgogCQkJ
dWludDhfdCBzdGF0dXM7CisJCQl1aW50OF90IHBhZFs3XTsKIAkJLyoKIAkJICogSW50ZXJuYWwg
c3RhdGUtbWFjaGluZSBmbGFncy4KIAkJICogT25seSBvbmUgYWNjZXB0IG9wZXJhdGlvbiBjYW4g
YmUgaW5mbGlnaHQgZm9yIGEgc29ja2V0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
