Return-Path: <SRS0=CWmW=OO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB9DC433F5
	for <xen-devel@archiver.kernel.org>; Fri, 24 Sep 2021 02:06:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E0960F11
	for <xen-devel@archiver.kernel.org>; Fri, 24 Sep 2021 02:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92E0960F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.194745.346995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTabf-0000Sc-SC; Fri, 24 Sep 2021 02:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194745.346995; Fri, 24 Sep 2021 02:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTabf-0000SV-OS; Fri, 24 Sep 2021 02:06:31 +0000
Received: by outflank-mailman (input) for mailman id 194745;
 Fri, 24 Sep 2021 02:06:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTabe-0000SP-GZ
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 02:06:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07d8ffa2-1cdc-11ec-ba98-12813bfff9fa;
 Fri, 24 Sep 2021 02:06:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A48BA61108;
 Fri, 24 Sep 2021 02:06:28 +0000 (UTC)
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
X-Inumbo-ID: 07d8ffa2-1cdc-11ec-ba98-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632449188;
	bh=g08zLt9Gkbbfyj1h5ZtLbvf52EBAgqKephgTJlG3dd4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KiBCSUOJa6YEJmeG7qxp9usHG4tWV3jbmYGmzO/5LplVxJzaMn7+nDfIKhylqMlR2
	 x97+q5b6zUcmew+9N/PTV0C+jdKb6MEcR+uJKsw83ODwLkglVhjd/rPPoTzUfo2sy6
	 /375Xz0qyHgOXbmQunA4dCFQoBP0z89rsNgwGyfNSFsCQaGSxvlD6Na2+u/bjwpu3P
	 B06uuXMZEaDKoCFhAA3Wwc1vHdb7yB9bEdo/LQeR3JxClvJhh04bx+s96r+c1tWZjG
	 s5IsNk9yMnINAT7eRtjjlFkGC/8JcWjh7boSVsleKIcQqWd6OYZLY4Cs1EqLTGWE+k
	 hVQH8kprRNIuw==
Date: Thu, 23 Sep 2021 19:06:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 24/37] xen/arm: implement two arch helpers to get memory
 map info
In-Reply-To: <20210923120236.3692135-25-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231905180.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-25-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> These two helpers are architecture APIs that are required by
> nodes_cover_memory.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/numa.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> index 3f08870d69..3755b01ef4 100644
> --- a/xen/arch/arm/numa.c
> +++ b/xen/arch/arm/numa.c
> @@ -67,3 +67,17 @@ uint8_t __node_distance(nodeid_t from, nodeid_t to)
>      return node_distance_map[from][to];
>  }
>  EXPORT_SYMBOL(__node_distance);
> +
> +uint32_t __init arch_meminfo_get_nr_bank(void)
> +{
> +	return bootinfo.mem.nr_banks;
> +}
> +
> +int __init arch_meminfo_get_ram_bank_range(uint32_t bank,
> +	paddr_t *start, paddr_t *end)
> +{
> +	*start = bootinfo.mem.bank[bank].start;
> +	*end = bootinfo.mem.bank[bank].start + bootinfo.mem.bank[bank].size;
> +
> +	return 0;
> +}

The rest of the file is indented using spaces, while this patch is using
tabs.

Also, given the implementation, it looks like
arch_meminfo_get_ram_bank_range should either return void or bool.

