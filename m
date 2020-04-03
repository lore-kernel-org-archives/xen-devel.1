Return-Path: <SRS0=kYra=5T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01F8C2BA16
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2020 14:31:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE5892073B
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2020 14:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE5892073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKNLg-0005Jj-Pj; Fri, 03 Apr 2020 14:31:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKNLf-0005Jd-PT
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 14:31:07 +0000
X-Inumbo-ID: c12311c8-75b7-11ea-bd27-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c12311c8-75b7-11ea-bd27-12813bfff9fa;
 Fri, 03 Apr 2020 14:31:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 48F22AEE7;
 Fri,  3 Apr 2020 14:31:05 +0000 (UTC)
Subject: Re: [PATCH v7 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
To: Juergen Gross <jgross@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-9-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <19f84540-6b49-f99d-805a-e07f56330f31@suse.com>
Date: Fri, 3 Apr 2020 16:31:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402154616.16927-9-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.04.2020 17:46, Juergen Gross wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -353,6 +353,16 @@ config DOM0_MEM
>  
>  	  Leave empty if you are not sure what to specify.
>  
> +config HYPFS_CONFIG
> +	bool "Provide hypervisor .config via hypfs entry"
> +	default y

My initial reaction was to ask for "depends on HYPFS", but then
I noticed the earlier patch doesn't introduce such. Am I
mis-remembering that it was agreed to make the whole thing
possible to disable at least in EXPERT mode?

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -389,6 +389,16 @@ static HYPFS_STRING_INIT(compile_date, "compile_date");
>  static HYPFS_STRING_INIT(compile_domain, "compile_domain");
>  static HYPFS_STRING_INIT(extra, "extra");
>  
> +#ifdef CONFIG_HYPFS_CONFIG
> +static struct hypfs_entry_leaf config = {
> +    .e.type = XEN_HYPFS_TYPE_STRING,
> +    .e.encoding = XEN_HYPFS_ENC_GZIP,
> +    .e.name = "config",
> +    .e.read = hypfs_read_leaf,
> +    .content = &xen_config_data
> +};
> +#endif

Would be really good if no open-coded instantiations like this
one would ever have to appear, i.e. if suitable macros were
available. What's preventing use of one of the available ones
here?

Jan

