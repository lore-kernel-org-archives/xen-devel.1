From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v2 39/45] ARM: new VGIC: Add preliminary stub
	implementation
Date: Thu, 15 Mar 2018 20:30:44 +0000
Message-ID: <20180315203050.19791-40-andre.przywara@linaro.org>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jxrf=gf=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ewZXU-0004VK-7t
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 20:31:52 +0000
Received: by mail-wr0-x242.google.com with SMTP id m12so9542301wrm.13
 for <xen-devel@lists.xenproject.org>; Thu, 15 Mar 2018 13:31:50 -0700 (PDT)
In-Reply-To: <20180315203050.19791-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlIEFSTSBhcmNoIGNvZGUgcmVxdWlyZXMgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIgZW11bGF0
aW9uIHRvIGltcGxlbWVudAp2Z2ljX2NsZWFyX3BlbmRpbmdfaXJxcygpLCBhbHRob3VnaCBpdCBp
cyBzdXNwZWN0ZWQgdGhhdCBpdCBpcyBhY3R1YWxseQpub3QgbmVjZXNzYXJ5LiBHbyB3aXRoIGEg
c3R1YiBmb3Igbm93IHRvIG1ha2UgdGhlIGxpbmtlciBoYXBweS4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgotLS0KIHhlbi9hcmNoL2Fy
bS92Z2ljL3ZnaWMuYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMgYi94ZW4vYXJjaC9hcm0v
dmdpYy92Z2ljLmMKaW5kZXggMWFhZTY4ZmY4My4uMDAyZmVjNTdlNiAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL3ZnaWMvdmdpYy5jCisrKyBiL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYwpAQCAt
NzgxLDYgKzc4MSwxNCBAQCB2b2lkIGdpY19kdW1wX3ZnaWNfaW5mbyhzdHJ1Y3QgdmNwdSAqdikK
ICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ2LT5hcmNoLnZnaWMuYXBfbGlzdF9sb2NrLCBm
bGFncyk7CiB9CiAKK3ZvaWQgdmdpY19jbGVhcl9wZW5kaW5nX2lycXMoc3RydWN0IHZjcHUgKnYp
Cit7CisgICAgLyoKKyAgICAgKiBUT0RPOiBJdCBpcyB1bmNsZWFyIHdoZXRoZXIgd2UgcmVhbGx5
IG5lZWQgdGhpcywgc28gd2UgbWlnaHQgaW5zdGVhZAorICAgICAqIHJlbW92ZSBpdCBvbiB0aGUg
Y2FsbGVyIHNpdGUuCisgICAgICovCit9CisKIC8qKgogICogYXJjaF9tb3ZlX2lycXMoKSAtIG1p
Z3JhdGUgdGhlIHBoeXNpY2FsIGFmZmluaXR5IG9mIGhhcmR3YXJlIG1hcHBlZCB2SVJRcwogICog
QHY6ICB0aGUgdkNQVSwgYWxyZWFkeSBhc3NpZ25lZCB0byB0aGUgbmV3IHBDUFUKLS0gCjIuMTQu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
