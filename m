Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29373CD4F24
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2026 15:49:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1307074.1578801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpLv-0001N3-2x; Tue, 12 May 2026 15:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307074.1578801; Tue, 12 May 2026 15:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpLv-0001Mw-0E; Tue, 12 May 2026 15:48:59 +0000
Received: by outflank-mailman (input) for mailman id 1307074;
 Tue, 12 May 2026 15:48:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMpLu-0001MZ-Id
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:48:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpLt-00HJSC-VX
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:48:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a034bde-e002-0a2a0a5209dd-0a2a4502a8bc-44
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:48:57 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a034be9-af86-0a2a45020019-d155802ae921-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:48:57 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso32344545e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:48:57 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f41a8b1sm31989155e9.7.2026.05.12.08.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:48:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778600937; x=1779205737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oJwQnC+99LxDyEz1ZKRp0nX/wm7Pp6O7+kV6TjSLTSU=;
        b=jp8PXRjkUUGAFThWmzufUBsSyfxeTQCtB4LWtomIsBZkE3UgqPNha10nVwsyy7ya/L
         LauOSnO7NsgmjRL7mZzOmszGF70MKYBNL0dxo8r8QeNmDuwGbUSgqMbPocT7xSjejPKe
         /3vxl4uvYamnPJzFai+Dg+8MRrrwZ2qOg+WOgvNRUARkeNlovLefD3c1TGJP6d/ybTWE
         VE8ASwWY0X5gnpFt98SAsCWeK2WBFaB67G3vETnxcIhIBJwxpns3i0wcr+hrLMd4PnnG
         wB//5uSEaUa92PjqDE4lTqMyQEOYr2BlCDRQ/BzDdZBzhWg+V4bJBfGbQhNLPybQjpCf
         nZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600937; x=1779205737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJwQnC+99LxDyEz1ZKRp0nX/wm7Pp6O7+kV6TjSLTSU=;
        b=qKdy3nr/wFYjjPRLoCJTfK6KWE1lGYxVAoP+HV/sYnufyMUrDsfcGLnme6PgobSUkk
         JFeGD9syS6vM9BsK6EABm/3SANWju7wbxZfb1MB6VaiG51AJSlrKwJnPMgmEOFk5AONb
         NjHG1XjGrJqSHrSdkZoTnbvD2cezTs+Ag6+jiP6Fuj4PpXpqHDzlz1eBi8dOORn2BRmD
         +Y+/wdUWOSH0Qk5NKZg1EFYpVTRJaD23rOWqpCiR8RDwpvWdivb5Rwzvv+UDtykamybH
         g+apYTblQVNySn/O4p4lXGf2IOVFDlAlnNaJBkWcyhwohm9vHGrFkaD1JgphjDydfSzN
         TkBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/j+VFudWbfctSpM0JqJ8w7Dtz0dUxjj8Yw0uq5Wt3QDNG5H/1N+ZQ+z7ENWlKxs2mT8247NuxK1HM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXlCVj4xcK7KVZdnq789b75Do7JAWiGj0OaZg5I9R/RWPWQkrq
	LqdSqCBPNZjqrHMY3kr2TGbszO1MWpfrOTSQYjBiIESFwC/4nV9w0UGS
X-Gm-Gg: Acq92OFJkO1SyATP2jkkqeRsDF2wC3rXmqiGBzxSLaZF/foRqTbolg14ItC04FIIVm4
	AyYolG/6yfOUXGoIDi2WkZyY+4yyjm6pj1cCugOSNBGKzz4wZCQ04DvI3zw6ddfxdWF+mC+V2SL
	UFcnN5r6s1Aznwimk5VbCooYWk31CUk/jzNnxQzs0QbznRUk6fBqssfqiqjsJYJ+ru1VMzN5paX
	jI0ZR8iTwJauyG2V/DPAASEqclgYQwdunTMQugmnuql4Ww0i5ArOojDhfqc1hnr44KXvvpIryZB
	Y4yG4DB8pgnR+X5r3VmOjoKsCnbNxsVg+WgJzN2jyewW9GiS7Boyuex2Bx52GXeChOdcOXfVT3v
	JqcVGYcKshDOcrrcLRPNnRjo1UJ6j1wnhAbA/5XFh1WrIwfLYzsJuq++JZEFicBVomFup1GFhpe
	9FI/0fx1FWWorNZGfao4B5h4Epjs0UdatCBuam/XwS1P/xxT4dXLNoQB2U9O4blMEmcCxvkpieS
	T8=
X-Received: by 2002:a05:600c:8508:b0:48f:99a9:bbcc with SMTP id 5b1f17b1804b1-48f99a9bd89mr19326595e9.10.1778600937263;
        Tue, 12 May 2026 08:48:57 -0700 (PDT)
Message-ID: <7a911029-57ba-421d-9657-03762dfe1109@gmail.com>
Date: Tue, 12 May 2026 17:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] tools/xenstore: fix issue related to XSA-417
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260429120619.1013440-1-jgross@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260429120619.1013440-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1778600937-ABD67161-B728FC79/10/73395122804
X-purgate-type: spam
X-purgate-size: 3179



On 4/29/26 2:06 PM, Juergen Gross wrote:
> There is one corner case of XSA-417 which wasn't handled completely
> with the patches back then.
> 
> The XSA-417 fixes tried to solve the problem, that a new domU would
> inherit access permissions to access Xenstore entries with that domid
> listed in the access rights. In order not to make it easy for a domU
> to query existence of a domid, adding permission for a non-existing
> domain is not rejected by Xenstore. The XSA-417 patches solved that
> problem by adding a flag to a permission entry referencing a not
> existing domain, indicating that the permission should not be
> effective for Xenstore.
> 
> One corner case was not handled:
> 
> Consider guest 1 and guest 2 running. Guest 1 adds guest 2 to be able
> to access a Xenstore entry. Now guest 2 is removed from the system and
> a new guest 3 with the same domid as guest 2 had is being created.
> 
> When guest 3 would try now to access the Xenstore entry, it would fail,
> as Xenstore would see that the Xenstore entry is older than guest 3.
> 
> But if guest 1 is modifying the permissions of the Xenstore entry
> again, e.g. by adding another domain, the permission entry for guest 2
> would lose its "special flag", resulting in guest 3 now really gaining
> access to the Xenstore entry.
> 
> This series is fixing this problem by the following means:
> 
> - In order to allow guests to know that a Xenstore entry permission
>    might have gone stale, allow unprivileged guests to receive
>    @releaseDomain watch events. This doesn't open a security hole, as
>    the only knowledge which can by gathered from that change is that a
>    domain is gone, not that a domain with a specific domid is existing.
> 
> - When a domain is removed, remove all permissions relating to this
>    domain from all Xenstore entries.
> 
> Note that this issue was discussed by the Xen security team and we
> decided not to issue an XSA, as there are no known use cases where one
> unprivileged guest would grant access to its Xenstore nodes to more
> than one other unprivileged guests.
> 
> We decided to delay this patch series until the watch depth feature has
> been committed, as with that feature available it is now possible for
> a guest to handle the death of a specific domain in a sane way.
> 
> Changes in V2:
> - some minor comments addressed
> 
> Denis Mukhin (1):
>    xen/public: introduce DOMID_ANY
> 
> Juergen Gross (3):
>    tools/xenstored: add support for "all domains" node permission
>    tools/xenstored: allow @releaseDomain watch for all domains
>    tools/xenstored: remove permissions related to dead domain
> 
>   docs/man/xl.cfg.5.pod.in        |  4 ++
>   tools/xenstored/core.c          | 45 ++++++++++++++-----
>   tools/xenstored/domain.c        | 78 +++++++++++++++++++++------------
>   tools/xenstored/domain.h        |  3 +-
>   xen/include/public/io/xs_wire.h |  2 +
>   xen/include/public/xen.h        |  7 +++
>   6 files changed, 100 insertions(+), 39 deletions(-)
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


