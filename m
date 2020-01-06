Return-Path: <SRS0=ufJU=23=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41D9C2D0D1
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jan 2020 10:32:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ADFB20731
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jan 2020 10:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ADFB20731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioPgI-0006rI-Fy; Mon, 06 Jan 2020 10:32:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioPgH-0006qY-Kr
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 10:32:17 +0000
X-Inumbo-ID: ca8c889e-306f-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca8c889e-306f-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 10:32:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5AE1DB187;
 Mon,  6 Jan 2020 10:31:04 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-5-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <775b79b4-4b12-62ad-63c3-04cc8179256c@suse.com>
Date: Mon, 6 Jan 2020 11:31:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200105164801.26278-5-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/5] x86/hyperv: retrieve vp_index from
 Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDEuMjAyMCAxNzo0OCwgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0L2h5cGVydi5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9o
eXBlcnYuaAo+IEBAIC02Niw2ICs2Niw3IEBAIHN0cnVjdCBtc19oeXBlcnZfaW5mbyB7Cj4gIGV4
dGVybiBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gbXNfaHlwZXJ2Owo+ICAKPiAgREVDTEFSRV9QRVJf
Q1BVKHZvaWQgKiwgaHZfcGNwdV9pbnB1dF9hcmcpOwo+ICtERUNMQVJFX1BFUl9DUFUodW5zaWdu
ZWQgaW50LCBodl92cF9pbmRleCk7CgpTYW1lIHF1ZXN0aW9uIGhlcmUgLSB3aWxsIHRoaXMgbmVl
ZCB0byBiZSB2aXNpYmxlIG91dHNpZGUgb2YgdGhlCmZpbGUgZGVmaW5pbmcgdGhlIHZhcmlhYmxl
PyBJbiB0aGUgb3RoZXIgcGF0Y2ggYXMgd2VsbCBhcyBoZXJlLAppZiB0aGUgYW5zd2VyIGlzIHll
cywgdGhlIG5leHQgcXVlc3Rpb24gd291bGQgYmUgd2hldGhlciBpdCBuZWVkcwp0byBiZSB2aXNp
YmxlIG91dHNpZGUgb2YgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi8gKGkuZS4gd2hldGhlcgpp
dCBzaG91bGRuJ3QgbGl2ZSBpbiBhIHByaXZhdGUgaGVhZGVyKS4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
