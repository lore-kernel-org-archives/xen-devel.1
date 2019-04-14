From: Amit Singh Tomar <amittomer25@gmail.com>
Subject: [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
Date: Sun, 14 Apr 2019 20:03:39 +0530
Message-ID: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F7+S=SQ=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hFgCs-0002nD-HG
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 14:34:06 +0000
Received: by mail-pl1-x643.google.com with SMTP id y6so7298324pll.13
 for <xen-devel@lists.xenproject.org>; Sun, 14 Apr 2019 07:34:05 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, julien.grall@arm.com, sstabellini@kernel.org, Amit Singh Tomar <amittomer25@gmail.com>
List-Id: xen-devel@lists.xenproject.org

QXQgdGhlIG1vbWVudCwgd2UgaGlkZSBQTVUncyBmcm9tIGRvbWFpbiAwIGFuZCBYRU4gYm9vdCBm
YWlscyBvbiBwbGF0Zm9ybVsxXQp3aGVyZSBEVFMgY29udGFpbnMgImFybSxjb3J0ZXgtYTUzLXBt
dSIgYXMgY29tcGF0aWJsZSBzdHJpbmcgZm9yIFBNVSBub2RlLgoKVGhpcyBwYXRjaCBzaW1wbHkg
YWRkcyAiYXJtLGNvcnRleC1hNTMtcG11IiB0byBsaXN0IG9mIGJsYWNrbGlzdGVkIFBNVXMuCgpb
MV06IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXEuZHRzaSNMMTI0CgpTaWduZWQtb2ZmLWJ5OiBB
bWl0IFNpbmdoIFRvbWFyIDxhbWl0dG9tZXIyNUBnbWFpbC5jb20+Ci0tLQogeGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKaW5kZXggZDk4MzY3Ny4uYjU0NTkyYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpAQCAt
MTMzNCw2ICsxMzM0LDcgQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxlX25vZGUoc3RydWN0IGRv
bWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKICAgICAgICAgRFRfTUFUQ0hfQ09N
UEFUSUJMRSgiYXJtLGNvcnRleC1hMTUtcG11IiksCiAgICAgICAgIERUX01BVENIX0NPTVBBVElC
TEUoImFybSxjb3J0ZXgtYTUzLWVkYWMiKSwKICAgICAgICAgRFRfTUFUQ0hfQ09NUEFUSUJMRSgi
YXJtLGFybXY4LXBtdXYzIiksCisgICAgICAgIERUX01BVENIX0NPTVBBVElCTEUoImFybSxjb3J0
ZXgtYTUzLXBtdSIpLAogICAgICAgICBEVF9NQVRDSF9QQVRIKCIvY3B1cyIpLAogICAgICAgICBE
VF9NQVRDSF9UWVBFKCJtZW1vcnkiKSwKICAgICAgICAgLyogVGhlIG1lbW9yeSBtYXBwZWQgdGlt
ZXIgaXMgbm90IHN1cHBvcnRlZCBieSBYZW4uICovCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
