Return-Path: <SRS0=f2UP=HK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D657BC433DB
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 10:36:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8827064DE7
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 10:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8827064DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.82712.152798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93u1-0008Ik-V5; Mon, 08 Feb 2021 10:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82712.152798; Mon, 08 Feb 2021 10:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93u1-0008Id-S8; Mon, 08 Feb 2021 10:36:21 +0000
Received: by outflank-mailman (input) for mailman id 82712;
 Mon, 08 Feb 2021 10:36:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l93u0-0008IY-7Z
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 10:36:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61db22b6-4fcd-4c70-818c-0ff2c4adf5f3;
 Mon, 08 Feb 2021 10:36:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5FFD2AC6E;
 Mon,  8 Feb 2021 10:36:18 +0000 (UTC)
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
X-Inumbo-ID: 61db22b6-4fcd-4c70-818c-0ff2c4adf5f3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612780578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5UpmvGJTacd6yUXg2H9+bLosTdiuU5Va+P2BDP3oi4Y=;
	b=QrwXNShCzDyYAZA4BYXeiZBCyfJGNbF/wzlZPiEU3K8Ie6xvQEI1yjQpnzynJRqYeVDDfU
	KODbn7VjygcHyxQAPUiPYawbNC9JOaoFJqTVptTceuTM4hTUTnHQJIaAqTaLykBtTgvKb5
	g5ANxsDslCGRmAKiMXbh/ZysXVTk3KU=
Subject: Re: [PATCH 6/7] xen/evtch: use smp barriers for user event ring
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-7-jgross@suse.com>
 <2d354cad-3413-a416-0bc1-01d03e1f41cd@citrix.com>
 <dfa40af0-2706-2540-c59a-6593c1c0553a@suse.com>
 <e68f76a5-27ce-a6d8-88a3-1e8fa1c30659@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <def49076-f943-9418-86b0-2aafbd0bf7de@suse.com>
Date: Mon, 8 Feb 2021 11:36:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e68f76a5-27ce-a6d8-88a3-1e8fa1c30659@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.02.2021 11:23, Andrew Cooper wrote:
> On 08/02/2021 09:50, Jan Beulich wrote:
>> On 08.02.2021 10:44, Andrew Cooper wrote:
>>> On 06/02/2021 10:49, Juergen Gross wrote:
>>>> The ring buffer for user events is used in the local system only, so
>>>> smp barriers are fine for ensuring consistency.
>>>>
>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> These need to be virt_* to not break in UP builds (on non-x86).
>> Initially I though so, too, but isn't the sole vCPU of such a
>> VM getting re-scheduled to a different pCPU in the hypervisor
>> an implied barrier anyway?
> 
> Yes, but that isn't relevant to why UP builds break.
> 
> smp_*() degrade to compiler barriers in UP builds, and while that's
> mostly fine for x86 read/write, its not fine for ARM barriers.

Hmm, I may not know enough of Arm's memory model - are you saying
Arm CPUs aren't even self-coherent, i.e. later operations (e.g.
the consuming of ring contents) won't observe earlier ones (the
updating of ring contents) when only a single physical CPU is
involved in all of this? (I did mention the hypervisor level
context switch simply because that's the only way multiple CPUs
can get involved.)

Jan

