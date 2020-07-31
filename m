Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0121C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 14:54:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA353206DA
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 14:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA353206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1WQg-0007dW-4Z; Fri, 31 Jul 2020 14:54:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1WQe-0007dM-L9
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:54:36 +0000
X-Inumbo-ID: bfd90942-d33d-11ea-abc9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfd90942-d33d-11ea-abc9-12813bfff9fa;
 Fri, 31 Jul 2020 14:54:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33658AE64;
 Fri, 31 Jul 2020 14:54:48 +0000 (UTC)
Subject: Ping: [PATCH v2] x86emul: avoid assembler warning about .type not
 taking effect in test harness
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <42875d48-10e4-cc88-70ac-8979fea2493c@suse.com>
Message-ID: <bf92faf4-b323-d4be-ca31-5e065c576b9a@suse.com>
Date: Fri, 31 Jul 2020 16:54:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <42875d48-10e4-cc88-70ac-8979fea2493c@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.07.2020 10:06, Jan Beulich wrote:
> gcc re-orders top level blocks by default when optimizing. This
> re-ordering results in all our .type directives to get emitted to the
> assembly file first, followed by gcc's. The assembler warns about
> attempts to change the type of a symbol when it was already set (and
> when there's no intervening setting to "notype").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Refine description to no longer claim a gcc change to be the reason.
> 
> --- a/tools/tests/x86_emulator/Makefile
> +++ b/tools/tests/x86_emulator/Makefile
> @@ -295,4 +295,9 @@ x86-emulate.o cpuid.o test_x86_emulator.
>  x86-emulate.o: x86_emulate/x86_emulate.c
>  x86-emulate.o: HOSTCFLAGS += -D__XEN_TOOLS__
>  
> +# In order for our custom .type assembler directives to reliably land after
> +# gcc's, we need to keep it from re-ordering top-level constructs.
> +$(call cc-option-add,HOSTCFLAGS-toplevel,HOSTCC,-fno-toplevel-reorder)
> +test_x86_emulator.o: HOSTCFLAGS += $(HOSTCFLAGS-toplevel)
> +
>  test_x86_emulator.o: $(addsuffix .h,$(TESTCASES)) $(addsuffix -opmask.h,$(OPMASK))
> 


