Return-Path: <SRS0=ydFR=D6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE77C4363A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 15:07:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA55B208B6
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 15:07:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Gb8CSFTY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA55B208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.11072.29333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVyek-0006Np-5U; Fri, 23 Oct 2020 15:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11072.29333; Fri, 23 Oct 2020 15:07:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVyek-0006Ni-1h; Fri, 23 Oct 2020 15:07:02 +0000
Received: by outflank-mailman (input) for mailman id 11072;
 Fri, 23 Oct 2020 15:07:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVyei-0006Nd-Oi
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:07:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab015e83-faa7-485d-ac9c-4744e7e0cc80;
 Fri, 23 Oct 2020 15:06:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDE5EAC83;
 Fri, 23 Oct 2020 15:06:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVyei-0006Nd-Oi
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:07:00 +0000
X-Inumbo-ID: ab015e83-faa7-485d-ac9c-4744e7e0cc80
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ab015e83-faa7-485d-ac9c-4744e7e0cc80;
	Fri, 23 Oct 2020 15:06:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603465618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WJfdBU/v3a9AiZbddIIyfpXTvlnrLNU7ifSIrJmNkPY=;
	b=Gb8CSFTYYralmCouIQBs3BT6akLW/9yN78GgF8/InK3qvXsU0fHyryxBE0muu9XmnqZnVn
	DsONvoH1Wd2dT7vnGeMgHJkz4kwHuC5Kzk63YrxFUEu5ro7NmEKQZ0q7dbuJBwHekudAmG
	/p+DEyL7Y5ezaafBdJqshAXwNSaEVrw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CDE5EAC83;
	Fri, 23 Oct 2020 15:06:58 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] tools/libs: move official headers to common
 directory
To: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20201023141934.20062-1-jgross@suse.com>
 <20201023141934.20062-2-jgross@suse.com>
 <24466.60952.899550.965639@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c2e11d90-70c3-0a00-2e56-83191e4d7d0e@suse.com>
Date: Fri, 23 Oct 2020 17:07:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <24466.60952.899550.965639@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.10.2020 16:52, Ian Jackson wrote:
> Juergen Gross writes ("[PATCH v2 1/3] tools/libs: move official headers to common directory"):
>> Instead of each library having an own include directory move the
>> official headers to tools/include instead. This will drop the need to
>> link those headers to tools/include and there is no need any longer
>> to have library-specific include paths when building Xen.
>>
>> While at it remove setting of the unused variable
>> PKG_CONFIG_CFLAGS_LOCAL in libs/*/Makefile.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Acked-by: Christian Lindig <christian.lindig@citrix.com>
>> Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Thanks, all three
> 
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> and pushed.

While you're at it, Ian, could you also take a look at
"[PATCH 2/2] tools/libs: fix uninstall rule for header files"
(patch 1 there now obviously is obsolete)?

Thanks, Jan

