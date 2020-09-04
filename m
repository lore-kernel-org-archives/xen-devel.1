Return-Path: <SRS0=ERFX=CN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4196FC433E2
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2020 06:55:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 061D7206B8
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2020 06:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 061D7206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE5d1-00035y-Re; Fri, 04 Sep 2020 06:55:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kE5d0-00035s-MM
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 06:55:18 +0000
X-Inumbo-ID: 6dceaad5-8609-457f-a54f-49603f8f6e8c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6dceaad5-8609-457f-a54f-49603f8f6e8c;
 Fri, 04 Sep 2020 06:55:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 117EAAC79;
 Fri,  4 Sep 2020 06:55:18 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Rewrite segment context switching from scratch
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andy Lutomirski <luto@kernel.org>, Sarah Newman <srn@prgmr.com>
References: <20200903213625.5372-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6217b722-cfae-4b68-51aa-6123527fe714@suse.com>
Date: Fri, 4 Sep 2020 08:55:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903213625.5372-1-andrew.cooper3@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.09.2020 23:36, Andrew Cooper wrote:
> There are multiple bugs with the existing implementation, including incorrect
> comments.
> 
> On AMD CPUs prior to Zen2, loading a NUL segment selector doesn't clear the
> segment base, which is a problem for 64bit code which typically expects to use
> a NUL %fs/%gs selector.
> 
> On a context switch from any PV vcpu, to a 64bit PV vcpu with an %fs/%gs
> selector which faults, the fixup logic loads NUL, and the guest is entered at
> the failsafe callback with the stale base.
> 
> Alternatively, a PV context switch sequence of 64 (NUL, non-zero base) =>
> 32 (NUL) => 64 (NUL, zero base) will similarly cause Xen to enter the guest
> with a stale base.
> 
> Both of these corner cases manifest as state corruption in the final vcpu.
> However, damage is limited to to 64bit code expecting to use Thread Local
> Storage with a base pointer of 0, which doesn't occur by default.
> 
> The context switch logic is extremely complicated, and is attempting to
> optimise away loading a NUL selector (which is fast), or writing a 64bit base
> of 0 (which is rare).  Furthermore, it fails to respect Linux's ABI with
> userspace, which manifests as userspace state corruption as far as Linux is
> concerned.
> 
> Always save and restore all selector and base state, in all cases.
> 
> Leave a large comment explaining hardware behaviour, and the new ABI
> expectations.  Update the comments in the public headers.
> 
> Drop all "segment preloading" to handle the AMD corner case.  It was never
> anything but a waste of time for %ds/%es, and isn't needed now that %fs/%gs
> bases are unconditionally written for 64bit PV guests.  In load_segments(),
> store the result of is_pv_32bit_vcpu() as it is an expensive predicate now,
> and not used in a way which impacts speculative safety.
> 
> Reported-by: Andy Lutomirski <luto@kernel.org>
> Reported-by: Sarah Newman <srn@prgmr.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

