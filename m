Return-Path: <SRS0=2tZV=6L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9946AC54FD0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2020 11:09:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EC712063A
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2020 11:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EC712063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT1dF-0004jp-Sa; Mon, 27 Apr 2020 11:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jT1dE-0004jk-MK
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 11:09:00 +0000
X-Inumbo-ID: 7e17c2b6-8877-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e17c2b6-8877-11ea-9887-bc764e2007e4;
 Mon, 27 Apr 2020 11:08:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 36FCFAC5F;
 Mon, 27 Apr 2020 11:08:57 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 00/11] x86emul: further work
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <e28f9cdf-00bc-4a48-c5bf-96f5055c7291@suse.com>
Date: Mon, 27 Apr 2020 13:08:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
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

At least the RDPRU patches is still at least partly RFC. I'd
appreciate though if at least some of the series could go in
rather sooner than later. Note in particular that there's no
strong ordering throughout the entire series, i.e. certain
later parts could be arranged for to go in earlier. This is
also specifically the case for what is now the last patch.

 1: x86emul: disable FPU/MMX/SIMD insn emulation when !HVM
 2: x86emul: support MOVDIR{I,64B} insns
 3: x86emul: support ENQCMD insn
 4: x86emul: support SERIALIZE
 5: x86emul: support X{SUS,RES}LDTRK
 6: x86emul: support FNSTENV and FNSAVE
 7: x86emul: support FLDENV and FRSTOR
 8: x86emul: support FXSAVE/FXRSTOR
 9: x86/HVM: scale MPERF values reported to guests (on AMD)
10: x86emul: support RDPRU
11: x86/HVM: don't needlessly intercept APERF/MPERF/TSC MSR reads

Main changes from v6 are, besides three new patches and some
re-ordering, the integration into this series of what is now
patch 1 (for later patches now depending even more heavily on
it), and the dropping (for the time being) of the MCOMMIT one.

Jan

