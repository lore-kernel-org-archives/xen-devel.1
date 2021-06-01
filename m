Return-Path: <SRS0=atsh=K3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA70C47080
	for <xen-devel@archiver.kernel.org>; Tue,  1 Jun 2021 14:28:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B825D61209
	for <xen-devel@archiver.kernel.org>; Tue,  1 Jun 2021 14:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B825D61209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.134889.250852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo5Nn-0004td-44; Tue, 01 Jun 2021 14:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134889.250852; Tue, 01 Jun 2021 14:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo5Nm-0004tW-WA; Tue, 01 Jun 2021 14:28:38 +0000
Received: by outflank-mailman (input) for mailman id 134889;
 Tue, 01 Jun 2021 14:28:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tu9B=K3=rmail.be=alien@srs-us1.protection.inumbo.net>)
 id 1lo5Nm-0004tN-0H
 for xen-devel@lists.xen.org; Tue, 01 Jun 2021 14:28:38 +0000
Received: from mail.rmail.be (unknown [85.234.218.189])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c49875bc-3693-4736-979a-6d7cee828a54;
 Tue, 01 Jun 2021 14:28:36 +0000 (UTC)
Received: from mail.rmail.be (localhost [127.0.0.1])
 by mail.rmail.be (Postfix) with ESMTP id AE896B11C68;
 Tue,  1 Jun 2021 16:28:35 +0200 (CEST)
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
X-Inumbo-ID: c49875bc-3693-4736-979a-6d7cee828a54
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 01 Jun 2021 16:28:35 +0200
From: AL13N <alien@rmail.be>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Subject: Re: pci passthrough issue introduced between 4.14.1 and 4.15.0
In-Reply-To: <a7c0e9b0cdd8f9e709abc329c7f6239c@mail.rmail.be>
References: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
 <e9a3f7a8-7bf2-4f0a-cc25-d8ce015df1f2@suse.com>
 <a7c0e9b0cdd8f9e709abc329c7f6239c@mail.rmail.be>
Message-ID: <9d4840391d9f99bd5b3f346a7782a1f9@mail.rmail.be>
X-Sender: alien@rmail.be
User-Agent: Roundcube Webmail/1.0.9-1.2.mga5

AL13N schreef op 2021-06-01 16:06:
> Jan Beulich schreef op 2021-06-01 12:08:
>> On 01.06.2021 09:36, AL13N wrote:
>>> Not 100% it's a bug or something i did wrong, but,
>>> 
>>> with xl create i start a PV with 3 pci passthroughs
>>> 
>>> after wards, xl pci-list shows all 3 nicely
>>> 
>>> looking at the domU boot logs, pcifront is only creating one pci 
>>> device
>>> and lspci in the guest shows only 1 pci entry
>>> 
>>> in at least 4.14.1 it still works.
>> 
>> This reminds me of my report at
>> https://lists.xen.org/archives/html/xen-devel/2021-03/msg00956.html
>> 
>> Meanwhile the proposed pciback change has gone in upstream:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/xen/xen-pciback?id=c81d3d24602540f65256f98831d0a25599ea6b87
>> 
>> I wasn't, however, aware that this may have been an issue going
>> from 4.14.1 to 4.15.0, i.e. something that was presumably (as
>> George also has just said) a regression in the tools. Or else I
>> probably wouldn't have suggested taking care of this in Linux.
>> Nevertheless you may want to give that change a try.
> 
> Well, both tests have only different tools en hypervisor, no kernel
> was changed between both tests, neither in dom0 or domU , so, it might
> not be pciback?

forgot to mention, dom0 is 5.7.19 and domU is 5.10.27 for all tests

