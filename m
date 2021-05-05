Return-Path: <SRS0=B3Pa=KA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2148C433ED
	for <xen-devel@archiver.kernel.org>; Wed,  5 May 2021 12:18:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50EC061222
	for <xen-devel@archiver.kernel.org>; Wed,  5 May 2021 12:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50EC061222
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.123081.232172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGU3-0001Jt-DV; Wed, 05 May 2021 12:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123081.232172; Wed, 05 May 2021 12:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGU3-0001Jm-Ab; Wed, 05 May 2021 12:18:31 +0000
Received: by outflank-mailman (input) for mailman id 123081;
 Wed, 05 May 2021 12:18:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leGU1-0001Je-Rg
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 12:18:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83c4dbef-bd9d-4897-8080-8834efe6ecac;
 Wed, 05 May 2021 12:18:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0532DACC4;
 Wed,  5 May 2021 12:18:28 +0000 (UTC)
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
X-Inumbo-ID: 83c4dbef-bd9d-4897-8080-8834efe6ecac
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620217108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PcEUYtfw1J9spaESNT8h/QUK42wl5s/bGU2tboUCcm8=;
	b=XoXpUhJ4OAdlWnT/CtcDWRmhDXdfmOqjOXKxQz0LkSi3f0eAGM5VXgnxm08lzHbuY/zcfQ
	qX6GmX3Iveu8pPn3dPNqBmMZbh3RuX0jAifA3X4G3NJvmN+D2VvLXwgqIs3jz70PhQ3d8x
	WOBoQLtxvhUqUZmWH0iDL2Wmrnu3SNE=
Subject: Re: [PATCH] public/gnttab: relax v2 recommendation
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Luca Fancellu <luca.fancellu@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dcd9ede1-9471-6866-4ba7-b6a7664b5e35@suse.com>
 <8eac6f09-4d1d-6fcc-4218-8c9a0760a6bb@xen.org>
 <71e61d09-5d92-94dc-ae0c-ce09cb49b4ce@suse.com>
 <c468856b-8ac6-2ab1-0f5f-eabc26d47293@xen.org>
 <51c29a91-8659-7525-a565-5b9fcfc935f3@suse.com>
 <9b8fb87c-a2fb-f371-5914-f0d175c18b02@xen.org>
 <7d55a2c1-f630-3e43-fb6a-39f28f716bca@suse.com>
 <00fa7de9-9f0c-1453-af7e-156d99bbd1f3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a56820e6-d30a-4647-1949-1198fa4af1d3@suse.com>
Date: Wed, 5 May 2021 14:18:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <00fa7de9-9f0c-1453-af7e-156d99bbd1f3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.05.2021 13:50, Julien Grall wrote:
> On 05/05/2021 11:57, Jan Beulich wrote:
>> Since I created this patch only because my request to correct the
>> statement led to me being asked to provide the suggested new text,
>> may I suggest that you pick up this patch or create one from scratch
>> to accommodate all your wishes, if you believe this extra information
>> really belongs there? All I'm after is to correct a statement that's
>> actively misleading.
> 
> I am a bit confused with this answer. Are you saying you are not willing 
> to write it but if someone else does you will accept it?

Along these lines, yes. One problem is if I start enumerating the
limitations, arguing could easily start whether I cover them all,
some are not worthwhile to mention, etc. Plus, as said, I'm not
convinced this is the right place for the information. In such a
case I can accept someone else thinking differently and making
such a change, but I'd like to be convinced of changes I'm doing
myself.

Jan

