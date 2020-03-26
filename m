Return-Path: <SRS0=xTCj=5L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D14C2D0E8
	for <xen-devel@archiver.kernel.org>; Thu, 26 Mar 2020 09:29:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 240C820714
	for <xen-devel@archiver.kernel.org>; Thu, 26 Mar 2020 09:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 240C820714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOpd-0007n5-7C; Thu, 26 Mar 2020 09:29:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BM0P=5L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jHOpb-0007n0-5F
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:29:43 +0000
X-Inumbo-ID: 528bf06e-6f44-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 528bf06e-6f44-11ea-bec1-bc764e2007e4;
 Thu, 26 Mar 2020 09:29:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D0E3BAF43;
 Thu, 26 Mar 2020 09:29:41 +0000 (UTC)
To: Miroslav Benes <mbenes@suse.cz>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, jpoimboe@redhat.com
References: <20200326092603.7230-1-mbenes@suse.cz>
 <20200326092603.7230-2-mbenes@suse.cz>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f743b8bd-7552-24a8-e7bc-fa8b3bbcb9d2@suse.com>
Date: Thu, 26 Mar 2020 10:29:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200326092603.7230-2-mbenes@suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v3 1/2] x86/xen: Make the boot CPU idle task
 reliable
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
Cc: andrew.cooper3@citrix.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 jbeulich@suse.com, live-patching@vger.kernel.org,
 xen-devel@lists.xenproject.org, jslaby@suse.cz
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.20 10:26, Miroslav Benes wrote:
> The unwinder reports the boot CPU idle task's stack on XEN PV as
> unreliable, which affects at least live patching. There are two reasons
> for this. First, the task does not follow the x86 convention that its
> stack starts at the offset right below saved pt_regs. It allows the
> unwinder to easily detect the end of the stack and verify it. Second,
> startup_xen() function does not store the return address before jumping
> to xen_start_kernel() which confuses the unwinder.
> 
> Amend both issues by moving the starting point of initial stack in
> startup_xen() and storing the return address before the jump, which is
> exactly what call instruction does.
> 
> Signed-off-by: Miroslav Benes <mbenes@suse.cz>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

