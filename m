Return-Path: <SRS0=JVlm=TD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2528FC004C9
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 17:00:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F33B1206C3
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 17:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F33B1206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbXd-00081w-6W; Fri, 03 May 2019 17:00:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lZ0l=TD=citrix.com=prvs=019b86d19=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMbXc-00081Z-8q
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:00:08 +0000
X-Inumbo-ID: e6fdcf77-6dc4-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e6fdcf77-6dc4-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 17:00:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="85085338"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 3 May 2019 17:59:52 +0100
Message-ID: <20190503165957.5960-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
References: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 06/11] mg-repro-setup: Move logging
 setup to later
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190503165952.BsX4ctcgEn6YFmwA9vwQTGvREaeqMuWN-oR4Dr4Cf70@z>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBtZy1yZXByby1zZXR1cCB8IDE0ICsrKysrKystLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL21nLXJlcHJvLXNldHVwIGIvbWctcmVwcm8tc2V0dXAKaW5kZXggMTBhYjY1YTgu
LmI0MWJmNDc4IDEwMDc1NQotLS0gYS9tZy1yZXByby1zZXR1cAorKysgYi9tZy1yZXByby1zZXR1
cApAQCAtMTE1LDYgKzExNSwxMyBAQCBjb21wdXRlX2FkanVzdHMgKCkgewogfQogY29tcHV0ZV9h
ZGp1c3RzICIke2FkanVzdHNldHNbQF19IgogCitwcm9ncmVzc2YgKCkgeyBwcmludGYgPiYyICIk
QCI7IH0KK3Byb2dyZXNzICgpIHsgcHJvZ3Jlc3NmICIlc1xuIiAiJDEiOyB9CisKK3Byb2dyZXNz
ICJsb2dnaW5nIHRvICRsb2dmaWxlIgorc2F2ZWxvZyAiJGxvZ2ZpbGUiCitleGVjIDM+IiRsb2dm
aWxlIgorCiB3aGlsZSBbICQjIC1uZSAwIF07IGRvCiAJYXJnPSQxOyBzaGlmdAogCkBAIC0xNjAs
MTMgKzE2Nyw2IEBAIHdoaWxlIFsgJCMgLW5lIDAgXTsgZG8KIAllc2FjCiBkb25lCiAKLXByb2dy
ZXNzZiAoKSB7IHByaW50ZiA+JjIgIiRAIjsgfQotcHJvZ3Jlc3MgKCkgeyBwcm9ncmVzc2YgIiVz
XG4iICIkMSI7IH0KLQotcHJvZ3Jlc3MgImxvZ2dpbmcgdG8gJGxvZ2ZpbGUiCi1zYXZlbG9nICIk
bG9nZmlsZSIKLWV4ZWMgMz4iJGxvZ2ZpbGUiCi0KIE9TU1RFU1RfVEFTSz0kKHBlcmwgLWUgJwog
CXVzZSBPc3N0ZXN0OwogCXVzZSBPc3N0ZXN0OjpFeGVjdXRpdmU7Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
