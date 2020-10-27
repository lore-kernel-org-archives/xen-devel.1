Return-Path: <SRS0=J13s=EC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EE9C55178
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 17:18:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A9E520657
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 17:18:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="EYWrard2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A9E520657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12989.33479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXSbx-0005G6-SJ; Tue, 27 Oct 2020 17:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12989.33479; Tue, 27 Oct 2020 17:18:17 +0000
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
	id 1kXSbx-0005Fz-PQ; Tue, 27 Oct 2020 17:18:17 +0000
Received: by outflank-mailman (input) for mailman id 12989;
 Tue, 27 Oct 2020 17:18:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXSbw-0005Fu-H7
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 17:18:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51f4dc21-8b7e-4ec8-9acb-5d6d3afc6ec8;
 Tue, 27 Oct 2020 17:18:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6424AF3B;
 Tue, 27 Oct 2020 17:18:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXSbw-0005Fu-H7
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 17:18:16 +0000
X-Inumbo-ID: 51f4dc21-8b7e-4ec8-9acb-5d6d3afc6ec8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 51f4dc21-8b7e-4ec8-9acb-5d6d3afc6ec8;
	Tue, 27 Oct 2020 17:18:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603819095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZloFDfr7m7sdxGHJxewwdMeBuQdWLuvBKOZl5RMfns=;
	b=EYWrard2J9CuB9FZobmCmLT5bKgsNWAZ7exvrGAgx6aQFriOtOTQ8tKnpLzl13CeR9TGn9
	afF3Hfgl3ti/reNLoIaBoDZnyRF3RDhCh6o18ehZKgg9kiwGsYVn1CEtL9XUuJJbBdyHaW
	ZCLkM/XDoOE65C+FR3+O+rLx7HaYWsE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E6424AF3B;
	Tue, 27 Oct 2020 17:18:14 +0000 (UTC)
Subject: Re: ARM/PCI passthrough: libxl_pci, sysfs and pciback questions
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rahul Singh
 <Rahul.Singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <ad25a5ba-f44c-4e88-f3b0-e0baa5efc5f6@epam.com>
 <20201027125104.axv26kdqljqsvufn@Air-de-Roger>
 <ac342c70-8fbb-023d-00b3-4a1bc1d389a7@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f98534d-39fd-cbcb-13dd-bbbd994251f0@suse.com>
Date: Tue, 27 Oct 2020 18:18:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ac342c70-8fbb-023d-00b3-4a1bc1d389a7@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.10.2020 16:52, Oleksandr Andrushchenko wrote:
> On 10/27/20 2:55 PM, Roger Pau Monné wrote:
>> On Tue, Oct 27, 2020 at 09:59:05AM +0000, Oleksandr Andrushchenko wrote:
>>>    5. An alternative route for 3-4 could be to store that data in XenStore, e.g.
>>>       MMIOs, IRQ, bind sysfs path etc. This would require more code on Xen side to
>>>       access XenStore and won’t work if MMIOs/IRQs are passed via device tree/ACPI
>>>       tables by the bootloaders.
>> As above, I think I need more context to understand what and why you
>> need to save such information.
> 
> Well, with pciback absence we loose a "database" which holds all the knowledge
> 
> about which devices are assigned, bound etc.

What hasn't become clear to me (sorry if I've overlooked it) is
why some form of pciback is not an option on Arm. Where it would
need to run in your split hardware-domain / Dom0 setup (if I got
that right in the first place) would be a secondary question.

Jan

