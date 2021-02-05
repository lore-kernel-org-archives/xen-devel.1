Return-Path: <SRS0=4OGc=HH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59928C433E6
	for <xen-devel@archiver.kernel.org>; Fri,  5 Feb 2021 14:05:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE09464FC4
	for <xen-devel@archiver.kernel.org>; Fri,  5 Feb 2021 14:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE09464FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81741.151173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81jp-0006k1-Ko; Fri, 05 Feb 2021 14:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81741.151173; Fri, 05 Feb 2021 14:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81jp-0006ju-Hi; Fri, 05 Feb 2021 14:05:33 +0000
Received: by outflank-mailman (input) for mailman id 81741;
 Fri, 05 Feb 2021 14:05:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IalI=HH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l81jo-0006jn-Ey
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 14:05:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e96ab7da-acd3-4e42-9ae8-1d46eacb6f62;
 Fri, 05 Feb 2021 14:05:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0FD7CAC9B;
 Fri,  5 Feb 2021 14:05:29 +0000 (UTC)
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
X-Inumbo-ID: e96ab7da-acd3-4e42-9ae8-1d46eacb6f62
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612533929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D74wxNoQbMywGrV8PBRGASKiV8IlPYkJharhsx+Zq18=;
	b=sQW11e0foe3CCXXSZVV1mGMhpgEDXtF1Hky/c89tbuGemIcbKA7+mCbhfSyY+lJ4RbjXF5
	B1S9oYp6UxwSBPG6IlgukGezWB5FGFYxvefdpy0zPomrbxTlyTUZuTPhA60ecVu+ic98Yp
	YRgy7HmdqTxJXegK9antp3abDgB6zDE=
Subject: Re: [PATCH for-4.15] tools/configure: add bison as mandatory
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210205115327.4086-1-roger.pau@citrix.com>
 <bd9d86ef-485d-fc93-f402-0a97acd9d2dd@citrix.com>
 <YB1Kqez4mjzog2YM@Air-de-Roger>
 <c1185550-8e73-5985-de70-a68a0b1e31ab@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df5e7984-90a4-ae13-c751-0723885c46fe@suse.com>
Date: Fri, 5 Feb 2021 15:05:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c1185550-8e73-5985-de70-a68a0b1e31ab@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.02.2021 14:50, Andrew Cooper wrote:
> On 05/02/2021 13:39, Roger Pau Monné wrote:
>> On Fri, Feb 05, 2021 at 01:34:20PM +0000, Andrew Cooper wrote:
>>> On 05/02/2021 11:53, Roger Pau Monne wrote:
>>>> Bison is now mandatory when the pvshim build is enabled in order to
>>>> generate the Kconfig.
>>>>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> ---
>>>> Please re-run autogen.sh after applying.
>>>>
>>>> Fallout from this patch can lead to broken configure script being
>>>> generated or bison not detected correctly, but those will be cached
>>>> quite quickly by the automated testing.
>>> I think this can be simpler.  Both flex and bison are mandatory libxlutil.
>> No, we ship the output .c and .h files so that the user only needs to
>> have bison/flex if it wants to modify the .l or .y files AFAICT?
> 
> I know that theory, but it is broken in practice because of `git
> checkout` timestamps.
> 
> Also, the Makefile explicitly enforces the checks, so they are mandatory
> in despite an attempt to ship the preprocessed form.

I don't see the Makefile enforcing anything. Upon seeing "XYZ is
needed to rebuild some libxl parsers and scanners, please install
it and rerun configure" you then have the choice of doing so or,
if you know you didn't fiddle with the sources, playing with the
time stamps.

Jan

