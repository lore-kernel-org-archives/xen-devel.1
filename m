Return-Path: <SRS0=C5Y3=JN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D815DC433ED
	for <xen-devel@archiver.kernel.org>; Fri, 16 Apr 2021 11:56:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59E6860FF1
	for <xen-devel@archiver.kernel.org>; Fri, 16 Apr 2021 11:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59E6860FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.111682.213563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXN5E-0007zi-R9; Fri, 16 Apr 2021 11:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111682.213563; Fri, 16 Apr 2021 11:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXN5E-0007zb-O8; Fri, 16 Apr 2021 11:56:24 +0000
Received: by outflank-mailman (input) for mailman id 111682;
 Fri, 16 Apr 2021 11:56:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDum=JN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lXN5D-0007zV-5G
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 11:56:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e86ddbf6-cfce-43d4-92ed-178d4597916c;
 Fri, 16 Apr 2021 11:56:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9683B029;
 Fri, 16 Apr 2021 11:56:20 +0000 (UTC)
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
X-Inumbo-ID: e86ddbf6-cfce-43d4-92ed-178d4597916c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618574181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fGV6IPy8h7/5/vucFEBYXMXSfW7vDCPowawTfXA3TIQ=;
	b=nrHv+DuKJBeEptyJgVDaie/8CbNTTGShnvDFvoAYUmhY7/8W5qX1wjYmbfQtnn1U60QZGC
	a78Sxzr/mwKVMekU5OZ00KunLweGIe2iFsLju6FJTd35prqg7vaVRuO5yGBmUBvWq/XJiG
	MJ6fDidsBjeNN5rAMfiN+ceDZqXHdyo=
Subject: Re: [PATCH] x86/pv: Improve dom0_update_physmap() with
 CONFIG_SPECULATIVE_HARDEN_BRANCH
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210416114645.21530-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <77003550-ad73-ce4d-faa4-31128aaf0283@suse.com>
Date: Fri, 16 Apr 2021 13:56:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210416114645.21530-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.04.2021 13:46, Andrew Cooper wrote:
> dom0_update_physmap() is mostly called in two tight loops, where the lfences
> hidden in is_pv_32bit_domain() have a substantial impact.
> 
> None of the boot time construction needs protection against malicious
> speculation, so use a local variable and calculate is_pv_32bit_domain() just
> once.
> 
> Reformat the some of the code for legibility, now that the volume has reduced,
> and removal of some gratuitous negations.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one mior remark:

> @@ -463,9 +465,9 @@ int __init dom0_construct_pv(struct domain *d,
>          vinitrd_end    = vinitrd_start + initrd_len;
>          vphysmap_start = round_pgup(vinitrd_end);
>      }
> -    vphysmap_end     = vphysmap_start + (nr_pages * (!is_pv_32bit_domain(d) ?
> -                                                     sizeof(unsigned long) :
> -                                                     sizeof(unsigned int)));
> +    vphysmap_end = vphysmap_start +
> +        (nr_pages * (compat ? sizeof(unsigned int) : sizeof(unsigned long)));
> +
>      if ( parms.p2m_base != UNSET_ADDR )
>          vphysmap_end = vphysmap_start;
>      vstartinfo_start = round_pgup(vphysmap_end);

I think a blank line as separator would make more sense ahead of
and/or after the full setting of vphysmap_end, but not so much
between the two parts of it.

Jan

