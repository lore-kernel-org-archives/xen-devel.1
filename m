Return-Path: <SRS0=1L59=T6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219B4C072B1
	for <xen-devel@archiver.kernel.org>; Thu, 30 May 2019 06:59:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F7A247CD
	for <xen-devel@archiver.kernel.org>; Thu, 30 May 2019 06:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F7A247CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxnavi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWF1a-0001xA-T5; Thu, 30 May 2019 06:58:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8x6=T6=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hWDx1-0005jL-Gz
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 05:50:07 +0000
X-Inumbo-ID: c217aa42-829e-11e9-afa5-075699f3fbd5
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c217aa42-829e-11e9-afa5-075699f3fbd5;
 Thu, 30 May 2019 05:50:00 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Thu, 30 May 2019 13:47:43 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 30 May 2019 13:47:24 +0800
Message-ID: <1559195244-7692-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
X-Mailman-Approved-At: Thu, 30 May 2019 06:58:53 +0000
Subject: [Xen-devel] [PATCH] xen: 'keyhandler' is not used in null scheduler
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
Cc: Baodong Chen <chenbaodong@mxnavi.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190530054724.w29ehhuKElw1svy8hTXNv3kkCg-uHI3vl9qn_l80qRs@z>

U28gcmVtb3ZlICdrZXloYW5kbGVyLmgnIGluY2x1ZGUuCkFsc28gYWRkICdzdGF0aWMnIHByZWZp
eCBmb3IgJ3NjaHVkX2J1bGxfZGVmJwoKU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVu
YmFvZG9uZ0BteG5hdmkuY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWRfbnVsbC5jIHwgMyArLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL3NjaGVkX251bGwuYyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCmlu
ZGV4IGE1OWRiYjIuLmM5NzAwZjEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfbnVsbC5j
CisrKyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCkBAIC0zMSw3ICszMSw2IEBACiAjaW5jbHVk
ZSA8eGVuL3NjaGVkLmg+CiAjaW5jbHVkZSA8eGVuL3NjaGVkLWlmLmg+CiAjaW5jbHVkZSA8eGVu
L3NvZnRpcnEuaD4KLSNpbmNsdWRlIDx4ZW4va2V5aGFuZGxlci5oPgogI2luY2x1ZGUgPHhlbi90
cmFjZS5oPgogCiAvKgpAQCAtODcxLDcgKzg3MCw3IEBAIHN0YXRpYyB2b2lkIG51bGxfZHVtcChj
b25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMpCiAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgm
cHJ2LT5sb2NrLCBmbGFncyk7CiB9CiAKLWNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgc2NoZWRfbnVs
bF9kZWYgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IHNjaGVkdWxlciBzY2hlZF9udWxsX2RlZiA9
IHsKICAgICAubmFtZSAgICAgICAgICAgPSAibnVsbCBTY2hlZHVsZXIiLAogICAgIC5vcHRfbmFt
ZSAgICAgICA9ICJudWxsIiwKICAgICAuc2NoZWRfaWQgICAgICAgPSBYRU5fU0NIRURVTEVSX05V
TEwsCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
