Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8778AC282DC
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:26:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 607DF20674
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 607DF20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGnOG-00043s-Uc; Wed, 17 Apr 2019 16:26:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGnOF-00043m-E1
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 16:26:27 +0000
X-Inumbo-ID: 8bc86ce8-612d-11e9-ae46-879d825e1696
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8bc86ce8-612d-11e9-ae46-879d825e1696;
 Wed, 17 Apr 2019 16:26:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85594A78;
 Wed, 17 Apr 2019 09:26:25 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8E9B3F557;
 Wed, 17 Apr 2019 09:26:24 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
 <1555513175-7596-2-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fd856da4-250f-adec-9a66-a3356d47540b@arm.com>
Date: Wed, 17 Apr 2019 17:26:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555513175-7596-2-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 1/5] xen/arm: Clarify usage of
 earlyprintk for Lager board
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417162623.2x5GC-5wCxu59PWU_p7FRg2HOEStuDNvNJRnDo7Npvw@z>

SGksCgpPbiAxNy8wNC8yMDE5IDE1OjU5LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPiBG
cm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
Cj4gCj4gQ3VycmVudCBzZW50ZW5jZSBpcyBub3QgZW50aXJlbHkgY29ycmVjdC4gU2luY2UgU0NJ
RjAgaW50ZXJmYWNlIGlzCj4gYXBwbGljYWJsZSBmb3IgTGFnZXIgYm9hcmQsIGJ1dCBpcyBub3Qg
YXBwbGljYWJsZSBmb3IgYWxsIFItQ2FyIEgyCj4gYmFzZWQgYm9hcmRzLiBGb3IgZXhhbXBsZSwg
U3RvdXQgYm9hcmQgdXNlcyBTQ0lGQTAgaW50ZXJmYWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9s
ZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbSA+IEFja2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKSSBoYXZlIHB1c2hlZCB0
aGlzIHBhdGNoIHRvIG15IGJyYW5jaCBuZXh0LTQuMTMgZm9yIG5vdy4gSXQgd2lsbCBiZSBtZXJn
ZWQgb25jZSAKdGhlIGNvbW1pdCBtb3JhdG9yaXVtIGlzIGxpZnRlZC4KCkkgd2lsbCByZXZpZXcg
dGhlIHJlc3Qgb2YgdGhlIHNlcmllcyBzb29uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
