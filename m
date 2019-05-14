Return-Path: <SRS0=qwBA=TO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C56C04AB4
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 09:24:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C30A520843
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 09:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C30A520843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQTfi-0006R7-K5; Tue, 14 May 2019 09:24:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pH1X=TO=citrix.com=prvs=030624cdf=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQTfh-0006Qq-1I
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 09:24:29 +0000
X-Inumbo-ID: 0ff89a9a-762a-11e9-bb5d-971aa1a6202a
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ff89a9a-762a-11e9-bb5d-971aa1a6202a;
 Tue, 14 May 2019 09:24:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="85429965"
Date: Tue, 14 May 2019 10:23:53 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <20190514092353.GX2798@zion.uk.xensource.com>
References: <20190514084325.43928-1-elnikety@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514084325.43928-1-elnikety@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v3] libxl: make vkbd tunable for HVM guests
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Amit Shah <aams@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190514092353.3Pvj1w72Tr0vHfAXDTm2uhqJ1A0VzznW0c-Q0CoJJkg@z>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDg6NDM6MjVBTSArMDAwMCwgRXNsYW0gRWxuaWtldHkg
d3JvdGU6Cj4gRWFjaCBIVk0gZ3Vlc3QgY3VycmVudGx5IGdldHMgYSB2a2JkIGZyb250ZW5kL2Jh
Y2tlbmQgcGFpciAoYy9zIGViYmQyNTYxYjRjKS4KPiBUaGlzIGNvbnN1bWVzIGhvc3QgcmVzb3Vy
Y2VzIHVubmVjZXNzYXJpbHkgZm9yIGd1ZXN0cyB0aGF0IGhhdmUgbm8gdXNlIGZvcgo+IHZrYmQu
IE1ha2UgdGhpcyBiZWhhdmlvdXIgdHVuYWJsZSB0byBhbGxvdyBhbiBhZG1pbmlzdHJhdG9yIHRv
IGNob29zZS4gVGhlCj4gY29tbWl0IHJldGFpbnMgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIC0tIEhW
TSBndWVzdHMgc3RpbGwgZ2V0IHZrZGIgdW5sZXNzCj4gc3BlY2lmaWVkIG90aGVyd2lzZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBFc2xhbSBFbG5pa2V0eSA8ZWxuaWtldHlAYW1hem9uLmNvbT4KCkFj
a2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
