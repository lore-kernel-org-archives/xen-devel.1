Return-Path: <SRS0=b8XE=TB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371F2C04AA8
	for <xen-devel@archiver.kernel.org>; Wed,  1 May 2019 09:58:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1062720835
	for <xen-devel@archiver.kernel.org>; Wed,  1 May 2019 09:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1062720835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLm0X-000068-QV; Wed, 01 May 2019 09:58:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLm0W-000063-LE
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 09:58:32 +0000
X-Inumbo-ID: ac580e3a-6bf7-11e9-845f-83e428a13f16
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac580e3a-6bf7-11e9-845f-83e428a13f16;
 Wed, 01 May 2019 09:58:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84835376"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23753.28099.800219.876059@mariner.uk.xensource.com>
Date: Wed, 1 May 2019 10:58:27 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-135421-mainreport@xen.org>
References: <osstest-135421-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.9-testing test] 135421: regressions - FAIL
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190501095827.aNihZeX2rM6UcoKJOvcYX_72MyYGainukE6HuB4P2Aw@z>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC45LXRlc3RpbmcgdGVzdF0gMTM1
NDIxOiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBmbGlnaHQgMTM1NDIxIHhlbi00LjktdGVzdGlu
ZyByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rl
c3QvbG9ncy8xMzU0MjEvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlk
IG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNv
dWxkIG5vdCBiZSBydW46Cj4gIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgNiB4ZW4tYnVpbGQg
ICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTMyODg5CgpUaGlzIGZsaWdodCBsYWNrZWQg
dGhlIGJhY2twb3J0cyBvZgogIHRvb2xzL2Zpcm13YXJlOiB1cGRhdGUgT1ZNRiBNYWtlZmlsZSwg
d2hlbiBuZWNlc3NhcnkKICB0b29sczogb25seSBjYWxsIGdpdCB3aGVuIG5lY2Vzc2FyeSBpbiBP
Vk1GIE1ha2VmaWxlCmR1ZSB0byBzdGFydGluZyBiZWZvcmUgdGhleSB3ZXJlIGNvbW1pdHRlZC4g
IFdlIGhvcGUgZm9yIHRoZSBuZXh0IHJ1bgp0byBzdWNjZWVkLgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
