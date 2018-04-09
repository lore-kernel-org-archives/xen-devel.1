From: Paul Semel <semelpaul@gmail.com>
Subject: [PATCH v3 5/7] add spin_sleep function to time manager
Date: Mon,  9 Apr 2018 16:35:41 +0200
Message-ID: <20180409143543.4568-5-semelpaul@gmail.com>
References: <20180409143543.4568-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=he/8=g6=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1f5XWe-0004sb-JN
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 14:12:04 +0000
Received: by mail-wr0-x243.google.com with SMTP id c24so9734236wrc.6
 for <xen-devel@lists.xenproject.org>; Mon, 09 Apr 2018 07:12:02 -0700 (PDT)
In-Reply-To: <20180409143543.4568-1-semelpaul@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: wipawel@amazon.de, Paul Semel <phentex@amazon.de>, roger.pau@citrix.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGF1bCBTZW1lbCA8cGhlbnRleEBhbWF6b24uZGU+Cgp0aGlzIGZ1bmN0aW9uIHVzZXMg
bnNwaW5fc2xlZXAgdG8gc3BpbiBzbGVlcCBmb3IgdCBzZWNvbmRzCgpTaWduZWQtb2ZmLWJ5OiBQ
YXVsIFNlbWVsIDxwaGVudGV4QGFtYXpvbi5kZT4KLS0tCiBjb21tb24vdGltZS5jIHwgNiArKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9jb21tb24v
dGltZS5jIGIvY29tbW9uL3RpbWUuYwppbmRleCA0NzcwYjlhLi5lNzQ0YWIxIDEwMDY0NAotLS0g
YS9jb21tb24vdGltZS5jCisrKyBiL2NvbW1vbi90aW1lLmMKQEAgLTE1MSw2ICsxNTEsMTIgQEAg
c3RhdGljIGlubGluZSB2b2lkIG5zcGluX3NsZWVwKHVpbnQ2NF90IHQpCiAgICAgICAgIGFzbSB2
b2xhdGlsZSAoInBhdXNlIik7CiB9CiAKK3N0YXRpYyBpbmxpbmUgdm9pZCBzcGluX3NsZWVwKHVp
bnQ2NF90IHQpCit7CisgICAgdWludDY0X3QgbnNlYyA9IFNFQ19UT19OU0VDKHQpOworICAgIG5z
cGluX3NsZWVwKG5zZWMpOworfQorCiAvKgogICogTG9jYWwgdmFyaWFibGVzOgogICogbW9kZTog
QwotLSAKMi4xNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
