Return-Path: <SRS0=Mf7K=FL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AAEC4361B
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 12:45:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6744233F7
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 12:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6744233F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.46460.82445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFt3-00007s-Sb; Mon, 07 Dec 2020 12:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46460.82445; Mon, 07 Dec 2020 12:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFt3-00007l-P7; Mon, 07 Dec 2020 12:45:05 +0000
Received: by outflank-mailman (input) for mailman id 46460;
 Mon, 07 Dec 2020 12:45:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmFt2-00007g-MM
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 12:45:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70f7a8a4-0377-4ee4-8bd5-1eec8c17939e;
 Mon, 07 Dec 2020 12:45:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE61FAC90;
 Mon,  7 Dec 2020 12:45:02 +0000 (UTC)
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
X-Inumbo-ID: 70f7a8a4-0377-4ee4-8bd5-1eec8c17939e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607345102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d9GEG4c+vI432TN9cI9m52CDJgB9wR91u8aHGsQQ1sk=;
	b=XjNBfwjORsI6I86tGwkG9Ju4aW2VtAw8OlDheCjR/WwNiu51qgybUBzBHVIIcRcMCRGTdq
	y16PPwlmA3740ZsEMyK9hqFqonJb55G9h3UHUNGThZHaTUPabSVFhxsxFdUeUcxgVKQjsH
	TnUJNC0VB5szqZGgx/sj01DjJw/dsLE=
Subject: Re: [PATCH V3 12/23] xen/ioreq: Remove "hvm" prefixes from involved
 function names
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-13-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b185227-3eae-de79-3af9-db39fed44459@suse.com>
Date: Mon, 7 Dec 2020 13:45:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-13-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> @@ -301,8 +301,8 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
>      return found;
>  }
>  
> -static void hvm_update_ioreq_evtchn(struct ioreq_server *s,
> -                                    struct ioreq_vcpu *sv)
> +static void ioreq_update_evtchn(struct ioreq_server *s,
> +                                struct ioreq_vcpu *sv)
>  {
>      ASSERT(spin_is_locked(&s->lock));

This looks to be an ioreq server function, which hence wants to be
named ioreq_server_update_evtchn()? Then

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

