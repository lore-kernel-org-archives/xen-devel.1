Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07237C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:30:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D137E20850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D137E20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEF4-0004ka-Uo; Wed, 10 Apr 2019 14:30:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEF3-0004k6-DG
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:30:21 +0000
X-Inumbo-ID: 782a45c4-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 782a45c4-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227683"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:10 +0100
Message-ID: <20190410142408.22848-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 04/62] ts-xen-build-prep: install
 packages for suites >jessie
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
Cc: Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142310.WXJqBCqFJwSRjfu783KIXUIAt1b8EQdS3-9ta_Rq_rM@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZSBzdHViZG9tIGJ1aWxkIG5l
ZWRzIHRleGluZm8uClRoZSBsaWJ2aXJ0IGJ1aWxkIG5lZWRzIGF1dG9wb2ludC4KVGhlIFFFTVUg
YnVpbGQgbmVlZHMgbGlicGNpYWNjZXNzLWRldi4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+CkFja2VkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+Ci0tLQogdHMteGVuLWJ1aWxkLXByZXAgfCA0ICsrKysKIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90cy14ZW4tYnVpbGQtcHJlcCBi
L3RzLXhlbi1idWlsZC1wcmVwCmluZGV4IGExNWFiM2RmLi5jYTU3MzVhMSAxMDA3NTUKLS0tIGEv
dHMteGVuLWJ1aWxkLXByZXAKKysrIGIvdHMteGVuLWJ1aWxkLXByZXAKQEAgLTIyMiw2ICsyMjIs
MTAgQEAgc3ViIHByZXAgKCkgewogCSMgamVzc2llICg+amVzc2llPykKIAlwdXNoKEBwYWNrYWdl
cywgImxpYm5sLXJvdXRlLTMtZGV2Iik7CiAgICAgfQorICAgIGlmICgkaG8tPntTdWl0ZX0gIX4g
bS9zcXVlZXplfHdoZWV6eXxqZXNzaWUvKSB7CisgICAgICAgIHB1c2goQHBhY2thZ2VzLCBxdyh0
ZXhpbmZvIGF1dG9wb2ludCBsaWJwY2lhY2Nlc3MtZGV2KSk7CisgICAgfQorCiAgICAgdGFyZ2V0
X2luc3RhbGxfcGFja2FnZXMoJGhvLCBAcGFja2FnZXMpOwogICAgIHRhcmdldF9jbWRfcm9vdCgk
aG8sICJjaG1vZCAtUiBhK3IgL3Vzci9zaGFyZS9naXQtY29yZS90ZW1wbGF0ZXMiKTsKICAgICAj
IHdvcmthcm91bmQgZm9yIERlYmlhbiAjNTk1NzI4Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
