Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106CDC54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 13:32:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375907.1622889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp4OI-0003kq-Vm; Wed, 29 Jul 2026 13:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375907.1622889; Wed, 29 Jul 2026 13:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp4OI-0003kj-SP; Wed, 29 Jul 2026 13:32:10 +0000
Received: by outflank-mailman (input) for mailman id 1375907;
 Wed, 29 Jul 2026 13:32:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp4OH-0003kd-CM
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 13:32:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp4OG-0004uH-2T
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 15:32:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a00d1-bab6-0a2a0a5309dd-0a2a4509e85e-8
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 15:32:08 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a00d7-be1a-0a2a45090019-d1558031a445-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 15:32:08 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493f6de72faso7166785e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 06:32:07 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496fa499a96sm45797375e9.3.2026.07.29.06.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 06:32:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785331927; x=1785936727; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivu+IxWUmxA+L8S93A5sn3yj//0duegd51RJ/1LjPXo=;
        b=rUyWOqBceuYhzQTuqsx/A2BhidQIoZ58cXyLyRuIrRN8b39nzDaqsyXBRnUygkFBbV
         C8GBuGQJHKSIIMZ8lMHVhVYG3rJt3we6F5dqPvaDSHq1/tKmmSu9swa0U3LmvgrLe0rb
         pOm9PEA5U4RYWfVzRk+gh5wft7WWvLSc6p1HJq0b1/cJ8Zciz/1Uuqot0/CznYLavLGm
         C7SvfF9ih826eVAwU0FT351F5CrPW7L9h6DHP9kUXqr8/s/iVbZieuYtaVXXLuhiQJTm
         0oAiMBTwllyo90twbwQZeC5Dvt4lXkCYAkGHAFsBBRM7G9TJekeT0Tnw0kxjKihXub43
         UihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331927; x=1785936727;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivu+IxWUmxA+L8S93A5sn3yj//0duegd51RJ/1LjPXo=;
        b=MCsh3JL3wM5rNg0zpfizXJVaMehjNUGTiyyPbME5F3CF5ZzPbLGxWPkjA8lFYvjYvS
         3tJ1Hro4Dng+8y4riYlhitViNWku5r6LOT5QwgazDPzSrcdB24XxFh4P/h0+Hnjtom4d
         lvJywwyc6tyzTDDwL5n9q8nDd0GxKxKMn+3dZez9Qx1KDL2PEwPSd65o6pyp17Q/If1l
         KYWJruiErvHVeiQRD5ntjwjrfDAodoOGY2PB9Jnr/M3kaCMku+pCT9GSaQ8D7CqLptqa
         MSgcvQj5Zjd3nOAZbbgdo5VptGq1K5BQ2uuzut78yLIAUPgiLMdcIIRMsh+lWfYPUNtM
         +h8g==
X-Forwarded-Encrypted: i=1; AHgh+RolD27BR+PBRCM5gtKqkpISD/eMLcE1MH6olHu91bGLTQDo9PsgRFYQlmjM2rR/bsXum8FIQwD7Edg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIpwviq2vCI9N8W7Yk37iDIQ41UoqLQCzOWS4eRp0OeU4NE2Fg
	9RVvLkT580Rm6Dqv48PYIR7UovfOjBVfO1ZIzr9ieDkOL92hxs1iXrF8
X-Gm-Gg: AR+sD13lQ/qYraQBeL/YyTZDwMVrJa/8D6NBi3mSzRt7ZLbu3p0RtwI5cUfG8qboO60
	qIRiLGnblFoqkiSpHjgbonaA38UdR2dav60W39msVppP7GDmLEfP4qJ72I1yNl2gdCDG9YLeWxu
	gYgTLn3EULXkZfbpVgUZpAf0efO9B7db8nAPQlGNqyUc2AUrzGnQc7aO2tKmxRBKkw0g1ixQYY2
	zvaHJhW8n+cvj6aMzk/iCB+b4qT/PHJj9U+pVFfo9h7ZHWm82vkKaKH8NTD4ywoMk/aEFa7/7SN
	4Ve4+nzo73jdnrq6NDCIQU6cy9M6zAGJJV1cYiEeye4b6u9BwLZLNA8EdMPnYgYuwBH3pJ2T5IJ
	CKlRVRY75IZzuF2hH+Ty+25Vu9xEe4REQXvr99u0/bLY3aBX4ff0+whGSw1rDDKP4RfmG0lHICI
	KzvQKvl/7liFz2lUK9uPkM4IbYmrvd4zssctwP0Vnub4ajoN+7NwjJZiAFlvdXZgfr6kQ3wYYdQ
	3+6Uk3JSDSU89guWwTs0VoYL2dcWLscj/ESpBuoQyg=
X-Received: by 2002:a05:600c:46cf:b0:494:1f7:8057 with SMTP id 5b1f17b1804b1-497fd2f5070mr27928775e9.1.1785331927219;
        Wed, 29 Jul 2026 06:32:07 -0700 (PDT)
Message-ID: <8692455e-f285-4805-9394-0313b17d2b1b@gmail.com>
Date: Wed, 29 Jul 2026 15:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/credit: fix race with schedule_cpu_rm() in
 csched_timer()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Dietmar Hahn <dietmar.hahn@fujitsu.com>
References: <20260729120643.327387-1-jgross@suse.com>
 <20260729120643.327387-2-jgross@suse.com>
 <e30a9ef3-bedb-42d8-b6d8-f716112ba7c1@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e30a9ef3-bedb-42d8-b6d8-f716112ba7c1@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1785331928-BDCC7034-168E6D48/10/73395122804
X-purgate-type: spam
X-purgate-size: 1199



On 7/29/26 2:27 PM, Andrew Cooper wrote:
> On 29/07/2026 1:06 pm, Juergen Gross wrote:
>> When removing a CPU from a cpupool running the credit scheduler, a
>> race might happen between schedule_cpu_rm() and csched_timer(),
>> resulting in a NULL dereference.
>>
>> The timer associated with csched_timer() is killed only in
>> csched_deinit_pdata(), which is called by schedule_cpu_rm() after
>> setting the scheduler's per-cpu data to NULL AND after enabling
>> interrupts again. This can result in the timer to fire before it is
>> being killed,
> 
> "... the timer firing before being killed,"
> 
>>   so csched_timer() needs to test the per-cpu data to be
>> set before accessing it.
>>
>> Fixes: 78be3dbbfefa ("cpupools [1/6]: hypervisor changes")
>> Reported-by: Dietmar Hahn <dietmar.hahn@fujitsu.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 

Despite the fact that the race is very unlikely, the fix is very simple 
and still resolves a race condition, so we could consider including it 
in 4.22:
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


