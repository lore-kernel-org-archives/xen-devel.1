From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] xen-blkfront: use true and false for boolean
 values
Date: Sat, 4 Aug 2018 19:08:59 -0500
Message-ID: <20180805000859.GA20132@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4cix=ku=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1fm6bZ-00051o-Ah
 for xen-devel@lists.xenproject.org; Sun, 05 Aug 2018 00:09:05 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 01354B493E
 for <xen-devel@lists.xenproject.org>; Sat,  4 Aug 2018 19:09:03 -0500 (CDT)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: xen-devel@lists.xenproject.org

UmV0dXJuIHN0YXRlbWVudHMgaW4gZnVuY3Rpb25zIHJldHVybmluZyBib29sIHNob3VsZCB1c2Ug
dHJ1ZSBvciBmYWxzZQppbnN0ZWFkIG9mIGFuIGludGVnZXIgdmFsdWUuCgpUaGlzIGNvZGUgd2Fz
IGRldGVjdGVkIHdpdGggdGhlIGhlbHAgb2YgQ29jY2luZWxsZS4KClNpZ25lZC1vZmYtYnk6IEd1
c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Ci0tLQogZHJpdmVycy9i
bG9jay94ZW4tYmxrZnJvbnQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtm
cm9udC5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwppbmRleCA5NDMwMGRiLi44OTg2
YWRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCisrKyBiL2RyaXZl
cnMvYmxvY2sveGVuLWJsa2Zyb250LmMKQEAgLTE0MzYsNyArMTQzNiw3IEBAIHN0YXRpYyBib29s
IGJsa2lmX2NvbXBsZXRpb24odW5zaWduZWQgbG9uZyAqaWQsCiAKIAkJLyogV2FpdCB0aGUgc2Vj
b25kIHJlc3BvbnNlIGlmIG5vdCB5ZXQgaGVyZS4gKi8KIAkJaWYgKHMyLT5zdGF0dXMgPT0gUkVR
X1dBSVRJTkcpCi0JCQlyZXR1cm4gMDsKKwkJCXJldHVybiBmYWxzZTsKIAogCQlicmV0LT5zdGF0
dXMgPSBibGtpZl9nZXRfZmluYWxfc3RhdHVzKHMtPnN0YXR1cywKIAkJCQkJCSAgICAgIHMyLT5z
dGF0dXMpOwpAQCAtMTUzNyw3ICsxNTM3LDcgQEAgc3RhdGljIGJvb2wgYmxraWZfY29tcGxldGlv
bih1bnNpZ25lZCBsb25nICppZCwKIAkJfQogCX0KIAotCXJldHVybiAxOworCXJldHVybiB0cnVl
OwogfQogCiBzdGF0aWMgaXJxcmV0dXJuX3QgYmxraWZfaW50ZXJydXB0KGludCBpcnEsIHZvaWQg
KmRldl9pZCkKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
