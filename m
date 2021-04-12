Return-Path: <SRS0=44Tx=JJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DA9C433B4
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 06:46:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5ADD61209
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 06:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5ADD61209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.108806.207589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVqKe-0003mO-Vt; Mon, 12 Apr 2021 06:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108806.207589; Mon, 12 Apr 2021 06:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVqKe-0003mH-RZ; Mon, 12 Apr 2021 06:46:00 +0000
Received: by outflank-mailman (input) for mailman id 108806;
 Mon, 12 Apr 2021 06:46:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqkM=JJ=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lVqKe-0003mC-2A
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 06:46:00 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cd3c1913-bcbc-4ddb-8ec2-adc024b06e12;
 Mon, 12 Apr 2021 06:45:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EEAA1FB;
 Sun, 11 Apr 2021 23:45:58 -0700 (PDT)
Received: from [10.57.12.29] (unknown [10.57.12.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C3983F73B;
 Sun, 11 Apr 2021 23:45:57 -0700 (PDT)
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
X-Inumbo-ID: cd3c1913-bcbc-4ddb-8ec2-adc024b06e12
Subject: Re: [PATCH v2] xen/arm: kernel: Propagate the error if we fail to
 decompress the kernel
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>
References: <20210406191554.12012-1-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <591603c5-ebcb-e9d6-74a0-bed921458a69@arm.com>
Date: Mon, 12 Apr 2021 08:45:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406191554.12012-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.04.2021 21:15, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, we are ignoring any error from perform_gunzip() and replacing
> the compressed kernel with the "uncompressed" kernel.
> 
> If there is a gzip failure, then it means that the output buffer may
> contain garbagge. So it can result to various sort of behavior that may
> be difficult to root cause.
> 
> In case of failure, free the output buffer and propagate the error.
> We also need to adjust the return check for kernel_compress() as
> perform_gunzip() may return a positive value.
> 
> Take the opportunity to adjust the code style for the check.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - Fix build
> ---

Reviewed-by: Michal Orzel <michal.orzel@arm.com>

