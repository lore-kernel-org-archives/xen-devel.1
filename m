Return-Path: <SRS0=vhhj=7L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F51DC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 08:34:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDD8E2075A
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 08:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDD8E2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeaT6-0004qI-7T; Fri, 29 May 2020 08:34:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeaT5-0004qB-HO
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 08:34:19 +0000
X-Inumbo-ID: 2ef25baa-a187-11ea-a87e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ef25baa-a187-11ea-a87e-12813bfff9fa;
 Fri, 29 May 2020 08:34:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8CE2AAC96;
 Fri, 29 May 2020 08:34:15 +0000 (UTC)
Subject: Re: [PATCH v10 07/12] xen: provide version information in hypfs
To: Juergen Gross <jgross@suse.com>, Paul Durrant <paul@xen.org>
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-8-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88b80e61-3fb4-8f89-0597-d6959033478b@suse.com>
Date: Fri, 29 May 2020 10:34:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519072106.26894-8-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

On 19.05.2020 09:21, Juergen Gross wrote:
> @@ -373,6 +374,52 @@ void __init do_initcalls(void)
>          (*call)();
>  }
>  
> +#ifdef CONFIG_HYPFS
> +static unsigned int __read_mostly major_version;
> +static unsigned int __read_mostly minor_version;
> +
> +static HYPFS_DIR_INIT(buildinfo, "buildinfo");
> +static HYPFS_DIR_INIT(compileinfo, "compileinfo");
> +static HYPFS_DIR_INIT(version, "version");
> +static HYPFS_UINT_INIT(major, "major", major_version);
> +static HYPFS_UINT_INIT(minor, "minor", minor_version);

These two lines fail to build with gcc 4.1 ("unknown field 'content'
specified in initializer"), which I've deliberately tried as a last
minute post-commit, pre-push check. I therefore reverted this change
before pushing.

Paul, Jürgen - please advise how to proceed, considering today's
deadline. I'd accept pushing the rest of the series, if a fix for
the issue will then still be permitted in later. Otherwise I'd have
to wait for a fixed (incremental) version.

Jan

