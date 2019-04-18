Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142B3C10F14
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E27BD2183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E27BD2183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xP-00029C-Q1; Thu, 18 Apr 2019 16:32:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xN-000268-UX
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:13 +0000
X-Inumbo-ID: 843157fe-61f7-11e9-a093-d366d8b4972d
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 843157fe-61f7-11e9-a093-d366d8b4972d;
 Thu, 18 Apr 2019 16:32:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913789"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:57 +0100
Message-ID: <20190418163158.11408-21-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 20/21] hostalloc_maxwait_max: Use
 starvation most_optimistic
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
Message-ID: <20190418163157.CWiW32hiCqnQNaOka62dBzlqjU3xq0tU5wMnR-HQq8Q@z>

Tm93IHRoYXQgd2UgaGF2ZSBhIG1vcmUgc29waGlzdGljYXRlZCBlc3RpbWF0ZSBvZiBvdXIgbGlr
ZWx5IHNjaGVkdWxlZAp0aW1lLCB1c2UgaXQgaGVyZSB0b28uCgpTaWduZWQtb2ZmLWJ5OiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1ob3N0cy1hbGxvY2F0
ZS1FeGVjdXRpdmUgfCAxMyArKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3RzLWFsbG9jYXRlLUV4
ZWN1dGl2ZSBiL3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZQppbmRleCA3ZWEzYzRhZi4uYjc1
OTI3YzEgMTAwNzU1Ci0tLSBhL3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZQorKysgYi90cy1o
b3N0cy1hbGxvY2F0ZS1FeGVjdXRpdmUKQEAgLTg2NSwxMCArODY1LDE1IEBAIHN1YiBhdHRlbXB0
X2FsbG9jYXRpb24gewogCSAgICAjIFdlIHF1aXQgaWY6CiAJICAgICMgICogd2UgaGF2ZSBiZWVu
IHdhaXRpbmcgYXQgbGVhc3QgJG1heHdhaXQvMgogCSAgICAjICAqIHdlIGVzdGltYXRlIGl0IHdp
bGwgdGFrZSBhdCBsZWFzdCAkbWF4d2FpdCBvdmVyYWxsCi0JICAgIG15ICR3YWl0X3NvZmFyID0g
JG5vdyAtICRhbGxvY19zdGFydF90aW1lOwotCSAgICBpZiAoJHdhaXRfc29mYXIgPiAkbWF4d2Fp
dC8yCi0JCSYmICR3YWl0X3NvZmFyICsgJGJlc3QtPntTdGFydH0gPiAkbWF4d2FpdCkgewotCQls
b2dtICJ0aW1lZCBvdXQ6ICR3YWl0X3NvZmFyLCAkYmVzdC0+e1N0YXJ0fSwgJG1heHdhaXQiOwor
CSAgICBteSAkZXN0X2FicyA9IG1vc3Rfb3B0aW1pc3RpYygkYmVzdCwgJG5vdywgJG1heHdhaXQv
Mik7CisJICAgIGlmIChkZWZpbmVkICRlc3RfYWJzKSB7CisJCW15ICR3YWl0X3NvZmFyID0gJG5v
dyAtICRhbGxvY19zdGFydF90aW1lOworCQlteSAkd2FpdF9leHAgPSAkZXN0X2FicyAtICRhbGxv
Y19zdGFydF90aW1lOworCQlpZiAoJHdhaXRfZXhwID4gJG1heHdhaXQpIHsKKwkJICAgIGxvZ20g
InRpbWVkIG91dDogJHdhaXRfZXhwID4gJG1heHdhaXQgKCR3YWl0X3NvZmFyKSIsCisJCSAgICBy
ZXR1cm4gMjsKKwkJfQorCSAgICB9CiAJfSBlbHNpZiAoJSRzdGFydmF0aW9uX3ApIHsKIAkgICAg
bXkgJGVzdF9hYnMgPSBtb3N0X29wdGltaXN0aWMoJGJlc3QsICRub3csICRzdGFydmF0aW9uX3At
PntJfSk7CiAJICAgIG15ICgkc3RhcnZpbmcsICRtKSA9IHN0YXJ2aW5nKCRlc3RfYWJzKTsKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
