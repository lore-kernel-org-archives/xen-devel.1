Return-Path: <SRS0=Fpha=EB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8481AC4363A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2020 16:49:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D7DE221FC
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2020 16:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="M/oGQJ0U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D7DE221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12468.32461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5fh-0000M1-12; Mon, 26 Oct 2020 16:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12468.32461; Mon, 26 Oct 2020 16:48:36 +0000
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
	id 1kX5fg-0000Lu-Tj; Mon, 26 Oct 2020 16:48:36 +0000
Received: by outflank-mailman (input) for mailman id 12468;
 Mon, 26 Oct 2020 16:48:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kX5fg-0000Lp-ER
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:48:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cf104f7-502b-42c6-8a10-5ca2ef7cb90d;
 Mon, 26 Oct 2020 16:48:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5ED92ACF5;
 Mon, 26 Oct 2020 16:48:30 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kX5fg-0000Lp-ER
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:48:36 +0000
X-Inumbo-ID: 0cf104f7-502b-42c6-8a10-5ca2ef7cb90d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0cf104f7-502b-42c6-8a10-5ca2ef7cb90d;
	Mon, 26 Oct 2020 16:48:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603730910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqRv94muRlAq/r4s6zwGCYMbRRkKaqrtyn2uegmbDqQ=;
	b=M/oGQJ0UoJJRAF3lryoXxPwZX90Ymaiqml2Td/RaE+dGgu3YlrZbbTk1KlFzvrkwk9RLs/
	c3OoVnTi6j9hkraqXIPfiO7I62Ta7Q1z/UDBgbUo4fo6jeilIj+sisC/u9OkoGDI74iKKg
	mMJy0TzTJk12f7FX/Lv8B4ambPiZQPU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5ED92ACF5;
	Mon, 26 Oct 2020 16:48:30 +0000 (UTC)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 01/11] libxl: Offer API
 versions 0x040700 and 0x040800
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-2-ian.jackson@eu.citrix.com>
 <20201026164239.GA27498@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be484d8b-c026-b22b-fea2-81839731f5a4@suse.com>
Date: Mon, 26 Oct 2020 17:48:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026164239.GA27498@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 17:42, Olaf Hering wrote:
> On Wed, Oct 23, Ian Jackson wrote:
> 
>> 0x040700 was introduced in 304400459ef0 (aka 4.7.0-rc1~481)
>> 0x040800 was introduced in 57f8b13c7240 (aka 4.8.0-rc1~437)
> 
>> Anyway, in the meantime, we should fix it.  Backporting this is
>> probably a good idea: it won't change the behaviour for existing
>> callers but it will avoid errors for some older correct uses.
> 
>> +    LIBXL_API_VERSION != 0x040700 && LIBXL_API_VERSION != 0x040800 && \
> 
> 
> Why was this never backported to staging-4.12 and older?
> Please backport it to assist libvirt.

I'm afraid the request comes too late for 4.12 (branch now
closed for its final stable release to be cut) and older
(already in security-only mode).

Jan

