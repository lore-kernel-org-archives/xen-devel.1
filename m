Return-Path: <SRS0=12TN=G5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C51C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 15:24:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 217BD22D58
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 15:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 217BD22D58
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.75199.135341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4QC1-0005k8-0x; Tue, 26 Jan 2021 15:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75199.135341; Tue, 26 Jan 2021 15:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4QC0-0005k1-UJ; Tue, 26 Jan 2021 15:23:44 +0000
Received: by outflank-mailman (input) for mailman id 75199;
 Tue, 26 Jan 2021 15:23:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4QBz-0005jw-1n
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 15:23:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b295bf66-1a28-4f25-bcc6-eca5162bb61b;
 Tue, 26 Jan 2021 15:23:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D666AB92;
 Tue, 26 Jan 2021 15:23:40 +0000 (UTC)
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
X-Inumbo-ID: b295bf66-1a28-4f25-bcc6-eca5162bb61b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611674620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZYxtVpCRC60EGZ9vlFr8TVf4hotBBU2PAwRzwtyUVk=;
	b=q2/ZceYC4t/lQQWHwoVUkwz2Sw5tqDcDw3byFhHopFxtxS+ZBLWzBGw1kNIu4f2bygOfk8
	46uwv0tz9Cb5xa7N8tSMyFyycSU1yYhEXKCc5OWgCetZvew+jK5Cbva/BisK5VnnW+DcQ+
	KAEhvoxqo4ooe2xL/sF0+wmdT76v9VU=
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
To: Ian Jackson <iwj@xenproject.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
 <20210125212747.26676-1-sstabellini@kernel.org>
 <bbdbb0d2-24d7-4e46-1303-706c6c3036c3@suse.com>
 <8F34AC6E-2337-42C3-B612-A5414F9E16BE@arm.com>
 <01da05ea-6c34-8d8e-4277-e29bc54cb67d@suse.com>
 <5CB981E5-27BC-4B7E-B494-EFFDE8A4A1A9@arm.com>
 <1199ab03-ecfe-386c-7488-ca4f794b0683@suse.com>
 <24592.5760.197643.853055@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e2985686-2e6a-11c1-d46c-894a167266ab@suse.com>
Date: Tue, 26 Jan 2021 16:23:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24592.5760.197643.853055@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.01.2021 14:17, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED"):
>> On 26.01.2021 12:17, Bertrand Marquis wrote:
>>> Maybe something we could explain more clearly in the UNSUPPORTED/EXPERT
>>> config parameters instead ?
>>> We could also make that more clear in the help of such parameters directly.
>>>
>>> I do not see how we could make that more clear directly in the prompt (as
>>> making it too long is not a good solution).
>>
>> My main request is that such tags be added only if there's
>> absolutely no ambiguity. Anything else (requiring longer
>> explanations in many cases) should be expressed in the help
>> text of the option, or in yet other ways (a referral to
>> SUPPORT.md comes to mind).
> 
> Is
> 
>>>>>> +	bool "Harden the branch predictor against aliasing attacks (disabling UNSUPPORTED)" if UNSUPPORTED
> 
> too long ?

One more consideration, beyond the "too long" aspect. To me (as a
non-native speaker) this wording might allow inferring (by people
not knowing kconfig sufficiently well) that selecting this option
will turn off UNSUPPORTED. IOW if anything I'd see us use the yet
slightly longer "... (UNSUPPORTED if disabled)" or some such.

Jan

