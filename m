Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA85C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA5BA2183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA5BA2183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xU-0002HC-2I; Thu, 18 Apr 2019 16:32:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xR-0002C3-E8
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:17 +0000
X-Inumbo-ID: 86a2232e-61f7-11e9-8634-4356937a26ca
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86a2232e-61f7-11e9-8634-4356937a26ca;
 Thu, 18 Apr 2019 16:32:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913807"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:58 +0100
Message-ID: <20190418163158.11408-22-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 21/21] starvation: Better
 logging/debugging output
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418163158.aM4fPoNN3aHIBBsJbp6vg_iljMyjR53DSreL19TeeoQ@z>

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogdHMtaG9zdHMtYWxsb2NhdGUtRXhlY3V0aXZlIHwgMTcgKysrKysrKysrKystLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZSBiL3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1
dGl2ZQppbmRleCBiNzU5MjdjMS4uNjRjNGM5ZjkgMTAwNzU1Ci0tLSBhL3RzLWhvc3RzLWFsbG9j
YXRlLUV4ZWN1dGl2ZQorKysgYi90cy1ob3N0cy1hbGxvY2F0ZS1FeGVjdXRpdmUKQEAgLTc3Nyw4
ICs3NzcsOCBAQCBzdWIgbW9zdF9vcHRpbWlzdGljICgkJCQpIHsKICAgICByZXR1cm4gJG9wdGlt
aXN0LT57R290fTsKIH0KIAotc3ViIHN0YXJ2aW5nICgkKSB7Ci0gICAgbXkgKCRiZXN0X3N0YXJ0
X2FicykgPSBAXzsKK3N1YiBzdGFydmluZyAoJCQpIHsKKyAgICBteSAoJGJlc3Rfc3RhcnRfYWJz
LCAkbm93KSA9IEBfOwogICAgIHJldHVybiAoMCwgJ3J1bnZhciBzYXlzIG5ldmVyIGdpdmUgdXAn
KSB1bmxlc3MgJSRzdGFydmF0aW9uX3A7CiAgICAgcmV0dXJuICgwLCAnbm8gZXN0aW1hdGUnKSB1
bmxlc3MgZGVmaW5lZCAkYmVzdF9zdGFydF9hYnM7CiAgICAgJHN0YXJ2YXRpb25fcS0+ZXhlY3V0
ZSgkZmxpZ2h0KTsKQEAgLTgwMSwxMSArODAxLDE2IEBAIHN1YiBzdGFydmluZyAoJCkgewogICAg
ICMgdG8gb3VyIGV4cGVjdGVkIGZpbmlzaCBpcyBtb3JlIHRoYW4gdGhlIHRvdGFsIHRpbWUgc28K
ICAgICAjIGZhciAoZm9yIHRoZSBjb21wbGV0ZWQgam9icykgYnkgdGhlIG1hcmdpbiBYIGFuZCBJ
CiAgICAgbXkgJFggPSBob3N0YWxsb2Nfc3RhcnZhdGlvbl9jYWxjdWxhdGVfWCgkc3RhcnZhdGlv
bl9wLCAkdywgJGQpOwotICAgIHJldHVybiAoMCwgJ1g9aW5mJykgdW5sZXNzIGRlZmluZWQgJFg7
CisgICAgcmV0dXJuICgwLCAiRD0kZCBXPSR3IFg9aW5mIikgdW5sZXNzIGRlZmluZWQgJFg7CiAg
ICAgbXkgJHRvdGFsX2QgPSAkbWF4ZmluIC0gJGZpLT57c3RhcnRlZH07CiAgICAgbXkgJHByb2pl
Y3RlZF9tZSA9ICRiZXN0X3N0YXJ0X2FicyAtICRmaS0+e3N0YXJ0ZWR9OwotICAgIG15ICRtID0g
IkQ9JGQgVz0kdyBYPSRYIG1heGZpbj0kbWF4ZmluIjsKLSAgICBteSAkYmFkID0gJHByb2plY3Rl
ZF9tZSA+ICRYICogJHRvdGFsX2QgKyAkc3RhcnZhdGlvbl9wLT57SX07CisgICAgbXkgJGxpbSA9
ICRYICogJHRvdGFsX2QgKyAkc3RhcnZhdGlvbl9wLT57SX07CisgICAgbXkgJFhjbXAgPSAoJHBy
b2plY3RlZF9tZSAtICRzdGFydmF0aW9uX3AtPntJfSkgLyAkdG90YWxfZDsKKyAgICBteSAkbSA9
IHNwcmludGYKKwkiRD0lZCBXPSVkIFg9JS4zZiB0X0Q9JXMgdF9tZT0lcyB0X2xpbT0lLjNmIFgn
PSUuNGYgKGZpLnM9JXMpIiwKKwkkZCwgJHcsICRYLCAkdG90YWxfZCwgJHByb2plY3RlZF9tZSwg
JGxpbSwgJFhjbXAsCisJJGZpLT57c3RhcnRlZH0gLSAkbm93OworICAgIG15ICRiYWQgPSAkcHJv
amVjdGVkX21lID4gJGxpbTsKICAgICByZXR1cm4gKCRiYWQsICRtKTsKIH0KIApAQCAtODc2LDcg
Kzg4MSw3IEBAIHN1YiBhdHRlbXB0X2FsbG9jYXRpb24gewogCSAgICB9CiAJfSBlbHNpZiAoJSRz
dGFydmF0aW9uX3ApIHsKIAkgICAgbXkgJGVzdF9hYnMgPSBtb3N0X29wdGltaXN0aWMoJGJlc3Qs
ICRub3csICRzdGFydmF0aW9uX3AtPntJfSk7Ci0JICAgIG15ICgkc3RhcnZpbmcsICRtKSA9IHN0
YXJ2aW5nKCRlc3RfYWJzKTsKKwkgICAgbXkgKCRzdGFydmluZywgJG0pID0gc3RhcnZpbmcoJGVz
dF9hYnMsICRub3cpOwogCSAgICAkc3RhcnZhdGlvbl9xLT5maW5pc2goKTsKIAkgICAgaWYgKCEk
c3RhcnZpbmcpIHsKIAkJcHJpbnQgREVCVUcgIm5vdCBzdGFydmluZzogJG1cbiI7Ci0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
