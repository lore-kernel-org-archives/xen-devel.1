Return-Path: <SRS0=4rCt=ZV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E96C432C0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 15:45:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED3E52075C
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 15:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED3E52075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaiRq-0002tR-UJ; Fri, 29 Nov 2019 15:44:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaiRp-0002tM-GU
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:44:45 +0000
X-Inumbo-ID: 29f3fa02-12bf-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29f3fa02-12bf-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 15:44:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8B685AE40;
 Fri, 29 Nov 2019 15:44:43 +0000 (UTC)
To: "committers@xenproject.org" <committers@xenproject.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cee9711b-881c-f10d-87eb-c2dd1b0bf606@suse.com>
Date: Fri, 29 Nov 2019 16:44:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Xen 4.13 has been branched
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WGVuIDQuMTMgaGFzIGJlZW4gYnJhbmNoZWQuIFNvIHRoZSBzdGFnaW5nIGJyYW5jaCBpcyBvcGVu
IGFnYWluIGZvcgpkZXZlbG9wbWVudC4KCkJVVDogcGxlYXNlIGJlYXIgaW4gbWluZCB0aGF0IHdl
IGhhdmUgbm8gNC4xMyByZWxlYXNlIHlldCwgc28gdGhlcmUKbWlnaHQgYmUgdGhlIG5lZWQgdG8g
cHVzaCBmdXJ0aGVyIGNvcnJlY3Rpb25zIHRvIDQuMTMtc3RhZ2luZyBiZWZvcmUgd2UKY2FuIHJl
bGVhc2UuIEZvciB0aGF0IHJlYXNvbiBwbGVhc2UgZG9uJ3QgY29tbWl0IHBhdGNoZXMgd2hpY2gg
d2lsbCBtYWtlCnN1Y2ggY29ycmVjdGlvbnMgZXNwZWNpYWxseSBoYXJkLiBTbyBpbiBjYXNlIHlv
dSBjb21taXQsIGRvIHNvIHdpdGgKY29uc2lkZXJpbmcgdGhlIHBvc3NpYmxlIG5lZWQgZm9yIGxh
c3QgbWludXRlIGNvcnJlY3Rpb25zIG9mIDQuMTMuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
