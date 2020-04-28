Return-Path: <SRS0=URyG=6M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E531C83000
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 14:06:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1827F206C0
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 14:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1827F206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTQs6-0004BF-Ux; Tue, 28 Apr 2020 14:06:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTQs6-0004BA-8U
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 14:06:02 +0000
X-Inumbo-ID: 63a7b23d-8959-11ea-9867-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63a7b23d-8959-11ea-9867-12813bfff9fa;
 Tue, 28 Apr 2020 14:06:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 07C04AA7C;
 Tue, 28 Apr 2020 14:05:58 +0000 (UTC)
Subject: Re: [XEN PATCH v5 13/16] xen,symbols: rework file symbols selection
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-14-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e67399ed-43d1-544c-6a85-29df59e42006@suse.com>
Date: Tue, 28 Apr 2020 16:05:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421161208.2429539-14-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.04.2020 18:12, Anthony PERARD wrote:
> We want to use the same rune to build mm/*/guest_*.o as the one use to
> build every other *.o object. The consequence it that file symbols that
> the program ./symbols prefer changes with CONFIG_ENFORCE_UNIQUE_SYMBOLS=y.
> 
> For example, when building arch/x86/mm/guest_walk_2.o from guest_walk.c,
> this would be the difference of file symbol present in the object when
> building with CONFIG_ENFORCE_UNIQUE_SYMBOLS=y:
> 
> (1) Currently we have those two file symbols:
>     guest_walk.c
>     guest_walk_2.o
> (2) When building with the same rune, we will have:
>     arch/x86/mm/guest_walk.c
>     guest_walk_2.o

So I had to go to the v4 discussion to understand this again. As said
there, it may be obvious to you but despite having been the one to
introduce the objcopy step there, it is not to me. Hence my continued
desire to have this at least briefly mentioned here, as it's not
otherwise noticeable from looking at the patch itself.

The code change itself looks okay to me, but I'll want to ack this
change only once I can follow the description from a single pass of
reading through it. I'm sorry for the extra trouble.

Jan

