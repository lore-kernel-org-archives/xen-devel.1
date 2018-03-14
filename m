From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] libxc/arm: initialise p2m_size to make gcc happy
Date: Wed, 14 Mar 2018 12:32:03 +0000
Message-ID: <20180314123203.30646-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yxl5=ge=citrix.com=prvs=60440319b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ew5a0-0000xY-Rj
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 12:32:28 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2NjIHdpdGggLU8zIGZhaWxlZCB0byBzcG90IHRoZSBsb29wIHRvIGluaXRpYWxpc2UgcDJtX3Np
emUgcnVucyBhdApsZWFzdCBvbmNlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4Yy94Y19kb21fYXJtLmMgfCAzICsrLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhjL3hjX2RvbV9hcm0uYyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV9hcm0uYwppbmRleCA1
YjllY2E2MDg3Li45N2QwOGYwNTVhIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19kb21fYXJt
LmMKKysrIGIvdG9vbHMvbGlieGMveGNfZG9tX2FybS5jCkBAIC0zOTUsNyArMzk1LDcgQEAgc3Rh
dGljIGludCBtZW1pbml0KHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkKICAgICBjb25zdCB1aW50
NjRfdCBtb2RzaXplID0gZHRiX3NpemUgKyByYW1kaXNrX3NpemU7CiAgICAgY29uc3QgdWludDY0
X3QgcmFtMTI4bWIgPSBiYW5rYmFzZVswXSArICgxMjg8PDIwKTsKIAotICAgIHhlbl9wZm5fdCBw
Mm1fc2l6ZTsKKyAgICB4ZW5fcGZuX3QgcDJtX3NpemUgPSAwOyAvKiBtYWtlIGdjYyAtTzMgaGFw
cHkgKi8KICAgICB1aW50NjRfdCBiYW5rMGVuZDsKIAogICAgIGFzc2VydChkb20tPnJhbWJhc2Vf
cGZuIDw8IFhDX1BBR0VfU0hJRlQgPT0gYmFua2Jhc2VbMF0pOwpAQCAtNDM4LDYgKzQzOCw3IEBA
IHN0YXRpYyBpbnQgbWVtaW5pdChzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20pCiAKICAgICBhc3Nl
cnQoZG9tLT5yYW1iYW5rX3NpemVbMF0gIT0gMCk7CiAgICAgYXNzZXJ0KHJhbXNpemUgPT0gMCk7
IC8qIFRvbyBtdWNoIFJBTSBpcyByZWplY3RlZCBhYm92ZSAqLworICAgIGFzc2VydChwMm1fc2l6
ZSAhPSAwKTsKIAogICAgIGRvbS0+cDJtX3NpemUgPSBwMm1fc2l6ZTsKICAgICBkb20tPnAybV9o
b3N0ID0geGNfZG9tX21hbGxvYyhkb20sIHNpemVvZih4ZW5fcGZuX3QpICogcDJtX3NpemUpOwot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
