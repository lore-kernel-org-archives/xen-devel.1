Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B485FC282CE
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CA6020854
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CA6020854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAn-0007aC-40; Wed, 10 Apr 2019 14:25:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAY-0006yI-8v
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:42 +0000
X-Inumbo-ID: 848960e9-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 848960e9-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227733"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:56 +0100
Message-ID: <20190410142408.22848-51-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 50/62] dm restrict audit: actually
 install fishdescriptor in host
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
Message-ID: <20190410142356.AKRkDf3okl-QK2Qm8gwHd1MuPexl54Y13pMduY_53xo@z>

SW4KICBkbSByZXN0cmljdCBhdWRpdDogaW5zdGFsbCBuZXdlciBjaGlhcmstc2NyaXB0cyBmb3Ig
ZmlzaGRlc2NyaXB0b3IKYXJyYW5nZW1lbnRzIHdlcmUgbWFkZSB0byBpbnN0YWxsIGEgYmFja3Bv
cnQgb2YgY2hpYXJrLXNjcmlwdHMKYnV0IHRoZSBjb2RlIHdhcyBtaXN0YWtlbmx5IHBsYWNlZCBp
biBwcmVzZWVkX2NyZWF0ZV9ndWVzdCBidXQKb2YgY291cnNlIGl0J3MgbmVlZGVkIGluIHRoZSBo
b3N0LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Ci0tLQogT3NzdGVzdC9EZWJpYW4ucG0gfCAxMSArKysrKystLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0
L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IDI1YmY4ZTg4Li44ZDUzYmJlMSAx
MDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAg
LTEwMjIsNiArMTAyMiwxMiBAQCBFTkQKICAgICAjIHNlY3VyaXR5LmQubyBDRE4gc2VlbXMgdW5y
ZWxpYWJsZSByaWdodCBub3cKICAgICAjIGFuZCBqZXNzaWUtdXBkYXRlcyBpcyBubyBtb3JlCiAK
KyAgICBpZiAoZ3JlcCB7IG0vX2RtcmVzdHJpY3QkLyAmJiAkcnskX30gfSBrZXlzICVyIGFuZAor
CSRzdWl0ZSA9fiBtL3N0cmV0Y2gvKSB7CisJcHJlc2VlZF9iYWNrcG9ydHNfcGFja2FnZXMoJGhv
LCAkc2Z4LCBcJXhvcHRzLCAkc3VpdGUsCisJCQkJICAgcXcoY2hpYXJrLXNjcmlwdHMpKTsKKyAg
ICB9CisKICAgICAkcHJlc2VlZCAuPSA8PCJFTkQiOwogCiAjIyMgRU5EIE9GIERFQklBTiBQUkVT
RUVEIEJBU0UKQEAgLTEwNTcsMTEgKzEwNjMsNiBAQCBzdWIgcHJlc2VlZF9jcmVhdGVfZ3Vlc3Qg
KCQkJDtAKSB7CiAgICAgICAgICAgICAkZXh0cmFfcGFja2FnZXMgPSAicHYtZ3J1Yi1tZW51IjsK
ICAgICAgICAgfQogICAgIH0KLSAgICBpZiAoZ3JlcCB7IG0vX2RtcmVzdHJpY3QkLyAmJiAkcnsk
X30gfSBrZXlzICVyIGFuZAotCSRzdWl0ZSA9fiBtL3N0cmV0Y2gvKSB7Ci0JcHJlc2VlZF9iYWNr
cG9ydHNfcGFja2FnZXMoJGhvLCAkc2Z4LCBcJXhvcHRzLCAkc3VpdGUsCi0JCQkJICAgcXcoY2hp
YXJrLXNjcmlwdHMpKTsKLSAgICB9CiAKICAgICBteSAkcHJlc2VlZF9maWxlPSBwcmVzZWVkX2Jh
c2UoJGhvLCAkc2Z4LCAkZXh0cmFfcGFja2FnZXMsICV4b3B0cyk7CiAgICAgJHByZXNlZWRfZmls
ZS49ICg8PEVORCk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
