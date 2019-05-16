From: Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 3/3] xen/rwlock: Include lib.h
Date: Wed, 15 May 2019 17:02:12 -0700
Message-ID: <20190516000212.13468-3-alistair.francis@wdc.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N00O=TQ=wdc.com=prvs=032022a23=alistair.francis@srs-us1.protection.inumbo.net>)
 id 1hR3sW-0004IN-IV
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 00:04:08 +0000
In-Reply-To: <20190516000212.13468-1-alistair.francis@wdc.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: wei.liu2@citrix.com, Alistair Francis <alistair.francis@wdc.com>, ian.jackson@eu.citrix.com, alistair23@gmail.com
List-Id: xen-devel@lists.xenproject.org

SW5jbHVkZSBsaWIuaCB0byBlbnN1cmUgdGhhdCBBU1NFUlQoKSBpcyBkZWZpbmVkLgoKU2lnbmVk
LW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgotLS0K
IHhlbi9pbmNsdWRlL3hlbi9yd2xvY2suaCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3J3bG9jay5oIGIveGVuL2luY2x1
ZGUveGVuL3J3bG9jay5oCmluZGV4IDM1NjU3YzU2YzQuLjEzMTUzNzM0OGUgMTAwNjQ0Ci0tLSBh
L3hlbi9pbmNsdWRlL3hlbi9yd2xvY2suaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgK
QEAgLTEsNiArMSw3IEBACiAjaWZuZGVmIF9fUldMT0NLX0hfXwogI2RlZmluZSBfX1JXTE9DS19I
X18KIAorI2luY2x1ZGUgPHhlbi9saWIuaD4KICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2suaD4KIAog
I2luY2x1ZGUgPGFzbS9hdG9taWMuaD4KLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
