Return-Path: <SRS0=FjyW=DQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85776C433DF
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2020 18:16:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0552E22280
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2020 18:16:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="inKv2pyp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0552E22280
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5040.12856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQwvY-0000Bt-VO; Fri, 09 Oct 2020 18:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5040.12856; Fri, 09 Oct 2020 18:15:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQwvY-0000Bm-SO; Fri, 09 Oct 2020 18:15:36 +0000
Received: by outflank-mailman (input) for mailman id 5040;
 Fri, 09 Oct 2020 18:15:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2W9l=DQ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kQwvX-0000Bh-EE
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 18:15:35 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 878b3be5-b4a3-49e6-94b0-e07c05eccdc6;
 Fri, 09 Oct 2020 18:15:34 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kQwvL-0002gX-Ru; Fri, 09 Oct 2020 18:15:23 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kQwvL-00049e-I2; Fri, 09 Oct 2020 18:15:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2W9l=DQ=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kQwvX-0000Bh-EE
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 18:15:35 +0000
X-Inumbo-ID: 878b3be5-b4a3-49e6-94b0-e07c05eccdc6
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 878b3be5-b4a3-49e6-94b0-e07c05eccdc6;
	Fri, 09 Oct 2020 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=5Z4jVQIxIVyDAbSJyOzZjF0+rPalo9kgmd8di19kV+4=; b=inKv2pypZADt89UaSjf/OqzGBf
	n9oNIqx6zUp0G20u053T0VpVC3/JmSFs4jGny7DHj8NOyjSdbCW5u0OBHvqNirQ5ZqXxG2JuLbpCU
	GJotBZlQgaZIgSUpfTZqwBHa/xJLws83vuP2q9ZvEngby9MTVlzbe7BbW61/sLUGueCA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kQwvL-0002gX-Ru; Fri, 09 Oct 2020 18:15:23 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kQwvL-00049e-I2; Fri, 09 Oct 2020 18:15:23 +0000
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 xen-devel@lists.xenproject.org, Alex Benn??e <alex.bennee@linaro.org>,
 bertrand.marquis@arm.com, andre.przywara@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monn?? <roger.pau@citrix.com>
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
 <20201008183904.GA56716@mattapan.m5p.com>
 <f0976c17-ad36-847b-7868-f6bb13948368@xen.org>
 <20201009142208.GA63582@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <55a4ac3d-dc6f-f2f6-1a98-62d1c555d26e@xen.org>
Date: Fri, 9 Oct 2020 19:15:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201009142208.GA63582@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Elliott,

On 09/10/2020 15:22, Elliott Mitchell wrote:
> On Fri, Oct 09, 2020 at 10:39:26AM +0100, Julien Grall wrote:
>> On 08/10/2020 19:39, Elliott Mitchell wrote:
>>> Your (Masami Hiramatsu) patch seems plausible, but things haven't
>>> progressed enough for me to endorse it.  Looks like something closer to
>>> the core of ACPI still needs further work, Julien Grall?
>>
>> I didn't go very far during my testing because QEMU is providing ACPI
>> 5.1 (Xen only supports 6.0+ so far).
>>
>> For your log above, Xen finished to boot and now dom0 should start
>> booting. The lack of console output may be because of a crash in Linux
>> during earlyboot.
>>
>> Do you have the early console enabled Linux? This can be done by adding
>> earlycon=xenboot on the Linux command line.
> 
> Finding all the command-line console settings can be a challenge.  I had
> thought it was supposed to be "console=hvc0 earlycon=hvc0".
> 
> With that though I finally have some output which claims to come from the
> Linux kernel (yay! finally hit this point!).  As we were both guessing,
> very early kernel panic:
> 
> [    0.000000] efi: Getting EFI parameters from FDT:
> [    0.000000] efi: Can't find 'System Table' in device tree!

Thank you for sending part of the log. Looking at Linux 5.6 code, the 
error message is printed by efi_get_fdt_params() (see 
drivers/firmware/efi.c) when one of the property is missing.

'System Table' suggests that Linux wasn't enable to find 
"linux,uefi-system-table" or "xen,uefi-system-table".

Xen will only create later. Would it be possible to add some code in 
__find_uefi_params() to confirm which property Linux thinks is missing?

> [    0.000000] cma: Failed to reserve 64 MiB
> [    0.000000] Kernel panic - not syncing: Failed to allocate page table page
> 
> I don't know whether this is a problem with the mini-DT which was passed
> in versus ACPI tables.  I note a complete lack of ACPI table information.

I think this is normal because, IIRC, the ACPI root pointer will be 
found using the System Table.

> The kernel is from a 5.6-based kernel tree.  I'm unsure which portion to
> try updating next.
> 
> 

Cheers,

-- 
Julien Grall

