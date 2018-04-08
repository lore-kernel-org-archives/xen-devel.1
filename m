From: Paul Semel <semelpaul@gmail.com>
Subject: [PATCH v2 6/7] add mspin_sleep function to time manager
Date: Sun,  8 Apr 2018 15:15:58 +0200
Message-ID: <20180408131559.6840-6-semelpaul@gmail.com>
References: <20180408131559.6840-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aspc=g5=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1f59nw-0001Rs-8m
 for xen-devel@lists.xenproject.org; Sun, 08 Apr 2018 12:52:20 +0000
Received: by mail-wm0-x241.google.com with SMTP id g8so12170238wmd.2
 for <xen-devel@lists.xenproject.org>; Sun, 08 Apr 2018 05:52:19 -0700 (PDT)
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
ZS5jIGIvY29tbW9uL3RpbWUuYwppbmRleCA2N2ZlMDQ5Li5mNzU5NzlhIDEwMDY0NAotLS0gYS9j
b21tb24vdGltZS5jCisrKyBiL2NvbW1vbi90aW1lLmMKQEAgLTEyNSw2ICsxMjUsMTIgQEAgc3Rh
dGljIGlubGluZSB2b2lkIHNwaW5fc2xlZXAodWludDY0X3QgdCkKICAgICBuc3Bpbl9zbGVlcChu
c2VjKTsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkIG1zcGluX3NsZWVwKHVpbnQ2NF90IHQpCit7
CisgICAgdWludDY0X3QgbnNlYyA9IHQgKiAxMDAwMDAwdWw7CisgICAgbnNwaW5fc2xlZXAobnNl
Yyk7Cit9CisKIC8qCiAgKiBMb2NhbCB2YXJpYWJsZXM6CiAgKiBtb2RlOiBDCi0tIAoyLjE2LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
