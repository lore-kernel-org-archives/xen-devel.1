Return-Path: <SRS0=Y5lV=N5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31138C433F5
	for <xen-devel@archiver.kernel.org>; Tue,  7 Sep 2021 19:53:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C833861106
	for <xen-devel@archiver.kernel.org>; Tue,  7 Sep 2021 19:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C833861106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eikelenboom.it
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.181312.328404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNh9N-0000sI-3l; Tue, 07 Sep 2021 19:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181312.328404; Tue, 07 Sep 2021 19:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNh9M-0000sB-Vg; Tue, 07 Sep 2021 19:52:56 +0000
Received: by outflank-mailman (input) for mailman id 181312;
 Tue, 07 Sep 2021 19:52:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g753=N5=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1mNh9L-0000s5-TG
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 19:52:56 +0000
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3051de83-1015-11ec-b121-12813bfff9fa;
 Tue, 07 Sep 2021 19:52:54 +0000 (UTC)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:40046
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1mNh99-0000xc-7f; Tue, 07 Sep 2021 21:52:43 +0200
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
X-Inumbo-ID: 3051de83-1015-11ec-b121-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=trC0etVSAP2kxLlL5V959uspM4Sc5FjGHeuAcplcm2s=; b=ALpw8XegMQbrkpYL4zIl8scRe2
	6XREaewve79+K+LHR+y3Mj01MyAfYv9yhV8KzAwlcygO/zC9U+xlglFnDPFgC8e0Iw2sSuuEEpTIm
	jg4SfhgBGLAiWgC42QlkK3fOjZATF0MW2bOaMFON/7Fa6CiqZbO+jK5l3BPe/h8/gQSQ=;
Subject: Re: xen-unstable linux-5.14: 1 of 2 multicall(s) failed: cpu 0
To: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9c36205e-cc37-ed9a-3408-0cccc4a83115@eikelenboom.it>
 <955da8ce-40f2-32c5-ee78-6801ce18afe5@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <b0854555-01fd-cbd8-6e6a-c793109b2972@eikelenboom.it>
Date: Tue, 7 Sep 2021 21:52:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <955da8ce-40f2-32c5-ee78-6801ce18afe5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07/09/2021 15:53, Juergen Gross wrote:
> On 06.09.21 23:35, Sander Eikelenboom wrote:
>> L.S.,
>>
>> On my AMD box running:
>>       xen-unstable changeset: Fri Sep 3 15:10:43 2021 +0200 git:2d4978ead4
>>       linux kernel: 5.14.1
>>
>> With this setup I'm encountering some issues in dom0, see below.
> 
> Could you test whether the attached patch (only compile tested)
> fixes the issue for you?
> 
> 
> Juergen
> 

Sure, running it now.
Since I haven't got a clear trigger, will report tomorrow if the logs stay clean :)

Thanks so far !

--
Sander

