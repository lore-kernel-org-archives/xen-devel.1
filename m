Return-Path: <SRS0=LcbK=IX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA40C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 25 Mar 2021 07:57:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 532366146D
	for <xen-devel@archiver.kernel.org>; Thu, 25 Mar 2021 07:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 532366146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.101281.193599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPKrn-0006BR-Ku; Thu, 25 Mar 2021 07:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101281.193599; Thu, 25 Mar 2021 07:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPKrn-0006BK-Hx; Thu, 25 Mar 2021 07:57:19 +0000
Received: by outflank-mailman (input) for mailman id 101281;
 Thu, 25 Mar 2021 07:57:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQ/e=IX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPKrm-0006BF-7m
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 07:57:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f82e1fd-1770-468c-9d59-019af01bddee;
 Thu, 25 Mar 2021 07:57:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E0ACAA55;
 Thu, 25 Mar 2021 07:57:16 +0000 (UTC)
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
X-Inumbo-ID: 8f82e1fd-1770-468c-9d59-019af01bddee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616659036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qqvuab5upILA1d/7jqjZKuvgtOPJL2VBrpR9GKTWEIY=;
	b=V/bmPFZjpoAgzD5m+0B3S+7b11pNpjfTiUFfFKJUfpPAKyZ6Et5sY/FtVR6a+vTq8Py7Yz
	mIsSSMtUj31KJVj33hx0kPJ3YMfBVLv8sqgHTScfQQY0wgWKqnobe1lh1PRgs+C9rH08S8
	cwKjTLu6dK9WE3fXlTRzz+LR4feBIzM=
Subject: Re: [PATCH 5/6] CHANGELOG.md: Add entries for emulation
To: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
References: <20210324164407.302062-1-george.dunlap@citrix.com>
 <20210324164407.302062-5-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33f78891-c894-b41a-a1a3-82aac1f57b8d@suse.com>
Date: Thu, 25 Mar 2021 08:57:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324164407.302062-5-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.03.2021 17:44, George Dunlap wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Named PCI devices for xl/libxl
>   - Support for zstd-compressed dom0 kernels
>   - Library improvements from NetBSD ports upstreamed
> + - x86_emulate: Support AVX-VNNI instructions
> + - x86_emulate: Expanded testing for several instruction classes

TBH both seem too minor to me to be mentioned here. If I was to pick
just one, I'd keep the former and drop the latter.

Jan

