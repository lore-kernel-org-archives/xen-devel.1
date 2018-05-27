From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] ALSA: xen-front: remove redundant error
 check on ret
Date: Sun, 27 May 2018 22:23:12 +0100
Message-ID: <20180527212312.23997-1-colin.king__5257.10573788292$1527456128$gmane$org@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xu1y=io=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1fN38K-0001NX-90
 for xen-devel@lists.xenproject.org; Sun, 27 May 2018 21:23:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBlcnJv
ciBmb3IgYSAtdmUgdmFsdWUgaW4gcmV0IGlzIHJlZHVuZGFudCBhcyBhbGwgcHJldmlvdXMKYXNz
aWdubWVudHMgdG8gcmV0IGhhdmUgYW4gYXNzb2NpYXRlZCAtdmUgY2hlY2sgYW5kIGhlbmNlIGl0
CmlzIGltcG9zc2libGUgZm9yIHJldCB0byBiZSBsZXNzIHRoYXQgemVybyBhdCB0aGUgcG9pbnQg
b2YgdGhlCmNoZWNrLiAgUmVtb3ZlIHRoaXMgcmVkdW5kYW50IGVycm9yIGNoZWNrLgoKRGV0ZWN0
ZWQgYnkgQ292ZXJpdFNjYW4sIENJRCMxNDY5NDA3ICgiTG9naWNhbGx5IERlYWQgY29kZSIpCgpT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgot
LS0KIHNvdW5kL3hlbi94ZW5fc25kX2Zyb250X2V2dGNobmwuYyB8IDIgLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250
X2V2dGNobmwuYyBiL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250X2V2dGNobmwuYwppbmRleCBkNzBh
NjJlN2Y5MTAuLjEwMmQ2ZTA5NmNjOCAxMDA2NDQKLS0tIGEvc291bmQveGVuL3hlbl9zbmRfZnJv
bnRfZXZ0Y2hubC5jCisrKyBiL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250X2V2dGNobmwuYwpAQCAt
MzUxLDggKzM1MSw2IEBAIGludCB4ZW5fc25kX2Zyb250X2V2dGNobmxfY3JlYXRlX2FsbChzdHJ1
Y3QgeGVuX3NuZF9mcm9udF9pbmZvICpmcm9udF9pbmZvLAogCQkJfQogCQl9CiAJfQotCWlmIChy
ZXQgPCAwKQotCQlnb3RvIGZhaWw7CiAKIAlmcm9udF9pbmZvLT5udW1fZXZ0X3BhaXJzID0gbnVt
X3N0cmVhbXM7CiAJcmV0dXJuIDA7Ci0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
