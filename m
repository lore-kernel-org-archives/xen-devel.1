Return-Path: <SRS0=QJhb=DU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78655C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2020 15:59:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E845025226
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2020 15:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="f45K6N9W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E845025226
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6308.16826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSMhU-0002Rd-Km; Tue, 13 Oct 2020 15:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6308.16826; Tue, 13 Oct 2020 15:58:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSMhU-0002RW-H2; Tue, 13 Oct 2020 15:58:56 +0000
Received: by outflank-mailman (input) for mailman id 6308;
 Tue, 13 Oct 2020 15:58:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSMhT-0002RR-Us
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:58:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcf638e8-54c8-4a3b-9bb6-52ebfe7c4989;
 Tue, 13 Oct 2020 15:58:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B928AC6D;
 Tue, 13 Oct 2020 15:58:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSMhT-0002RR-Us
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:58:55 +0000
X-Inumbo-ID: fcf638e8-54c8-4a3b-9bb6-52ebfe7c4989
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fcf638e8-54c8-4a3b-9bb6-52ebfe7c4989;
	Tue, 13 Oct 2020 15:58:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602604734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CtD/97jkM0ctnGcvP5fmJmXD0Un5r/DeGz/RrewPpo=;
	b=f45K6N9WLE7hNv28p/6hezdrGNwbVn/8iYzH2Y5TCINueU1T15foMFDuV6izusFw6/pCCe
	NdQX8uqVphhQJi4jxgVHhP967HCVDu/BSJDvZYwVkZasmNICh9S0TcrFNoKa6orVL1FYv5
	janVu5nkvVn00WzJYaRDkMr32hyE5YQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1B928AC6D;
	Tue, 13 Oct 2020 15:58:54 +0000 (UTC)
Subject: Re: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before re-entering
 guest"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <20201009150948.31063-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fb4a7a1d-95ad-0b59-7cb9-4a94c3600960@suse.com>
Date: Tue, 13 Oct 2020 17:58:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201009150948.31063-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.10.2020 17:09, Andrew Cooper wrote:
> At the time of XSA-170, the x86 instruction emulator really was broken, and
> would allow arbitrary non-canonical values to be loaded into %rip.  This was
> fixed after the embargo by c/s 81d3a0b26c1 "x86emul: limit-check branch
> targets".
> 
> However, in a demonstration that off-by-one errors really are one of the
> hardest programming issues we face, everyone involved with XSA-170, myself
> included, mistook the statement in the SDM which says:
> 
>   If the processor supports N < 64 linear-address bits, bits 63:N must be identical
> 
> to mean "must be canonical".  A real canonical check is bits 63:N-1.
> 
> VMEntries really do tolerate a not-quite-canonical %rip, specifically to cater
> to the boundary condition at 0x0000800000000000.
> 
> Now that the emulator has been fixed, revert the XSA-170 change to fix
> architectural behaviour at the boundary case.  The XTF test case for XSA-170
> exercises this corner case, and still passes.
> 
> Fixes: ffbbfda377 ("x86/VMX: sanitize rIP before re-entering guest")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

But why revert the change rather than fix ...

> @@ -4280,38 +4280,6 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>  out:
>      if ( nestedhvm_vcpu_in_guestmode(v) )
>          nvmx_idtv_handling();
> -
> -    /*
> -     * VM entry will fail (causing the guest to get crashed) if rIP (and
> -     * rFLAGS, but we don't have an issue there) doesn't meet certain
> -     * criteria. As we must not allow less than fully privileged mode to have
> -     * such an effect on the domain, we correct rIP in that case (accepting
> -     * this not being architecturally correct behavior, as the injected #GP
> -     * fault will then not see the correct [invalid] return address).
> -     * And since we know the guest will crash, we crash it right away if it
> -     * already is in most privileged mode.
> -     */
> -    mode = vmx_guest_x86_mode(v);
> -    if ( mode == 8 ? !is_canonical_address(regs->rip)

... the wrong use of is_canonical_address() here? By reverting
you open up avenues for XSAs in case we get things wrong elsewhere,
including ...

> -                   : regs->rip != regs->eip )

... for 32-bit guests.

Jan

