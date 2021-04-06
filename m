Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B4EC433ED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 07:46:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 327C2613B7
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 07:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 327C2613B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.105658.202083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgPI-00016x-9v; Tue, 06 Apr 2021 07:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105658.202083; Tue, 06 Apr 2021 07:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgPI-00016q-6P; Tue, 06 Apr 2021 07:45:52 +0000
Received: by outflank-mailman (input) for mailman id 105658;
 Tue, 06 Apr 2021 07:45:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTgPG-00016l-TF
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 07:45:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ca01984-3766-4172-a421-be673badd0cc;
 Tue, 06 Apr 2021 07:45:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35B3CAF5A;
 Tue,  6 Apr 2021 07:45:49 +0000 (UTC)
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
X-Inumbo-ID: 5ca01984-3766-4172-a421-be673badd0cc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617695149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1SCRcNKBxEFCPFDNOXIJ+kQKt2OChDK6vWjs45jKWk=;
	b=boORjMmZjvdjw3TfEW5NA94l+9J3/NFoSyI8Mg+ObLFWgcMGy8zsxi8idG7mRGbZ5BisSi
	JZ1HIGlWrq9jn1+zgqhpUdW8El34qVqaN85M3Z5OLp4co7CN1M2s4wNzvrtTzT2xzeRwjB
	uMan7Mf8N9T4paVWDuNksDGJiaD1Mjs=
Subject: Re: [PATCH 0/2] xen/arm: Couple of bug fixes when decompressing
 kernels
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210402152105.29387-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a65f71b-e5a6-22aa-d360-4045b266229e@suse.com>
Date: Tue, 6 Apr 2021 09:45:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210402152105.29387-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.04.2021 17:21, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> The main goal of this series is to address the bug report [1]. It is not
> possible

...?

> While testing the series, I also noticed that it is not possible to
> re-use the same compressed kernel for multiple domains as the module
> will be overwritten during the first decompression.
> 
> I am still a bit undecided how to fix it. We can either create a new
> module for the uncompressed kernel and link with the compressed kernel.
> Or we could decompress everytime.
> 
> One inconvenience to kernel to only decompress once is we have to keep
> it until all the domains have booted. This may means a lot of memory to be
> wasted just for keeping the uncompressed kernel (one my setup, it takes
> ~3 times more space).
> 
> Any opinions on how to approach it?

Well, it's not "until all the domains have booted", but until all the
domains have had their kernel image placed in the designated piece of
memory. So while for the time being multiple decompression may indeed
be a reasonable approach, longer term one could populate all the
domains' memory in two steps - first just the kernel space for all of
them, then load the kernel(s), then populate the rest of the memory.

Jan

