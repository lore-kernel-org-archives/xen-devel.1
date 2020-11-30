Return-Path: <SRS0=tG8y=FE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36760C64E90
	for <xen-devel@archiver.kernel.org>; Mon, 30 Nov 2020 09:46:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBFC5206B6
	for <xen-devel@archiver.kernel.org>; Mon, 30 Nov 2020 09:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="gD0pigSk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBFC5206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.40755.73669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjfkv-0003FD-88; Mon, 30 Nov 2020 09:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40755.73669; Mon, 30 Nov 2020 09:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjfkv-0003F6-4p; Mon, 30 Nov 2020 09:46:01 +0000
Received: by outflank-mailman (input) for mailman id 40755;
 Mon, 30 Nov 2020 09:45:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj5U=FE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kjfkt-0003Ez-J4
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 09:45:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c69cc95-e9b1-4842-bd01-fe5f7c0f8bc1;
 Mon, 30 Nov 2020 09:45:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35E61AC6A;
 Mon, 30 Nov 2020 09:45:56 +0000 (UTC)
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
X-Inumbo-ID: 7c69cc95-e9b1-4842-bd01-fe5f7c0f8bc1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606729556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=717ZnlDtzkAXums8kkcz9Mg9J24T5NL/mgFvBcE1vKI=;
	b=gD0pigSkU2DljCnzXV3mPoF+0g0S60VuCwG5Ox9ZTJZNul+cbDamRyxisrpLf3ixBahhy9
	tJt/A5MeG/qyvN1m6tsq475p8IC8AK79JuwavF8sSXjUeT1dLUiz2WzTLFh1Nvaab1yXPG
	2eNdTJvyvAQtzjho+gULkKMyTuUAdqo=
Subject: Re: [PATCH v10 5/7] vtd: use a bit field for root_entry
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Paul Durrant <pdurrant@amazon.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20201120132440.1141-1-paul@xen.org>
 <20201120132440.1141-6-paul@xen.org>
 <MWHPR11MB164520264945AF959D7A3ED28CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5962cbc3-5aaf-7855-e00d-fb525441f454@suse.com>
Date: Mon, 30 Nov 2020 10:45:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB164520264945AF959D7A3ED28CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 04:06, Tian, Kevin wrote:
>> From: Paul Durrant <paul@xen.org>
>> Sent: Friday, November 20, 2020 9:25 PM
>>
>> From: Paul Durrant <pdurrant@amazon.com>
>>
>> This makes the code a little easier to read and also makes it more consistent
>> with iremap_entry.
>>
>> Also take the opportunity to tidy up the implementation of
>> device_in_domain().
>>
>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> 
> Reviewed-by: <kevin.tian@intel.com>

Besides this looking a little odd (can be easily fixed of course)
I wonder whether both here and for patch 6 you had seen my requests
for smallish changes, and whether you meant to override those, or
whether your R-b will continue to apply with them made.

Jan

