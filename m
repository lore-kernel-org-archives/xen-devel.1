Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F271DC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C913520850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C913520850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAI-0006N6-Bi; Wed, 10 Apr 2019 14:25:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAF-0006Hu-MD
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:23 +0000
X-Inumbo-ID: 795ca628-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 795ca628-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227692"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:29 +0100
Message-ID: <20190410142408.22848-24-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 23/62] contents_make_cpio: Make files
 owned by root
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
Message-ID: <20190410142329.luTHxqNze_1DaHtQtRlwQMhhT4geENgIyb2uC0ukmLI@z>

VGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgdG8gZ2VuZXJhdGUgb3ZlcmxheXMgZm9yIHVzZSwgbWFp
bmx5LCBieSB0aGUKaW5pdHJhbWZzLgoKV2UgYXJlIGdvaW5nIHRvIHVzZSBpdCB0byBzaGlwIHVk
ZXYgcnVsZXMuICBBbm5veWluZ2x5LCB1ZGV2IGhhdGVzCmZpbGVzIHdoaWNoIGFyZW4ndCBvd25l
ZCBieSByb290IC0gaXQgc2ltcGx5IGlnbm9yZXMgdGhlbS4KClNpZ25lZC1vZmYtYnk6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBv
cnQucG0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIvT3NzdGVzdC9UZXN0U3Vw
cG9ydC5wbQppbmRleCAxZjAxYWM2YS4uNDFmNmY1ZjggMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvVGVz
dFN1cHBvcnQucG0KKysrIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQpAQCAtMTUyMSw3ICsxNTIx
LDcgQEAgc3ViIGNvbnRlbnRzX21ha2VfY3BpbyAoJCQkKSB7CiAgICAgICAgIG9wZW4gU1RESU4s
ICdmaW5kICEgLW5hbWUgIip+IiAhIC1uYW1lICIjKiIgLXR5cGUgZixsIC1wcmludDAgfCcKICAg
ICAgICAgICAgIG9yIGRpZSAkITsKICAgICAgICAgb3BlbiBTVERPVVQsICc+JicsICRmaCBvciBk
aWUgJCE7Ci0gICAgICAgIHN5c3RlbSAiY3BpbyAtSCRmb3JtYXQgLW8gLS1xdWlldCAtMCAtUiAx
MDAwOjEwMDAiOworICAgICAgICBzeXN0ZW0gImNwaW8gLUgkZm9ybWF0IC1vIC0tcXVpZXQgLTAg
LVIgMDowIjsKICAgICAgICAgJD8gYW5kIGRpZSAkPzsKICAgICAgICAgJCE9MDsgY2xvc2UgU1RE
SU47IGRpZSAiJCEgJD8iIGlmICQhIG9yICQ/OwogICAgICAgICBleGl0IDA7Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
