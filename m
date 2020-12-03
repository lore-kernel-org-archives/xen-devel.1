Return-Path: <SRS0=y3rP=FH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF50DC47437
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 14:51:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 329E121972
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 14:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 329E121972
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.43656.78487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpet-000483-6o; Thu, 03 Dec 2020 14:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43656.78487; Thu, 03 Dec 2020 14:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpet-00047u-3N; Thu, 03 Dec 2020 14:32:35 +0000
Received: by outflank-mailman (input) for mailman id 43656;
 Thu, 03 Dec 2020 14:32:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkper-00047f-5L
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:32:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f7de066-6fba-487a-822d-6fce65ccd27b;
 Thu, 03 Dec 2020 14:32:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D2E9ABE9;
 Thu,  3 Dec 2020 14:32:31 +0000 (UTC)
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
X-Inumbo-ID: 5f7de066-6fba-487a-822d-6fce65ccd27b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607005951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D590jycdEqjmqOLf5UnHRlb2s9jIT0LQnoieX8G9a+0=;
	b=gf7kiDQkuPQi8T2d1GxRwF9QKoicFnQWwpGlls3mvUKES0wCtEnie23zN9fe1jmCMOoSXu
	RXyAdNr6sJd3uRDC0yLuFJWSUs3O8AUhXsNDal1PiGSqwXOv5W/WSe6k/EdfQYOBDfLp47
	07oGw1ybrh1WL28LhfE9mSii+xgxjqQ=
Subject: Re: [ANNOUNCE] Call for agenda items for December 2020 Community Call
 @ 16:00 UTC
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>
References: <6A1AC739-EB53-4996-A99B-EE68358E70DB@citrix.com>
 <6da4cd56-7364-bc6e-24d8-02976dbd637d@suse.com>
 <49AA35F9-5056-4D42-AE1D-5A478B0CDF7B@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6173e857-2486-08b8-e0b1-93b400e8c9ba@suse.com>
Date: Thu, 3 Dec 2020 15:32:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <49AA35F9-5056-4D42-AE1D-5A478B0CDF7B@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.11.2020 13:16, George Dunlap wrote:
>> On Nov 30, 2020, at 10:25 AM, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 27.11.2020 12:52, George Dunlap wrote:
>>> The proposed agenda is in https://cryptpad.fr/pad/#/2/pad/edit/OPN55rXaOncupuWuHxtddzWJ/ and you can edit to add items.  Alternatively, you can reply to this mail directly.
>>
>> The "New series / series requiring attention" section is gone. Was
>> this intentional? If not, I would have wanted to propose that items
>> from that list which we didn't get to on the previous call be
>> automatically propagated. According to my observation it is more
>> likely than not that nothing would have changed in their status.
>> Hence it may be easier to take one off the list if indeed it has
>> got unstalled.
> 
> Oops — I meant to delete the content, but not the header.
> 
> Hopefully “not getting to that part of the call” should be rare; but yes, copying it over (perhaps with a color to indicate that it’s been carried over from last time) sounds reasonable.  I’ll do that.

Seeing that it didn't happen for today's meeting, I've blindly copied
over the previous meeting's section, before adding new items there.

Jan

