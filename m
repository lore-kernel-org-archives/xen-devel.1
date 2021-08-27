Return-Path: <SRS0=IFNi=NS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2927C432BE
	for <xen-devel@archiver.kernel.org>; Fri, 27 Aug 2021 14:16:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83FDD60EFE
	for <xen-devel@archiver.kernel.org>; Fri, 27 Aug 2021 14:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83FDD60EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=apertussolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.173717.316932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJceS-00043I-OK; Fri, 27 Aug 2021 14:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173717.316932; Fri, 27 Aug 2021 14:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJceS-000438-Km; Fri, 27 Aug 2021 14:16:12 +0000
Received: by outflank-mailman (input) for mailman id 173717;
 Fri, 27 Aug 2021 14:16:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBy1=NS=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mJceQ-000430-Rj
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:16:10 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52cb60a1-0741-11ec-aad0-12813bfff9fa;
 Fri, 27 Aug 2021 14:16:10 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630073761781790.1600573831129;
 Fri, 27 Aug 2021 07:16:01 -0700 (PDT)
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
X-Inumbo-ID: 52cb60a1-0741-11ec-aad0-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1630073762; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UygP6y+FA5u65E3633bEhPnB3eDTQ/Si8COC6nvQQJ/YneqhCeHcLUXuvlUYEOwzqxeOlLwZ43JRKUyvXCTz3J6fXxTaCttZAJR0VsusHxQVfiS8/8c1zNS9BesFJWqMxrCSaZ5wyDPcgP4w878jFp4+RbHW5iTxuae3cjE3sCM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630073762; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=+EKNePXZlVUo6I7ze8oWmaX4VOQeBfDdkoZWb/2vp1s=; 
	b=FsXfUza7ACrPZUGU//oW0RJVgxSQtMGvB8/GfVciAbq4Id/Iavhf96CJLv7D/6u7lc9pa/AoqH2UyP7c+lsIC9TzaAkUUrg9hxOwz5t0lS6LGkR2DazqQnMf2RjlCnTQl3dVjDwAzNhfsqIGomyKE+CHOivn4NJ2/jgK12xp7fk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630073762;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+EKNePXZlVUo6I7ze8oWmaX4VOQeBfDdkoZWb/2vp1s=;
	b=gFT3ovitrT0MxQhECnDD0xb9ZaYlOlfxuZnnInCedThS91zsDFYOt7H1fsy4+WWe
	O3qC54IUkk4YG/zCI659CNcuh0ZCVrdwMeSjYwVCx7BrzgZX1eMWNUmLLRR+g0Zdx6v
	PcXsuIbv7KqVqh1sROAFQFe6OoPXKzF6CBVEYv7Y=
Subject: Re: [PATCH v3 6/7] xsm: drop generic event channel labeling exclusion
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-7-dpsmith@apertussolutions.com>
 <dc2fbefb-93fb-4574-ef7b-23a9c9a248fe@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <bed0ac0e-b5ba-d8e4-3869-3db493b3c890@apertussolutions.com>
Date: Fri, 27 Aug 2021 10:16:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <dc2fbefb-93fb-4574-ef7b-23a9c9a248fe@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/25/21 11:44 AM, Jan Beulich wrote:
> On 05.08.2021 16:06, Daniel P. Smith wrote:
>> The internal define flag is not used by any XSM module, removing the #ifdef
>> leaving the generic event channel labeling as always present.
> 
> With this description ...
> 
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -120,15 +120,12 @@ struct evtchn
>>      unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
>>      uint32_t fifo_lastq;           /* Data for identifying last queue. */
>>  
>> -#ifdef CONFIG_XSM
>>      union {
>> -#ifdef XSM_NEED_GENERIC_EVTCHN_SSID
>>          /*
>>           * If an XSM module needs more space for its event channel context,
>>           * this pointer stores the necessary data for the security server.
>>           */
>>          void *generic;
>> -#endif
>>  #ifdef CONFIG_XSM_FLASK
>>          /*
>>           * Inlining the contents of the structure for FLASK avoids unneeded
>> @@ -138,7 +135,6 @@ struct evtchn
>>          uint32_t flask_sid;
>>  #endif
>>      } ssid;
>> -#endif
>>  } __attribute__((aligned(64)));
> 
> ... I can see the inner #ifdef go away, but not the outer one. While
> the (imo bogus) attribute means you don't alter the size of the
> struct, I'm afraid that's not obvious at all without counting bits
> and bytes, and hence this may also want saying explicitly in the
> description.

I can put the #ifdef CONFIG_XSM back and in the subsequent patch change
it to CONFIG_XSM_CONFIGURABLE, making this the only difference between
being able to select the XSM policy in effect or not.

v/r,
dps


