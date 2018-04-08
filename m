From: Paul Semel <semelpaul@gmail.com>
Subject: [PATCH v2 4/7] add nspin_sleep function to time manager
Date: Sun,  8 Apr 2018 15:15:56 +0200
Message-ID: <20180408131559.6840-4-semelpaul@gmail.com>
References: <20180408131559.6840-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aspc=g5=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1f59nu-0001RH-VY
 for xen-devel@lists.xenproject.org; Sun, 08 Apr 2018 12:52:19 +0000
Received: by mail-wm0-x242.google.com with SMTP id r82so10793487wme.0
 for <xen-devel@lists.xenproject.org>; Sun, 08 Apr 2018 05:52:17 -0700 (PDT)
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
IFNlbWVsIDxwaGVudGV4QGFtYXpvbi5kZT4KLS0tCiBjb21tb24vdGltZS5jIHwgOSArKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9jb21tb24v
dGltZS5jIGIvY29tbW9uL3RpbWUuYwppbmRleCAxZjBmMjg5Li4xZDdmZWY1IDEwMDY0NAotLS0g
YS9jb21tb24vdGltZS5jCisrKyBiL2NvbW1vbi90aW1lLmMKQEAgLTExMCw2ICsxMTAsMTUgQEAg
aW50IGdldHRpbWVvZmRheShzdHJ1Y3QgdGltZXZhbCAqdHApCiAgICAgcmV0dXJuIDA7CiB9CiAK
K3N0YXRpYyBpbmxpbmUgdm9pZCBuc3Bpbl9zbGVlcCh1aW50NjRfdCB0KQoreworICAgIHVpbnQ2
NF90IGN1cnIgPSBzaW5jZV9ib290X3RpbWUoKTsKKyAgICB1aW50NjRfdCBlbmQgPSBjdXJyICsg
dDsKKworICAgIHdoaWxlICggY3VyciA8IGVuZCApCisgICAgICAgIGN1cnIgPSBzaW5jZV9ib290
X3RpbWUoKTsKK30KKwogLyoKICAqIExvY2FsIHZhcmlhYmxlczoKICAqIG1vZGU6IEMKLS0gCjIu
MTYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
