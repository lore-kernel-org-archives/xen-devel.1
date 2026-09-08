Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F92C79F99
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 18:05:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412346.1642861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x40C5-0004VO-9t; Tue, 08 Sep 2026 18:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412346.1642861; Tue, 08 Sep 2026 18:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x40C5-0004VH-78; Tue, 08 Sep 2026 18:05:17 +0000
Received: by outflank-mailman (input) for mailman id 1412346;
 Tue, 08 Sep 2026 18:05:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1x40C3-0004VB-CR
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 18:05:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x40C1-000MXo-Tg
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 20:05:13 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa04e56-8faa-0a2a0a5109dd-0a2a4509a64e-4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 20:05:13 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa04e58-be1a-0a2a45090019-d561b3388098-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 20:05:13 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x40Bi-00GcyI-N0; Tue, 08 Sep 2026 20:04:54 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1x40Bh-006cMp-P2; Tue, 08 Sep 2026 20:04:54 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1x40Bh-00000007AFC-2x4D;
 Tue, 08 Sep 2026 20:04:53 +0200
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
	bh=vp63UVaxTdJB+T//K0HyE8/U9OGm3JAcHr89i9lbZwo=; b=PcSRrgveRmq44kFUJ6/suRcHNj
	jE4yYchg++9GF1E4naqI/IwTOm+LKLpqOYaHgbSD4INDiAbCX+wX772SaHygl6iOWoWEYtEqHpuRA
	miA/IrtAq3HJPmEHwW5QtH1WFtwjhPgC/FMFBCBWfC2hKwnGJPbtwddVwVJ1c1V6yAaM/T11UEkZU
	9sXTOR3kTslOmlanM2crHTWCT91IwZU1AEzBjXPouiZUyCz4gaEkLzjvdM1yunF70c4EKMKtxzC4J
	g/4wqu7UySpgDH2SlRDPcM4ghFH+CQ1lILUuzPLYZYBaXx8bIKas+wVhTrB3NpL6+CheEYmDuB4tO
	uEn+Tu9w==;
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 15:04:53 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Juergen Gross
 <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>, Brian Gerst
 <brgerst@gmail.com>, kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
In-Reply-To: <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
Message-ID: <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788890713-BDEC6034-8DA78F1D/0/0
X-purgate-type: clean
X-purgate-size: 2308

On 2026-09-06 15:15, H. Peter Anvin wrote:
> On September 6, 2026 10:01:16 AM PDT, Borislav Petkov <bp@alien8.de> wrote:
>>On Sat, Aug 22, 2026 at 03:33:18PM -0300, Mauricio Faria de Oliveira wrote:
>>> Move the inline memcmp function currently only available in 'boot/string.c'
>>> into the shared string function header <asm/shared/string.h> to be reused.
>>> 
>>> This is not done through <asm/string.h> to avoid pulling unnecessary code
>>> in 'boot/string.c' that causes build errors in 'boot/compressed/string.c'
>>> and 'purgatory/purgatory.ro'.
>>
>>Please drop those '' quotes - it is perfectly clear that those are .c files.
>>
>>> No functional changes.
>>> 
>>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>>> 
>>> ---
>>> 
>>> Thanks to David Laight for noticing the return value difference between
>>> inline and regular memcmp().
>>> ---
>>>  arch/x86/boot/string.c               | 13 ++-----------
>>>  arch/x86/include/asm/shared/string.h | 26 ++++++++++++++++++++++++++
>>>  2 files changed, 28 insertions(+), 11 deletions(-)
>>
>>...
>>
>>> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..06c1d5e5013e4d59cfb49866d10e164362d2c4cc
>>> --- /dev/null
>>> +++ b/arch/x86/include/asm/shared/string.h
>>> @@ -0,0 +1,26 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef _ASM_X86_SHARED_STRING_H
>>> +#define _ASM_X86_SHARED_STRING_H
>>> +
>>> +/*
>>> + * This inline memcmp() returns 0 (equal) or 1 (not equal).
>>> + * The regular memcmp() returns <0 (less than), 0 (equal), or >0 (greater than)
>>> + * to indicate ordering as well.
>>
>>No need to overdo it:
>>
>>	Returns:	0 (equal)
>>			1 (not equal)
>>
>>In contrast, the regular memcmp() follows glibc return value semantics.
>>
>>
> 
> Worth noting that memeq() and streq() are becoming used in other contexts, e.g. glibc.

Thanks for mentioning.

Boris, perhaps the approach here could be changed to add an actual
memcmp()-like inline implementation (e.g., as provided in a previous
revision, without return value differences), or continue with the
memeq()-like memcmp() from arch/x86/boot/ but rename it to memeq() ?

-- 
Mauricio

