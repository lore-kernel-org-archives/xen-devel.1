Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8FDC56202
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 13:58:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FA3E20781
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 13:58:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="jz6QdI5G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FA3E20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.34395.65412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCM8-0003l9-R6; Mon, 23 Nov 2020 13:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34395.65412; Mon, 23 Nov 2020 13:58:12 +0000
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
	id 1khCM8-0003l2-Nj; Mon, 23 Nov 2020 13:58:12 +0000
Received: by outflank-mailman (input) for mailman id 34395;
 Mon, 23 Nov 2020 13:58:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCM7-0003kw-Ri
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:58:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2e01039-815e-46a7-9af3-aec410442773;
 Mon, 23 Nov 2020 13:58:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F319ABE4;
 Mon, 23 Nov 2020 13:58:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCM7-0003kw-Ri
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:58:11 +0000
X-Inumbo-ID: a2e01039-815e-46a7-9af3-aec410442773
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a2e01039-815e-46a7-9af3-aec410442773;
	Mon, 23 Nov 2020 13:58:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606139890; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lYFTUsX+0/pVFdYdfVYe2ygcWjaAE030Av5jYiLRLo=;
	b=jz6QdI5Gq1MJXVHRM7slJ0g3kxMEzsYtmzRJeCKv69fzH1Mwc2nkgm2Jvk9CLx7C2m+/k/
	gl3bOz8P55EqBKd7KlEF2Xi3JFutARu9bmxNUt6ZAX1gmDSiD8025681w/YSf6fnliNTa+
	C1y5A2qjsSCnd5taDaaoPCV+hJuqLWY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4F319ABE4;
	Mon, 23 Nov 2020 13:58:10 +0000 (UTC)
Subject: Re: [PATCH] libxg: don't use max policy in xc_cpuid_xend_policy()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <4fa05759-24ac-5ff3-3db9-94537f6be95d@suse.com>
 <20201106155839.vnhdqcptbpkbzfly@liuwe-devbox-debian-v2>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bab94d0a-89e8-18d8-9098-e30781c3a2e9@suse.com>
Date: Mon, 23 Nov 2020 14:58:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201106155839.vnhdqcptbpkbzfly@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.11.2020 16:58, Wei Liu wrote:
> On Thu, Nov 05, 2020 at 04:56:53PM +0100, Jan Beulich wrote:
>> Using max undermines the separation between default and max. For example,
>> turning off AVX512F on an MPX-capable system silently turns on MPX,
>> despite this not being part of the default policy anymore. Since the
>> information is used only for determining what to convert 'x' to (but not
>> to e.g. validate '1' settings), the effect of this change is identical
>> for guests with (suitable) "cpuid=" settings to that of the changes
>> separating default from max and then converting (e.g.) MPX from being
>> part of default to only being part of max for guests without (affected)
>> "cpuid=" settings.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I will defer this to Andrew.

Andrew?

Thanks, Jan

