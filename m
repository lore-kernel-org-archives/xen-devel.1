Return-Path: <SRS0=l84g=6E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60AAC3815B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 13:14:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9980B205C9
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 13:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9980B205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQWFI-0006zz-Nl; Mon, 20 Apr 2020 13:13:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQWFH-0006zt-ES
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:13:55 +0000
X-Inumbo-ID: c906f144-8308-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c906f144-8308-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 13:13:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4FE38AC92;
 Mon, 20 Apr 2020 13:13:52 +0000 (UTC)
Subject: Re: [PATCH v2] sched: print information about scheduling granularity
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200420130650.14341-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8543ad06-2b98-a211-8360-c57ee9ddafa2@suse.com>
Date: Mon, 20 Apr 2020 15:13:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420130650.14341-1-sergey.dyasli@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 15:06, Sergey Dyasli wrote:
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -40,6 +40,30 @@ static DEFINE_SPINLOCK(cpupool_lock);
>  static enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
>  static unsigned int __read_mostly sched_granularity = 1;
>  
> +static void sched_gran_print(enum sched_gran mode, unsigned int gran)
> +{
> +    char *str = "";

const please (could easily be added while committing of course)

Jan

