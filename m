Return-Path: <SRS0=syOn=JY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCAAC43462
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 14:04:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 432EC60FF1
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 14:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 432EC60FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.118561.224747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbOK5-00032i-Bs; Tue, 27 Apr 2021 14:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118561.224747; Tue, 27 Apr 2021 14:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbOK5-00032b-8q; Tue, 27 Apr 2021 14:04:21 +0000
Received: by outflank-mailman (input) for mailman id 118561;
 Tue, 27 Apr 2021 14:04:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbOK4-00032W-9w
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 14:04:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5b71c7f-10d2-4a31-912f-e075cb0c0e25;
 Tue, 27 Apr 2021 14:04:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3DF8B1AB;
 Tue, 27 Apr 2021 14:04:18 +0000 (UTC)
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
X-Inumbo-ID: e5b71c7f-10d2-4a31-912f-e075cb0c0e25
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619532258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irnD8H+Ltmvio0+MIZZ5Td0oWNCdmHTWC4V6hkG+DG8=;
	b=hpMcwtclNRBJ7t9z68H7RwrhNIzDMAP/mgKEq3+HhU9wZxMUmVFMWLdZNYFwpQ7JhQFrxi
	DaaBQ52HwQSnAB/g/6U1JPXo0vxCyUD/Q0LbbEHCMgItVEhkEE2U3WFlfWWyv5UNV75gz4
	6t1Q9y+18AxQgodv527g1UEQnzZII/o=
Subject: Re: [PATCH 7/7] video/vesa: adjust (not just) command line option
 handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
 <7e3f69d7-23e8-397d-72b6-8c489d80ea45@suse.com>
 <3e04b606-4e4f-e181-d3be-bcf99a2c8fa2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3aadebaa-5a0b-e21b-c86a-289c2fae5d44@suse.com>
Date: Tue, 27 Apr 2021 16:04:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3e04b606-4e4f-e181-d3be-bcf99a2c8fa2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.04.2021 15:49, Andrew Cooper wrote:
> On 27/04/2021 13:56, Jan Beulich wrote:
> 
> The grammar in the subject is very awkward.  The (not just) like that is
> weird.
> 
> If it were me, I'd phrase this as "minor adjustments to command line
> handling".

Well, the (not just) is intentionally there because there are changes
to stuff unrelated to command line option handling as well.

>> Document both options. Add section annotations to both variables holding
>> the parsed values as well as a few adjacent ones. Adjust the types of
>> font_height and vga_compat.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> In principle, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, with
> one note below.

Thanks.

> However, is there really any value in these options?  I can't see a case
> where their use will result in a less broken system.

Well, if we mis-detect VRAM size, the respective option might indeed
help. I'm less certain of the utility of the mapping option, the more
that now there's no possible (and implicit) effect on MTRRs anymore.

>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2369,9 +2369,21 @@ cache-warming. 1ms (1000) has been measu
>>  ### vesa-map
>>  > `= <integer>`
>>  
>> +> Default: `0`
>> +
>> +Specify, in MiB, the portion of video RAM to actually remap.  This will be
>> +honored only when large enough to cover the space needed for the chosen video
>> +mode, and only when less than a non-zero value possibly specified through
>> +'vesa-ram'.
> 
> "and only when less than a non-zero value possibly specified" is
> confusing to follow.
> 
> What I think you mean is that vesa-map will be honoured when it is >=
> chosen video mode, and <= vesa-ram?

Yes. Any suggestion how to improve the wording without using >= and
<= ?

Jan

