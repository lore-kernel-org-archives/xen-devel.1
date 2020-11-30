Return-Path: <SRS0=tG8y=FE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AB3C64E7B
	for <xen-devel@archiver.kernel.org>; Mon, 30 Nov 2020 14:48:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D05B207FF
	for <xen-devel@archiver.kernel.org>; Mon, 30 Nov 2020 14:48:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="glKWLgLG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D05B207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.41240.74381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjkTm-0004so-TH; Mon, 30 Nov 2020 14:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41240.74381; Mon, 30 Nov 2020 14:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjkTm-0004sh-Px; Mon, 30 Nov 2020 14:48:38 +0000
Received: by outflank-mailman (input) for mailman id 41240;
 Mon, 30 Nov 2020 14:48:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj5U=FE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kjkTl-0004sc-CF
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 14:48:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85c7a924-80fd-4ccb-b756-843dce666f2a;
 Mon, 30 Nov 2020 14:48:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0C31DB2D1;
 Mon, 30 Nov 2020 14:47:12 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 85c7a924-80fd-4ccb-b756-843dce666f2a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606747632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c9rg7STKFkmnEhepr5+mSU1ShSbrW0KVLMPanlFaYlU=;
	b=glKWLgLGcLSkq1U2D6UmlhijQHupxtwzEOl7R65AuWEH8RUGh600TJWVOq13JFZazFx324
	XwV/xlY2rDVIqgpmZZnE++yRYwAXfBDF4mE9kgIiNaR8zKfj/jt46blUhbXJRqiWWSedQA
	93pt/XGpwYAYcki7dg35ZTSRIm+hu74=
Subject: Re: [PATCH v8 03/15] x86/mm: rewrite virt_to_xen_l*e
To: Hongyan Xia <hx242@xen.org>
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <cover.1595857947.git.hongyxia@amazon.com>
 <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
 <41d9d8d4-d5cb-8350-c118-c9e1fe73b6d0@suse.com>
 <a4f02c292a369cfd771790b1d164f139fec6bead.camel@xen.org>
 <f25e278f-2d63-d806-4650-983df490556f@xen.org>
 <d75fd45c-3f66-63c9-90c7-90dc10fc5763@suse.com>
 <8bb9eb92-ede4-0fa4-d21f-c7976fe70acf@xen.org>
 <622a8319-a439-72f2-c045-15e7611a22e7@suse.com>
 <3db3081d-232a-cce1-cfce-c657be64a0dd@xen.org>
 <600d3ea4-f905-3aab-e110-da3bd0d4b38a@suse.com>
 <23cd67ea1b96ba3f8801a3cf13549298597cb331.camel@xen.org>
 <1dab4032-6ae1-bf77-c183-c62ca06f0ad8@suse.com>
 <21e17d308adcec2854b35c5d1682927bedf45f58.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a885152-80be-19f7-6549-302b4b3d1a48@suse.com>
Date: Mon, 30 Nov 2020 15:47:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <21e17d308adcec2854b35c5d1682927bedf45f58.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 15:13, Hongyan Xia wrote:
> On Mon, 2020-11-30 at 13:50 +0100, Jan Beulich wrote:
>> Not very efficient, but not needed anywhere anyway - the sole user of
>> the construct is domain_page_map_to_mfn(), which maps only individual
>> pages. (An even better option would be to avoid the recurring walk of
>> the higher levels by using only virt_to_xen_l3e() and then doing the
>> remaining steps "by hand". This would at once allow to avoid the here
>> unwanted / unneeded checking for whether page tables need
>> allocating.)
> 
> The "even better option" looks more promising to me, and is what I want
> to go forward with. At any rate, this fix grows larger than intended
> and I want to send this as an individual patch. Any objections?

Definitely not - separate changes are almost always easier to look
at and faster to get in.

Jan

