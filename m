From: Paul Semel <semelpaul@gmail.com>
Subject: [PATCH v2 5/7] add spin_sleep function to time manager
Date: Sun,  8 Apr 2018 15:15:57 +0200
Message-ID: <20180408131559.6840-5-semelpaul@gmail.com>
References: <20180408131559.6840-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aspc=g5=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1f59nw-0001Rr-7L
 for xen-devel@lists.xenproject.org; Sun, 08 Apr 2018 12:52:20 +0000
Received: by mail-wm0-x241.google.com with SMTP id b127so12243030wmf.5
 for <xen-devel@lists.xenproject.org>; Sun, 08 Apr 2018 05:52:18 -0700 (PDT)
In-Reply-To: <20180408131559.6840-1-semelpaul@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: wipawel@amazon.de, Paul Semel <phentex@amazon.de>, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGF1bCBTZW1lbCA8cGhlbnRleEBhbWF6b24uZGU+CgpTaWduZWQtb2ZmLWJ5OiBQYXVs
IFNlbWVsIDxwaGVudGV4QGFtYXpvbi5kZT4KLS0tCiBjb21tb24vdGltZS5jIHwgNiArKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9jb21tb24vdGlt
ZS5jIGIvY29tbW9uL3RpbWUuYwppbmRleCAxZDdmZWY1Li42N2ZlMDQ5IDEwMDY0NAotLS0gYS9j
b21tb24vdGltZS5jCisrKyBiL2NvbW1vbi90aW1lLmMKQEAgLTExOSw2ICsxMTksMTIgQEAgc3Rh
dGljIGlubGluZSB2b2lkIG5zcGluX3NsZWVwKHVpbnQ2NF90IHQpCiAgICAgICAgIGN1cnIgPSBz
aW5jZV9ib290X3RpbWUoKTsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkIHNwaW5fc2xlZXAodWlu
dDY0X3QgdCkKK3sKKyAgICB1aW50NjRfdCBuc2VjID0gdCAqIDEwMDAwMDAwMDB1bDsKKyAgICBu
c3Bpbl9zbGVlcChuc2VjKTsKK30KKwogLyoKICAqIExvY2FsIHZhcmlhYmxlczoKICAqIG1vZGU6
IEMKLS0gCjIuMTYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
