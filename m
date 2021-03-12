Return-Path: <SRS0=dPyG=IK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488C8C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 10:14:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07E7A64FC3
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 10:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07E7A64FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.96960.183938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKenm-0006Dl-NE; Fri, 12 Mar 2021 10:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96960.183938; Fri, 12 Mar 2021 10:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKenm-0006De-Ja; Fri, 12 Mar 2021 10:13:50 +0000
Received: by outflank-mailman (input) for mailman id 96960;
 Fri, 12 Mar 2021 10:13:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKenl-0006DZ-Eh
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:13:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 752a784f-ee79-409c-ad11-e1af094a0327;
 Fri, 12 Mar 2021 10:13:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD554AF9F;
 Fri, 12 Mar 2021 10:13:46 +0000 (UTC)
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
X-Inumbo-ID: 752a784f-ee79-409c-ad11-e1af094a0327
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615544027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sPiSkafLbbIKwYtj0VbdM45lHctMgoLsYxbNMURtuZ0=;
	b=cdMhYOuhoZI8dF99cijx1HHaTC5Un5yL+GFOVUAOH/Sg4tsyHAlLoZglxtCxDrnCu7/+W+
	+kH2cgMnsv84OJoVx77YpkKRTSsFUgcmoiQvATOf+eRvHJkDWjkE3PyCadHwA0GdwxV4jy
	XaXYJYKfczVS+GwFG+bqMSoUcXqW6Js=
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
To: Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
 <6bd14438-7dec-2176-eab5-5898f190c4d8@suse.com>
 <e45ef012-22c6-b480-d987-dd951ae36948@xen.org>
 <24651.15544.142804.468744@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7185c052-3e66-6202-f820-76568b2b1228@suse.com>
Date: Fri, 12 Mar 2021 11:13:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24651.15544.142804.468744@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.03.2021 11:04, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH][4.15] gnttab: work around "may be used uninitialized" warning"):
>> This is pretty much what we are already doing slowly by initializing 
>> values to shut up older compilers. I agree this is more limited, but we 
>> also waive off diagnostics from every single compiler in that code 
>> rather than just one version.
>>
>> Hence why I suggested dropping -Werror for older compiler. This is not 
>> ideal but it would give us the ability to keep support for dinausor 
>> compiler and not hamper our ability to take advantage of newer compiler 
>> diagnostics.
> 
> I agree with Julien.  I think we should avoid adding these redundant
> initialisers for the reasons he gives.

I find this odd, not only because it is contrary to what we've done so
far. What if more modern gcc issues a false-positive warning? If we'd
fix it there, where would you suggest to draw the line? Imo our tree
should build without issues on all compiler versions which we state we
permit to be used.

Of course in the case here I could add a "default:" to the switch(),
but this would still only work around the compiler issue. Would the
two of you consider this any better?

Also, Ian - do you have any alternative suggestion towards making the
build work again (in the more general case, i.e. irrespective of the
alternative suggestion for this specific case just above)? Not using
-Werror on old compilers (again - where would we draw the line) was
already objected to by me.

Jan

