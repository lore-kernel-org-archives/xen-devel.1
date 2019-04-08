Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECA2C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 11:50:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A0C20855
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 11:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7A0C20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDSnP-0005BT-Bz; Mon, 08 Apr 2019 11:50:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PEQb=SK=citrix.com=prvs=994fb90f6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDSnN-0005BM-Oa
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 11:50:37 +0000
X-Inumbo-ID: 847ccb4a-59f4-11e9-bea1-2f8943edb756
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 847ccb4a-59f4-11e9-bea1-2f8943edb756;
 Mon, 08 Apr 2019 11:50:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,325,1549929600"; d="scan'208";a="82992722"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 8 Apr 2019 12:50:31 +0100
Message-ID: <20190408115031.27127-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] gitlab-ci: use git clean -ffdx in build each
 commit test
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408115031.9vNtG0Xwz275GWUlgn5wNn29SYFz9paRMGacAZKtPoY@z>

VGhlIGJ1aWxkIHNjcmlwdCBpbnZva2VkIGlzIGRlc2lnbmVkIHRvIHJ1biBpbiBhIHByaXN0aW5l
IGNoZWNrb3V0LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
LS0tCiBhdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaCB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLWVhY2gtY29tbWl0LnNoIGIvYXV0b21hdGlvbi9n
aXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2gKaW5kZXggMjc1YmM3MTkwMi4uODc5MDI4YjVh
NyAxMDA3NTUKLS0tIGEvYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2gK
KysrIGIvYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2gKQEAgLTE1LDQg
KzE1LDQgQEAgZmkKIGVjaG8gIkJ1aWxkaW5nICR7Q0lfQ09NTUlUX0JFRk9SRV9TSEF9Li4ke0NJ
X0NPTU1JVF9TSEF9IgogCiBOT05fU1lNQk9MSUNfUkVGPTEgLi9hdXRvbWF0aW9uL3NjcmlwdHMv
YnVpbGQtdGVzdC5zaCAke0NJX0NPTU1JVF9CRUZPUkVfU0hBfSAke0NJX0NPTU1JVF9TSEF9IFwK
LSAgICBiYXNoIC1jICJtYWtlIC1qNCBkaXN0Y2xlYW4gJiYgLi9hdXRvbWF0aW9uL3NjcmlwdHMv
YnVpbGQiCisgICAgYmFzaCAtYyAiZ2l0IGNsZWFuIC1mZmR4ICYmIC4vYXV0b21hdGlvbi9zY3Jp
cHRzL2J1aWxkIgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
