Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BA4C369CB
	for <xen-devel@archiver.kernel.org>; Thu, 24 Apr 2025 01:09:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.965726.1356182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7l5T-0002fE-Em; Thu, 24 Apr 2025 01:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965726.1356182; Thu, 24 Apr 2025 01:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7l5T-0002f7-Bk; Thu, 24 Apr 2025 01:09:11 +0000
Received: by outflank-mailman (input) for mailman id 965726;
 Thu, 24 Apr 2025 01:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YKuC=XK=tum.de=f.specht@srs-se1.protection.inumbo.net>)
 id 1u7l5M-0002ei-FT
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 01:09:09 +0000
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [129.187.255.137])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4928715-20a8-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 03:09:01 +0200 (CEST)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
 by postout1.mail.lrz.de (Postfix) with ESMTP id 4ZjdCc2TPCzyYd;
 Thu, 24 Apr 2025 03:08:59 +0200 (CEST)
Received: from postout1.mail.lrz.de ([127.0.0.1])
 by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id 2C68K3DEf7DF; Thu, 24 Apr 2025 03:08:59 +0200 (CEST)
Received: from localhost (ip-77-25-21-71.web.vodafone.de [77.25.21.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4ZjdCb1j6MzyYB;
 Thu, 24 Apr 2025 03:08:59 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b4928715-20a8-11f0-9eb1-5ba50f476ded
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tum.de; h=
	content-disposition:content-type:content-type:mime-version
	:message-id:subject:subject:from:from:date:date:received
	:received; s=tu-postout21; t=1745456939; bh=bYJ0+adjAhoU74pADpBp
	inu5glaC3kBjd/yPNjT5efI=; b=HXDAj10fy1gvB1oMCmVZIRRsOnIDtlGHHovk
	xGwR3hnbWNSZoVSLMW+dRIr2SwLmaL76/+vcAId4x7yT794XQiN68Fah9EcBxiIp
	lG1D7PTUK51REux0xuoo1ABz3cMIIwKYalvBWwLC5XpR8aSTkJIXVj42CitQd1Hz
	Cb3GtDdxv+HPFQ6opADTDV7v+4Qflor6JgHYtuQyH+4MbhdprvCLLNWn9OBEzTgS
	Kd/GycPG84+cCdv9w4e+aW1HKsUB+kZYY7myw9wk04RUDecSzC+YOQEQJa8Q02d7
	uhKd6hTuBu8Cs1I46Kwk3lD1NnZ/p/dX8doJQkzwCceCBRRBzQ==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
Date: Thu, 24 Apr 2025 03:08:50 +0200
From: Fabian Specht <f.specht@tum.de>
To: xen-devel@lists.xenproject.org
Cc: manuel.andreas@tum.de
Subject: UBSan bug in real mode fpu emulation
Message-ID: <l2jnq5cxgkzcdkndp3mjf76nd7wdp2pbstkqo7llaarmbfqdge@bxdydela4rcf>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="7qx3syuhiqqeq7zi"
Content-Disposition: inline


--7qx3syuhiqqeq7zi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dear Xen-Devel team,

we discovered a bug regarding undefined behaviour in the FPU emulation
unit.

if ( !s->rex_prefix )
{
	/* Convert 32-bit real/vm86 to 32-bit prot format. */
	unsigned int fip = fpstate.env.mode.real.fip_lo +
					   (fpstate.env.mode.real.fip_hi << 16);
	unsigned int fdp = fpstate.env.mode.real.fdp_lo +
					   (fpstate.env.mode.real.fdp_hi << 16);
	unsigned int fop = fpstate.env.mode.real.fop;

	fpstate.env.mode.prot.fip = fip & 0xf;
	fpstate.env.mode.prot.fcs = fip >> 4;
	fpstate.env.mode.prot.fop = fop;
	fpstate.env.mode.prot.fdp = fdp & 0xf;
	fpstate.env.mode.prot.fds = fdp >> 4;
}

It occurs at arch/x86/arch/x86/x86_emulate/blk.c:85 of the v4.20.0
release during the bit shift and can be triggered using the attached xtf
test. We are not aware of any security consequences.
Simply shifting by 4 should do the trick in my opinion.

Similar code resides in the same file in lines 87, 125 and 127.
The attached xtf test is run for hvm32.

~Fabian

--7qx3syuhiqqeq7zi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="main.c"

#include <xtf.h>

const char test_title[] = "PoC-FPU-UBSan";

bool test_needs_fep = true;

void test_main(void)
{
    uint8_t fpu_env[28];

    /* To trigger UBSAN oout of bounds shift */
    memset(fpu_env, 0xFF, sizeof(fpu_env));

    asm volatile("movl %%cr0, %%ebx;"
                 "andl $0xFFFFFFFE, %%ebx;"
                 "movl %%ebx, %%cr0;"
                 "ud2;"
                 ".ascii \"xen\";"
                 "fldenv (%0)"
                 :
                 : "r"(fpu_env)
                 : "memory"
                 );

}

--7qx3syuhiqqeq7zi--

