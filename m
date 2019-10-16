Return-Path: <SRS0=bbgy=YJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B69EFA3728
	for <xen-devel@archiver.kernel.org>; Wed, 16 Oct 2019 11:13:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF5620854
	for <xen-devel@archiver.kernel.org>; Wed, 16 Oct 2019 11:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EF5620854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKhEj-0004WE-7E; Wed, 16 Oct 2019 11:13:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GHfa=YJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKhEi-0004Vh-GA
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 11:13:00 +0000
X-Inumbo-ID: e7f3be20-f005-11e9-beca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e7f3be20-f005-11e9-beca-bc764e2007e4;
 Wed, 16 Oct 2019 11:12:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D5EC1570;
 Wed, 16 Oct 2019 04:12:56 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CCB43F6C4;
 Wed, 16 Oct 2019 04:12:55 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 16 Oct 2019 12:12:51 +0100
Message-Id: <20191016111251.29214-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13] xen/arm: setup: Calculate correctly
 the size of Xen
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
Cc: jgross@suse.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGN1cnJlbnQgc2l6ZSBvZiBYZW4gaXMgY29tcHV0ZWQgdXNpbmcgX2VuZCAtIF9zdGFydCAr
IDEuIEhvd2V2ZXIsCl9lbmQgaXMgcG9pbnRpbmcgb25lIHBhc3QgdGhlIGVuZCBvZiBYZW4sIHNv
IHRoZSBzaXplIG9mIFhlbiBpcwpvZmYtYnktb25lLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKaW5kZXgg
NzA1YTkxN2FiZi4uNTFkMzIxMDZiNyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMK
KysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKQEAgLTgxOSw3ICs4MTksNyBAQCB2b2lkIF9faW5p
dCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAogICAgIC8qIFJlZ2lz
dGVyIFhlbidzIGxvYWQgYWRkcmVzcyBhcyBhIGJvb3QgbW9kdWxlLiAqLwogICAgIHhlbl9ib290
bW9kdWxlID0gYWRkX2Jvb3RfbW9kdWxlKEJPT1RNT0RfWEVOLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAocGFkZHJfdCkodWludHB0cl90KShfc3RhcnQgKyBib290X3BoeXNfb2Zmc2V0
KSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHBhZGRyX3QpKHVpbnRwdHJfdCkoX2Vu
ZCAtIF9zdGFydCArIDEpLCBmYWxzZSk7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChw
YWRkcl90KSh1aW50cHRyX3QpKF9lbmQgLSBfc3RhcnQpLCBmYWxzZSk7CiAgICAgQlVHX09OKCF4
ZW5fYm9vdG1vZHVsZSk7CiAKICAgICBmZHRfc2l6ZSA9IGJvb3RfZmR0X2luZm8oZGV2aWNlX3Ry
ZWVfZmxhdHRlbmVkLCBmZHRfcGFkZHIpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
