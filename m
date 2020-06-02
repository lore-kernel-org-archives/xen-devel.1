Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9818EC433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 09:49:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 730F620679
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 09:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 730F620679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg3YJ-0007vq-Ag; Tue, 02 Jun 2020 09:49:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Exxl=7P=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jg3YI-0007vi-Jm
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:49:46 +0000
X-Inumbo-ID: 63f7a558-a4b6-11ea-9947-bc764e2007e4
Received: from ppsw-30.csi.cam.ac.uk (unknown [131.111.8.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63f7a558-a4b6-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 09:49:46 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:53914
 helo=[192.168.1.219])
 by ppsw-30.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.156]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jg3YF-000lhP-eF (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Tue, 02 Jun 2020 10:49:43 +0100
Subject: Re: [PATCH for-4.14] x86/cpu: fix build with clang 3.5
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200602090536.38064-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <025f047c-bf92-1ffd-031d-ec46e17f6ffa@citrix.com>
Date: Tue, 2 Jun 2020 10:49:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602090536.38064-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02/06/2020 10:05, Roger Pau Monne wrote:
> Clang 3.5 complains with:
>
> common.c:794:24: error: statement expression not allowed at file scope
>                       i < ARRAY_SIZE(this_cpu(tss_page).ist_ssp); ++i )
>                                      ^
> /build/xen/include/asm/percpu.h:14:7: note: expanded from macro 'this_cpu'
>     (*RELOC_HIDE(&per_cpu__##var, get_cpu_info()->per_cpu_offset))
>       ^
> /build/xen/include/xen/compiler.h:104:3: note: expanded from macro 'RELOC_HIDE'
>   ({ unsigned long __ptr;                       \
>   ^
> /build/xen/include/xen/lib.h:68:69: note: expanded from macro 'ARRAY_SIZE'
> #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))
>                                                                     ^
> /build/xen/include/xen/compiler.h:85:57: note: expanded from macro '__must_be_array'
>   BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(&a[0])))
>                                                         ^
> /build/xen/include/xen/lib.h:39:57: note: expanded from macro 'BUILD_BUG_ON_ZERO'
> #define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
>                                                         ^
>
> Workaround this by defining the tss_page as a local variable. Adjust
> other users of the per-cpu tss_page to also use the newly introduced
> local variable.
>
> No functional change expected.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Sorry for more carnage.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

