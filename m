Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6DEC433DB
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 11:34:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E12722795
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 11:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E12722795
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74036.133068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4085-0006PV-5R; Mon, 25 Jan 2021 11:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74036.133068; Mon, 25 Jan 2021 11:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4085-0006PO-21; Mon, 25 Jan 2021 11:33:57 +0000
Received: by outflank-mailman (input) for mailman id 74036;
 Mon, 25 Jan 2021 11:33:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4083-0006PJ-Rd
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 11:33:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 364eccc1-69ac-4294-bc78-2522c7fc93ef;
 Mon, 25 Jan 2021 11:33:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5040DAD5C;
 Mon, 25 Jan 2021 11:33:54 +0000 (UTC)
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
X-Inumbo-ID: 364eccc1-69ac-4294-bc78-2522c7fc93ef
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611574434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9mmzuxqOs7ugO7N9CSJ6mB9cWtQ7CT0SW7uF+CRS7vA=;
	b=hx73Pd237ViFuqQYIeW8D9Abml6UyQg3u/ggZVP+aJ2Gxm42HFRe6Lb+PwzyQoQp6DHMB5
	HNHj1l+bMJ9KDow31NQZeUQD4BQUD8bWZHou+qwizwjXTa1yNRmF6nCuiFbJWRWtPxBnVZ
	knY1+P1vT5NTlU3thZrQGFSi+HURNiA=
Subject: Re: [PATCH 15/17] x86/shadow: drop SH_type_l2h_pae_shadow
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <c412bbe4-d555-7d36-997c-92274679d9ae@suse.com>
 <YArPAicNIR0H5Q0y@deinos.phlegethon.org>
 <c8de294c-ae72-aebf-a893-790c84efdc97@suse.com>
 <YAsvVUUqSQ9bUK32@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <42f5ac7a-0d31-293a-78e6-2159684f0ff6@suse.com>
Date: Mon, 25 Jan 2021 12:33:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YAsvVUUqSQ9bUK32@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.01.2021 21:02, Tim Deegan wrote:
> At 17:31 +0100 on 22 Jan (1611336662), Jan Beulich wrote:
>> Because of this having been benign (due to none of the callback
>> tables specifying non-NULL entries there), wouldn't it make
>> sense to dimension the tables by SH_type_max_shadow + 1 only?
>> Or would you consider this too risky?
> 
> Yes, I think that would be fine, also changing '<= 15' to
> '<= SH_type_max_shadow'.  Maybe add a matching
> ASSERT(t <= SH_type_max_shadow) in shadow_hash_insert as well?

The latter (also for shadow_hash_delete()) would seem kind
of orthogonal to me, but for now I've put it in there.

Jan

