Return-Path: <SRS0=vMqj=6Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5890C47255
	for <xen-devel@archiver.kernel.org>; Mon, 11 May 2020 15:00:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EA8420643
	for <xen-devel@archiver.kernel.org>; Mon, 11 May 2020 15:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EA8420643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY9uh-0004sr-1i; Mon, 11 May 2020 15:00:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jY9ug-0004sm-1p
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 15:00:14 +0000
X-Inumbo-ID: 1c57e64c-9398-11ea-a21f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c57e64c-9398-11ea-a21f-12813bfff9fa;
 Mon, 11 May 2020 15:00:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 04F33AD08;
 Mon, 11 May 2020 15:00:12 +0000 (UTC)
Subject: Re: [PATCH 01/16] x86/traps: Drop last_extable_addr
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-2-andrew.cooper3@citrix.com>
 <3ec06cb1-6b31-2fde-6de4-23938acab73a@suse.com>
 <64cb6793-c3a0-e396-c6cc-50f5a36e19a6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c2740228-ff78-e9d3-41c4-6a5402029259@suse.com>
Date: Mon, 11 May 2020 17:00:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <64cb6793-c3a0-e396-c6cc-50f5a36e19a6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.05.2020 16:53, Andrew Cooper wrote:
> On 04/05/2020 13:44, Jan Beulich wrote:
>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>> The only user of this facility is dom_crash_sync_extable() by passing 0 into
>>> asm_domain_crash_synchronous().  The common error cases are already covered
>>> with show_page_walk(), leaving only %ss/%fs selector/segment errors in the
>>> compat case.
>>>
>>> Point at dom_crash_sync_extable in the error message, which is about as good
>>> as the error hints from other users of asm_domain_crash_synchronous(), and
>>> drop last_extable_addr.
>> While I'm not entirely opposed, I'd like you to clarify that you indeed
>> mean to (mostly) revert your own improvement from 6 or 7 years back
>> (commit 8e0da8c07f4f). I'm also surprised to find this as part of the
>> series it's in - in what way does this logic get in the way of CET-SS?
> 
> It was part of the exception_fixup() cleanup.  The first 4 patches not
> specifically related to CET-SS.

"Cleanup" doesn't mean it's needed as a prereq for the CET-SS, so I'm
afraid it's still not really clear to me whether we indeed want to
effectively revert the earlier change, which had a reason to be done
the way it was done.

Jan

