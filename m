Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CB3C5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 17:02:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400061.1635992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzH1P-0002e2-Jl; Wed, 26 Aug 2026 17:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400061.1635992; Wed, 26 Aug 2026 17:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzH1P-0002dv-H2; Wed, 26 Aug 2026 17:02:43 +0000
Received: by outflank-mailman (input) for mailman id 1400061;
 Wed, 26 Aug 2026 17:02:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wzH1N-0002dp-Al
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 17:02:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzH1M-001lj4-7m
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 19:02:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a8f1c28-8faa-0a2a0a5109dd-0a2a45018662-14
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 19:02:40 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a8f1c2c-5984-0a2a45010019-a0658309d7f6-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 19:02:36 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id ADA0D83646FA;
 Wed, 26 Aug 2026 13:00:36 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org,
	jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech
Subject: Re: Re: [PATCH v1] x86/nSVM: Expose the FlushByASID CPU Capability to L1 guests
Date: Wed, 26 Aug 2026 17:58:10 +0100
Message-ID: <20260826165819.2990238-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <73e2a6fd-8cd9-4dc1-9a83-e48baec6c13e@suse.com>
References: <73e2a6fd-8cd9-4dc1-9a83-e48baec6c13e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787763757-C5341757-70C8D2AA/0/0
X-purgate-type: clean
X-purgate-size: 2181

On 13.08.2026 17:29, Jan Beulich wrote:
>On 13.08.2026 16:56, Abdelkareem Abdelsaamad wrote:
>> On the AMD platforms, the Xen hypervisor requires the FlushByASID CPU
>> capability to support HVM nested virtualization (see start_nested_svm).
>> Consequently, the L1 hypervisor must report FlushByASID CPU capability support
>> when intercepting CPUID instruction for the CPU feature from the L2 guest to
>> support nested virtualization levels beyond L1. Extend the exposed HVM CPU
>> policy to surface this CPU feature support for the guests.
>
>While the change makes sense, I have to admit that I consider it a stretch
>to justify changes by multi-level nesting, when a single level of nesting
>is in need of a lot of work to actually behave sensibly. Further, "to
>support nested virtualization levels beyond L1" looks pretty Xen-centric:
>Other hypervisors may permit this without the feature.
I believe the change is actually necessary for the single-level nesting
support. Xen was meant only as an example of an L1 hypervisor requiring this
feature from L0; VMware has the same requirement (see Launchpad Bug #2008583).
I will update the commit message in v2 to clarify this and remove the
Xen-centric phrasing. Just to ensure we are aligned—did you have any concerns
that exposing this feature can cause incorrect behavior?
>
>> While at it remove the dangling `exitinfo1 = ns_vmcb->exitinfo1;` assignment
>> inside the nested exit handling of svm_vmexit_handler().
>
>Unrelated adjustments to somewhat nearby or related code are generally
>okay, but here you're touching a different file and entirely unrelated
>code. I think the two changes want splitting.
I agree. I will drop in v2. I just came across it while verifying the VMExit
for the CPUID intercept is properly injected into the L2.
>
>And the CPUID test that XTF has wasn't suitable?
I tried with the CPUID test from the XTF, it does require nestedhvm=1 in the
configuration but it gave the same results. I will update the testing
section accordingly in v2.
>Finally: Can you please drop Roger's old email address that you still
>had on Cc?
I will correct it.
>
>Jan



