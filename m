Return-Path: <SRS0=TkWG=EY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2C6C5519F
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 15:51:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16AC5247A7
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 15:51:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="xPOU7ugc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16AC5247A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.30070.59790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfPjW-00060Q-UL; Wed, 18 Nov 2020 15:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30070.59790; Wed, 18 Nov 2020 15:50:58 +0000
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
	id 1kfPjW-00060J-RK; Wed, 18 Nov 2020 15:50:58 +0000
Received: by outflank-mailman (input) for mailman id 30070;
 Wed, 18 Nov 2020 15:50:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfPjV-00060D-TU
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:50:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfPjS-0004Fs-0U; Wed, 18 Nov 2020 15:50:54 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfPjR-0000ES-LH; Wed, 18 Nov 2020 15:50:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfPjV-00060D-TU
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=H2OnZGygED/PBqBVpxIVeWg1cYBzDTz72kzvRW1xj6E=; b=xPOU7ugciOwcX+UsEXtq7TBf7x
	zcsq/TzIEKZkiZto6qzy1jfiektakyPsP9fRhy3kBfZYhwf2VloF1w0LZqyjPE+bNncoergwdQ6s4
	Pf5TKGF9utmr90CcaVXuXnf3GF514e9Rg/XVWm0sTCAZbSsGWvlHi7c8A5z115sZgppA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfPjS-0004Fs-0U; Wed, 18 Nov 2020 15:50:54 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfPjR-0000ES-LH; Wed, 18 Nov 2020 15:50:53 +0000
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3740e147-719a-4e97-bb0e-fe9bd2ec2aa5@xen.org>
Date: Wed, 18 Nov 2020 15:50:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 16/11/2020 12:25, Rahul Singh wrote:
> NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
> is enabled for ARM, compilation error is observed for ARM architecture
> because ARM platforms do not have full PCI support available.
 >
> Introducing new kconfig option CONFIG_HAS_NS16550_PCI to support
> ns16550 PCI for X86.
> 
> For X86 platforms it is enabled by default. For ARM platforms it is
> disabled by default, once we have proper support for NS16550 PCI for
> ARM we can enable it.
> 
> No functional change.

NIT: I would say "No functional change intended" to make clear this is 
an expectation and hopefully will be correct :).

Regarding the commit message itself, I would suggest the following to 
address Jan's concern:

"
xen/char: ns16550: Gate all PCI code with a new Kconfig HAS_NS16550_PCI

The NS16550 driver is assuming that NS16550 PCI card are usable if the 
architecture supports PCI (i.e. CONFIG_HAS_PCI=y). However, the code is 
very x86 focus and will fail to build on Arm (/!\ it is not all the errors):

  ns16550.c: In function ‘ns16550_init_irq’:
ns16550.c:726:21: error: implicit declaration of function ‘create_irq’; 
did you mean ‘release_irq’? [-Werror=implicit-function-declaration]
          uart->irq = create_irq(0, false);
                      ^~~~~~~~~~
                      release_irq
ns16550.c:726:21: error: nested extern declaration of ‘create_irq’ 
[-Werror=nested-externs]
ns16550.c: In function ‘ns16550_init_postirq’:
ns16550.c:768:33: error: ‘mmio_ro_ranges’ undeclared (first use in this 
function); did you mean ‘mmio_handler’?
               rangeset_add_range(mmio_ro_ranges, uart->io_base,
                                  ^~~~~~~~~~~~~~
                                  mmio_handler
ns16550.c:768:33: note: each undeclared identifier is reported only once 
for each function it appears in
ns16550.c:780:20: error: variable ‘msi’ has initializer but incomplete type
              struct msi_info msi = {
                     ^~~~~~~~
ns16550.c:781:18: error: ‘struct msi_info’ has no member named ‘bus’
                  .bus = uart->ps_bdf[0],
                   ^~~
ns16550.c:781:24: error: excess elements in struct initializer [-Werror]
                  .bus = uart->ps_bdf[0],
                         ^~~~
ns16550.c:781:24: note: (near initialization for ‘msi’)
ns16550.c:782:18: error: ‘struct msi_info’ has no member named ‘devfn’
                  .devfn = PCI_DEVFN(uart->ps_bdf[1], uart->ps_bdf[2]),

Enabling support for NS16550 PCI card on Arm would require more plumbing 
in addition to fixing the compilation error.

Arm systems tend to have platform UART available such as NS16550, PL011. 
So there are limited reasons to get NS16550 PCI support for now on Arm.

A new Kconfig option CONFIG_HAS_NS16550_PCI is introduced to gate all 
the PCI code.

This option will be select automically for x86 platform and left 
unselectable on Arm.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
[julieng: Commit message]
Signed-off-by: Julien Grall <jgrall@amazon.com>
"

Cheers,

-- 
Julien Grall

