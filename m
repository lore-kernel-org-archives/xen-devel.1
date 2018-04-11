From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: [PATCH 1/2] x86/microcode: Indicate "not found" in rc
 of microcode_resume_cpu()
Date: Wed, 11 Apr 2018 22:14:57 +0200
Message-ID: <20180411201458.26004-1-simon@invisiblethingslab.com>
References: <5ACE2D9502000078001BA56C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lz4q=ha=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f6M9M-0000nC-Bb
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 20:15:24 +0000
In-Reply-To: <5ACE2D9502000078001BA56C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

TWFrZSBpdCBwb3NzaWJsZSB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIGEgZmFpbHVyZSB0byBsb2Fk
IGEgbWljcm9jb2RlCnVwZGF0ZSBhbmQgYSBmYWlsdXJlIHRvIGZpbmQgYW55IG1hdGNoaW5nIG1p
Y3JvY29kZSB1cGRhdGUgYnkgcmV0dXJuaW5nCi1FTk9FTlQgKGluc3RlYWQgb2YgLUVJTykgaW4g
dGhlIGxhdGVyIGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBHYWlzZXIgPHNpbW9uQGludmlz
aWJsZXRoaW5nc2xhYi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21pY3JvY29kZS5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCmlu
ZGV4IDc3YzFlZmM5N2YuLmU5ZmFmYjFkMTQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNy
b2NvZGUuYworKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKQEAgLTI0OCw3ICsyNDgsNyBA
QCBpbnQgbWljcm9jb2RlX3Jlc3VtZV9jcHUodW5zaWduZWQgaW50IGNwdSkKICAgICBfX21pY3Jv
Y29kZV9maW5pX2NwdShjcHUpOwogICAgIHVjaS0+Y3B1X3NpZyA9IG5zaWc7CiAKLSAgICBlcnIg
PSAtRUlPOworICAgIGVyciA9IC1FTk9FTlQ7CiAgICAgZm9yX2VhY2hfb25saW5lX2NwdSAoIGNw
dTIgKQogICAgIHsKICAgICAgICAgdWNpID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8sIGNwdTIp
OwotLSAKMi4xNi4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
