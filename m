Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F72C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29A7020850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29A7020850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAV-0006sD-JU; Wed, 10 Apr 2019 14:25:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAO-0006aU-RI
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:32 +0000
X-Inumbo-ID: 7eeceac3-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7eeceac3-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227711"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:28 +0100
Message-ID: <20190410142408.22848-23-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 22/62] contents_make_cpio: Include
 symlinks
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
Message-ID: <20190410142328.662rodNRs8wKMPnXmcOmdNtp5AV3tgCxVoJeM9inm74@z>

V2UgYXJlIGdvaW5nIHRvIGludHJvZHVjZSBzb21lIHN5bWxpbmtzIGludG8gb25lIG9mIG91ciBw
cmVwcmVwYXJlZApvdmVybGF5cy4gIFdlIG11c3QgdGhlcmVmb3JlIGFycmFuZ2UgdG8gY29weSB0
aGVtIGFzIGFwcHJvcHJpYXRlLgoKVGhlIHN5bnRheCBgLXR5cGUgZixsJyBpcyBhbiBleHRlbnNp
b24gaW4gR05VIGZpbmQuICBJZiB0aGlzIGNhdXNlcwp0cm91YmxlIGluIHRoZSBmdXR1cmUgd2Ug
d2lsbCB0aGVuIGhhdmUgdG8gaW50cm9kdWNlIHRoZSBvYnZpb3VzCmNpcmN1bWxvY3V0aW9uIGlu
dm9sdmluZyAoICkuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVz
dC9UZXN0U3VwcG9ydC5wbSBiL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KaW5kZXggZDM1YTc4NGIu
LjFmMDFhYzZhIDEwMDY0NAotLS0gYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCisrKyBiL09zc3Rl
c3QvVGVzdFN1cHBvcnQucG0KQEAgLTE1MTgsNyArMTUxOCw3IEBAIHN1YiBjb250ZW50c19tYWtl
X2NwaW8gKCQkJCkgewogICAgIGlmICghJGNoaWxkKSB7CiAgICAgICAgIHBvc3Rmb3JrKCk7CiAg
ICAgICAgIGNoZGlyKCRzcmNkaXIpIG9yIGRpZSAkITsKLSAgICAgICAgb3BlbiBTVERJTiwgJ2Zp
bmQgISAtbmFtZSAiKn4iICEgLW5hbWUgIiMqIiAtdHlwZSBmIC1wcmludDAgfCcKKyAgICAgICAg
b3BlbiBTVERJTiwgJ2ZpbmQgISAtbmFtZSAiKn4iICEgLW5hbWUgIiMqIiAtdHlwZSBmLGwgLXBy
aW50MCB8JwogICAgICAgICAgICAgb3IgZGllICQhOwogICAgICAgICBvcGVuIFNURE9VVCwgJz4m
JywgJGZoIG9yIGRpZSAkITsKICAgICAgICAgc3lzdGVtICJjcGlvIC1IJGZvcm1hdCAtbyAtLXF1
aWV0IC0wIC1SIDEwMDA6MTAwMCI7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
