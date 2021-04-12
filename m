Return-Path: <SRS0=44Tx=JJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084C9C433ED
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 11:03:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B95F76100B
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 11:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B95F76100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.108990.208013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuLf-0002J1-U2; Mon, 12 Apr 2021 11:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108990.208013; Mon, 12 Apr 2021 11:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuLf-0002Iu-Qn; Mon, 12 Apr 2021 11:03:19 +0000
Received: by outflank-mailman (input) for mailman id 108990;
 Mon, 12 Apr 2021 11:03:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVuLf-0002Ip-3E
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 11:03:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f375b326-ce99-48b1-87e4-8578bf560c5f;
 Mon, 12 Apr 2021 11:03:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ACD69AE20;
 Mon, 12 Apr 2021 11:03:16 +0000 (UTC)
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
X-Inumbo-ID: f375b326-ce99-48b1-87e4-8578bf560c5f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618225396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SggUo5vEkMMchFi34/C1qyVNuuNBzopDvY6Ert2iC9s=;
	b=Fcn6dD9P6QQLrfbeg2hWV/mjhH7epteNGb3ffZenKKC/OcwwSD3i7CiHLI3E4joRtpXKCa
	rK759chmpFJC+fLmX5TXxE5ki2M4XA2Dr9kR+6sM94ljaf6GSbmC5UWNrpYlP38JYapnsD
	LJlkmQCKC1/4ksI/icLiI+BlipSC3aE=
Subject: Re: [PATCH v3 2/4] xen/arm: Handle cases when hardware_domain is NULL
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
References: <20210412105243.23354-1-luca.fancellu@arm.com>
 <20210412105243.23354-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1242714-e5f3-1e6b-f1bd-e9e53326fda7@suse.com>
Date: Mon, 12 Apr 2021 13:03:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412105243.23354-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.04.2021 12:52, Luca Fancellu wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1022,6 +1022,9 @@ static always_inline bool is_hardware_domain(const struct domain *d)
>      if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>          return false;
>  
> +    if ( !d )
> +        return false;
> +
>      return evaluate_nospec(d == hardware_domain);
>  }

On v2 I did say on the respective code that was here (and my
suggestion of this alternative adjustment): "Can you point out
code paths where d may actually be NULL, and where [...] would
not behave as intended (i.e. where bad speculation would
result)?"

Since you've taken the suggestion as-is, and since the commit
message says nothing in either direction here, did you actually
verify that there's no abuse of speculation possible with this
extra return path? And did you find any caller at all which may
pass NULL into here?

Jan

