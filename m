Return-Path: <SRS0=6BBm=J2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B615C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 13:26:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B1761419
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 13:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B1761419
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.120028.226944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6gj-0002qn-RQ; Thu, 29 Apr 2021 13:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120028.226944; Thu, 29 Apr 2021 13:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6gj-0002qg-OM; Thu, 29 Apr 2021 13:26:41 +0000
Received: by outflank-mailman (input) for mailman id 120028;
 Thu, 29 Apr 2021 13:26:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc6gj-0002qb-3d
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 13:26:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id def364bf-6d6d-4c5d-9a9b-de402cc93860;
 Thu, 29 Apr 2021 13:26:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D22C8B4AF;
 Thu, 29 Apr 2021 13:26:38 +0000 (UTC)
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
X-Inumbo-ID: def364bf-6d6d-4c5d-9a9b-de402cc93860
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619702798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rI5XBE2fV5gz1Y+GT0S2AL6B7Ff0xoPq4hxa6rQRBbk=;
	b=atfy46RjhdRXqYn6zKoph28BYfsezf/hS03AiUnbIQ/vFA3eoAufFvdM+9uHGp4Tw2F7j2
	uNu7cQ4LIbEI3+JnPVv656Usy8MA2GQ04XE7k/QiQDVFpgQS+/wKkPMmnnzkbUBqcReRdc
	Bk2zUMUPEG3yATp06O98rhh624ZtG/o=
Subject: Re: [PATCH v4 3/3] unzstd: make helper symbols static
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
 <759c8524-cc01-fac8-bc62-0ba6558477bd@suse.com>
 <cb8fa703-f421-ce55-811a-d4a649bc201a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1696e5f2-481a-5a7f-258d-b2a0679b041f@suse.com>
Date: Thu, 29 Apr 2021 15:26:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <cb8fa703-f421-ce55-811a-d4a649bc201a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.04.2021 13:27, Julien Grall wrote:
> On 21/04/2021 11:22, Jan Beulich wrote:
>> While for the original library's purposes these functions of course want
>> to be externally exposed, we don't need this, and we also don't want
>> this both to prevent unintended use and to keep the name space tidy.
>> (When functions have no callers at all, wrap them with a suitable
>> #ifdef.) This has the added benefit of reducing the resulting binary
>> size - while this is all .init code, it's still desirable to not carry
>> dead code.
> 
> So I understand the desire to keep the code close to Linux and removing 
> the dead code. However I am still not convinced that the approach taken 
> is actually worth the amount of memory saved.
> 
> How much memory are we talking about here?

There are no (runtime) memory savings, as is being said by the
description. There are savings on the image and symbol table sizes
(see below - .*.0/ holding files as produced without the patch
applied, while .*.1/ holding output with it in place), the image
size reduction part of which is - as also expressed by the
description - a nice side effect, but not the main motivation for
the change.

Jan

xen/.debug-info.0/:
total 64124
-rwxr-xr-x 1 jbeulich users  2817324 Apr 29 15:13 xen
-rwxr-xr-x 1 jbeulich users 33159787 Apr 29 15:13 xen.efi
-rw-r--r-- 1 jbeulich users   382568 Apr 29 15:13 xen.efi.map
-rw-r--r-- 1 jbeulich users  1233207 Apr 29 15:13 xen.gz
-rwxr-xr-x 1 jbeulich users 27616424 Apr 29 15:13 xen-syms
-rw-r--r-- 1 jbeulich users   382569 Apr 29 15:13 xen-syms.map

xen/.debug-info.1/:
total 64092
-rwxr-xr-x 1 jbeulich users  2809132 Apr 29 15:15 xen
-rwxr-xr-x 1 jbeulich users 33155283 Apr 29 15:14 xen.efi
-rw-r--r-- 1 jbeulich users   380862 Apr 29 15:15 xen.efi.map
-rw-r--r-- 1 jbeulich users  1230365 Apr 29 15:15 xen.gz
-rwxr-xr-x 1 jbeulich users 27608800 Apr 29 15:14 xen-syms
-rw-r--r-- 1 jbeulich users   380863 Apr 29 15:14 xen-syms.map

xen/.stripped.0/:
total 10876
-rwxr-xr-x 1 jbeulich users 2817324 Apr 29 15:16 xen
-rwxr-xr-x 1 jbeulich users 3143360 Apr 29 15:16 xen.efi
-rw-r--r-- 1 jbeulich users  382568 Apr 29 15:16 xen.efi.map
-rw-r--r-- 1 jbeulich users 1233197 Apr 29 15:16 xen.gz
-rwxr-xr-x 1 jbeulich users 3169360 Apr 29 15:16 xen-syms
-rw-r--r-- 1 jbeulich users  382569 Apr 29 15:16 xen-syms.map

xen/.stripped.1/:
total 10840
-rwxr-xr-x 1 jbeulich users 2809132 Apr 29 15:15 xen
-rwxr-xr-x 1 jbeulich users 3136552 Apr 29 15:15 xen.efi
-rw-r--r-- 1 jbeulich users  380862 Apr 29 15:15 xen.efi.map
-rw-r--r-- 1 jbeulich users 1230352 Apr 29 15:15 xen.gz
-rwxr-xr-x 1 jbeulich users 3159376 Apr 29 15:15 xen-syms
-rw-r--r-- 1 jbeulich users  380863 Apr 29 15:15 xen-syms.map


