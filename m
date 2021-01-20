Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3543BC433DB
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 18:05:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09DB223E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 18:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E09DB223E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71704.128624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HrR-0007z7-AV; Wed, 20 Jan 2021 18:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71704.128624; Wed, 20 Jan 2021 18:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HrR-0007z0-6i; Wed, 20 Jan 2021 18:05:41 +0000
Received: by outflank-mailman (input) for mailman id 71704;
 Wed, 20 Jan 2021 18:05:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2HrQ-0007yt-0K
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 18:05:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2HrK-0006e2-OO; Wed, 20 Jan 2021 18:05:34 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2HrK-0001YE-Dl; Wed, 20 Jan 2021 18:05:34 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=B1bc4piYFybsa0Y1dwlyxev7i8CQ4bsWS1AkeW5LKvw=; b=LjYX/bXvXCkfRLY+BoR/GzDEPu
	xWNCxWuIdM5k70p07x17G00HUqNF8EwZv6Wnckfo4syHnbD7yjiWjQFt2+TfmfW4AwSXzYGEPNNRL
	8qFq66QMg2UiJRukYsQQfqHKrL+dADLBt2rdRuNhgiQFYo6BVSzHJKVoGEgatdZDZ4uQ=;
Subject: Re: [PATCH] xen: acpi: Hide UART address only if SPCR exists
To: Elliott Mitchell <ehem+xen@m5p.com>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 bertrand.marquis@arm.com, andre.przywara@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monn?? <roger.pau@citrix.com>
References: <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
 <160129689861.4486.15700361505030965554.stgit@localhost>
 <YAaJXRTbMyDW4zP+@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9a9618ba-1f93-7c7f-f181-22405e5ea6f9@xen.org>
Date: Wed, 20 Jan 2021 18:05:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YAaJXRTbMyDW4zP+@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 19/01/2021 07:25, Elliott Mitchell wrote:
> On Mon, Sep 28, 2020 at 09:41:39PM +0900, Masami Hiramatsu wrote:
>> With Julien's ACPI fix, I found my DeveloperBox (
>> https://www.96boards.org/product/developerbox/ ) still failed
>> to boot bcause of SPCR issue. According to the UEFI EDK2
>> implementation, the SCPR table will not be made if user
>> chooses graphical console instead of serial.
>> In such case, we should ignore the SPCR missing error.
> 
> You weren't the only person running into this.  Since you didn't get
> back sooner I ended up submitting a pretty similar patch (I kept the
> printk() due to informational value).

Right, a cut-down version of the patch submitted has been merged.

@Masami, I believe all the ACPI patches for Arm went in. Would you mind 
to try the latest staging branch?

> 
> 861f0c110976fa8879b7bf63d9478b6be83d4ab6 on master (switching to "main"
> in the future?)

There was a discussion about it a few months ago. The last input we were 
waiting on github to make the change and adopt the same name.

Feel free to give a nudge on the thread [1].

Cheers,

[1] <24307.31637.214096.240023@mariner.uk.xensource.com>


-- 
Julien Grall

