Return-Path: <SRS0=xTCj=5L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93A4C43331
	for <xen-devel@archiver.kernel.org>; Thu, 26 Mar 2020 15:06:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56DA20737
	for <xen-devel@archiver.kernel.org>; Thu, 26 Mar 2020 15:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A56DA20737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHU53-000571-0S; Thu, 26 Mar 2020 15:06:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHU51-00056w-O3
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 15:05:59 +0000
X-Inumbo-ID: 4c3f76ac-6f73-11ea-8805-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c3f76ac-6f73-11ea-8805-12813bfff9fa;
 Thu, 26 Mar 2020 15:05:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A8DE9AD93;
 Thu, 26 Mar 2020 15:05:57 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-8-andrew.cooper3@citrix.com>
 <de9a73c3-4568-c010-4669-e39aa0b9c31d@suse.com>
 <3e157f6d-e237-68d2-f628-10f4d42e578b@citrix.com>
 <a7a03cf2-a8ce-3b82-5c0c-22f4bccc0c8e@suse.com>
 <154fef1b-5c73-4716-e649-4ea99cba3c72@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5aef05a2-5d37-c9a9-8cc7-157c52524faa@suse.com>
Date: Thu, 26 Mar 2020 16:05:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <154fef1b-5c73-4716-e649-4ea99cba3c72@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 7/7] x86/ucode/intel: Fold structures
 together
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.2020 15:50, Andrew Cooper wrote:
> On a perhaps tangential note, what (if anything) are you plans regarding
> backport here?
> 
> These defines are ok for a transitional period across a series (and
> probably means I'll need to get the AMD side ready to be committed at
> the same time), but I don't think we'd want them in the code for the
> longterm.
> 
> I personally wasn't overly concerned about backports, but if you are, we
> should probably take this into consideration for the fixes.

Till now I didn't see a strong reason why backporting might be
needed (or even just wanted). If you think there is one,
arranging for backport material to come first would of course
be nice. And indeed, the #define-s you mention are meant to be
there just to limit the churn of this immediate patch; I'd be
happy to see them go away in another patch immediately after.

Jan

