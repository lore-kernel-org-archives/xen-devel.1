Return-Path: <SRS0=Dhy5=FM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E6DC2BB48
	for <xen-devel@archiver.kernel.org>; Tue,  8 Dec 2020 09:13:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E8623A7F
	for <xen-devel@archiver.kernel.org>; Tue,  8 Dec 2020 09:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E8623A7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.47242.83638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmZ37-0005G3-2F; Tue, 08 Dec 2020 09:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47242.83638; Tue, 08 Dec 2020 09:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmZ36-0005Fw-VL; Tue, 08 Dec 2020 09:12:44 +0000
Received: by outflank-mailman (input) for mailman id 47242;
 Tue, 08 Dec 2020 09:12:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmZ35-0005Fr-4e
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 09:12:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ad26ae0-c35f-421b-9730-9806fc593c14;
 Tue, 08 Dec 2020 09:12:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6AB6CB04C;
 Tue,  8 Dec 2020 09:12:41 +0000 (UTC)
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
X-Inumbo-ID: 2ad26ae0-c35f-421b-9730-9806fc593c14
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607418761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wji7cVr3E4ewzf0/ekPSVYyJD48uMGTKrk3JbT5PmOM=;
	b=VItoo7KwBUcpXcHTZrylVcMEStb4pjIBDlKbmUj/5oY/x2/doF4+BGOb/oOad6RXqLji+F
	gM1U932Y+smoMwjYcMn0HUu8RvYVRlPw1GcHxlDWsJ+AZxsLh2bauyFgYnc5e8Y41mC0en
	dWiLtFHrUr8cfcOdCcy2BESvRp1N0HU=
Subject: Re: [RFC] design: design doc for 1:1 direct-map
To: Julien Grall <julien@xen.org>
Cc: Bertrand.Marquis@arm.com, Kaly.Xin@arm.com, Wei.Chen@arm.com, nd@arm.com,
 Paul Durrant <paul@xen.org>, famzheng@amazon.com,
 Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
References: <20201208052113.1641514-1-penny.zheng@arm.com>
 <6731d0c1-37df-ade8-7b77-d1032c326111@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b53b7ea5-51f2-8746-8d0d-17d2b57ecc89@suse.com>
Date: Tue, 8 Dec 2020 10:12:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <6731d0c1-37df-ade8-7b77-d1032c326111@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.12.2020 10:07, Julien Grall wrote:
> On 08/12/2020 05:21, Penny Zheng wrote:
>> --- /dev/null
>> +++ b/docs/designs/1_1_direct-map.md
>> @@ -0,0 +1,87 @@
>> +# Preface
>> +
>> +The document is an early draft for direct-map memory map
>> +(`guest physical == physical`) of domUs. And right now, it constrains to ARM
> 
> s/constrains/limited/
> 
> Aside the interface to the user, you should be able to re-use the same 
> code on x86. Note that because the memory layout on x86 is fixed (always 
> starting at 0), you would only be able to have only one direct-mapped 
> domain.

Even one seems challenging, if it's truly meant to have all of the
domain's memory direct-mapped: The use of space in the first Mb is
different between host and guest.

Jan

