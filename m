Return-Path: <SRS0=XJfI=DV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336DEC433DF
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 12:44:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD5EE20848
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 12:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dPTaMNGH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD5EE20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6741.17725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSg8W-0000G1-Dv; Wed, 14 Oct 2020 12:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6741.17725; Wed, 14 Oct 2020 12:44:08 +0000
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
	id 1kSg8W-0000Fu-Aw; Wed, 14 Oct 2020 12:44:08 +0000
Received: by outflank-mailman (input) for mailman id 6741;
 Wed, 14 Oct 2020 12:44:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kSg8V-0000Fn-Ez
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 12:44:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7263436-b274-4df4-bd27-1872374527ff;
 Wed, 14 Oct 2020 12:44:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93B2FABBD;
 Wed, 14 Oct 2020 12:44:03 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kSg8V-0000Fn-Ez
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 12:44:07 +0000
X-Inumbo-ID: d7263436-b274-4df4-bd27-1872374527ff
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d7263436-b274-4df4-bd27-1872374527ff;
	Wed, 14 Oct 2020 12:44:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602679443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zt8c11X/frnwitFC4Xq+aSq+45DY9Bs54ns5mbGsSQc=;
	b=dPTaMNGH6SxwDbJaasBvImBnS9urMYE8KxySDBQ7NwcHSimpuoDNe2d/zh6I5CPwJom6xb
	cSDXaQvESI5xj5YM5F98SWPDPgXiCsgP8iwG+3sY611rXHtIscgCMN5XY+PypnIdaRIwC4
	cvaW5hydIpEE0uyDz7hPGTuVDbXrCGk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 93B2FABBD;
	Wed, 14 Oct 2020 12:44:03 +0000 (UTC)
Subject: Re: [PATCH 0/3] stubdom: add xenstore pvh stubdom support
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20200923064541.19546-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e1eb2571-16f0-2f2f-3127-ece3ca615ea9@suse.com>
Date: Wed, 14 Oct 2020 14:44:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923064541.19546-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.09.20 08:45, Juergen Gross wrote:
> Add support for creating a PVH Xenstore stub-domain.
> 
> This includes building the stubdom and loading it at system boot.
> 
> It should be noted that currently this stubdom is not in a working
> state as there is some support in Mini-OS missing. I'm working on
> adding this support.
> 
> Juergen Gross (3):
>    tools/init-xenstore-domain: add logging
>    tools/init-xenstore-domain: support xenstore pvh stubdom
>    stubdom: add xenstore pvh stubdom
> 
>   .gitignore                           |   1 +
>   stubdom/Makefile                     |  31 ++++-
>   stubdom/configure                    |  47 ++++++++
>   stubdom/configure.ac                 |   1 +
>   stubdom/xenstorepvh-minios.cfg       |  10 ++
>   tools/helpers/init-xenstore-domain.c | 170 ++++++++++++++++++++-------
>   6 files changed, 213 insertions(+), 47 deletions(-)
>   create mode 100644 stubdom/xenstorepvh-minios.cfg
> 

Anything missing for this series to be committed?


Juergen

