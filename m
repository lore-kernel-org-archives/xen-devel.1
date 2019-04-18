Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4739CC10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2210E2186A
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2210E2186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xR-0002BY-9b; Thu, 18 Apr 2019 16:32:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xP-00028E-Jx
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:15 +0000
X-Inumbo-ID: 85b12970-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 85b12970-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913798"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:54 +0100
Message-ID: <20190418163158.11408-18-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 17/21] starvation: Use "starved" for
 hostalloc_maxwait_max
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
Message-ID: <20190418163154.-YEQGCCtVFPgb12GyVxDKXcrBMLE12_4X0wqkqXUidM@z>

UHJldmlvdXNseSB0aGlzIHdhcyAiYnJva2VuIi4KCldlIG11c3RuJ3QganVzdCBjYWxsIGBicm9r
ZW4nIGluc2lkZSBhdHRlbXB0X2FsbG9jYXRpb24gYmVjYXVzZSB0aGF0CnJ1bnMgaW4gYSBkYiB0
cmFuc2FjdGlvbi4gIEluc3RlYWQsIHdlIGFycmFuZ2UgdGhhdCBhdHRlbXB0X2FsbG9jYXRpb24K
cmV0dXJucyAyLCB3aGljaCB0aHJlYWRzIGl0cyB3YXkgYmFjayBvdXQgdG8gdGhlIHJldHVybiB2
YWx1ZSBmcm9tCmFsbG9jX3Jlc291cmNlcywgYW5kIHRoZW4gY2FsbCBicm9rZW4gdGhlcmUuCgpT
aWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0t
CiB0cy1ob3N0cy1hbGxvY2F0ZS1FeGVjdXRpdmUgfCAxNSArKysrKysrKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZSBiL3RzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2
ZQppbmRleCAzNDI1YzhjZS4uOGM5ZGRhZjcgMTAwNzU1Ci0tLSBhL3RzLWhvc3RzLWFsbG9jYXRl
LUV4ZWN1dGl2ZQorKysgYi90cy1ob3N0cy1hbGxvY2F0ZS1FeGVjdXRpdmUKQEAgLTY4MywxMiAr
NjgzLDE3IEBAIHN1YiBhbGxvY19ob3N0cyAoKSB7CiAgICAgICAgID8gLTEwMDAwCiAgICAgICAg
IDogLTEwICogQGhpZHM7CiAKLSAgICBhbGxvY19yZXNvdXJjZXMoV2FpdFN0YXJ0ID0+CisgICAg
bXkgJG9rID0gYWxsb2NfcmVzb3VyY2VzKFdhaXRTdGFydCA9PgogICAgICAgICAgICAgICAgICAg
ICAoJEVOVntPU1NURVNUX1JFU09VUkNFX1dBSVRTVEFSVH0gfHwgJGZpLT57c3RhcnRlZH0pLAog
ICAgICAgICAgICAgICAgICAgICBXYWl0U3RhcnRBZGp1c3QgPT4gJHdhaXRzdGFydGFkanVzdCwK
IAkJICAgIERlYnVnRmggPT4gXCpERUJVRywKICAgICAgICAgICAgICAgICAgICAgXCZhdHRlbXB0
X2FsbG9jYXRpb24pOwogCisgICAgaWYgKCRvaz09MikgeworCWJyb2tlbiAic3RhcnZlZCBvciB0
aW1lZCBvdXQiLCAnc3RhcnZlZCc7CisgICAgfQorICAgIGRpZSAkb2sgdW5sZXNzICRvaz09MTsK
KwogICAgIGZvcmVhY2ggbXkgJGhpZCAoQGhpZHMpIHsKICAgICAgICAgbXkgJHNlbD0gJGhpZC0+
e1NlbGVjdGVkfTsKICAgICAgICAgZGllICRoaWQtPntJZGVudH0gdW5sZXNzIGRlZmluZWQgJHNl
bC0+e3Jlc25hbWV9OwpAQCAtNzY0LDkgKzc2OSwxMSBAQCBzdWIgYXR0ZW1wdF9hbGxvY2F0aW9u
IHsKIAkgICAgIyAgKiB3ZSBoYXZlIGJlZW4gd2FpdGluZyBhdCBsZWFzdCAkbWF4d2FpdC8yCiAJ
ICAgICMgICogd2UgZXN0aW1hdGUgaXQgd2lsbCB0YWtlIGF0IGxlYXN0ICRtYXh3YWl0IG92ZXJh
bGwKIAkgICAgbXkgJHdhaXRfc29mYXIgPSAkbm93IC0gJGFsbG9jX3N0YXJ0X3RpbWU7Ci0JICAg
IGRpZSAidGltZWQgb3V0OiAkd2FpdF9zb2ZhciwgJGJlc3QtPntTdGFydH0sICRtYXh3YWl0Igot
ICAgICAgICAgICAgICAgIGlmICR3YWl0X3NvZmFyID4gJG1heHdhaXQvMgotCQkmJiAkd2FpdF9z
b2ZhciArICRiZXN0LT57U3RhcnR9ID4gJG1heHdhaXQ7CisJICAgIGlmICgkd2FpdF9zb2ZhciA+
ICRtYXh3YWl0LzIKKwkJJiYgJHdhaXRfc29mYXIgKyAkYmVzdC0+e1N0YXJ0fSA+ICRtYXh3YWl0
KSB7CisJCWxvZ20gInRpbWVkIG91dDogJHdhaXRfc29mYXIsICRiZXN0LT57U3RhcnR9LCAkbWF4
d2FpdCI7CisJCXJldHVybiAyOworCSAgICB9CiAJfQogICAgIH0KIAotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
