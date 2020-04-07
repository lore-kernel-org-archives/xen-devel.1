Return-Path: <SRS0=FJpJ=5X=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689EAC2D0EC
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2020 22:07:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB6D20747
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2020 22:07:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="aej6GlYk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EB6D20747
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLwMr-0006b7-3F; Tue, 07 Apr 2020 22:06:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A3/I=5X=amazon.com=prvs=3592f0f2d=apanyaki@srs-us1.protection.inumbo.net>)
 id 1jLwMp-0006aa-27
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 22:06:47 +0000
X-Inumbo-ID: 1241670a-791c-11ea-83d8-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1241670a-791c-11ea-83d8-bc764e2007e4;
 Tue, 07 Apr 2020 22:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1586297206; x=1617833206;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7lrS4ajv1ecolBDc1hjRWYWeZ/nLCJnkPuqNmCNTG4g=;
 b=aej6GlYkko6QsU/1+zf5URdhTaAy5NkeMKcfGWVLPwLBPhSVccuc1HNB
 Fd7A7YMYZY5pXH/z8XNwwCp0Ql0x4aq+wR1v5ebC969xq+tzri0g/DoE5
 FWqUs5+hWEobiBKeVQBolhRuCSeyDsLg1NKYkLoc17cv8letviuQXTRQh A=;
IronPort-SDR: WH6IT/k2I5+/psCkfUs0vAztv23ZN1gzg4bcBMx8bO7xc1huGXDwfeIKHZRwwtcY9IrK0OV6tR
 fvLxN8RsjMIw==
X-IronPort-AV: E=Sophos;i="5.72,356,1580774400"; d="scan'208";a="35840602"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 07 Apr 2020 22:06:45 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2C7D6A2A59; Tue,  7 Apr 2020 22:06:43 +0000 (UTC)
Received: from EX13D26EUB002.ant.amazon.com (10.43.166.9) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 7 Apr 2020 22:06:43 +0000
Received: from 38f9d35285e8.ant.amazon.com (10.43.162.171) by
 EX13D26EUB002.ant.amazon.com (10.43.166.9) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 7 Apr 2020 22:06:39 +0000
Subject: Re: [XEN PATCH] libxc/migration: Abort migration on precopy policy
 request
To: Wei Liu <wl@xen.org>
References: <eb85d7fee920b54eea3b4c0e77ab40593613ccc4.1586270820.git.apanyaki@amazon.com>
 <20200407202244.a6isag63njejbshe@debian>
From: "Panyakin, Andrew" <apanyaki@amazon.com>
Message-ID: <9930fbd5-10f7-5f92-348b-8856ecad3768@amazon.com>
Date: Wed, 8 Apr 2020 00:06:22 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407202244.a6isag63njejbshe@debian>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.43.162.171]
X-ClientProxiedBy: EX13D18UWC003.ant.amazon.com (10.43.162.237) To
 EX13D26EUB002.ant.amazon.com (10.43.166.9)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 4/7/20 10:22 PM, Wei Liu wrote:
> On Tue, Apr 07, 2020 at 02:52:22PM +0000, Andrew Panyakin wrote:
>> libxc defines XGS_POLICY_ABORT for precopy policy to signal that migration
>> should be aborted (eg. if the estimated pause time is too huge for the
>> instance). Default simple precopy policy never returns that, but it could be
>> overriden with a custom one.
>>
> 
> Right. I think this is a real problem.
> 
>> Signed-off-by: Andrew Panyakin <apanyaki@amazon.com>
>> ---
>>  tools/libxc/xc_sr_save.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/tools/libxc/xc_sr_save.c b/tools/libxc/xc_sr_save.c
>> index fa736a311f..507274ce22 100644
>> --- a/tools/libxc/xc_sr_save.c
>> +++ b/tools/libxc/xc_sr_save.c
>> @@ -560,6 +560,12 @@ static int send_memory_live(struct xc_sr_context *ctx)
>>
>>      }
>>
>> +    if ( policy_decision == XGS_POLICY_ABORT ) {
> 
> The { should be on a new line.
> 
>> +        PERROR("Abort precopy loop");
>> +        rc = -1;
>> +        goto out;
> 
> There is no need to have "goto out" here.

I was considering two more examples of "goto out" in a branch right before the label:
- send_domain_memory_nonlive,
- send_domain_memory_live.

Isn't it done this way to simplify the function extension: you won't need to add "goto out" to previous branch when adding new code?

> 
> These can be fixed easily while committing, so no need to resend yet. I
> will give other people a chance to comment.
> 
> Wei.
> 
>> +    }
>> +
>>   out:
>>      xc_set_progress_prefix(xch, NULL);
>>      free(progress_str);
>> --
>> 2.16.6
>>


-- 
Andrew

