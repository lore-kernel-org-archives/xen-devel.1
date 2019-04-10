Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5ADC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:27:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0CCA20830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0CCA20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEC7-00023s-7h; Wed, 10 Apr 2019 14:27:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEC5-00020w-JB
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:27:17 +0000
X-Inumbo-ID: 7e96180c-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7e96180c-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227710"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:42 +0100
Message-ID: <20190410142408.22848-37-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 36/62] TestSupport: target_somefile_leaf
 rename and change a variable
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
Message-ID: <20190410142342._ChBBzZnJpkB59HodX2A4h-J0HJo14UgWnz-qZfJIAY@z>

UmVuYW1lIHRoaXMgZnVuY3Rpb24uICBgZ2V0bGVhZicgY29udGFpbnMgYGdldCcgd2hpY2ggbWFr
ZXMgaXQgc291bmQKbGlrZSB0aGUgZnVuY3Rpb24gY29waWVzIHNvbWV0aGluZywgb3IgcmV0dXJu
cyBhbnN3ZXJzIHN1aXRhYmxlIGZvcgpnZXR0aW5nLCBvciBzb21ldGhpbmcuCgpBbHNvIHJlbmFt
ZSBgJHJkZXN0JyB0byBgJHJmaWxlJyBzaW5jZSBpdCBtaWdodCBiZSBhIHNvdXJjZSB0b28uCihB
bHRob3VnaCB3ZSBhcmUgbm90IGFib3V0IHRvIG1ha2UgaXQgYSBzb3VyY2UuLi4pCgpTaWduZWQt
b2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0
ZXN0L1Rlc3RTdXBwb3J0LnBtIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rlc3RTdXBw
b3J0LnBtIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQppbmRleCA0ZTJmMTIwYS4uYTU4NzBlNGQg
MTAwNjQ0Ci0tLSBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KKysrIGIvT3NzdGVzdC9UZXN0U3Vw
cG9ydC5wbQpAQCAtNTA0LDEwICs1MDQsMTAgQEAgc3ViIHJlbW90ZV9wZXJsX3NjcmlwdF9kb25l
ICgkKSB7CiAgICAgISQ/IG9yIGRpZSAiJHRoaW5nLT57V2hhdH0gJD8iOwogfQogCi1zdWIgdGFy
Z2V0X3NvbWVmaWxlX2dldGxlYWYgKCQkJCkgewotICAgIG15ICgkbGxlYWZfcmVmLCAkcmRlc3Qs
ICRobykgPSBAXzsKK3N1YiB0YXJnZXRfc29tZWZpbGVfbGVhZiAoJCQkKSB7CisgICAgbXkgKCRs
bGVhZl9yZWYsICRyZmlsZSwgJGhvKSA9IEBfOwogICAgIGlmICghZGVmaW5lZCAkJGxsZWFmX3Jl
ZikgewotICAgICAgICAkJGxsZWFmX3JlZj0gJHJkZXN0OworICAgICAgICAkJGxsZWFmX3JlZj0g
JHJmaWxlOwogICAgICAgICAkJGxsZWFmX3JlZiA9fiBzLC4qLywsOwogICAgIH0KICAgICAkJGxs
ZWFmX3JlZj0gaG9zdG5hbWVwYXRoKCRobykuIi0tJCRsbGVhZl9yZWYiOwpAQCAtNjAyLDcgKzYw
Miw3IEBAIHN1YiB0YXJnZXRfaW5zdGFsbF9wYWNrYWdlc19ub3JlYyAoJEApIHsKIAogc3ViIHRw
ZmNzX2NvcmUgewogICAgIG15ICgkdHB1dGZpbGVmLCRobywkdGltZW91dCwkZmlsZWRhdGEsICRy
ZGVzdCwkbGxlYWYpID0gQF87Ci0gICAgdGFyZ2V0X3NvbWVmaWxlX2dldGxlYWYoXCRsbGVhZiwk
cmRlc3QsJGhvKTsKKyAgICB0YXJnZXRfc29tZWZpbGVfbGVhZihcJGxsZWFmLCRyZGVzdCwkaG8p
OwogCiAgICAgbXkgJGg9IG5ldyBJTzo6RmlsZSAiJHN0YXNoLyRsbGVhZiIsICd3JyBvciBkaWUg
IiRsbGVhZiAkISI7CiAgICAgcHJpbnQgJGggJGZpbGVkYXRhIG9yIGRpZSAkITsKQEAgLTY1NCw3
ICs2NTQsNyBAQCBzdWIgdGVkaXRmaWxlZXggewogICAgIGlmICghZGVmaW5lZCAkcmRlc3QpIHsK
ICAgICAgICAgJHJkZXN0PSAkcmZpbGU7CiAgICAgfQotICAgIHRhcmdldF9zb21lZmlsZV9nZXRs
ZWFmKFwkbGxlYWYsJHJkZXN0LCRobyk7CisgICAgdGFyZ2V0X3NvbWVmaWxlX2xlYWYoXCRsbGVh
ZiwkcmRlc3QsJGhvKTsKICAgICBteSAkbGZpbGU7CiAgICAgCiAgICAgZm9yICg7OykgewotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
