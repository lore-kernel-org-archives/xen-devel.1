Return-Path: <SRS0=wySQ=WX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4853BC3A5A3
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 15:11:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2310B2070B
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 15:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2310B2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2d80-0005Fo-3Q; Tue, 27 Aug 2019 15:11:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2d7y-0005Fi-Vi
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 15:11:23 +0000
X-Inumbo-ID: ed879bb8-c8dc-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed879bb8-c8dc-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 15:11:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3DE26AFBB;
 Tue, 27 Aug 2019 15:11:21 +0000 (UTC)
To: Oleksandr <olekstysh@gmail.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-7-git-send-email-olekstysh@gmail.com>
 <20f3a150-3619-deea-d0cd-fefe7f062a4f@suse.com>
 <d38bc9d3-1e34-66d4-8eea-baa1ebe0f195@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a2d392f-a976-8a0f-af5f-041b2904325c@suse.com>
Date: Tue, 27 Aug 2019 17:11:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d38bc9d3-1e34-66d4-8eea-baa1ebe0f195@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 6/8] iommu: Add of_xlate callback
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDguMjAxOSAxNjo1OSwgT2xla3NhbmRyIHdyb3RlOgo+IFRoZXJlIHdhcyBhIHByZWZl
cmVuY2UgdG8gaW50cm9kdWNlIGNhbGxiYWNrIGluIGEgc2VwYXJhdGUgcGF0Y2ggWzJdLiBBbnl3
YXksIHNoYWxsIEkgZm9sZCBpdD8KCkhtbSwgSSBkaXNhZ3JlZSB3aXRoIEp1bGllbiBoZXJlLiBJ
IGRvbid0IHRoaW5rIHdlIHNob3VsZCBoYXZlIHVudXNlZApob29rcyBpbiB0aGUgdHJlZSwgbm90
IGV2ZW4gaW50ZXJtZWRpYXRlbHkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
