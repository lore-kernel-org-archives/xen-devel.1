Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBAFC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:43:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311F6217D4
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 311F6217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEXAu-00059C-Rc; Thu, 11 Apr 2019 10:43:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pqov=SN=citrix.com=prvs=997e04109=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hEXAt-000597-MI
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:43:19 +0000
X-Inumbo-ID: 9e14dcf7-5c46-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9e14dcf7-5c46-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 10:43:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,337,1549929600"; d="scan'208";a="83316762"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 11 Apr 2019 11:42:14 +0100
Message-ID: <20190411104214.18828-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] README: add a paragraph for specifying python
 interpreter
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411104214.KROQu_VNHyR8If3jcBwngqTuCVqFGUxDu3pmt7Dw5Lc@z>

SXQgaXMgcmVwb3J0ZWQgaW4gTGludXggRnJvbSBTY3JhdGNoIHRoZXJlIGlzbid0IG5lY2Vzc2Fy
aWx5IGEKYHB5dGhvbmAuICBBZGQgYSBwYXJhZ3JhcGggdG8gdGVsbCB1c2VycyBob3cgdG8gc3Bl
Y2lmeSBhIHBhdGggdG8gYQpweXRob24gaW50ZXJwcmV0ZXIuCgpSZXBvcnRlZC1ieTogS2V2aW4g
QnVja2xleSA8a2V2aW4uYnVja2xleS5lY3MudnV3LmFjLm56QGdtYWlsLmNvbT4KU2lnbmVkLW9m
Zi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNDOiBLZXZpbiBCdWNrbGV5
IDxrZXZpbi5idWNrbGV5LmVjcy52dXcuYWMubnpAZ21haWwuY29tPgotLS0KIFJFQURNRSB8IDYg
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvUkVB
RE1FIGIvUkVBRE1FCmluZGV4IDIzZTRmN2MzZGMuLjQ3NDcxOTJhNjEgMTAwNjQ0Ci0tLSBhL1JF
QURNRQorKysgYi9SRUFETUUKQEAgLTE4MSw2ICsxODEsMTIgQEAgVmFyaW91cyB0b29scywgc3Vj
aCBhcyBweWdydWIsIGhhdmUgdGhlIGZvbGxvd2luZyBydW50aW1lIGRlcGVuZGVuY2llczoKICAg
ICAgICAgICBVUkw6ICAgIGh0dHA6Ly93d3cucHl0aG9uLm9yZy8KICAgICAgICAgICBEZWJpYW46
IHB5dGhvbgogCitOb3RlIHRoYXQgdGhlIGJ1aWxkIHN5c3RlbSBleHBlY3RzIGBweXRob25gIHRv
IGJlIGF2YWlsYWJsZS4gSWYgeW91ciBzeXN0ZW0KK29ubHkgaGFzIGBweXRob24yYCBvciBgcHl0
aG9uM2AgYnV0IG5vdCBgcHl0aG9uYCAoYXMgaW4gTGludXggRnJvbSBTY3JhdGNoKSwKK3lvdSB3
aWxsIG5lZWQgdG8gc3BlY2lmeSBhIHBhdGggdG8gYSBweXRob24gaW50ZXJwcmV0ZXIgd2hlbiBy
dW5uaW5nIGNvbmZpZ3VyZToKKworICAgIFBZVEhPTj0vcGF0aC90by9weXRob24vaW50ZXJwcmV0
ZXIgLi9jb25maWd1cmUKKwogSW50ZWwoUikgVHJ1c3RlZCBFeGVjdXRpb24gVGVjaG5vbG9neSBT
dXBwb3J0CiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIAot
LSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
