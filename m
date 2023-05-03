Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7DCC7EE22
	for <xen-devel@archiver.kernel.org>; Wed,  3 May 2023 12:47:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.529177.823277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBsK-000722-VK; Wed, 03 May 2023 12:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529177.823277; Wed, 03 May 2023 12:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBsK-00071v-S6; Wed, 03 May 2023 12:46:28 +0000
Received: by outflank-mailman (input) for mailman id 529177;
 Wed, 03 May 2023 12:46:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puBsJ-00071Y-NZ
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 12:46:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puBsI-0002Ba-Dq; Wed, 03 May 2023 12:46:26 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puBsI-00032K-6X; Wed, 03 May 2023 12:46:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=E9fnji8EWnL4Q3KzOAL+r0yyQHK5Ln8yKDSohAdh+lY=; b=MfeyMzW5NmhzccmnDms08bftKd
	/+bAE7iZwagUAKRdP3Js3vnNU1nf8AQeMwmCvzdpB/i2fK4EhrWPK1z03zv7AABml39NNUO14quQ1
	zwd2L3Elq2guyzFZjZ9DX+4Ckk0Ll0YP+2qjhPrvKbOIkObhXxRFarPRXvWJCYanCs1I=;
Message-ID: <0654529d-fe53-f3b4-a1f2-bf3515af8e93@xen.org>
Date: Wed, 3 May 2023 13:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/13] tools/xenstore: verify command line parameters
 better
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230330085011.9170-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/03/2023 09:49, Juergen Gross wrote:
> Add some more verification of command line parameters.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_core.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 6e2fc06840..7214b3df03 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -2809,7 +2809,7 @@ int main(int argc, char *argv[])
>   			no_domain_init = true;
>   			break;
>   		case 'E':
> -			hard_quotas[ACC_NODES].val = strtoul(optarg, NULL, 10);
> +			hard_quotas[ACC_NODES].val = get_optval_int(optarg);

Ah, so that exactly what I was exactly on the other series.

I would be OK if this is kept separate:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

