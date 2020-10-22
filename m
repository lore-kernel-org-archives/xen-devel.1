Return-Path: <SRS0=UfNL=D5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A943FC4363A
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 07:51:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF0C21D43
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 07:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="MI5ELawq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF0C21D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10224.27112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVNC-00087g-3V; Thu, 22 Oct 2020 07:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10224.27112; Thu, 22 Oct 2020 07:50:58 +0000
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
	id 1kVVNC-00087Z-0P; Thu, 22 Oct 2020 07:50:58 +0000
Received: by outflank-mailman (input) for mailman id 10224;
 Thu, 22 Oct 2020 07:50:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVVNA-00087U-4Q
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:50:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df2db677-704f-4a7c-9b39-ba4844631df3;
 Thu, 22 Oct 2020 07:50:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6EE36AB95;
 Thu, 22 Oct 2020 07:50:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVVNA-00087U-4Q
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:50:56 +0000
X-Inumbo-ID: df2db677-704f-4a7c-9b39-ba4844631df3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id df2db677-704f-4a7c-9b39-ba4844631df3;
	Thu, 22 Oct 2020 07:50:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603353053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zNLtVEILTRhSO9neaxgcuQDtNGcKm6gHkTPdV6pRK6Q=;
	b=MI5ELawq9JMeJ0xcVv/klGxR3zrlu0jnHvjsyo+88SnGhFjh/35SUV2brBNCuPc+F7M1Dx
	/OgZsV2PRkjK2dpooT6U6OGgzRQr20tquGLL5TrpKnNeYbs5m0JShnBfwqc/ZuWBJn1Kp9
	pRRMqdVTm1FIYms6cRVcgrsPhOknRBc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6EE36AB95;
	Thu, 22 Oct 2020 07:50:53 +0000 (UTC)
Subject: Re: [xen-unstable test] 156050: regressions - FAIL
From: Jan Beulich <jbeulich@suse.com>
To: xen-devel@lists.xenproject.org
Cc: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-156050-mainreport@xen.org>
 <c38b0b70-b85c-6a5c-6a94-d4845d59a9dd@suse.com>
Message-ID: <72d0b538-da5c-48fb-45d2-ff7407d4925c@suse.com>
Date: Thu, 22 Oct 2020 09:50:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <c38b0b70-b85c-6a5c-6a94-d4845d59a9dd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.10.2020 09:46, Jan Beulich wrote:
> On 22.10.2020 07:58, osstest service owner wrote:
>> flight 156050 xen-unstable real [real]
>> flight 156084 xen-unstable real-retest [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/156050/
>> http://logs.test-lab.xenproject.org/osstest/logs/156084/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 156013
> 
> Continuing from my reply to the earlier flight yesterday I'm
> meanwhile even more puzzled because 4.12 and earlier have had
> pushes, i.e. the tests were successful there that have been
> failing for 4.13 and newer. It's further suspicious (to me)
> that in each case it's just one of the qemu{u,t} tests which
> fails, while its sibling is successful. This may mean a
> dependency on the particular hardware we're running on, but
> again I wouldn't be able to make a connection of such
> behavior to the commits under test.

Actually, yesterday's 4.14 and 4.13 flights speak against a
hardware dependency: Their failing vs successful qemu{u,t}
each ran on respectively the same host.

For now I'm lost; I'd appreciate others to take a look.

Jan

