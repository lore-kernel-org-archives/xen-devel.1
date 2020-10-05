Return-Path: <SRS0=LTrL=DM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6403C46466
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2020 14:42:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A77F207F7
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2020 14:42:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="ca6HqU6B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A77F207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3044.8792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPRgv-0004yr-Hn; Mon, 05 Oct 2020 14:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3044.8792; Mon, 05 Oct 2020 14:42:17 +0000
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
	id 1kPRgv-0004yk-Ca; Mon, 05 Oct 2020 14:42:17 +0000
Received: by outflank-mailman (input) for mailman id 3044;
 Mon, 05 Oct 2020 14:42:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9LJO=DM=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kPRgt-0004yf-Ch
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 14:42:15 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 843a6ff9-53e2-4cde-8c72-46d486f9fdc6;
 Mon, 05 Oct 2020 14:42:13 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kPRgo-0007OE-Mh; Mon, 05 Oct 2020 14:42:10 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kPRgn-0003Xa-7S; Mon, 05 Oct 2020 14:42:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=9LJO=DM=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kPRgt-0004yf-Ch
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 14:42:15 +0000
X-Inumbo-ID: 843a6ff9-53e2-4cde-8c72-46d486f9fdc6
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 843a6ff9-53e2-4cde-8c72-46d486f9fdc6;
	Mon, 05 Oct 2020 14:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=8N2w0bCF8xdyrdHEbT/a55lf3SbpFUtlG7dLfXuvNio=; b=ca6HqU6B6+71YR0zL7fyuUP8K1
	YSGWWdl5sVDPFg3vAc4iB+0qS8Cr0gxj6/pr3m2aB869lthM4l+hSIdgd5CsswVCy+HfdKsYnb1J/
	F+lFY55GD9ETb7mgjugH4lDlPCqlkrhp09GnbJO6HaRfByyJku7X2HScrMz4iaycHxxU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kPRgo-0007OE-Mh; Mon, 05 Oct 2020 14:42:10 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kPRgn-0003Xa-7S; Mon, 05 Oct 2020 14:42:10 +0000
Subject: Re: [PATCH] ioreq: cope with server disappearing while I/O is pending
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201005140817.1339-1-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <ea27f64b-deea-a80e-ed05-e4a6dd8e11f9@xen.org>
Date: Mon, 5 Oct 2020 15:42:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201005140817.1339-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Paul,

On 05/10/2020 15:08, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Currently, in the event of an ioreq server being destroyed while I/O is
> pending in the attached emulator, it is possible that hvm_wait_for_io() will
> dereference a pointer to a 'struct hvm_ioreq_vcpu' or the ioreq server's
> shared page after it has been freed.

So the IOREQ code will call domain_pause() before destroying the IOREQ.

A vCPU can only be descheduled in hvm_wait_for_io() from 
wait_on_xen_event_channel(). AFAIK, we would schedule a new vCPU (or 
idle) when this happens.

On x86, the schedule() function will not return after context switch. 
Therefore...

> This will only occur if the emulator (which is necessarily running in a
> service domain with some degree of privilege) does not complete pending I/O
> during tear-down and is not directly exploitable by a guest domain.

... I am not sure how this can happen on x86. Do you mind providing an 
example?

Note that on Arm, the schedule() function will return after context 
switch. So the problem you describe is there from an arch-agnostic PoV.

Cheers,

-- 
Julien Grall

