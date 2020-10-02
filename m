Return-Path: <SRS0=mHc1=DJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9FDC4363D
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 06:20:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B9D206DD
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 06:20:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="duT1sp8u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87B9D206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1688.5114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOEQO-0004XF-Cy; Fri, 02 Oct 2020 06:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1688.5114; Fri, 02 Oct 2020 06:20:12 +0000
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
	id 1kOEQO-0004X8-8M; Fri, 02 Oct 2020 06:20:12 +0000
Received: by outflank-mailman (input) for mailman id 1688;
 Fri, 02 Oct 2020 06:20:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOEQM-0004X3-KO
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 06:20:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 859395e9-6e23-4669-ad3c-a1a5b5311647;
 Fri, 02 Oct 2020 06:20:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06CC0AD2C;
 Fri,  2 Oct 2020 06:20:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOEQM-0004X3-KO
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 06:20:10 +0000
X-Inumbo-ID: 859395e9-6e23-4669-ad3c-a1a5b5311647
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 859395e9-6e23-4669-ad3c-a1a5b5311647;
	Fri, 02 Oct 2020 06:20:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601619609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZbOzifHMrWmdV8hTzqw4L1Ltp2rraz8UHROP0ToP688=;
	b=duT1sp8uf2+cXRqnCIMZ6kFEhwyO/uvCWQRcjMSU6Ouf/FkYE2I/bjsZxp0nH6L73xAdRZ
	XOurxyEKX+2/N+p/LaAigeKrBBWOcolGRmG1wjZDgQ7sGoVw0va6mjGWpyfTY91tY5WrEb
	NMiPD8bA6Qq+hWrHoEcmLPaRI3Lc0lE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 06CC0AD2C;
	Fri,  2 Oct 2020 06:20:09 +0000 (UTC)
Subject: Re: [PATCH v3] tools/libs/stat: fix broken build
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20200912130836.11024-1-jgross@suse.com>
 <5232FD74-9636-4EF4-81F8-2EF7EE21D326@arm.com>
 <87CA2B55-B372-458C-82CC-2423B8AC3EEE@arm.com>
 <f12092a1-119f-ce68-8804-1a8772f1a923@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6853e47-27bd-efcd-71ae-b28e7ea1dd4d@suse.com>
Date: Fri, 2 Oct 2020 08:20:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f12092a1-119f-ce68-8804-1a8772f1a923@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.10.2020 06:50, Jürgen Groß wrote:
> On 01.10.20 18:38, Bertrand Marquis wrote:
>> Hi Juergen,
>>
>>> On 14 Sep 2020, at 11:58, Bertrand Marquis <bertrand.marquis@arm.com> wrote:
>>>
>>>
>>>
>>>> On 12 Sep 2020, at 14:08, Juergen Gross <jgross@suse.com> wrote:
>>>>
>>>> Making getBridge() static triggered a build error with some gcc versions:
>>>>
>>>> error: 'strncpy' output may be truncated copying 15 bytes from a string of
>>>> length 255 [-Werror=stringop-truncation]
>>>>
>>>> Fix that by using a buffer with 256 bytes instead.
>>>>
>>>> Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat directory")
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Sorry i have to come back on this one.
>>
>> I still see an error compiling with Yocto on this one:
>> |     inlined from 'xenstat_collect_networks' at xenstat_linux.c:306:2:
>> | xenstat_linux.c:81:6: error: 'strncpy' output may be truncated copying 255 bytes from a string of length 255 [-Werror=stringop-truncation]
>> |    81 |      strncpy(result, de->d_name, resultLen);
>> |       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> To solve it, I need to define devBridge[257] as devNoBrideg.
> 
> IMHO this is a real compiler error.
> 
> de->d_name is an array of 256 bytes, so doing strncpy() from that to
> another array of 256 bytes with a length of 256 won't truncate anything.

That's a matter of how you look at it, I think: If the original array
doesn't hold a nul-terminated string, the destination array won't
either, yet the common goal of strncpy() is to yield a properly nul-
terminated string. IOW the warning may be since the standard even has
a specific foot note to point out this possible pitfall.

Jan

