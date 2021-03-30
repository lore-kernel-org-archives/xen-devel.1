Return-Path: <SRS0=ZQjX=I4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E58C433DB
	for <xen-devel@archiver.kernel.org>; Tue, 30 Mar 2021 15:57:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A4B619C0
	for <xen-devel@archiver.kernel.org>; Tue, 30 Mar 2021 15:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A4B619C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.103614.197631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGjP-0007H1-23; Tue, 30 Mar 2021 15:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103614.197631; Tue, 30 Mar 2021 15:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGjO-0007Gu-VP; Tue, 30 Mar 2021 15:56:38 +0000
Received: by outflank-mailman (input) for mailman id 103614;
 Tue, 30 Mar 2021 15:56:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRGjO-0007Gp-2F
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 15:56:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d378593-0767-4354-8e15-27fe93c95349;
 Tue, 30 Mar 2021 15:56:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60A34AE58;
 Tue, 30 Mar 2021 15:56:36 +0000 (UTC)
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
X-Inumbo-ID: 8d378593-0767-4354-8e15-27fe93c95349
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617119796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hybCrCzhnpWgNJOsJo3bbeBNZ6i4nJGi00JXnUFG3Y=;
	b=GE0clHnc1DpM7HAtz/O4ljo7QWOWAucq4VVdtnZEXXX7owUVX0TgHH0V9SteldkJIDktRY
	T+HmK199rszx9xGufN9Nvm09Tdb8ysdaA2WIT2BaONTgfeWSnqkLTrT/RZ/npIkI+lyjxc
	xyOnXtgiiPXgdfRkIb96RGTBYio1CEo=
Subject: Re: [PATCH 11/21] libs/guest: allow updating a cpu policy CPUID data
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-12-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ee841bd2-340e-aed4-2403-a655fbb13862@suse.com>
Date: Tue, 30 Mar 2021 17:56:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210323095849.37858-12-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.03.2021 10:58, Roger Pau Monne wrote:
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -966,3 +966,70 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
>      free(msrs);
>      return rc;
>  }
> +
> +int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
> +                               const xen_cpuid_leaf_t *leaves,
> +                               uint32_t nr)
> +{
> +    unsigned int err_leaf = -1, err_subleaf = -1;
> +    unsigned int nr_leaves, nr_msrs, i, j;
> +    xen_cpuid_leaf_t *current;
> +    int rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
> +
> +    if ( rc )
> +    {
> +        PERROR("Failed to obtain policy info size");
> +        return -1;
> +    }
> +
> +    current = calloc(nr_leaves, sizeof(*current));
> +    if ( !current )
> +    {
> +        PERROR("Failed to allocate resources");
> +        errno = ENOMEM;
> +        return -1;
> +    }
> +
> +    rc = xc_cpu_policy_serialise(xch, policy, current, &nr_leaves, NULL, 0);
> +    if ( rc )
> +        goto out;
> +
> +    for ( i = 0; i < nr; i++ )
> +    {
> +        const xen_cpuid_leaf_t *update = &leaves[i];
> +
> +        for ( j = 0; j < nr_leaves; j++ )
> +            if ( current[j].leaf == update->leaf &&
> +                 current[j].subleaf == update->subleaf )
> +            {
> +                /*
> +                 * NB: cannot use an assignation because of the const vs
> +                 * non-const difference.
> +                 */
> +                memcpy(&current[j], update, sizeof(*update));

I'm having trouble understanding the comment. In

    current[j] = *update;

the lvalue is xen_cpuid_leaf_t and the rvalue is const xen_cpuid_leaf_t.
That the usual (and permitted) arrangement afaics.

Jan

