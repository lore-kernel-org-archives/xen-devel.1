Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A499C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 521BC2133D
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 521BC2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAB-0006CK-Rl; Wed, 10 Apr 2019 14:25:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAA-0006BV-69
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:18 +0000
X-Inumbo-ID: 7696b082-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7696b082-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227670"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:16 +0100
Message-ID: <20190410142408.22848-11-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 10/62] ts-debian-fixup: append noresume
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
Message-ID: <20190410142316.UoMOUOd23UfUNGeVsyvsDQWSwrAHaKIH3_CrFnfDzR4@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNlZSBjb2RlIGNvbW1lbnQgZm9y
IGV4cGxhbmF0aW9uLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0K
djQ6IEZpeCBncmFtbWFyIGVycm9yIGluIGNvbW1lbnQuCi0tLQogdHMtZGViaWFuLWZpeHVwIHwg
MTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS90cy1kZWJpYW4tZml4dXAgYi90cy1kZWJpYW4tZml4dXAKaW5kZXggNDc4ZGMyYWYuLjBl
NTUzZDQ3IDEwMDc1NQotLS0gYS90cy1kZWJpYW4tZml4dXAKKysrIGIvdHMtZGViaWFuLWZpeHVw
CkBAIC0xNzgsNiArMTc4LDE2IEBAIHN1YiBvdGhlcmZpeHVwY2ZnICgpIHsKICAgICAgICAgJGV4
dHJhIC49ICIgaW9tbXU9c29mdCI7CiAgICAgfQogCisgICAgIyBUaGVyZSBtaWdodCBiZSBzdGFs
ZSBlbnRyaWVzIGluIC9ldGMvaW5pdHJhbWZzLXRvb2xzL2NvbmYuZC9yZXN1bWUgd2hpY2gKKyAg
ICAjIGdldCBzdG9yZWQgaW4gdGhlIGluaXRyYW1mcy4gVGhhdCBpbnRyb2R1Y2VzIGRlbGF5IGlu
IGd1ZXN0IGJvb3Rpbmcgd2hpY2gKKyAgICAjIG1pZ2h0IGNhdXNlIHRlc3RzIHRvIGZhaWwuCisg
ICAgIworICAgICMgVGhpcyBpcyBwYXJ0aWN1bGFybHkgcHJvbWluZW50IGluIHN0cmV0Y2ggd2hl
biBpdCB0cmllcyB0byBzY2FuIGZvciB0aGUKKyAgICAjIG5vbmV4aXN0ZW50IGRldmljZShzKSBm
b3IgYSBsb25nIHRpbWUuIFNlZSBhbHNvIERlYmlhbiBidWcgIzc4NDgxMC4KKyAgICAjCisgICAg
IyBBcHBlbmQgbm9yZXN1bWUgdG8gZml4IHRoZSBpc3N1ZS4KKyAgICAkZXh0cmEgLj0gIiBub3Jl
c3VtZSI7CisKICAgICBpZiAoJGNmZyA9fiBtL2V4dHJhXHMqPVxzKlsnIl0oLiopWyciXS8pIHsK
IAkkY2ZnID1+IHMvZXh0cmFccyo9XHMqWyciXSguKilbJyJdL2V4dHJhID0gJyQxICRleHRyYScv
OwogICAgIH0gZWxzZSB7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
