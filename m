From: Juergen Gross <jgross@suse.com>
Subject: Regression in xen-unstable due to commit 3802ecbaa9eb36
Date: Thu, 16 May 2019 10:09:38 +0200
Message-ID: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xQgL=TQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRBSQ-0008I5-VC
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 08:09:43 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6656DABB1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 08:09:39 +0000 (UTC)
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <ohering@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHBhdGNoICJsaWJ4bDogYWRkIGhlbHBlciBmdW5jdGlvbiB0byBzZXQgZGV2aWNlX21vZGVs
X3ZlcnNpb24iCmJyZWFrcyBjcmVhdGluZyBhbnkgZG9tYWluIGZvciBtZS4KCkNyZWF0aW5nIGEg
UFYgb3IgSFZNIGd1ZXN0IHdpbGwgdHJpZ2dlciB0aGUgYXNzZXJ0aW9uCgphc3NlcnQoYl9pbmZv
LT5kZXZpY2VfbW9kZWxfdmVyc2lvbik7CgphZGRlZCBieSB0aGF0IHBhdGNoLiBSZW1vdmluZyB0
aGlzIGFzc2VydCgpIHdpbGwgdGhlbiB0cmlnZ2VyCgp4bDogbGlieGwuYzozMzk6IGxpYnhsX2Rl
ZmJvb2xfdmFsOiBBc3NlcnRpb24KYCFsaWJ4bF9kZWZib29sX2lzX2RlZmF1bHQoZGIpJyBmYWls
ZWQuCgp3aGljaCBpcyBjYWxsZWQgYnkgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1
bHQoKSBsaW5lIDE0MywKd2hpY2ggaGFzIGJlZW4gYWRkZWQgYnkgdGhlIHNhbWUgcGF0Y2guCgpI
YXMgdGhpcyBwYXRjaCBldmVyIGJlZW4gdGVzdGVkIHRvIHdvcms/CgpJIGhhdmUgZG9uZSBhIG1h
a2UgZGlzdGNsZWFuIGFuZCBjb25maWd1cmUsIHNvIEkgZG9uJ3QgdGhpbmsgdGhpcwpzaG91bGQg
YmUgYSBzeXN0ZW0gc3BlY2lmaWMgcHJvYmxlbS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
