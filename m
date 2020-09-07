Return-Path: <SRS0=WVJZ=CQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B82C2BC11
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2020 07:19:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC99206B8
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2020 07:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC99206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFBR6-0000cC-PV; Mon, 07 Sep 2020 07:19:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFBR5-0000c6-7v
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 07:19:31 +0000
X-Inumbo-ID: 4878c1ce-cc42-485e-b2a4-d48fbd012d77
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4878c1ce-cc42-485e-b2a4-d48fbd012d77;
 Mon, 07 Sep 2020 07:19:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B303AD49;
 Mon,  7 Sep 2020 07:19:30 +0000 (UTC)
Subject: Re: [xen-unstable bisection] complete test-amd64-i386-xl-shadow
To: xen-devel@lists.xenproject.org
References: <E1kF3SG-0000mV-7s@osstest.test-lab.xenproject.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <268c60de-a2b2-e4d5-f349-633c1dc6bafe@suse.com>
Date: Mon, 7 Sep 2020 09:19:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <E1kF3SG-0000mV-7s@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 00:48, osstest service owner wrote:
> branch xen-unstable
> xenbranch xen-unstable
> job test-amd64-i386-xl-shadow
> testid guest-saverestore
> 
> Tree: linux git://xenbits.xen.org/linux-pvops.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: xen git://xenbits.xen.org/xen.git
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  xen git://xenbits.xen.org/xen.git
>   Bug introduced:  696c273f3d9a169911308fb7e0a702a3eb6a150d
>   Bug not present: a609b6577f7867db4be1470130b7b3c686398c4f
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153833/
> 
> 
>   commit 696c273f3d9a169911308fb7e0a702a3eb6a150d
>   Author: Jan Beulich <jbeulich@suse.com>
>   Date:   Fri Sep 4 11:13:01 2020 +0200
>   
>       x86: generalize padding field handling

Oh, so I'm guilty in all the test failures over the weekend. That's
surely unexpected, and I have no immediate idea why this is. Will
hopefully find time later today to look into this, but if in the
meantime anyone has any idea ...

Jan


