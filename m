Return-Path: <SRS0=a6zz=KF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCF1C433B4
	for <xen-devel@archiver.kernel.org>; Mon, 10 May 2021 19:07:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90E5161492
	for <xen-devel@archiver.kernel.org>; Mon, 10 May 2021 19:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90E5161492
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fensystems.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.125501.236246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgBF7-0003tJ-P5; Mon, 10 May 2021 19:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125501.236246; Mon, 10 May 2021 19:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgBF7-0003tC-Ly; Mon, 10 May 2021 19:07:01 +0000
Received: by outflank-mailman (input) for mailman id 125501;
 Mon, 10 May 2021 19:06:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fIyG=KF=fensystems.co.uk=mbrown@srs-us1.protection.inumbo.net>)
 id 1lgBF5-0003t6-JD
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 19:06:59 +0000
Received: from blyat.fensystems.co.uk (unknown [54.246.183.96])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 516b5dd3-a205-40d1-b485-3b4065e6ffe0;
 Mon, 10 May 2021 19:06:58 +0000 (UTC)
Received: from dolphin.home (unknown
 [IPv6:2a00:23c6:5495:5e00:72b3:d5ff:feb1:e101])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id CBAA7442C4;
 Mon, 10 May 2021 19:06:55 +0000 (UTC)
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
X-Inumbo-ID: 516b5dd3-a205-40d1-b485-3b4065e6ffe0
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: paul@xen.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 wei.liu@kernel.org, pdurrant@amazon.com
References: <54659eec-e315-5dc5-1578-d91633a80077@xen.org>
 <20210413152512.903750-1-mbrown@fensystems.co.uk> <YJl8IC7EbXKpARWL@mail-itl>
 <404130e4-210d-2214-47a8-833c0463d997@fensystems.co.uk>
 <YJmBDpqQ12ZBGf58@mail-itl>
From: Michael Brown <mbrown@fensystems.co.uk>
Message-ID: <21f38a92-c8ae-12a7-f1d8-50810c5eb088@fensystems.co.uk>
Date: Mon, 10 May 2021 20:06:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YJmBDpqQ12ZBGf58@mail-itl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/05/2021 19:53, Marek Marczykowski-Górecki wrote:
> On Mon, May 10, 2021 at 07:47:01PM +0100, Michael Brown wrote:
>> That doesn't sound plausible to me.  In the setup as you describe, how is
>> the kernel expected to differentiate between "hotplug script has not yet
>> created the node" and "hotplug script does not exist and will therefore
>> never create any node"?
> 
> Is the later valid at all? From what I can see in the toolstack, it
> always sets some hotplug script (if not specified explicitly - then
> "vif-bridge"),

I don't see any definitive documentation around that so I can't answer 
for sure.  It's probably best to let one of the Xen guys answer that.

If you have a suggested patch, I'm happy to test that it doesn't 
reintroduce the regression bug that was fixed by this commit.

Michael

