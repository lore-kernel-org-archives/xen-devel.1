Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF83C88E75
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 23:50:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422142.1647677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6cua-0002Da-6i; Tue, 15 Sep 2026 23:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422142.1647677; Tue, 15 Sep 2026 23:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6cua-0002Cu-37; Tue, 15 Sep 2026 23:50:04 +0000
Received: by outflank-mailman (input) for mailman id 1422142;
 Tue, 15 Sep 2026 23:50:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1x6cuW-0001ig-4j
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 23:50:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6cuV-008U2Q-0r
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 01:49:59 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa9d967-bab6-0a2a0a5309dd-0a2a45059fc2-14
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 01:49:57 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa9d9a3-4cb1-0a2a45050019-d561b33880d4-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 01:49:55 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x6cu2-002gmb-8v; Wed, 16 Sep 2026 01:49:30 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1x6cu0-00859I-Rj; Wed, 16 Sep 2026 01:49:29 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1x6cu0-000000029fQ-3n0E;
 Wed, 16 Sep 2026 01:49:28 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To:From:Date:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=I8JTmEd44ay2XHHFYotn7CWkmIwj8DNipARBUw7yAXk=; b=M5pUMVLaNCzsLx5LTcydsMeZCN
	s9AKwvruPECFpPUZF4Sj2JVpUooGQ9sb6+TTIpRZXO6oO/v1ub8GxAeHJPKC42fex+gVpEMu2lwig
	DycdC3uIwtmjH+AtyZq9UWde5aWNzst+87vcnj5+9wHX+ef6nMXxlRy8K84AFi1vDkmyEpz0eG2nf
	WYzXWsJ3YK5GVMm9b1DbN14cIno1b42gBgBArBSr50KWsu2lCLz/mvB/qHbfbTSEFTQfRhpKef1b4
	YX9RLKgbecJlt7hBOEASyBl/3+aNSsGiMD7wRMPMChDq24CKPjOtC+P3vy4kKsN5+SuEyL0g15WQq
	wp50ai2g==;
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 20:49:27 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
In-Reply-To: <20260915154853.GAaqlo5YxQ9ALlhjbF@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
 <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
 <6113f06c790cfe1141d2dc09b68937b6@igalia.com>
 <20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>
 <20260915154853.GAaqlo5YxQ9ALlhjbF@fat_crate.local>
Message-ID: <9086138f2dcaffe30622438b7e825ae7@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1789516197-73CB82A1-20A45973/0/0
X-purgate-type: clean
X-purgate-size: 1111

On 2026-09-15 12:48, Borislav Petkov wrote:
> On Mon, Sep 14, 2026 at 10:11:55PM -0700, Borislav Petkov wrote:
>> Hmm, never heard that before but that doesn't mean anything. Probably should
>> mention it in one of the commit messages so that we know for the future...
> 
> My compiler friends are telling me that gcc doesn't do that now but it might
> in the future, perhaps.
> 
> -fno-builtin-memcmp
> 
> will stop any of that behavior so if, perhaps, building the pvh code with it
> looks better as a solution, we probably could use it.

It looks like clang does [1], but according to an LLM that is also
disabled with -fno-builtin-memcmp.

IMO a fix in the source file is clearer, less obfuscated than in a
Makefile (and the source file has to be changed anyway). It also has the
potential advantage that, if the Makefile change slips in a future
change/refactor, the issue shouldn't reappear.

Either way, please let me know and I can certainly change the patch.

Thanks,

[1]
https://github.com/llvm/llvm-project/commit/9473c01e968bc4ecf5ea7c54ef0c84b687d365ea

-- 
Mauricio

