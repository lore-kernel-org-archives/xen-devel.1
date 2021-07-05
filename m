Return-Path: <SRS0=1i6W=L5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB58C07E98
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 09:00:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F066B613C9
	for <xen-devel@archiver.kernel.org>; Mon,  5 Jul 2021 09:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F066B613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.149950.277328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KSf-00070s-3m; Mon, 05 Jul 2021 09:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149950.277328; Mon, 05 Jul 2021 09:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KSf-00070l-0Z; Mon, 05 Jul 2021 09:00:17 +0000
Received: by outflank-mailman (input) for mailman id 149950;
 Mon, 05 Jul 2021 09:00:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rHuV=L5=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1m0KSd-0006zF-RP
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:00:15 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 695d0bb2-dd6f-11eb-8440-12813bfff9fa;
 Mon, 05 Jul 2021 09:00:14 +0000 (UTC)
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
X-Inumbo-ID: 695d0bb2-dd6f-11eb-8440-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625475614;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=gpO5L/u3UREsXqa+45yj/y5IgBmcrphWeBHKfwFoxyU=;
  b=Jru943seSsk1fSyOX+KotrQZ6mabhAopNlZIJlqVnbNZlOO5w0kdouvU
   JWj1WcmlsRso8+xWzOd3ZUR+A2GpAHyMJa0VmjZ9++Mio1k9riOuCUXkv
   1x3v36ZrVU/DsmgINC9JAsL/hsQTYtNNXZijPziyQT4pqCr3sOxtjkCQF
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yAvmx3gRms4eoTLKidZquDxJgStGcrFGo3KXYKeFxjc8KgZLmpWIGNMk5ApCKEVqkS5fe6i97H
 2S4gql+jqdeG0yMEB5M9+W09Xu6R0Z1vcNifRPqIcRQFFhCOOymfE2DSVsNOlzV4l8MyCSYDcy
 SY7Nwbr1lZIVgKSvcya3OwSlr+Mq/K/ITySj/1Pp+gGBO2adfg/n7P4qsMO9CEeOzULhc3zUar
 G7w2hHcqc3Cb8+fS379AHbyXwheAcyxRb15j6lKdMPUrVPXweSd5vOqWrhc+tOIm3NgqCSL9Jg
 6hQ=
X-SBRS: 5.1
X-MesageID: 49192802
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:032I/qASyTEq38blHemQ55DYdb4zR+YMi2TC1yhKJiC9Afbo8f
 xG+85rrCMc6QxhP03I9urwW5VoLUm8yXcx2/h0AV7AZniChILLFuFfBOLZqlWKcREWtNQy6U
 4JSdkHNDSaNzVHZKjBjDVQX+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="49192802"
Subject: Re: [PATCH] xen/events: reset active flag for lateeoi events later
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20210623130913.9405-1-jgross@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <41f6aeaa-583f-9b00-7789-d8a6f751b49d@citrix.com>
Date: Mon, 5 Jul 2021 10:00:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623130913.9405-1-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2021-06-23 14:09, Juergen Gross wrote:
> In order to avoid a race condition for user events when changing
> cpu affinity reset the active flag only when EOI-ing the event.
> 
> This is working fine as all user events are lateeoi events. Note that
> lateeoi_ack_mask_dynirq() is not modified as there is no explicit call
> to xen_irq_lateeoi() expected later.
> 
> Reported-by: Julien Grall <julien@xen.org>
> Fixes: b6622798bc50b62 ("xen/events: avoid handling the same event on two cpus at the same time")
> Tested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---

Hi Juergen,

Are you planning on backporting this fix to releases <= 5.10?

I think the fix may need some minor adjustment to make it work after
"xen/events: fix setting irq affinity" since both lateeoi_ack_dynirq()
and lateeoi_mask_ack_dynirq() were adjusted to call ack_dynirq().

Thanks,
Ross

