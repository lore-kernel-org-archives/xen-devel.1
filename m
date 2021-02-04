Return-Path: <SRS0=vb+Z=HG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9868FC433DB
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 10:14:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D13064F53
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 10:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D13064F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81211.149631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7be3-0003Xp-N5; Thu, 04 Feb 2021 10:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81211.149631; Thu, 04 Feb 2021 10:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7be3-0003Xi-Jx; Thu, 04 Feb 2021 10:13:51 +0000
Received: by outflank-mailman (input) for mailman id 81211;
 Thu, 04 Feb 2021 10:13:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7be1-0003Xd-RA
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 10:13:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f7bf3a5-02dc-4b90-9fcf-d2fd1f68877a;
 Thu, 04 Feb 2021 10:13:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8634AC97;
 Thu,  4 Feb 2021 10:13:43 +0000 (UTC)
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
X-Inumbo-ID: 3f7bf3a5-02dc-4b90-9fcf-d2fd1f68877a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612433623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yoT15T+kyMhoEcCFEuSJLqP2f+DuofcetFo1XfUFPp8=;
	b=sorgXHJ1bNPjP6TLGyNUP8PAD4Yt9TuaTxT0Sdklj5KqPPAOn1dpvbdwYi/50AaNlmuLtk
	W2Y0oOSc70oVHGu/hQRf2YkIQ9NZXE3TJiu59hn2STj7wkrpbpc6dZiDXK/c7OIIlV/gcM
	Ho7KaJSKMflyPg0LiLfeUdShSXkp6iI=
Subject: Re: [PATCH for-4.15] autoconf: check endian.h include path
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20210204093833.91190-1-roger.pau@citrix.com>
 <26522f21-4714-c29d-5ca4-baf012c51ac8@suse.com>
 <YBvFbbnje+Dt7CfD@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e3576d3-4565-9898-e954-4a888b21d92f@suse.com>
Date: Thu, 4 Feb 2021 11:13:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YBvFbbnje+Dt7CfD@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.02.2021 10:59, Roger Pau Monné wrote:
> On Thu, Feb 04, 2021 at 10:46:58AM +0100, Jan Beulich wrote:
>> On 04.02.2021 10:38, Roger Pau Monne wrote:
>>> --- a/tools/configure.ac
>>> +++ b/tools/configure.ac
>>> @@ -74,6 +74,7 @@ m4_include([../m4/ax_compare_version.m4])
>>>  m4_include([../m4/paths.m4])
>>>  m4_include([../m4/systemd.m4])
>>>  m4_include([../m4/golang.m4])
>>> +m4_include([../m4/header.m4])
>>>  
>>>  AX_XEN_EXPAND_CONFIG()
>>>  
>>> @@ -517,4 +518,6 @@ AC_ARG_ENABLE([pvshim],
>>>  ])
>>>  AC_SUBST(pvshim)
>>>  
>>> +AX_FIND_HEADER([INCLUDE_ENDIAN_H], [endian.h sys/endian.h])
>>
>> Instead of a new macro, can't you use AC_CHECK_HEADERS()?
> 
> AC_CHECK_HEADERS doesn't do what we want here: it will instead produce
> a HAVE_header-file define for each header on the list that's present,
> and the action-if-found doesn't get passed the path of the found
> header according to the documentation.
> 
> Here I want the variable to be set to the include path of the first
> header on the list that's present on the system.

I was thinking of

#if defined(HAVE_SYS_ENDIAN_H)
# include <sys/endian.h>
#elif defined(HAVE_ENDIAN_H)
# include <endian.h>
#else
# error ...
#endif

>> I'm also not certain about the order of checks - what if both
>> exist?
> 
> With my macro the first one will be picked.

And which one is to be the first one? IOW how likely is it that
on a system having both the first one is what we're after vs
the second one?

Jan

