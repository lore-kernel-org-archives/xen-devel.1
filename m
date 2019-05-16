Return-Path: <SRS0=BdeL=TQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8257DC04AAF
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 15:49:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4412D2082E
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 15:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4412D2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRIcg-000535-7B; Thu, 16 May 2019 15:48:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vv4c=TQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hRIce-00052m-ML
 for xen-devel@lists.xen.org; Thu, 16 May 2019 15:48:44 +0000
X-Inumbo-ID: 14ef1be8-77f2-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 14ef1be8-77f2-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 15:48:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB0B71715;
 Thu, 16 May 2019 08:48:42 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4869A3F71E;
 Thu, 16 May 2019 08:48:40 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
References: <1557309578-6436-1-git-send-email-andrii.anisov@gmail.com>
 <d4876c22d85f1af7bac22213942c611b1043acf4.camel@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0493d376-43a5-7b57-4c69-6040f260ff7e@arm.com>
Date: Thu, 16 May 2019 16:48:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d4876c22d85f1af7bac22213942c611b1043acf4.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen:arm: we never get into schedule_tail()
 with prev==current
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190516154838.w11oEFAhkBYp2jc_GkOe4ucxWgCoxB52RyCbK1I0s4E@z>

SGksCgpPbiAwOC8wNS8yMDE5IDEyOjI1LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiBPbiBXZWQs
IDIwMTktMDUtMDggYXQgMTI6NTkgKzAzMDAsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+IEZyb206
IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4+Cj4+IEFSTSdzIHNjaGVk
dWxlX3RhaWwoKSBpcyBjYWxsZWQgZnJvbSB0d28gcGxhY2VzOiBjb250ZXh0X3N3aXRjaCgpIGFu
ZAo+PiBjb250aW51ZV9uZXdfdmNwdSgpLiBCb3RoIGZ1bmN0aW9ucyBhcmUgYWx3YXlzIGNhbGxl
ZCB3aXRoCj4+IHByZXYhPWN1cnJlbnQuIFNvIHJlcGxhY2UgdGhlIGNvcnJlc3BvbmRlbnQgY2hl
Y2sgaW4gc2NoZWR1bGVfdGFpbCgpCj4+IHdpdGggQVNTRVJUKCkgd2hpY2ggaXMgdGhlIGRldmVs
b3BtZW50IChkZWJ1ZykgYnVpbGQgZ3VhcmQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4+Cj4gRldJVywKPiAKPiBSZXZpZXdlZC1i
eTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKSSBoYXZlIG5vdyBjb21taXR0ZWQgdGhlIHBh
dGNoLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
