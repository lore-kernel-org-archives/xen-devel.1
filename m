Return-Path: <SRS0=syOn=JY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F74C433B4
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 06:56:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 094A361076
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 06:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 094A361076
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.118032.223992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbHe4-0007dh-EC; Tue, 27 Apr 2021 06:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118032.223992; Tue, 27 Apr 2021 06:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbHe4-0007da-BC; Tue, 27 Apr 2021 06:56:32 +0000
Received: by outflank-mailman (input) for mailman id 118032;
 Tue, 27 Apr 2021 06:56:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbHe3-0007dV-2g
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 06:56:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f715d80-4288-417f-b627-7e262185731c;
 Tue, 27 Apr 2021 06:56:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48CFDAF88;
 Tue, 27 Apr 2021 06:56:29 +0000 (UTC)
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
X-Inumbo-ID: 6f715d80-4288-417f-b627-7e262185731c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619506589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjGui25wUiC5sijz/4iOg+LwF5L69MBvHR4cTMbP3VI=;
	b=PWtwKxhHVa7RiNpR8dpGaFFzz7cQepGl+yCcwytfAfFw8gj5sgQ6k+nfVCK6N+wDefjfgl
	VU+3aPOATlWDipbaLpBCfS5ookNFwmO7JA3u3R75ef1thBxN53MzJExwwP/+T9eg3JpXxt
	If7Rms4bT7zfUmStj/4FGKTVbuc7fA4=
Subject: Re: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
To: Scott Davis <scottwd@gmail.com>
Cc: Scott Davis <scott.davis@starlab.io>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <0a292d952ff71dbfed5234d27b42a05f7b49a1fe.1619451434.git.scott.davis@starlab.io>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cea1d2d0-fd69-a4cd-6653-dd881d07b96a@suse.com>
Date: Tue, 27 Apr 2021 08:56:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0a292d952ff71dbfed5234d27b42a05f7b49a1fe.1619451434.git.scott.davis@starlab.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.04.2021 19:25, Scott Davis wrote:
> This patch modifies Xen's behavior when making devices assignable while the
> iommu=no-quarantine command line option is in effect. Currently this option
> only affects device deassignment, causing devices to get immediately assigned
> back to Dom0 instead of to the quarantine dom_io domain. This patch extends
> no-quarantine to device assignment as well, preventing devices from being
> assigned to dom_io when they are made assignable while no-quarantine is in
> effect.

Well, the term "quarantine" to me means a safety action taken _after_
possible exposure to something "bad". Therefore I see this being specific
to device de-assignment as the logical thing. Hence if a mode like what
you describe was wanted, I don't think it should be the result of
"iommu=no-quarantine".

> First patch submission, apologies in advance for any formatting or other errors.

I couldn't spot any, except maybe ...

> Background: I am setting up a QEMU-based development and testing environment for
> the Crucible team at Star Lab that includes emulated PCIe devices for
> passthrough and hotplug. I encountered an issue with `xl pci-assignable-add`
> that causes the host QEMU to rapidly allocate memory until getting OOM-killed.
> I then found that the issue could be worked around either by using manual sysfs
> commands to rebind devices to pciback or by skipping over the quarantine logic
> in `libxl__device_pci_assignable_add`, producing a working system. I hoped that
> setting iommu=no-quarantine on the command line would have the same effect, only
> to be surprised that it did not.

... some of this "why do we want this" would belong in the commit message
imo, not just here.

Jan

