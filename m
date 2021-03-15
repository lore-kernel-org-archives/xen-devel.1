Return-Path: <SRS0=ZtLg=IN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C35C433DB
	for <xen-devel@archiver.kernel.org>; Mon, 15 Mar 2021 08:07:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B475664E13
	for <xen-devel@archiver.kernel.org>; Mon, 15 Mar 2021 08:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B475664E13
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.97861.185659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLiFN-0006Tb-56; Mon, 15 Mar 2021 08:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97861.185659; Mon, 15 Mar 2021 08:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLiFN-0006TU-15; Mon, 15 Mar 2021 08:06:41 +0000
Received: by outflank-mailman (input) for mailman id 97861;
 Mon, 15 Mar 2021 08:06:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EzTP=IN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lLiFL-0006TP-A8
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 08:06:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 867e7d67-f64f-43c0-b24c-f75dab14cc77;
 Mon, 15 Mar 2021 08:06:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51016ABD7;
 Mon, 15 Mar 2021 08:06:37 +0000 (UTC)
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
X-Inumbo-ID: 867e7d67-f64f-43c0-b24c-f75dab14cc77
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615795597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Ws3SpyyAi9it/NT6gVbyOHCpYWOqJ8OfrDH6SnT6Ak=;
	b=ufckSlMj1P6inXfVUSdddEDf2kVeC/gbTCNiQ3KVLCz2UMHLrYNWv9etowYKY5jxIW2cb8
	g9LDpf1nf4BraMxAZuw/BTl1QqLDORW+UCbvwzxUfzqA4iJxHeZDXBcTl8ADBCW6g6xpKZ
	j3/Eo96qDlJjrMbtfiUSH1C9zbNv+6Y=
Subject: Re: [PATCH v3] xen: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20210312231632.5666-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e35a613-fd93-0805-10b9-5ecee73bb15d@suse.com>
Date: Mon, 15 Mar 2021 09:06:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210312231632.5666-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.03.2021 00:16, Stefano Stabellini wrote:
> Introduce two feature flags to tell the domain whether it is
> direct-mapped or not. It allows the guest kernel to make informed
> decisions on things such as swiotlb-xen enablement.
> 
> The introduction of both flags (XENFEAT_direct_mapped and
> XENFEAT_not_direct_mapped) allows the guest kernel to avoid any
> guesswork if one of the two is present, or fallback to the current
> checks if neither of them is present.
> 
> XENFEAT_direct_mapped is always set for not auto-translated guests.
> 
> For auto-translated guests, only Dom0 on ARM is direct-mapped. Also,
> see is_domain_direct_mapped() which refers to auto-translated guests:
> xen/include/asm-arm/domain.h:is_domain_direct_mapped
> xen/include/asm-x86/domain.h:is_domain_direct_mapped
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: jbeulich@suse.com
> CC: andrew.cooper3@citrix.com
> CC: julien@xen.org

Any particular reason my previously given R-b isn't here?

Jan

