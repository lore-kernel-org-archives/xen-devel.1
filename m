Return-Path: <SRS0=uIqA=3S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EDEC2D0DB
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jan 2020 15:28:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1964206F0
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jan 2020 15:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1964206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwpGV-0003bB-Pz; Wed, 29 Jan 2020 15:28:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwpGU-0003aR-Og
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 15:28:26 +0000
X-Inumbo-ID: fdfcf904-42ab-11ea-88fb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdfcf904-42ab-11ea-88fb-12813bfff9fa;
 Wed, 29 Jan 2020 15:28:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 117CBAD2B;
 Wed, 29 Jan 2020 15:28:25 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-6-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c16cfcc-0ec5-18f9-e05c-84415fed72c9@suse.com>
Date: Wed, 29 Jan 2020 16:28:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200117105358.607910-6-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 05/12] xen/include: remove include of
 Config.mk
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxMTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gSXQgaXNuJ3QgbmVj
ZXNzYXJ5IHRvIGluY2x1ZGUgQ29uZmlnLm1rIGhlcmUgYmVjYXVzZSB0aGlzIE1ha2VmaWxlIGlz
Cj4gb25seSB1c2VkIGJ5IHhlbi9SdWxlcy5tayB3aGljaCBhbHJlYWR5IGluY2x1ZGVzIENvbmZp
Zy5tay4KCkFuZCBzbyBpcyB4ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUgYWZhaWNzIGZyb20g
aXRzIHBhcmVudCBkaXIKTWFrZWZpbGUuIFdpdGggdGhpcyBhbHNvIGFkanVzdGVkIChvciBpdCBl
eHBsYWluZWQgd2h5IEknbSBzZWVpbmcKdGhpbmdzIGluY29ycmVjdGx5KSAuLi4KCj4gU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
