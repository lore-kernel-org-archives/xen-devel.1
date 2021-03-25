Return-Path: <SRS0=LcbK=IX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0401C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 25 Mar 2021 07:53:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D6061945
	for <xen-devel@archiver.kernel.org>; Thu, 25 Mar 2021 07:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87D6061945
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.101278.193587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPKoQ-00061L-5E; Thu, 25 Mar 2021 07:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101278.193587; Thu, 25 Mar 2021 07:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPKoQ-00061E-1x; Thu, 25 Mar 2021 07:53:50 +0000
Received: by outflank-mailman (input) for mailman id 101278;
 Thu, 25 Mar 2021 07:53:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQ/e=IX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPKoP-000619-Br
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 07:53:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d51ecd83-67c1-4630-83ae-28d9c5075afe;
 Thu, 25 Mar 2021 07:53:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D03A5ACBF;
 Thu, 25 Mar 2021 07:53:47 +0000 (UTC)
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
X-Inumbo-ID: d51ecd83-67c1-4630-83ae-28d9c5075afe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616658827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wC00qsoMd0Vpe0LEgrn1pSDhjhoVGrMCuJHCsjhvysg=;
	b=Lw1LPfFbH5ni7z+VDpZ+wAtBiFfF29WOnR9wnosqYhciI9C9QfeJI17KnznOGA6zCH9Dmo
	n7xc7cMVdmT7PtscDuF9cRW8ZmvjlxNycctaPoPKulCxf5cZA2DU7cbH0enRmyaLpAt2v4
	FRKbUaXOLug/l2EQHSPCuTF7lDPvyVo=
Subject: Re: [PATCH 1/6] Intel Processor Trace Support: Add CHANGELOG.md and
 SUPPORT.md entries
To: George Dunlap <george.dunlap@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@zentific.com>, xen-devel@lists.xenproject.org
References: <20210324164407.302062-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1fe59844-d512-805d-fefe-8522cccd59ca@suse.com>
Date: Thu, 25 Mar 2021 08:53:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324164407.302062-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.03.2021 17:44, George Dunlap wrote:
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -247,6 +247,13 @@ Export hypervisor coverage data suitable for analysis by gcov or lcov.
>  
>      Status: Supported, Not security supported
>  
> +### Processor trace support
> +
> +Support for using Intel Processor Trace technology to trace guests
> +from dom0.
> +
> +    Status: Tech Preview

While it may not strictly be needed here, perhaps for consistency with
other entries

    Status, x86: Tech Preview

?

This minor aspect aside,
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

