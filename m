Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D0AC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 13:10:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E00F2173C
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 13:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E00F2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGkKM-0004dV-89; Wed, 17 Apr 2019 13:10:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fEre=ST=citrix.com=prvs=0036fbe7a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hGkKK-0004dQ-Qt
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 13:10:12 +0000
X-Inumbo-ID: 1ffc1200-6112-11e9-9443-d7f8b8a9f0fb
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ffc1200-6112-11e9-9443-d7f8b8a9f0fb;
 Wed, 17 Apr 2019 13:10:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,362,1549929600"; d="scan'208";a="83787877"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23735.9645.576959.629965@mariner.uk.xensource.com>
Date: Wed, 17 Apr 2019 14:10:05 +0100
To: "julien.grall@arm.com" <julien.grall@arm.com>
In-Reply-To: <E1hGSgo-0005VG-0e@osstest.test-lab.xenproject.org>
References: <E1hGSgo-0005VG-0e@osstest.test-lab.xenproject.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] osstest armhf arndales (was Re: [adhoc test] 134864:
 trouble: blocked/broken/pass)
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417131005.Oy0rkhzKCVx_M8NtagwVkQ7T0cTJxtOE2kT3c1xAqrE@z>

aXdqQHhlbmJpdHMueGVuLm9yZyB3cml0ZXMgKCJbYWRob2MgdGVzdF0gMTM0ODY0OiB0cm91Ymxl
OiBibG9ja2VkL2Jyb2tlbi9wYXNzIik6Cj4gW2FkaG9jIGNvbW1pc3Npb24tYXJuZGFsZV0gPDJ0
ZXN0aW5nLmdpdCAoSEVBRCBkZXRhY2hlZCBhdCBvcmlnaW4vcHJldGVzdCkgL2Rldi9wdHMvNDE+
Cj4gaGFybmVzcyA2ODlkMjdmOiB0cy1ob3N0LWluc3RhbGw6IERvIG5vdCBmb3JjZSBNQUMgYWRk
cmVzcyBvZiBYZW4gdmlmcwo+IDEzNDg2NDogdHJvdWJsZTogYmxvY2tlZC9icm9rZW4vcGFzcwo+
IAo+IGZsaWdodCAxMzQ4NjQgeGVuLXVuc3RhYmxlIGNvbW1pc3Npb24tYXJuZGFsZSBbY29tbWlz
c2lvbi1hcm5kYWxlXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rl
c3QvbG9ncy8xMzQ4NjQvCi4uLgoKVGhpcyBoYWQgb25seSB0aGUgZXhwZWN0ZWQgaG9zdCBhbGxv
Y2F0aW9uIGZhaWx1cmVzIChleHBlY3RlZCwKYmVjYXVzZSBpdCB3YXMgbGltaXRlZCB0byBhcm5k
YWxlcyBvbmx5KS4gIFNvIEkgaGF2ZSByZS1ibGVzc2VkIHRoZQphcm5kYWxlcyBmb3IgcHJvZHVj
dGlvbi4KClJlZ2FyZHMsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
