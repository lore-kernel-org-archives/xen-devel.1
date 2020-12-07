Return-Path: <SRS0=Mf7K=FL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D3DC4361B
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 12:04:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6FCD23381
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 12:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6FCD23381
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.46416.82373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFFp-00040Q-BO; Mon, 07 Dec 2020 12:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46416.82373; Mon, 07 Dec 2020 12:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFFp-00040J-8B; Mon, 07 Dec 2020 12:04:33 +0000
Received: by outflank-mailman (input) for mailman id 46416;
 Mon, 07 Dec 2020 12:04:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmFFo-00040E-2u
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 12:04:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13e25b6b-f02e-4993-ba62-7ced120ab61a;
 Mon, 07 Dec 2020 12:04:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60891ADD7;
 Mon,  7 Dec 2020 12:04:30 +0000 (UTC)
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
X-Inumbo-ID: 13e25b6b-f02e-4993-ba62-7ced120ab61a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607342670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLA83gT1r9ILFBmvmDq6lXlW6yKdI3JqLM47ResQUAM=;
	b=enKSmarTp1mK+Q4S+1OBZ+APu//w84sxZRTpAllGo4DMUlLaoe5zA8pt8d56rRf7te7a+J
	gUlAZnAge4FNt43/aqTpxCDRltPi4J2pr/xh6hSbBpHB/BNN3ZaIFoPWndqSQw02V1tV3y
	6kZrTCUI5k6WVbEUe+i4DZOuaU1C/co=
Subject: Re: [PATCH V3 08/23] xen/ioreq: Move x86's ioreq_server to struct
 domain
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, Paul Durrant <paul@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-9-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b5011b7-5b8f-79cd-d8dc-c276ba1f9e37@suse.com>
Date: Mon, 7 Dec 2020 13:04:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-9-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The IOREQ is a common feature now and this struct will be used
> on Arm as is. Move it to common struct domain. This also
> significantly reduces the layering violation in the common code
> (*arch.hvm* usage).
> 
> We don't move ioreq_gfn since it is not used in the common code
> (the "legacy" mechanism is x86 specific).
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Applicable parts
Acked-by: Jan Beulich <jbeulich@suse.com>
yet with a question, but maybe more to Paul than to you:

> --- a/xen/include/asm-x86/hvm/domain.h
> +++ b/xen/include/asm-x86/hvm/domain.h
> @@ -63,8 +63,6 @@ struct hvm_pi_ops {
>      void (*vcpu_block)(struct vcpu *);
>  };
>  
> -#define MAX_NR_IOREQ_SERVERS 8
> -
>  struct hvm_domain {
>      /* Guest page range used for non-default ioreq servers */
>      struct {
> @@ -73,12 +71,6 @@ struct hvm_domain {
>          unsigned long legacy_mask; /* indexed by HVM param number */
>      } ioreq_gfn;
>  
> -    /* Lock protects all other values in the sub-struct and the default */
> -    struct {
> -        spinlock_t              lock;
> -        struct ioreq_server *server[MAX_NR_IOREQ_SERVERS];
> -    } ioreq_server;
> -
>      /* Cached CF8 for guest PCI config cycles */
>      uint32_t                pci_cf8;
>  
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -316,6 +316,8 @@ struct sched_unit {
>  
>  struct evtchn_port_ops;
>  
> +#define MAX_NR_IOREQ_SERVERS 8
> +
>  struct domain
>  {
>      domid_t          domain_id;
> @@ -523,6 +525,14 @@ struct domain
>      /* Argo interdomain communication support */
>      struct argo_domain *argo;
>  #endif
> +
> +#ifdef CONFIG_IOREQ_SERVER
> +    /* Lock protects all other values in the sub-struct and the default */
> +    struct {
> +        spinlock_t              lock;
> +        struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
> +    } ioreq_server;
> +#endif

The comment gets merely moved, but what "default" does it talk about?
Is this a stale part which would better be dropped at this occasion?

Jan

