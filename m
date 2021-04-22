Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FB3C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 15:16:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2E216144A
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 15:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2E216144A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115634.220658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZb3m-0001AL-Uy; Thu, 22 Apr 2021 15:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115634.220658; Thu, 22 Apr 2021 15:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZb3m-0001AE-Rr; Thu, 22 Apr 2021 15:16:06 +0000
Received: by outflank-mailman (input) for mailman id 115634;
 Thu, 22 Apr 2021 15:16:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZb3l-0001A9-AJ
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:16:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11231367-2b32-44da-812a-6abdbb6ee2c6;
 Thu, 22 Apr 2021 15:16:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D546AF9E;
 Thu, 22 Apr 2021 15:16:03 +0000 (UTC)
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
X-Inumbo-ID: 11231367-2b32-44da-812a-6abdbb6ee2c6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619104563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkrS5Dxrb1ouK8VtwGEkh5+X/L5fhslUZ1usjLo8vSc=;
	b=GUNZNQaO/jkQoegnioQaMiAtk4QDzpmlHgZUBGMSLbFtV5BTZalH7QPEbdCNus9LoRlUVs
	ysPByqkQJ1gHh8KYGQagyKga5/7X7axPIJaw2sTmnDc9t7xHWPfdO7NKg19z/DNBAXKImi
	xIE2dkKMNRAxvhpaUYGLJSMyvWmZcOI=
Subject: Re: [PATCH 0/3] xen: remove some checks for always present Xen
 features
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
References: <20210422151007.2205-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df27aba6-c67e-d66e-f00e-75a1f76de921@suse.com>
Date: Thu, 22 Apr 2021 17:16:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210422151007.2205-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.04.2021 17:10, Juergen Gross wrote:
> Some features of Xen can be assumed to be always present, so add a
> central check to verify this being true and remove the other checks.
> 
> Juergen Gross (3):
>   xen: check required Xen features
>   xen: assume XENFEAT_mmu_pt_update_preserve_ad being set for pv guests
>   xen: assume XENFEAT_gnttab_map_avail_bits being set for pv guests

I wonder whether it's a good idea to infer feature presence from
version numbers. If (at some point in the past) you had inferred
gnttab v2 being available by version, this would have been broken
by its availability becoming controllable by a command line option
in Xen.

Jan

