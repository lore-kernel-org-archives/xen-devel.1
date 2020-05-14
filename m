Return-Path: <SRS0=xDB7=64=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE1DC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 14 May 2020 09:13:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A322A20675
	for <xen-devel@archiver.kernel.org>; Thu, 14 May 2020 09:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A322A20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZ9vD-0002Zg-Rv; Thu, 14 May 2020 09:12:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZ9vD-0002ZY-1X
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 09:12:55 +0000
X-Inumbo-ID: 17ba3d60-95c3-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17ba3d60-95c3-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 09:12:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D3C7ABE6;
 Thu, 14 May 2020 09:12:56 +0000 (UTC)
Subject: Re: [PATCH v9 0/9] x86emul: further work
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2c2bb6c-b089-de09-6388-50ec837310d7@suse.com>
Message-ID: <75b9068b-4bbb-221d-6737-dc4a7867d580@suse.com>
Date: Thu, 14 May 2020 11:12:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e2c2bb6c-b089-de09-6388-50ec837310d7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.2020 11:03, Jan Beulich wrote:
> 1: address x86_insn_is_mem_{access,write}() omissions 
> 2: disable FPU/MMX/SIMD insn emulation when !HVM
> 3: support MOVDIR{I,64B} insns
> 4: support ENQCMD insn
> 5: support SERIALIZE
> 6: support X{SUS,RES}LDTRK
> 7: support FNSTENV and FNSAVE
> 8: support FLDENV and FRSTOR
> 9: support FXSAVE/FXRSTOR
> 
> Main changes from v8 are the new patch 1 and dropped patches
> from the end of the series. For other changes see the individual
> patches.

Oh, and I should have mentioned that parts here depend on
"x86/gen-cpuid: Distinguish default vs max in feature annotations",
which looks to be ready to go in, but hasn't gone in yet.

Jan


