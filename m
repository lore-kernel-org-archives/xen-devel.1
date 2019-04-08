Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E358DC10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 15:17:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEB53214C6
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 15:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEB53214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDW0t-0008Gl-TY; Mon, 08 Apr 2019 15:16:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p7a1=SK=citrix.com=prvs=9940f4835=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hDW0s-0008GV-LT
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 15:16:46 +0000
X-Inumbo-ID: 5205f261-5a11-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5205f261-5a11-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 15:16:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,325,1549929600"; d="scan'208";a="83016892"
From: Paul Durrant <paul.durrant@citrix.com>
To: <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>,
 <xen-devel@lists.xenproject.org>
Date: Mon, 8 Apr 2019 16:16:16 +0100
Message-ID: <20190408151617.13025-3-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb6
In-Reply-To: <20190408151617.13025-1-paul.durrant@citrix.com>
References: <20190408151617.13025-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/3] xen-bus: allow AioContext to be specified
 for each event channel
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBhZGRzIGFuIEFpb0NvbnRleHQgcGFyYW1ldGVyIHRvIHhlbl9kZXZpY2VfYmlu
ZF9ldmVudF9jaGFubmVsKCkKYW5kIHRoZW4gdXNlcyBhaW9fc2V0X2ZkX2hhbmRsZXIoKSB0byBz
ZXQgdGhlIGNhbGxiYWNrIHJhdGhlciB0aGFuCnFlbXVfc2V0X2ZkX2hhbmRsZXIoKS4KClNpZ25l
ZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogQW50aG9ueSBQ
ZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiBTdGVmYW4gSGFqbm9jemkgPHN0
ZWZhbmhhQHJlZGhhdC5jb20+CkNjOiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPgpDYzog
TWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4KLS0tCiBody9ibG9jay9kYXRhcGxhbmUveGVu
LWJsb2NrLmMgfCAgMiArLQogaHcveGVuL3hlbi1idXMuYyAgICAgICAgICAgICAgIHwgMTAgKysr
KysrKy0tLQogaW5jbHVkZS9ody94ZW4veGVuLWJ1cy5oICAgICAgIHwgIDEgKwogMyBmaWxlcyBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcv
YmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jIGIvaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9j
ay5jCmluZGV4IGJiOGYxMTg2ZTQuLjEwNDZmOTY1YzQgMTAwNjQ0Ci0tLSBhL2h3L2Jsb2NrL2Rh
dGFwbGFuZS94ZW4tYmxvY2suYworKysgYi9ody9ibG9jay9kYXRhcGxhbmUveGVuLWJsb2NrLmMK
QEAgLTgwMiw3ICs4MDIsNyBAQCB2b2lkIHhlbl9ibG9ja19kYXRhcGxhbmVfc3RhcnQoWGVuQmxv
Y2tEYXRhUGxhbmUgKmRhdGFwbGFuZSwKICAgICB9CiAKICAgICBkYXRhcGxhbmUtPmV2ZW50X2No
YW5uZWwgPQotICAgICAgICB4ZW5fZGV2aWNlX2JpbmRfZXZlbnRfY2hhbm5lbCh4ZW5kZXYsIGV2
ZW50X2NoYW5uZWwsCisgICAgICAgIHhlbl9kZXZpY2VfYmluZF9ldmVudF9jaGFubmVsKHhlbmRl
diwgZGF0YXBsYW5lLT5jdHgsIGV2ZW50X2NoYW5uZWwsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHhlbl9ibG9ja19kYXRhcGxhbmVfZXZlbnQsIGRhdGFwbGFuZSwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmxvY2FsX2Vycik7CiAgICAgaWYg
KGxvY2FsX2VycikgewpkaWZmIC0tZ2l0IGEvaHcveGVuL3hlbi1idXMuYyBiL2h3L3hlbi94ZW4t
YnVzLmMKaW5kZXggOWUzOTE0OTJhYy4uNGY2MzRkMTI5MSAxMDA2NDQKLS0tIGEvaHcveGVuL3hl
bi1idXMuYworKysgYi9ody94ZW4veGVuLWJ1cy5jCkBAIC05MjQsNiArOTI0LDcgQEAgZG9uZToK
IAogc3RydWN0IFhlbkV2ZW50Q2hhbm5lbCB7CiAgICAgUUxJU1RfRU5UUlkoWGVuRXZlbnRDaGFu
bmVsKSBsaXN0OworICAgIEFpb0NvbnRleHQgKmN0eDsKICAgICB4ZW5ldnRjaG5faGFuZGxlICp4
ZWg7CiAgICAgZXZ0Y2huX3BvcnRfdCBsb2NhbF9wb3J0OwogICAgIFhlbkV2ZW50SGFuZGxlciBo
YW5kbGVyOwpAQCAtOTQzLDYgKzk0NCw3IEBAIHN0YXRpYyB2b2lkIHhlbl9kZXZpY2VfZXZlbnQo
dm9pZCAqb3BhcXVlKQogfQogCiBYZW5FdmVudENoYW5uZWwgKnhlbl9kZXZpY2VfYmluZF9ldmVu
dF9jaGFubmVsKFhlbkRldmljZSAqeGVuZGV2LAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBBaW9Db250ZXh0ICpjdHgsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwb3J0LAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYZW5FdmVudEhhbmRsZXIgaGFu
ZGxlciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9p
ZCAqb3BhcXVlLCBFcnJvciAqKmVycnApCkBAIC05NjgsOCArOTcwLDkgQEAgWGVuRXZlbnRDaGFu
bmVsICp4ZW5fZGV2aWNlX2JpbmRfZXZlbnRfY2hhbm5lbChYZW5EZXZpY2UgKnhlbmRldiwKICAg
ICBjaGFubmVsLT5oYW5kbGVyID0gaGFuZGxlcjsKICAgICBjaGFubmVsLT5vcGFxdWUgPSBvcGFx
dWU7CiAKLSAgICBxZW11X3NldF9mZF9oYW5kbGVyKHhlbmV2dGNobl9mZChjaGFubmVsLT54ZWgp
LCB4ZW5fZGV2aWNlX2V2ZW50LCBOVUxMLAotICAgICAgICAgICAgICAgICAgICAgICAgY2hhbm5l
bCk7CisgICAgY2hhbm5lbC0+Y3R4ID0gY3R4OworICAgIGFpb19zZXRfZmRfaGFuZGxlcihjaGFu
bmVsLT5jdHgsIHhlbmV2dGNobl9mZChjaGFubmVsLT54ZWgpLCBmYWxzZSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgeGVuX2RldmljZV9ldmVudCwgTlVMTCwgTlVMTCwgY2hhbm5lbCk7CiAKICAg
ICBRTElTVF9JTlNFUlRfSEVBRCgmeGVuZGV2LT5ldmVudF9jaGFubmVscywgY2hhbm5lbCwgbGlz
dCk7CiAKQEAgLTEwMTAsNyArMTAxMyw4IEBAIHZvaWQgeGVuX2RldmljZV91bmJpbmRfZXZlbnRf
Y2hhbm5lbChYZW5EZXZpY2UgKnhlbmRldiwKIAogICAgIFFMSVNUX1JFTU9WRShjaGFubmVsLCBs
aXN0KTsKIAotICAgIHFlbXVfc2V0X2ZkX2hhbmRsZXIoeGVuZXZ0Y2huX2ZkKGNoYW5uZWwtPnhl
aCksIE5VTEwsIE5VTEwsIE5VTEwpOworICAgIGFpb19zZXRfZmRfaGFuZGxlcihjaGFubmVsLT5j
dHgsIHhlbmV2dGNobl9mZChjaGFubmVsLT54ZWgpLCBmYWxzZSwKKyAgICAgICAgICAgICAgICAg
ICAgICAgTlVMTCwgTlVMTCwgTlVMTCwgTlVMTCk7CiAKICAgICBpZiAoeGVuZXZ0Y2huX3VuYmlu
ZChjaGFubmVsLT54ZWgsIGNoYW5uZWwtPmxvY2FsX3BvcnQpIDwgMCkgewogICAgICAgICBlcnJv
cl9zZXRnX2Vycm5vKGVycnAsIGVycm5vLCAieGVuZXZ0Y2huX3VuYmluZCBmYWlsZWQiKTsKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvaHcveGVuL3hlbi1idXMuaCBiL2luY2x1ZGUvaHcveGVuL3hlbi1i
dXMuaAppbmRleCAzMzE1ZjBkZTIwLi44MTgzYjk4YzdkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3
L3hlbi94ZW4tYnVzLmgKKysrIGIvaW5jbHVkZS9ody94ZW4veGVuLWJ1cy5oCkBAIC0xMjIsNiAr
MTIyLDcgQEAgdm9pZCB4ZW5fZGV2aWNlX2NvcHlfZ3JhbnRfcmVmcyhYZW5EZXZpY2UgKnhlbmRl
diwgYm9vbCB0b19kb21haW4sCiB0eXBlZGVmIHZvaWQgKCpYZW5FdmVudEhhbmRsZXIpKHZvaWQg
Km9wYXF1ZSk7CiAKIFhlbkV2ZW50Q2hhbm5lbCAqeGVuX2RldmljZV9iaW5kX2V2ZW50X2NoYW5u
ZWwoWGVuRGV2aWNlICp4ZW5kZXYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEFpb0NvbnRleHQgKmN0eCwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHBvcnQsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhlbkV2ZW50SGFuZGxlciBoYW5kbGVyLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpvcGFx
dWUsIEVycm9yICoqZXJycCk7Ci0tIAoyLjIwLjEuMi5nYjIxZWJiNgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
