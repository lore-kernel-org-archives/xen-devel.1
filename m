Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60DDC624D3
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 13:48:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405950.1639370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1lKY-0001ta-3Z; Wed, 02 Sep 2026 13:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405950.1639370; Wed, 02 Sep 2026 13:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1lKY-0001tT-04; Wed, 02 Sep 2026 13:48:46 +0000
Received: by outflank-mailman (input) for mailman id 1405950;
 Wed, 02 Sep 2026 13:48:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1x1lKU-0001tN-Mj
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:48:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1lKU-00FP57-38
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 15:48:42 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a98292f-2eae-0a2a0a5409dd-0a2a4507b37a-38
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:48:41 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a982938-b4ea-0a2a45070019-d561b338eb64-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:48:40 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x1lK3-00DcvD-D4; Wed, 02 Sep 2026 15:48:15 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1x1lK2-00Fbfl-Gp; Wed, 02 Sep 2026 15:48:15 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1x1lK2-00000005efq-1wbk;
 Wed, 02 Sep 2026 15:48:14 +0200
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
	bh=58qqfjMVhvSKBno1pG7rNumItbKcnzJgJLj9UyPe5Ps=; b=nZO8BEvTrlQGU9RSC1Gs15aClM
	IN49e3tBEdMvbHrZybWANDpjiyQoNHg8BocuJU8sWkwPtbEWUweHYLWNHi91jzzkwdZ713XX6iikj
	jSkNT4Jkam0pPU2zqpYMIaDVk8C7L6dxfAcRSKBZTXwEvQ868fxOg1OZTPkFeejsdFRj3aBQn17Qj
	EkF2csedkHmH9FGypd2mADsZoD0GfUl5OOQfRiNrmoxPGGMw2E69asm8DhvHnJ4GU5ZU8xdM1WloH
	OFRy1EB1XCk5KyHR3I492GsqyVP4Mvle3KkjxFIeERi3EketeAIQeQZ3Iwp/OBAetJiinLbJlpF1o
	dYXUtpfg==;
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 10:48:14 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Michael Matz <matz@suse.de>, Borislav Petkov <bp@alien8.de>
Cc: Richard Biener <rguenther@suse.de>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross
 <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>, Brian Gerst
 <brgerst@gmail.com>, kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
In-Reply-To: <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
 <20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
 <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
Message-ID: <05896397667d66a2969259298bcebb7f@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788356921-37CD7AE4-0966C813/0/0
X-purgate-type: clean
X-purgate-size: 2325

On 2026-09-02 10:29, Michael Matz wrote:
> Hello,
> 
> On Tue, 1 Sep 2026, Borislav Petkov wrote:
> 
>> On Sat, Aug 22, 2026 at 03:33:17PM -0300, Mauricio Faria de Oliveira wrote:
>> > According to the GCC documentation, conditions in the flags register
>> > (e.g., "=@ccnz") are output operands [1] and the compiler is aware [2].
>> > 
>> > Also, clobbers (e.g., "cc") may not overlap with an output operand [2].
>> > 
>> > Thus, remove the "cc" clobber as it is redudant, and overlaps with, the
>> > "=@ccnz" output operand.
> 
> Strictly speaking, on x86, the '=@ccXY' constraints are register outputs 
> into normal random integer registers (though they are of course 
> initialized in a funny way), while the 'cc' clobber is not a register at 
> all, but rather a fuzzy idea of "state" in old cc0-based compilers (which 
> the x86 backend isn't anymore since, ... well, about forever, 1999).  As 
> such they both really don't conflict and ...
> 
>> But then I'd expect that gcc would enforce that. I know it can't have it 
>> when the clobbers contain input or output regs:
>> 
>> In function ‘__memcmp’,
>>     inlined from ‘main’ at memcmp.c:25:6:
>> memcmp.c:11:9: error: ‘asm’ operand has impossible constraints or there are not enough registers
>>    11 |         asm volatile("test %3, %3\n\t"
>>       |         ^~~
>> 
>> but with "cc" clobbers it works.
> 
> ... hence there's nothing to report.  In fact what an explicit 'cc' 
> clobber once meant in cc0 backends (that indiscriminated flag "state") is 
> manufactured by the non-cc0 backends (all of them now) automatically 
> whenever an asm has no flag output constraints at all.  (On x86 that means 
> it adds the "flags" register (internal name for the collection of flag 
> status bits) to the clobber set automatically when there are no =@ccXY 
> constraints).
> 
> You can regard all 'cc' clobbers as pure source compatibility, they have 
> no meaning anymore.  But as they are so ubiquitous (even in our own docu), 
> they remain recognized.

Michael, thanks for the detailed explanation; that's very nice to know.

Boris, I guess this may be added as clarification in the commit message.
Would you prefer another version with it?

Thanks,

> 
> 
> Ciao,
> Michael.

-- 
Mauricio

