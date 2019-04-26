Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0396DC43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2BC420693
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2BC420693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK3ut-0008ID-Q0; Fri, 26 Apr 2019 16:41:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3us-0008GY-NE
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:38 +0000
X-Inumbo-ID: 26c24244-6842-11e9-a407-8beefea5a8fc
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26c24244-6842-11e9-a407-8beefea5a8fc;
 Fri, 26 Apr 2019 16:41:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,398,1549929600"; d="scan'208";a="84519740"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 26 Apr 2019 17:39:58 +0100
Message-ID: <20190426164002.22381-12-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 11/15] cross builds: ts-kernel-build:
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426163958.Bof1BCVI09t95_GETPmcM-QuE2o4ig3Fx7ULBjUR-f0@z>

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkND
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDQzogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLS0KIHRzLWtlcm5lbC1idWlsZCB8IDE5ICsr
KysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdHMta2VybmVsLWJ1aWxkIGIvdHMta2VybmVsLWJ1aWxk
CmluZGV4IDcyY2E5OGExLi4yOWM2YzQzZCAxMDA3NTUKLS0tIGEvdHMta2VybmVsLWJ1aWxkCisr
KyBiL3RzLWtlcm5lbC1idWlsZApAQCAtMjEsNiArMjEsNyBAQCBCRUdJTiB7IHVuc2hpZnQgQElO
QywgcXcoLik7IH0KIHVzZSBPc3N0ZXN0OwogdXNlIE9zc3Rlc3Q6OlRlc3RTdXBwb3J0OwogdXNl
IE9zc3Rlc3Q6OkJ1aWxkU3VwcG9ydDsKK3VzZSBDYXJwOwogCiB0c3JlYWRjb25maWcoKTsKIApA
QCAtNDgsOSArNDksMjQgQEAgbXkgJHBhcm1zID0gJGFyY2hwYXJtcy0+eyAkcnthcmNofSB9Owog
CiBzdWIgZW5hYmxlX3hlbl9jb25maWcgKCk7CiAKK291ciAkYXJjaF9lbnZ2YXJzID0gJyc7CisK
IHN1YiBjbWQgKCQkKSB7CiAgICAgbXkgKCR0aW1lb3V0LCAkc2NyaXB0KSA9IEBfOwotICAgIHRh
cmdldF9jbWRfYnVpbGQoJGhvLCAkdGltZW91dCwgJGJ1aWxkZGlyLCAkc2NyaXB0KTsKKyAgICB0
YXJnZXRfY21kX2J1aWxkKCRobywgJHRpbWVvdXQsICRidWlsZGRpciwgJGFyY2hfZW52dmFycy4k
c2NyaXB0KTsKK30KKworc3ViIGNoZWNrYXJjaCAoKSB7CisgICAgcmV0dXJuIGlmICRye2FyY2h9
IGVxICRoby0+e0FyY2h9OworICAgIG15ICRjYyA9ICdnY2MnOworICAgIGlmICgkcnthcmNofSBl
cSAnYXJtaGYnKSB7CisJdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhvLCAiY3Jvc3NidWlsZC1l
c3NlbnRpYWwtJHJ7YXJjaH0iKTsKKwkkYXJjaF9lbnZ2YXJzID0gPDxFTkQ7CisgICAgZXhwb3J0
IEFSQ0g9YXJtIEhPU1RDQz0kY2MgQ1JPU1NfQ09NUElMRT1hcm0tbGludXgtZ251ZWFiaWhmLQor
RU5ECisgICAgfSBlbHNlIHsKKwljb25mZXNzICJ1bmtub3duIGNyb3NzIHRhcmdldCAoZ251ICdo
b3N0JykgJHJ7YXJjaH0iOworICAgIH0KIH0KIAogc3ViIGNoZWNrb3V0ICgpIHsKQEAgLTQ1MCw2
ICs0NjYsNyBAQCBzdWIgZndpbnN0YWxsICgpIHsKIEVORAogfQogCitjaGVja2FyY2goKTsKIGNo
ZWNrb3V0KCk7CiBjb25maWcoKTsKIGJ1aWxkKCk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
