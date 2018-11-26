From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v1] xl: free bitmaps on exit
Date: Mon, 26 Nov 2018 15:58:22 +0100
Message-ID: <20181126145822.2121-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bbsm=of=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gRILV-0008TT-BD
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 14:58:45 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

RXZlcnkgaW52b2NhdGlvbiBvZiB4bCB2aWEgdmFsZ3JpbmQgd2lsbCBzaG93IHRocmVlIGxlYWtz
LiBTaW5jZQpsaWJ4bF9iaXRtYXBfYWxsb2MgdXNlcyBOT0dDLCB0aGUgY2FsbGVyIGhhcyB0byBm
cmVlIHRoZSBtZW1vcnkgYWZ0ZXIKdXNlLgoKU2lnbmVkLW9mZi1ieTogT2xhZiBIZXJpbmcgPG9s
YWZAYWVwZmxlLmRlPgotLS0KIHRvb2xzL3hsL3hsLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsLmMgYi90b29scy94bC94
bC5jCmluZGV4IDdkMjE0MmYxNmYuLjk3NTZhODM1MjYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hs
LmMKKysrIGIvdG9vbHMveGwveGwuYwpAQCAtMjI5LDYgKzIyOSw5IEBAIHN0YXRpYyB2b2lkIHBh
cnNlX2dsb2JhbF9jb25maWcoY29uc3QgY2hhciAqY29uZmlnZmlsZSwKICAgICBlbHNlCiAgICAg
ICAgIGxpYnhsX2JpdG1hcF9zZXRfYW55KCZnbG9iYWxfcHZfYWZmaW5pdHlfbWFzayk7CiAKKyAg
ICBsaWJ4bF9iaXRtYXBfZGlzcG9zZSgmZ2xvYmFsX3B2X2FmZmluaXR5X21hc2spOworICAgIGxp
YnhsX2JpdG1hcF9kaXNwb3NlKCZnbG9iYWxfaHZtX2FmZmluaXR5X21hc2spOworICAgIGxpYnhs
X2JpdG1hcF9kaXNwb3NlKCZnbG9iYWxfdm1fYWZmaW5pdHlfbWFzayk7CiAgICAgeGx1X2NmZ19k
ZXN0cm95KGNvbmZpZyk7CiB9CiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
