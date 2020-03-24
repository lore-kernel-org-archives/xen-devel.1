Return-Path: <SRS0=L5TH=5J=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EE2C43331
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2020 12:26:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E34E20719
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2020 12:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E34E20719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGidZ-0005Mf-DL; Tue, 24 Mar 2020 12:26:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGidY-0005MY-8y
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 12:26:28 +0000
X-Inumbo-ID: ae589e86-6dca-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae589e86-6dca-11ea-bec1-bc764e2007e4;
 Tue, 24 Mar 2020 12:26:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DB2BAAEB8;
 Tue, 24 Mar 2020 12:26:25 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
Date: Tue, 24 Mar 2020 13:26:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH v5 00/10] x86emul: further work
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Some of the later patches are still at least partly RFC, for
varying reasons (see there). I'd appreciate though if at least
some of the earlier ones could go in rather sooner than later.

Patch 1 functionally (for the test harness) depends on
"libx86/CPUID: fix (not just) leaf 7 processing", while at
least patch 2 contextually depends on "x86emul: disable
FPU/MMX/SIMD insn emulation when !HVM".

 1: x86emul: support AVX512_BF16 insns
 2: x86emul: support MOVDIRI insn
 3: x86: determine HAVE_AS_* just once
 4: x86: move back clang no integrated assembler tests
 5: x86emul: support MOVDIR64B insn
 6: x86emul: support ENQCMD insn
 7: x86/HVM: scale MPERF values reported to guests (on AMD)
 8: x86emul: support RDPRU
 9: x86/HVM: don't needlessly intercept APERF/MPERF/TSC MSR reads
10: x86emul: support MCOMMIT

See individual patches for changes from v4 (which was mistakenly
sent out with a v3 tag).

Jan

