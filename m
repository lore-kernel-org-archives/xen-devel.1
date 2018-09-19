From: Wei Liu <wei.liu2@citrix.com>
Subject: Out of bounds access in early boot code related to GRUB
Date: Wed, 19 Sep 2018 10:34:47 +0100
Message-ID: <20180919093447.lrrvyh7tdkcplqdj@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2Ysl-0004qs-Og
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 09:34:51 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgRGFuaWVsLAoKSSBkaXNjb3ZlcmVkIGFuIG91dCBvZiBib3VuZHMgYWNjZXNzIGlzc3VlIHJl
bGF0ZWQgdG8gR1JVQiByZWxvY2F0aW9uCmNvZGUgcGF0aCB3aGVuIGluc3BlY3RpbmcgZWFybHkg
Ym9vdCBjb2RlLgoKOTU4OTkyN2U1YiBjaGFuZ2VkIGFuIEVGSSBvbmx5IHBhdGggdG8gd29yayB3
aXRoIEdSVUIuIFlldCB0aGUgZm9sbG93aW5nCnR3byBsaW5lcyB3aXRoaW4gYW4gaWYgY29uZGl0
aW9uIHJlbWFpbmVkIHVudG91Y2hlZC4KCiAgICBtb2RbbWJpLT5tb2RzX2NvdW50XS5tb2Rfc3Rh
cnQgPSB2aXJ0X3RvX21mbihfc3RleHQpOwogICAgbW9kW21iaS0+bW9kc19jb3VudF0ubW9kX2Vu
ZCA9IF9fMk1fcndkYXRhX2VuZCAtIF9zdGV4dDsKCkJlZm9yZSB5b3VyIGNoYW5nZSB0aGV5IHdl
cmUgZmluZSBiZWNhdXNlIHRoZSBtb2QgYXJyYXkgd2FzIGNyZWF0ZWQgb25lCmVsZW1lbnQgbGFy
Z2VyIGluIFhlbiAoc2VlIGUyMmUxYzQ3OTU4YSkuIEkgZG9uJ3QgdGhpbmsgR1JVQiBkb2VzIHRo
ZQpzYW1lLiBTbyB0aGlzIGlzIGFuIG91dCBvZiBib3VuZHMgYWNjZXNzIGZvciBHUlVCIGNhc2Uu
CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
