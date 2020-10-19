Return-Path: <SRS0=rP1u=D2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9FEC433E7
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2020 15:37:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EBD722260
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2020 15:37:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RMEBy54p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EBD722260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8752.23496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUXDM-0000eT-Eb; Mon, 19 Oct 2020 15:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8752.23496; Mon, 19 Oct 2020 15:36:48 +0000
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
	id 1kUXDM-0000eM-AW; Mon, 19 Oct 2020 15:36:48 +0000
Received: by outflank-mailman (input) for mailman id 8752;
 Mon, 19 Oct 2020 15:36:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUXDL-0000eH-Es
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:36:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f1ba7c1-4d4c-4747-83b9-596542e3db6b;
 Mon, 19 Oct 2020 15:36:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6C47B1B6;
 Mon, 19 Oct 2020 15:36:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUXDL-0000eH-Es
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:36:47 +0000
X-Inumbo-ID: 6f1ba7c1-4d4c-4747-83b9-596542e3db6b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6f1ba7c1-4d4c-4747-83b9-596542e3db6b;
	Mon, 19 Oct 2020 15:36:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603121805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LhI41s9uuQ9FvOUUfeBpwh8KwhupqRV/agwhY1nG4Ko=;
	b=RMEBy54pGb372TEx9pQqudlVTxPqJtgnxj3YAIzT6HwntnmmUb5rsMreHTOlqTVeiDMvHr
	RmnaiI4NP1WLUcCB/DLHT9/WjZQJDKp+6BDBgxr+kwcGWy2/jS7Dzvue5CaorRkY44EVZY
	tP6FvEtGbuXai9rFoftNGnLk9cAo6sA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B6C47B1B6;
	Mon, 19 Oct 2020 15:36:45 +0000 (UTC)
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20201014153150.83875-1-jandryuk@gmail.com>
 <6d373cae-c7dc-e109-1df3-ccbbe4bdd9c8@suse.com>
 <CAKf6xpv5GNjw0pjOxEqdVj2+C6v+O5PDZG5yYkNfytDjUT_r5w@mail.gmail.com>
 <4229544b-e98d-6f3c-14aa-a884c403ba74@suse.com>
 <CAKf6xpt_VhJ5r4scuAkWU3aGxgwiYNtHaBDpMoFJS+q837aFiA@mail.gmail.com>
 <d8e93366-0f99-37c7-e5f4-8efaf804d2e2@suse.com>
 <CAKf6xpv9qHJydjQ_TyZEKZAK14T4m2GLLqEwyMTraUxqvg+1Xw@mail.gmail.com>
 <d10143d9-0082-fa09-3ef0-2d13e5ee54ef@suse.com>
 <CAKf6xpvhTLVdBEXjz4MB_cmbfMGR0pjdAxHHoHz9hTsa+ObpOg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec5d41a2-18e8-15a3-85e0-d6a72deab5fc@suse.com>
Date: Mon, 19 Oct 2020 17:36:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAKf6xpvhTLVdBEXjz4MB_cmbfMGR0pjdAxHHoHz9hTsa+ObpOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.10.2020 17:26, Jason Andryuk wrote:
> On Mon, Oct 19, 2020 at 3:38 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 16.10.2020 18:28, Jason Andryuk wrote:
>>> Looks like we can pass XC_DOM_PV_CONTAINER/XC_DOM_HVM_CONTAINER down
>>> into elf_xen_parse().  Then we would just validate phys_entry for HVM
>>> and virt_entry for PV.  Does that sound reasonable?
>>
>> I think so, yes. Assuming of course that you'll convert the XC_DOM_*
>> into a boolean, so that the hypervisor's use of libelf/ can also be
>> suitably adjusted.
> 
> Are you okay with:
> -int elf_xen_parse(struct elf_binary *elf,
> -                  struct elf_dom_parms *parms);
> +int elf_xen_parse_pvh(struct elf_binary *elf,
> +                      struct elf_dom_parms *parms);
> +int elf_xen_parse_pv(struct elf_binary *elf,
> +                     struct elf_dom_parms *parms);
> ?
> 
> I prefer avoiding boolean arguments since I find it helps readability.

And I view things the other way around. If readability is of
concern, how about adding an unsigned int flags parameter
and #define-ing two suitable constants to be passed?

And of course it's not me alone who needs to be okay with
whatever route you/we go.

Jan

