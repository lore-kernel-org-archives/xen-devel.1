Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A24BC10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33AA6214AF
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33AA6214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc8o-0004bg-On; Mon, 22 Apr 2019 16:50:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8n-0004WC-M3
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:01 +0000
X-Inumbo-ID: ab50b3de-651e-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ab50b3de-651e-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 16:50:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F252EBD;
 Mon, 22 Apr 2019 09:50:00 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F8B33F557;
 Mon, 22 Apr 2019 09:49:59 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:24 +0100
Message-Id: <20190422164937.21350-8-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 07/20] xen/arm64: head: Remove unnecessary
 comment
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422164924.FnW5zJPH5MTvbu3oo4xn34jJdx_RrGOb5SZnLQbZwSQ@z>

U28gZmFyLCB3ZSBkb24ndCBpbml0IHNwZWNpZmljIGNvcmUgaW5pdGlhbGl6YXRpb24gYXQgYm9v
dC4gU28gcmVtb3ZlCnRoZSBjb21tZW50LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMiAt
LQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXggY2IzMGQ2
ZjIyZS4uYWQ0NDZlNzM0NSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwor
KysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBAIC0zNDQsOCArMzQ0LDYgQEAgZWwyOiAg
ICBQUklOVCgiLSBYZW4gc3RhcnRpbmcgYXQgRUwyIC1cclxuIikKIHNraXBfYnNzOgogICAgICAg
ICBQUklOVCgiLSBTZXR0aW5nIHVwIGNvbnRyb2wgcmVnaXN0ZXJzIC1cclxuIikKIAotICAgICAg
ICAvKiBYWFhYIGNhbGwgUFJPQ0lORk9fY3B1X2luaXQgaGVyZSAqLwotCiAgICAgICAgIC8qIFNl
dCB1cCBtZW1vcnkgYXR0cmlidXRlIHR5cGUgdGFibGVzICovCiAgICAgICAgIGxkciAgIHgwLCA9
TUFJUlZBTAogICAgICAgICBtc3IgICBtYWlyX2VsMiwgeDAKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
