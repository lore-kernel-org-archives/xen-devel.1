Return-Path: <SRS0=Zzob=IT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68820C433C1
	for <xen-devel@archiver.kernel.org>; Sun, 21 Mar 2021 21:01:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 113B66192E
	for <xen-devel@archiver.kernel.org>; Sun, 21 Mar 2021 21:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 113B66192E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.99867.189977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lO5Bn-0004BR-1r; Sun, 21 Mar 2021 21:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99867.189977; Sun, 21 Mar 2021 21:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lO5Bm-0004BK-Uz; Sun, 21 Mar 2021 21:00:46 +0000
Received: by outflank-mailman (input) for mailman id 99867;
 Sun, 21 Mar 2021 21:00:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6VPd=IT=amazon.com=prvs=7076807ca=andyhsu@srs-us1.protection.inumbo.net>)
 id 1lO5Bm-0004BF-0Z
 for xen-devel@lists.xenproject.org; Sun, 21 Mar 2021 21:00:46 +0000
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e59c070d-cc04-47f1-ad6b-d0192263843d;
 Sun, 21 Mar 2021 21:00:45 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 21 Mar 2021 21:00:39 +0000
Received: from EX13D12EUA002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id C740FA1F51; Sun, 21 Mar 2021 21:00:36 +0000 (UTC)
Received: from 147dda3ee008.ant.amazon.com (10.43.166.52) by
 EX13D12EUA002.ant.amazon.com (10.43.165.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Sun, 21 Mar 2021 21:00:33 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e59c070d-cc04-47f1-ad6b-d0192263843d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1616360446; x=1647896446;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=bR/zGL5bgmIYKJX4KBNvUn1W7VU3s2jvkoCpPNEsc+Y=;
  b=D+80gHtukbZoYMZx8KbnoPhQyra/OZnnFHS7/XDep9bqxDXTZIR6vCnz
   QPj3mzZEIsBYjFWqDHndISrWokjBAmCVvGwbjXEttGPPUj/uei55tI48E
   X+278dJOrIIHhVvRDJopZNwLlJpG4irJX3jgW5vS5CrNLmtVVq33SztIU
   c=;
X-IronPort-AV: E=Sophos;i="5.81,266,1610409600"; 
   d="scan'208";a="99384150"
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable ctrl-ring
To: Andrew Lunn <andrew@lunn.ch>
CC: Leon Romanovsky <leon@kernel.org>, <netdev@vger.kernel.org>,
	<wei.liu@kernel.org>, <paul@xen.org>, <davem@davemloft.net>,
	<kuba@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20210311225944.24198-1-andyhsu@amazon.com>
 <YEuAKNyU6Hma39dN@lunn.ch> <ec5baac1-1410-86e4-a0d1-7c7f982a0810@amazon.com>
 <YEvQ6z5WFf+F4mdc@lunn.ch> <YE3foiFJ4sfiFex2@unreal>
 <64f5c7a8-cc09-3a7f-b33b-a64d373aed60@amazon.com> <YFI676dumSDJvTlV@unreal>
 <f3b76d9b-7c82-d3bd-7858-9e831198e33c@amazon.com> <YFeAzfJsHAqPvPuY@unreal>
 <12f643b5-7a35-d960-9b1f-22853aea4b4c@amazon.com> <YFeso1fr1hLxi3lR@lunn.ch>
From: "Hsu, Chiahao" <andyhsu@amazon.com>
Message-ID: <818b5f7c-92ce-dca9-ee83-c6220c8292da@amazon.com>
Date: Sun, 21 Mar 2021 22:00:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFeso1fr1hLxi3lR@lunn.ch>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.43.166.52]
X-ClientProxiedBy: EX13D10EUA003.ant.amazon.com (10.43.165.52) To
 EX13D12EUA002.ant.amazon.com (10.43.165.103)
Precedence: Bulk



Andrew Lunn 於 2021/3/21 21:29 寫道:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>
>
>
>>> At the end, it will be more granular module parameter that user still
>>> will need to guess.
>> I believe users always need to know any parameter or any tool's flag before
>> they use it.
>> For example, before user try to set/clear this ctrl_ring_enabled, they
>> should already have basic knowledge about this feature,
>> or else they shouldn't use it (the default value is same as before), and
>> that's also why we use the 'ctrl_ring_enabled' as parameter name.
> To me, it seems you are fixing this problem in the wrong place. As a
> VM user in the cloud, i have no idea how the cloud provider needs the
> VM configured to allow the cloud provider to migrate the VM to
> somewhere else in the bitbarn. As the VM user, it should not be my
> problem. I would expect the cloud provider to configure the VM host to
> only expose facilities to the VM which allows it to be migrated.
'the users' I mentioned it's the cloud provider, not a VM user. Sorry 
for the confusion.
And agree with you, just wondering how the cloud provider can expose the 
facilities to the VM if there's no way to set/clr it at runtime, unless 
reconfigure kernel?  These features are enabled by default.
>
> This is a VM host problem, not a VM problem.
>
>       Andrew


Thanks


