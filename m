Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF18FC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:38:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9752C2173C
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9752C2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGnZT-0005Bd-JY; Wed, 17 Apr 2019 16:38:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fEre=ST=citrix.com=prvs=0036fbe7a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hGnZS-0005Ax-0p
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 16:38:02 +0000
X-Inumbo-ID: 29383628-612f-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 29383628-612f-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 16:38:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,362,1549929600"; d="scan'208";a="83816810"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 17 Apr 2019 17:37:51 +0100
Message-ID: <20190417163752.994-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190417163752.994-1-ian.jackson@eu.citrix.com>
References: <20190417163752.994-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 4/5] ts-debian-hvm-install: Disable
 net.ifnames for Debian HVM guests
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
Message-ID: <20190417163751.HgRx4sQHGHFN_ELzI5MnuicXaqS-BnBM82RNVXqlM0E@z>

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogdHMtZGViaWFuLWh2bS1pbnN0YWxsIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RzLWRlYmlhbi1odm0taW5zdGFsbCBiL3RzLWRl
Ymlhbi1odm0taW5zdGFsbAppbmRleCBhMDFjZmIyYi4uNGRlYjQ0M2UgMTAwNzU1Ci0tLSBhL3Rz
LWRlYmlhbi1odm0taW5zdGFsbAorKysgYi90cy1kZWJpYW4taHZtLWluc3RhbGwKQEAgLTEzNSw2
ICsxMzUsMTQgQEAgc3ViIGdjbWRsaW5lICg7JCkgewogCiAgICAgcHVzaCBAZGljbWRsaW5lLCAk
Z2NvbnNvbGU7CiAKKyAgICAjIGh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy93aWtpL1NvZnR3
YXJlL3N5c3RlbWQvUHJlZGljdGFibGVOZXR3b3JrSW50ZXJmYWNlTmFtZXMvCisgICAgIyBJbiBm
YWN0IHRoZXNlIGFyZSBhbnl0aGluZyBidXQgcHJlZGljdGFibGUuICBJbiBEZWJpYW4gaTM4Ngor
ICAgICMgc3RyZXRjaCwgd2UgZW5kIHVwIHVzaW5nIHRoZSBlbXVsYXRlZCBOSUMgaW4gdGhlIGlu
c3RhbGxlciBidXQKKyAgICAjIHRoZSBYZW4gUFYgVklGIGluIHRoZSBpbnN0YWxsZWQgc3lzdGVt
LiAgV2Ugd2FudCB0aGVzZSBib3RoIHRvCisgICAgIyBiZSBldGgwLCB3aGljaCBpcyB3aGF0IGhh
cHBlbnMgaWYgd2UgdHVybiBvZmYgdGhlIG5ldyBzY2hlbWUgYW5kCisgICAgIyB0YWtlIG5vIGZ1
cnRoZXIgc3BlY2lhbCBtZWFzdXJlcy4KKyAgICBwdXNoIEBkaWNtZGxpbmUsICduZXQuaWZuYW1l
cz0wJzsKKwogICAgIHJldHVybiBqb2luKCIgIiwgQGRpY21kbGluZSk7CiB9CiAKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
