Return-Path: <SRS0=Sbf7=AM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546A8C433DF
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2020 10:23:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2FA2067D
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2020 10:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D2FA2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqZtH-0001X9-Qu; Wed, 01 Jul 2020 10:22:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LFmw=AM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqZtG-0001X4-Sk
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 10:22:54 +0000
X-Inumbo-ID: d2d87364-bb84-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2d87364-bb84-11ea-b7bb-bc764e2007e4;
 Wed, 01 Jul 2020 10:22:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F876AD04;
 Wed,  1 Jul 2020 10:22:53 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/7] x86: compat header generation and checking adjustments
Message-ID: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
Date: Wed, 1 Jul 2020 12:22:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As was pointed out by 0e2e54966af5 ("mm: fix public declaration of
struct xen_mem_acquire_resource"), we're not currently handling structs
correctly that have uint64_aligned_t fields. Patch 2 demonstrates that
there was also an issue with XEN_GUEST_HANDLE_64().

Only the 1st patch was previously sent, but the approach chosen has
been changed altogether. All later patches are new. For 4.14 I think
at least patch 1 should be considered.

1: x86: fix compat header generation
2: x86/mce: add compat struct checking for XEN_MC_inject_v2
3: x86/mce: bring hypercall subop compat checking in sync again
4: x86/dmop: add compat struct checking for XEN_DMOP_map_mem_type_to_ioreq_server
5: x86: generalize padding field handling
6: flask: drop dead compat translation code
7: x86: only generate compat headers actually needed

Jan

