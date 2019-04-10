Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FBCC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 09:18:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460AF2077C
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 09:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 460AF2077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hE9NE-0002Xu-Fm; Wed, 10 Apr 2019 09:18:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/zj=SM=citrix.com=prvs=9969b238a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hE9ND-0002Xo-U7
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 09:18:27 +0000
X-Inumbo-ID: 9877cf23-5b71-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9877cf23-5b71-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 09:18:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83199213"
Date: Wed, 10 Apr 2019 10:18:23 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190410091823.GT30543@zion.uk.xensource.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-2-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190409164542.30274-2-anthony.perard@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 1/9] libxl_internal: Remove lost comment
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
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410091823.sMgEKAZD6nxKkHdGAanbaL7Hj0_GTv42REPrKf1miGw@z>

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDU6NDU6MzRQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhhdCBjb21tZW50IGFzIGJlZW4gc2VwYXJhdGVkIGZyb20gdGhlIGZ1bmN0aW9u
IGl0IGRlZmluZXMgYnkKPiA0MTk3ZDNhYmJiMzA1NWQzNzk4MjU0ZWI3YmEyMzliZmI1ODI0MzYw
LCBidXQgdGhlbiB3YXMgbm90IHVzZWZ1bAo+IGFueW1vcmUgd2hlbiB0aGUgbGlieGxfX2Rldmlj
ZV9kaXNrX2FkZCgpIHByb3RvdHlwZSB3YXMgcmVtb3ZlZCBieQo+IDIyZWE4YWQwMmU0NjVlMzJj
ZDQwODg3Yzc1MGI1NWMzYTk5N2EyODguCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
