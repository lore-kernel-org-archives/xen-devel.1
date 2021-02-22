Return-Path: <SRS0=J8L2=HY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB4BC433E6
	for <xen-devel@archiver.kernel.org>; Mon, 22 Feb 2021 16:25:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6D564E61
	for <xen-devel@archiver.kernel.org>; Mon, 22 Feb 2021 16:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C6D564E61
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.88256.165800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEE1X-00074l-Kq; Mon, 22 Feb 2021 16:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88256.165800; Mon, 22 Feb 2021 16:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEE1X-00074e-Ht; Mon, 22 Feb 2021 16:25:27 +0000
Received: by outflank-mailman (input) for mailman id 88256;
 Mon, 22 Feb 2021 16:25:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEE1W-00074Z-IQ
 for xen-devel@lists.xen.org; Mon, 22 Feb 2021 16:25:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df841af0-1fb3-48df-83cd-a605bcd6ee26;
 Mon, 22 Feb 2021 16:25:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0EB0AC69;
 Mon, 22 Feb 2021 16:25:24 +0000 (UTC)
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
X-Inumbo-ID: df841af0-1fb3-48df-83cd-a605bcd6ee26
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614011124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=osJvbx1L06taSNZkiSDQJ0xWcSCB+zp9cpcXFxUyEMo=;
	b=bJ+Gi09CWniYmaYBkYCSiHjbmE/zF8iPt9XwDLMwipvAzcmB7sbva4Dilg0/qY6NAacs39
	8uwrZiKO7ZpLeLIRcbWgsGBH6igBwVqH8DM7LFkZ7HWRFG7ItjQd19tzaQ9/KDayPFQ1Tu
	C3yJYd2Mn7kXIs5cnk7/MyiHM47vfnY=
Subject: Re: Stable ABI checking (take 2)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>
References: <68c93553-7db5-f43b-b3cd-b9112a8a57dc@citrix.com>
 <78eec55c-ac2c-467e-0a2c-9acb44eba850@suse.com>
 <a2acb45e-244a-2786-391d-c6ee7d267cfd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a38fe0a-0aee-f3f3-f9ea-43300499c350@suse.com>
Date: Mon, 22 Feb 2021 17:25:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a2acb45e-244a-2786-391d-c6ee7d267cfd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.02.2021 17:00, Andrew Cooper wrote:
> On 22/02/2021 14:37, Jan Beulich wrote:
>> On 22.02.2021 15:03, Andrew Cooper wrote:
>>> Hello,
>>>
>>> Staging is now capable of writing out an ABI description when the
>>> appropriate tool (abi-dumper) is available.
>>>
>>> We now have to possible courses of action for ABI checking in builds.
>>>
>>> 1) Publish the ABI descriptions on xenbits, update all downstream test
>>> systems to invoke abi-compliance-checker manually.
>>>
>>> 2) Commit/update the ABI descriptions when RELEASE-$X.$Y.0 is tagged,
>>> update the main build to use abi-compliance-checker when available.
>>>
>>>
>>> Pros/Cons:
>>>
>>> The ABI descriptions claim to be sensitive to toolchain in use.  I don't
>>> know how true this is in practice.
>>>
>>> Publishing on xenbits involves obtaining even more misc artefacts during
>>> the build, which is going to be firm -2 from downstreams.
>>>
>>> Committing the ABI descriptions lets abi checking work in developer
>>> builds (with suitable tools installed).  It also means we get checking
>>> "for free" in Gitlab CI and OSSTest without custom logic.
>>>
>>>
>>> Thoughts on which approach is better?  I'm leaning in favour of option 2
>>> because it allows for consumption by developers and test systems.
>> +1 for option 2, fwiw.
>>
>>> If we do go with route 2, I was thinking of adding a `make check`
>>> hierarchy.  Longer term, this can be used to queue up other unit tests
>>> which can be run from within the build tree.
>> Is there a reason the normal build process can't be made fail in
>> case verification fails? Besides "make check" typically meaning to
>> invoke a functional testsuite rather than (just) some compatibility
>> checking, I'd also be worried of no-one (likely including me) to
>> remember to separately run "make check" at appropriate times.
> 
> As far as RPM is concerned, splitting the two is important, as %build
> and %check are explicitly separate steps.  I have no idea what the deb
> policy/organisation is here.
> 
> Merging some of check into build would be a layering violation, and even
> if we did so, where do you draw the line?

Well, building a shared object that won't load is as bad as building
a shared object that won't work because of violating expected
guarantees. The closest similarity I can think of right away would be
the linker error you ought to get when a to-be-exported symbol can't
be resolved. The line imo would be drawn between things detectable at
build time vs those only detectable by actually using the generated
binaries.

Jan

