Return-Path: <SRS0=v/14=JE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076F2C433B4
	for <xen-devel@archiver.kernel.org>; Wed,  7 Apr 2021 21:27:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B51FD6103E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Apr 2021 21:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B51FD6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.106929.204417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUFhX-0005ul-Cj; Wed, 07 Apr 2021 21:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106929.204417; Wed, 07 Apr 2021 21:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUFhX-0005ue-9V; Wed, 07 Apr 2021 21:27:03 +0000
Received: by outflank-mailman (input) for mailman id 106929;
 Wed, 07 Apr 2021 21:27:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gfIe=JE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lUFhV-0005uZ-J2
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 21:27:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c944368-db63-48c7-8a71-54e00bc70660;
 Wed, 07 Apr 2021 21:27:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F262E6103E;
 Wed,  7 Apr 2021 21:26:59 +0000 (UTC)
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
X-Inumbo-ID: 7c944368-db63-48c7-8a71-54e00bc70660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617830820;
	bh=ojqS+OP+pnrmdghnXuDADCExqLjXsjKsvylLWQWxRbA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hbrLFad/YFO40omDnXfyvKFv3z+8UvJOBgM1QCyyU4BHATFYy7UzPQF9r5CxMDbSh
	 R0gtfLgj9i2zPUjU1Ii0TfCdl3lzC8/aWjPbYXqBlKAhQIiaH6dDKMj43kIm18OGmU
	 UuQiPeOhu5kOVd24D0tCeTlYnWxcyZVn2uJPPjPut6DazMbC5+JwL5wsHLqHyhuedx
	 4LcO5n5nKlYm9TaiDUwYmvUhVxc3q1DzwEDfWnbVxIVPR1kTVtrQ/PEy8XPKQJAWwJ
	 GZSBMiJx8Dq3MEZJnne4tirPD0gpMyfEsAax78GmzUhOtsYxm4mceBA1yknMOSMgyk
	 /pMQ2IukBy8Dw==
Date: Wed, 7 Apr 2021 14:26:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <luca.fancellu@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
In-Reply-To: <5cad4ffb-44ec-4cde-f5bb-f59dc3ca59ca@suse.com>
Message-ID: <alpine.DEB.2.21.2104071424190.31460@sstabellini-ThinkPad-T480s>
References: <20210406103603.8530-1-luca.fancellu@arm.com> <20210406103603.8530-4-luca.fancellu@arm.com> <073e28bc-ad94-429d-6384-744864d12b57@suse.com> <alpine.DEB.2.21.2104061425040.31460@sstabellini-ThinkPad-T480s> <e15ed7b9-b153-b767-e625-e7a9d2aa76bf@suse.com>
 <DF5BE432-F79E-4874-92DF-60A4DCD9EDBD@arm.com> <5cad4ffb-44ec-4cde-f5bb-f59dc3ca59ca@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Apr 2021, Jan Beulich wrote:
> On 07.04.2021 10:42, Luca Fancellu wrote:
> > Just to be sure that we are in the same page, are you suggesting to modify the name
> > In this way?
> > 
> > struct gnttab_cache_flush {
> > -    union {
> > +    union xen_gnttab_cache_flush_a {
> >         uint64_t dev_bus_addr;
> >         grant_ref_t ref;
> >     } a;
> > 
> > Following this kind of pattern: xen_<upper struct name>_<member name> ?
> 
> While in general I would be fine with this scheme, for field names like
> "a" or "u" it doesn't fit well imo.

"a" is a bad name anyway, even for the member. We can take the
opportunity to find a better name. Almost anything would be better than
"a". Maybe "refaddr"?


> I'm also unconvinced this would be
> scalable to the case where there's further struct/union nesting.

How many of these instances of multilevel nesting do we have? Luca might
know. Probably not many? They could be special-cased.

