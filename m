From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 0/2] Fix make -j race due to stubdom and tools
 make -C
Date: Mon, 15 Apr 2019 17:28:07 +0100
Message-ID: <20190415162809.23675-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tbw4=SR=citrix.com=prvs=001b8ac9c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hG4Sv-0007UF-Rw
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 16:28:17 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gKDIpOgogIGJ1aWxkIHN5c3RlbTogbWFrZSBpbnN0YWxsLXN0dWJkb20gZGVw
ZW5kIG9uIGluc3RhbGwtdG9vbHMgYWdhaW4KICBETyBOT1QgQVBQTFkgZ2l0LWNoZWNrb3V0LnNo
OiBhZGQgc2xlZXAgdG8gZGVtb25zdHJhdGUgcmFjZQoKIE1ha2VmaWxlICAgICAgICAgICAgICAg
IHwgMiArLQogc2NyaXB0cy9naXQtY2hlY2tvdXQuc2ggfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
