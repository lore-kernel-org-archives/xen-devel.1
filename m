Return-Path: <SRS0=xTCj=5L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EDFC43331
	for <xen-devel@archiver.kernel.org>; Thu, 26 Mar 2020 15:41:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5EBF20714
	for <xen-devel@archiver.kernel.org>; Thu, 26 Mar 2020 15:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5EBF20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHUdC-0000av-KT; Thu, 26 Mar 2020 15:41:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHUdB-0000an-Oj
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 15:41:17 +0000
X-Inumbo-ID: 3b119ebe-6f78-11ea-8816-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b119ebe-6f78-11ea-8816-12813bfff9fa;
 Thu, 26 Mar 2020 15:41:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 53591ABF6;
 Thu, 26 Mar 2020 15:41:16 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200326152720.36970-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c7cb463-bb92-a57c-9654-52536c874a8c@suse.com>
Date: Thu, 26 Mar 2020 16:41:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200326152720.36970-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v3 0/4] x86/nvmx: fixes for interrupt
 injection
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.2020 16:27, Roger Pau Monne wrote:
> Hello,
> 
> osstest identified a regression caused by my earlier attempt to fix
> interrupt injection when using nested VMX. This series aims to fix the
> regression, and should unblock several osstest branches.
> 
> The following report is from osstest with this series applied:
> 
> http://logs.test-lab.xenproject.org/osstest/logs/149051/
> 
> Note the last patch (4/4) is the one that actually fixes the issue. Xen
> will always use the Ack on exit feature so patches 2/4 and 3/4 don't
> change the functionality when running a nested Xen, as it always
> requires SVI to be updated.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (4):
>   Revert "x86/vvmx: fix virtual interrupt injection when Ack on exit
>     control is used"
>   x86/nvmx: only update SVI when using Ack on exit

You probably didn't notice that these two got committed earlier today?

Jan

