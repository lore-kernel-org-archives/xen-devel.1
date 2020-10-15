Return-Path: <SRS0=IsAa=DW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF8FC433E7
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2020 09:20:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87EC22224A
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2020 09:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cf5J2IiM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87EC22224A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.7180.18815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSzQx-0007hi-Jy; Thu, 15 Oct 2020 09:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7180.18815; Thu, 15 Oct 2020 09:20:27 +0000
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
	id 1kSzQx-0007hb-FR; Thu, 15 Oct 2020 09:20:27 +0000
Received: by outflank-mailman (input) for mailman id 7180;
 Thu, 15 Oct 2020 09:20:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSzQw-0007hW-G3
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 09:20:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2658bd47-bd55-496a-a07f-dba18147df3e;
 Thu, 15 Oct 2020 09:20:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4D25AF16;
 Thu, 15 Oct 2020 09:20:24 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSzQw-0007hW-G3
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 09:20:26 +0000
X-Inumbo-ID: 2658bd47-bd55-496a-a07f-dba18147df3e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2658bd47-bd55-496a-a07f-dba18147df3e;
	Thu, 15 Oct 2020 09:20:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602753625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QMv7UBCOvFBSjIe6lxfS+zRlNYNSopMWBW8nh0iSO2k=;
	b=cf5J2IiMXlLYUlzoCWwW7KWh9DPz1TbBslSxPpFHWEghaDFQvO203IrRgPHGT+gy85WKXx
	wdStFKlLLEsHTpGeheZh6I2fV6Fdw/Fykw7PYgGEkQ3bYxW0iE0s4M/iSXg1bokQuXr5kK
	1m+e8PsTpstUOKLtE9Yc35MBoUkkWtM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E4D25AF16;
	Thu, 15 Oct 2020 09:20:24 +0000 (UTC)
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
 <72589937-a918-96c8-4589-6d30efaead9a@suse.com>
 <U00A4lb9CgpRhV9huYxk5kvyAAam9UcFJ7h2K1a6-M84ef8W58V4Shq7hmU5WKh3rKaVRl6EiTXVmDc-czrBJvyf7h1mjh3Dc3SPvj8qIog=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5db65e32-31aa-57a5-f82b-ebe497f493f5@suse.com>
Date: Thu, 15 Oct 2020 11:20:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <U00A4lb9CgpRhV9huYxk5kvyAAam9UcFJ7h2K1a6-M84ef8W58V4Shq7hmU5WKh3rKaVRl6EiTXVmDc-czrBJvyf7h1mjh3Dc3SPvj8qIog=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 11:14, Dylanger Daly wrote:
> Indeed this is for dom0, I only recently tried limiting a domU to 1 core and observed absolutely no softlocks, UI animations are smooth as butter with 1 core only.
> 
> Indeed I believe this is a CPU Scheduling issue, I've tried both the older credit and RTDS however both don't boot correctly.

This wants reporting (with sufficient data, i.e. at least a serial log)
as separate issues.

> The number of cores on this CPU is 8, 16 threads however Qubes by default disables SMT, sched_credit2_max_cpus_runqueue is 16 by default, I've tried testing with setting this to 7 or 8 however it'll either not boot, or nothing will change.

Failure to boot, unless with insane command line options, should always
be reported to it can be fixed.

I'm afraid neither part of the reply gets you/us any closer to an
understanding of your softlockup issues. As a random thought, have you
tried disabling use of (deep) C-states? This is known to have helped
to work around errata on other hardware, so may be worth a try.

Jan

