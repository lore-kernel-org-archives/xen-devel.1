Return-Path: <SRS0=ZQjX=I4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEF2C433C1
	for <xen-devel@archiver.kernel.org>; Tue, 30 Mar 2021 15:37:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3AD4619A7
	for <xen-devel@archiver.kernel.org>; Tue, 30 Mar 2021 15:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3AD4619A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.103606.197608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGQV-00050j-5k; Tue, 30 Mar 2021 15:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103606.197608; Tue, 30 Mar 2021 15:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGQV-00050c-1w; Tue, 30 Mar 2021 15:37:07 +0000
Received: by outflank-mailman (input) for mailman id 103606;
 Tue, 30 Mar 2021 15:37:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRGQT-00050U-3H
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 15:37:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45e71df3-201f-4986-ae9e-db6bcb50e0ce;
 Tue, 30 Mar 2021 15:37:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FF91AFF9;
 Tue, 30 Mar 2021 15:37:03 +0000 (UTC)
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
X-Inumbo-ID: 45e71df3-201f-4986-ae9e-db6bcb50e0ce
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617118623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emOCP43U5HD3LXM1xmMO0uasduBk5tfij7cy9KsNKUA=;
	b=CAJmUc0xWPmBVNqEUyC9EtU3524mpwsEPdaFWFSU0r8AJtqvGJKRMQyCksWegQg4Lzd9+T
	2ow0ydq3pq4UbqKAUB7aK71obG3AGl9H3QEtRmqCoQn7F4qVqbdPX3D5HSBA3S8P8WoIPH
	QMTDqAFhnmeuTEGB1D49/fqyO8NmS/c=
Subject: Re: [PATCH 05/21] libs/guest: introduce helper to fetch a domain cpu
 policy
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87d48996-6b8b-d801-c43b-30b919244fcb@suse.com>
Date: Tue, 30 Mar 2021 17:37:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210323095849.37858-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.03.2021 10:58, Roger Pau Monne wrote:
> Such helper is based on the existing functions to fetch a CPUID and
> MSR policies, but uses the xc_cpu_policy_t type to return the data to
> the caller.
> 
> No user of the interface introduced on the patch.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with again a minor remark (plus of course the same that I made for
patch 4):

> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2599,6 +2599,8 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
>  /* Retrieve a system policy, or get/set a domains policy. */
>  int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
>                               xc_cpu_policy_t policy);
> +int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
> +                             xc_cpu_policy_t policy);

Generally I'd expect domid_t to be used for domain IDs.

Jan

