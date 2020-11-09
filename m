Return-Path: <SRS0=Pc9a=EP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB43C388F7
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2020 12:00:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD41720789
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2020 12:00:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="HhOXk9vF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD41720789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.22432.48736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc5qg-0007of-Lc; Mon, 09 Nov 2020 12:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22432.48736; Mon, 09 Nov 2020 12:00:38 +0000
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
	id 1kc5qg-0007oY-If; Mon, 09 Nov 2020 12:00:38 +0000
Received: by outflank-mailman (input) for mailman id 22432;
 Mon, 09 Nov 2020 12:00:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kc5qf-0007oS-DG
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:00:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b195b27e-0cb2-406d-8028-a2793837a169;
 Mon, 09 Nov 2020 12:00:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2F3EABF4;
 Mon,  9 Nov 2020 12:00:35 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kc5qf-0007oS-DG
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:00:37 +0000
X-Inumbo-ID: b195b27e-0cb2-406d-8028-a2793837a169
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b195b27e-0cb2-406d-8028-a2793837a169;
	Mon, 09 Nov 2020 12:00:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604923235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6O/AVKJogNb2qz7BW4zQQMiP0+DrfWq/tB9FKD/VZn4=;
	b=HhOXk9vFP7qqyNkvuk2EoY2KXhHEGANfR/4XNwhsWyb1CkWpbV7TSu1kBwPfiFOsZ1Gaet
	MmdamZXoxSADwL201C3bGfLZxCC6TbNKYFwq/EPiSVLHBFDRccW/tj5XieU1rBEfkPXDvp
	azZqvk7dctoD8w+ASTrFtyrl90M6LAw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A2F3EABF4;
	Mon,  9 Nov 2020 12:00:35 +0000 (UTC)
Subject: Re: [PATCH v5 0/2] XSA-343 followup patches
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20201109064128.3908-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9326609-0808-8f0b-6cb9-3ed4401b9f1d@suse.com>
Date: Mon, 9 Nov 2020 13:00:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109064128.3908-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.11.2020 07:41, Juergen Gross wrote:
> The patches for XSA-343 produced some fallout, especially the event
> channel locking has shown to be problematic.
> 
> Patch 1 is targeting fifo event channels for avoiding any races for the
> case that the fifo queue has been changed for a specific event channel.
> 
> The second patch is modifying the per event channel locking scheme in
> order to avoid deadlocks and problems due to the event channel lock
> having been changed to require IRQs off by the XSA-343 patches.
> 
> Changes in V5:
> - moved evtchn_write_[un]lock() to event_channel.c (Jan Beulich)
> - used normal read_lock() in some cases (Jan Beulich)
> 
> Changes in V4:
> - switched to real rwlock
> 
> Changes in V3:
> - addressed comments
> 
> Juergen Gross (2):
>   xen/events: access last_priority and last_vcpu_id together
>   xen/evtchn: rework per event channel lock

Didn't you mean to add a 3rd patch here to drop the 2nd call to
xsm_evtchn_send() again?

Jan

