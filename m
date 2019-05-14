From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH MM-PART2 v2 11/19] xen/arm32: head: Don't set
 MAIR0 and MAIR1
Date: Tue, 14 May 2019 13:21:28 +0100
Message-ID: <20190514122136.28215-20-julien.grall@arm.com>
References: <20190514122136.28215-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWRh-00007X-3N
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:22:13 +0000
In-Reply-To: <20190514122136.28215-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvLXByb2Nlc3NvciByZWdpc3RlcnMgTUFJUjAgYW5kIE1BSVIxIGFyZSBtYW5hZ2VkIGJ5
IEVMMS4gU28gdGhlcmUKYXJlIG5vIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGVtIGR1cmluZyBYZW4g
Ym9vdC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0t
CiAgICBDaGFuZ2VzIGluIHYyCiAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKLS0t
CiB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9h
cmNoL2FybS9hcm0zMi9oZWFkLlMKaW5kZXggZDQyYTEzNTU2Yy4uMzQ0ODgxN2FhYiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TCkBAIC0yMTIsOCArMjEyLDYgQEAgY3B1X2luaXRfZG9uZToKICAgICAgICAgLyogU2V0
IHVwIG1lbW9yeSBhdHRyaWJ1dGUgdHlwZSB0YWJsZXMgKi8KICAgICAgICAgbGRyICAgcjAsID1N
QUlSMFZBTAogICAgICAgICBsZHIgICByMSwgPU1BSVIxVkFMCi0gICAgICAgIG1jciAgIENQMzIo
cjAsIE1BSVIwKQotICAgICAgICBtY3IgICBDUDMyKHIxLCBNQUlSMSkKICAgICAgICAgbWNyICAg
Q1AzMihyMCwgSE1BSVIwKQogICAgICAgICBtY3IgICBDUDMyKHIxLCBITUFJUjEpCiAKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
