Return-Path: <SRS0=fV0s=IG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4998AC433DB
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 14:22:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2AD8650BA
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 14:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2AD8650BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.94969.179048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGlo-0001ob-JJ; Mon, 08 Mar 2021 14:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94969.179048; Mon, 08 Mar 2021 14:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGlo-0001oU-GM; Mon, 08 Mar 2021 14:22:04 +0000
Received: by outflank-mailman (input) for mailman id 94969;
 Mon, 08 Mar 2021 14:22:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJGln-0001oP-AJ
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 14:22:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07b4cd94-bb51-4470-9f14-a230342546be;
 Mon, 08 Mar 2021 14:22:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64557AD3B;
 Mon,  8 Mar 2021 14:22:01 +0000 (UTC)
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
X-Inumbo-ID: 07b4cd94-bb51-4470-9f14-a230342546be
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615213321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zuVhzmHD/GwJ/BD/Uua8G2r0aRGsxm60T75ZELmL844=;
	b=MfrzZ18omo+HO8HaAVlWOrF1RBhmea1E6XupkOnJh0eoGbn+B82qMLSmPldiPSLCvh+rMe
	+6vbGhSpU9v3NHndW3TwHH8f1AcDxYZifJDtP9D1FtAXcBD+F/MuobUEmreEOGWnwN32nt
	JxrqNZrvcxpqWhfgImxtez2kd2P+D1E=
Subject: Re: [PATCH] xen/arm: Prevent Dom0 to be loaded when using dom0less
To: Julien Grall <julien@xen.org>, Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210308115610.48203-1-luca.fancellu@arm.com>
 <1921ff88-7637-6454-74a7-1cbab8dafc61@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <24f4462d-cf3e-73a1-0515-de94d7576f34@suse.com>
Date: Mon, 8 Mar 2021 15:22:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1921ff88-7637-6454-74a7-1cbab8dafc61@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 15:12, Julien Grall wrote:
> On 08/03/2021 11:56, Luca Fancellu wrote:
>> This patch prevents the dom0 to be loaded skipping its
>> building and going forward to build domUs when the dom0
>> kernel is not found and at least one domU is present.
> 
> As you are skipping dom0, the domid 0 will not be usable for another 
> domain. I can see a few issues:
>     1) The first domU created will now be considered as the hardware 
> domain (see domain_create()).
>     2)  There are still a few hardcoded use of d->domain_id == 0 in the 
> codebase (I could spot at least on in the RTDS code).
>     3) Not all the code seems to be able to cope with hardware_domain is 
> NULL (although most of it looks to be only reachable by x86)?
>     4) is_hardware_domain() will return true when passing NULL. It is 
> not clear whether one may pass NULL here.
> 
> For 2), ideally this needs to be fixed. But we may also want to reserve 
> domid 0 just for sanity.

+1 to reserving ID zero in such a case.

Jan

