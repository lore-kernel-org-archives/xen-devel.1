Return-Path: <SRS0=v5y7=7C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDE1C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 14:20:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DCAA205CB
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 14:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DCAA205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbPZk-0007t5-33; Wed, 20 May 2020 14:20:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbPZj-0007kg-08
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 14:20:03 +0000
X-Inumbo-ID: fe0cf718-9aa4-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe0cf718-9aa4-11ea-b9cf-bc764e2007e4;
 Wed, 20 May 2020 14:20:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C3FE9AF44;
 Wed, 20 May 2020 14:20:03 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: correct {evex} assembler capability check
Message-ID: <2c0c9040-5ae4-ec08-9ddc-b88b99645950@suse.com>
Date: Wed, 20 May 2020 16:20:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The {evex} pseudo prefix gets rejected by gas for insns not allowing
EVEX encoding. Except there's a gas bug due to which its check gets
bypassed for insns without operands. Let's not rely on that bug to
remain there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -112,7 +112,7 @@ $(foreach flavor,$(SIMD) $(FMA),$(eval $
 
 # Also explicitly check for {evex} pseudo-prefix support, which got introduced
 # only after AVX512F and some of its extensions.
-TARGET-$(shell echo 'asm("{evex} vzeroall");' | $(CC) -x c -c -o /dev/null - || echo y) :=
+TARGET-$(shell echo 'asm("{evex} vmovaps %xmm0$(comma)%xmm0");' | $(CC) -x c -c -o /dev/null - || echo y) :=
 
 ifeq ($(TARGET-y),)
 $(warning Test harness not built, use newer compiler than "$(CC)" (version $(shell $(CC) -dumpversion)) and an "{evex}" capable assembler)

