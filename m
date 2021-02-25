Return-Path: <SRS0=BiGO=H3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88723C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 13:25:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F6E164EF5
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 13:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F6E164EF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89768.169370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGe9-0001uY-QS; Thu, 25 Feb 2021 13:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89768.169370; Thu, 25 Feb 2021 13:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGe9-0001uR-NS; Thu, 25 Feb 2021 13:25:37 +0000
Received: by outflank-mailman (input) for mailman id 89768;
 Thu, 25 Feb 2021 13:25:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFGe8-0001uM-Ny
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:25:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e7edcde-e457-4c8f-a28a-f84dc9a0679a;
 Thu, 25 Feb 2021 13:25:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E29D0AFEC;
 Thu, 25 Feb 2021 13:25:34 +0000 (UTC)
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
X-Inumbo-ID: 0e7edcde-e457-4c8f-a28a-f84dc9a0679a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614259535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j7Vacklv3PUp5sL4v4xQbFRLhlG3BXVNu0h33D+R/aA=;
	b=n+zz5iQC8kHA4r4fNUnb+0hkowE7HjdNrRqjgq+jSQgZjOfUBIivdLkj0E4oWBdkcxVvI8
	sNn3cGVtrb+ffkdFzs31ZerLGxtgrHMHVr3PhmegBPULwP6gdtiE7VWzyKGtGPoIHSfw+Q
	9hGm2BdsakFKqd2eNFQKu6jEveplVIQ=
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
To: Ian Jackson <iwj@xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
 <dae5479e-9974-334b-7f4f-e4194e435aaa@suse.com>
 <24631.41997.596809.646522@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e79c8610-6e4e-e57f-a10a-aad1f2cbdfed@suse.com>
Date: Thu, 25 Feb 2021 14:25:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24631.41997.596809.646522@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 14:20, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
>> As to 4.15: Without this shadow mode simply won't work on such (new)
>> hardware. Hence something needs to be done anyway. An alternative
>> would be to limit the change to just the guest-no-present entries (to
>> at least allow PV guests to be migrated), and refuse to enable shadow
>> mode for HVM guests on such hardware. (In this case we'd probably
>> better take care of ...
> 
> Thanks for this explanation.
> 
> It sounds like the way you have it in this proposed patch is simpler
> than the alternative.  And that right now it's not a regression, but
> it is needed for running Xen on such newer hardware.

I'm not sure about the "simpler" part.

>> The main risk here is (in particular for the MMIO part of the change
>> I suppose) execution suddenly going a different path, which has been
>> unused / untested (for this specific case) for years.
> 
> That's somewhat concerning.  But I think this only applies to the new
> hardware ?  So it would be risking an XSA but not really risking the
> release very much.

Right - afaict an XSA would also be lurking without us doing anything,
as we'd permit a guest access to pages we didn't mean to hand to it.

> I think therefore:
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks.

Jan

