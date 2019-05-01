Return-Path: <SRS0=b8XE=TB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32558C43219
	for <xen-devel@archiver.kernel.org>; Wed,  1 May 2019 10:49:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 126CA20835
	for <xen-devel@archiver.kernel.org>; Wed,  1 May 2019 10:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 126CA20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmnI-0005b9-72; Wed, 01 May 2019 10:48:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnG-0005Yx-NM
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:54 +0000
X-Inumbo-ID: b4bffa68-6bfe-11e9-98ed-5f79ff758e18
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4bffa68-6bfe-11e9-98ed-5f79ff758e18;
 Wed, 01 May 2019 10:48:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837305"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:48:35 +0100
Message-ID: <20190501104839.21621-12-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 11/15] cross builds: ts-kernel-build:
 Support cross target armhf
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190501104835.VyPqopyx1QHd6PbnUPqY4URQv-cXCqh_cjm_2_IExPM@z>

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkFj
a2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDQzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLS0KdjI6IERyb3AgSE9TVENDPSBz
ZXR0aW5nCi0tLQogdHMta2VybmVsLWJ1aWxkIHwgMTkgKysrKysrKysrKysrKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90cy1rZXJuZWwtYnVpbGQgYi90cy1rZXJuZWwtYnVpbGQKaW5kZXggNzJjYTk4YTEuLjcxZWRh
NDhkIDEwMDc1NQotLS0gYS90cy1rZXJuZWwtYnVpbGQKKysrIGIvdHMta2VybmVsLWJ1aWxkCkBA
IC0yMSw2ICsyMSw3IEBAIEJFR0lOIHsgdW5zaGlmdCBASU5DLCBxdyguKTsgfQogdXNlIE9zc3Rl
c3Q7CiB1c2UgT3NzdGVzdDo6VGVzdFN1cHBvcnQ7CiB1c2UgT3NzdGVzdDo6QnVpbGRTdXBwb3J0
OwordXNlIENhcnA7CiAKIHRzcmVhZGNvbmZpZygpOwogCkBAIC00OCw5ICs0OSwyNCBAQCBteSAk
cGFybXMgPSAkYXJjaHBhcm1zLT57ICRye2FyY2h9IH07CiAKIHN1YiBlbmFibGVfeGVuX2NvbmZp
ZyAoKTsKIAorb3VyICRhcmNoX2VudnZhcnMgPSAnJzsKKwogc3ViIGNtZCAoJCQpIHsKICAgICBt
eSAoJHRpbWVvdXQsICRzY3JpcHQpID0gQF87Ci0gICAgdGFyZ2V0X2NtZF9idWlsZCgkaG8sICR0
aW1lb3V0LCAkYnVpbGRkaXIsICRzY3JpcHQpOworICAgIHRhcmdldF9jbWRfYnVpbGQoJGhvLCAk
dGltZW91dCwgJGJ1aWxkZGlyLCAkYXJjaF9lbnZ2YXJzLiRzY3JpcHQpOworfQorCitzdWIgY2hl
Y2thcmNoICgpIHsKKyAgICByZXR1cm4gaWYgJHJ7YXJjaH0gZXEgJGhvLT57QXJjaH07CisgICAg
bXkgJGNjID0gJ2djYyc7CisgICAgaWYgKCRye2FyY2h9IGVxICdhcm1oZicpIHsKKwl0YXJnZXRf
aW5zdGFsbF9wYWNrYWdlcygkaG8sICJjcm9zc2J1aWxkLWVzc2VudGlhbC0kcnthcmNofSIpOwor
CSRhcmNoX2VudnZhcnMgPSA8PEVORDsKKyAgICBleHBvcnQgQVJDSD1hcm0gQ1JPU1NfQ09NUElM
RT1hcm0tbGludXgtZ251ZWFiaWhmLQorRU5ECisgICAgfSBlbHNlIHsKKwljb25mZXNzICJ1bmtu
b3duIGNyb3NzIHRhcmdldCAoZ251ICdob3N0JykgJHJ7YXJjaH0iOworICAgIH0KIH0KIAogc3Vi
IGNoZWNrb3V0ICgpIHsKQEAgLTQ1MCw2ICs0NjYsNyBAQCBzdWIgZndpbnN0YWxsICgpIHsKIEVO
RAogfQogCitjaGVja2FyY2goKTsKIGNoZWNrb3V0KCk7CiBjb25maWcoKTsKIGJ1aWxkKCk7Ci0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
