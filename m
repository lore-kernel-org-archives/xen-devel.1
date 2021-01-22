Return-Path: <SRS0=o5zc=GZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59538C433E6
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 16:31:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 192ED23A7D
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 16:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 192ED23A7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.72967.131549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zKz-00026Z-KJ; Fri, 22 Jan 2021 16:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72967.131549; Fri, 22 Jan 2021 16:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zKz-00026R-HC; Fri, 22 Jan 2021 16:31:05 +0000
Received: by outflank-mailman (input) for mailman id 72967;
 Fri, 22 Jan 2021 16:31:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=83/a=GZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2zKy-00026L-5V
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:31:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1302fc1-3d5f-4578-a6b8-bc9bfcd3b932;
 Fri, 22 Jan 2021 16:31:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8C820AF55;
 Fri, 22 Jan 2021 16:31:02 +0000 (UTC)
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
X-Inumbo-ID: a1302fc1-3d5f-4578-a6b8-bc9bfcd3b932
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611333062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7a/Zyytzg3YUE+x0QCxzMkbKbeUK2iNB/hBGFCQJho=;
	b=ILk8MoaDQoWHIoSFbTbcb2sH+qmntK5iAJavlfDovnSo/0rQ3k4R/qiv43hX5/Gy3UR+hj
	YvrRBhYlkkrxVeOIszBaTH+3EL5kZjFIs234RaNSiTeAh+5yeb+lnOj7XEt7XStuF5JxD+
	GdSAmQjEeZHO2mpjjZh5vpOsc6rAYok=
Subject: Re: [PATCH 15/17] x86/shadow: drop SH_type_l2h_pae_shadow
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <c412bbe4-d555-7d36-997c-92274679d9ae@suse.com>
 <YArPAicNIR0H5Q0y@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8de294c-ae72-aebf-a893-790c84efdc97@suse.com>
Date: Fri, 22 Jan 2021 17:31:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YArPAicNIR0H5Q0y@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.01.2021 14:11, Tim Deegan wrote:
> At 16:10 +0100 on 14 Jan (1610640627), Jan Beulich wrote:
>> This is a remnant from 32-bit days, having no place anymore where a
>> shadow of this type would be created.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> hash_{domain,vcpu}_foreach() have a use each of literal 15. It's not
>> clear to me what the proper replacement constant would be, as it
>> doesn't look as if SH_type_monitor_table was meant.
> 
> Good spot.  I think the '<= 15' should be replaced with '< SH_type_unused'.
> It originally matched the callback arrays all being coded as
> "static hash_callback_t callbacks[16]".

So are you saying this was off by one then prior to this patch
(when SH_type_unused was still 17), albeit in apparently a
benign way? And the comments in sh_remove_write_access(),
sh_remove_all_mappings(), sh_remove_shadows(), and
sh_reset_l3_up_pointers() are then wrong as well, and would
instead better be like in shadow_audit_tables()?

Because of this having been benign (due to none of the callback
tables specifying non-NULL entries there), wouldn't it make
sense to dimension the tables by SH_type_max_shadow + 1 only?
Or would you consider this too risky?

In any event I guess I'll make the patch addressing this (one
way or the other) a prereq to everything here.

Jan

