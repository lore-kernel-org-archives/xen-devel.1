Return-Path: <SRS0=3qI7=5S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7848AC43331
	for <xen-devel@archiver.kernel.org>; Thu,  2 Apr 2020 07:56:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 516EE206F6
	for <xen-devel@archiver.kernel.org>; Thu,  2 Apr 2020 07:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 516EE206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJuhg-0004yp-0z; Thu, 02 Apr 2020 07:55:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJuhe-0004yk-ES
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 07:55:54 +0000
X-Inumbo-ID: 60745ab8-74b7-11ea-bb88-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60745ab8-74b7-11ea-bb88-12813bfff9fa;
 Thu, 02 Apr 2020 07:55:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F0DD1AAB8;
 Thu,  2 Apr 2020 07:55:52 +0000 (UTC)
Subject: Ping: [PATCH 4/4] x86/APIC: restrict certain messages to BSP
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <513e4f93-a8a0-ae72-abcc-aa28531eca97@suse.com>
 <bab16aee-bb0c-1e7b-62b8-4a70c54314a8@citrix.com>
 <59fb3a7c-dd03-d9f6-2588-aae300b3d28f@suse.com>
Message-ID: <bca78b96-54a2-8253-0b17-78726781bcc1@suse.com>
Date: Thu, 2 Apr 2020 09:55:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <59fb3a7c-dd03-d9f6-2588-aae300b3d28f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.03.2020 10:10, Jan Beulich wrote:
> On 13.03.2020 17:18, Andrew Cooper wrote:
>> On 13/03/2020 09:26, Jan Beulich wrote:
>>> All CPUs get an equal setting of EOI broadcast suppression; no need to
>>> log one message per CPU, even if it's only in verbose APIC mode.
>>>
>>> Only the BSP is eligible to possibly get ExtINT enabled; no need to log
>>> that it gets disabled on all APs, even if - again - it's only in verbose
>>> APIC mode.
>>
>> How true is this in practice?
> 
> I guess you read "eligible" as "in theory", whereas it is meant as "with
> how our [and in particular this] code is working right now". Even if we
> decided to switch the CPU to handle ExtINT, it still wouldn't need to be
> one message per CPU - it would suffice to issue the message for the one
> CPU getting ExtINT enabled.

Are you okay with the above explanation, and hence willing to give an
ack? If not, what alternative suggestion do you have to limit this
particular part of the log spam on very-many-CPU systems?

Jan

