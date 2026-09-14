Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3C3C88E71
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 11:41:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420829.1647048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x653c-0001Mc-DO; Mon, 14 Sep 2026 11:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420829.1647048; Mon, 14 Sep 2026 11:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x653c-0001MV-A3; Mon, 14 Sep 2026 11:41:08 +0000
Received: by outflank-mailman (input) for mailman id 1420829;
 Mon, 14 Sep 2026 11:41:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1x653b-0001MP-28
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:41:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x653a-00GbBt-0s
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 13:41:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa7dd48-e002-0a2a0a5209dd-0a2a4502d2b4-18
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:41:05 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa7dd4c-6ca4-0a2a45020019-d561b338e46a-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:41:01 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x653A-001rT0-6p; Mon, 14 Sep 2026 13:40:39 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1x6539-005UIG-0y; Mon, 14 Sep 2026 13:40:39 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1x6539-00000001lUT-0Hp4;
 Mon, 14 Sep 2026 13:40:38 +0200
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
	bh=9CFOHjBOf3yPy/DhHAL3D16IeilqUND+JE3cSijaXso=; b=JzJ232aVCAQkvfcw/WMghan5vq
	08b52hWMOrx42r7WC3jSHoFS1yHhbqL9lKT9J/QPQhqelN2/is/ODfaXEBRdK8XPwz4yTApOZKbZN
	BiUpi0ocDJOOmelexgUaly7bAyOBGChwGSQGNjvK969Z7lJqV6pPyaLef+6Uuf3nmAa2gxtDZ1A7T
	WbAeG6OnHTwb0k8wpO91bY68H49ewXJqnKlHqChvO+zFKagBuk+UfOVXHPirjzmlnZJ5UcBSpJoaM
	unHkgbvEsQ35c3YMnzHFvPUcVGmQ0b8RSWU3EYJ7shFJRnpR9LqH9hBtetoiaLqWP1WjrxmbKiAQb
	Zw5BBrWQ==;
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 08:40:38 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 5/5] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
In-Reply-To: <20260911043947.GIaqOGE9DFCHWwc6Ys@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-5-e70ef3b75b6a@igalia.com>
 <20260911043947.GIaqOGE9DFCHWwc6Ys@fat_crate.local>
Message-ID: <bdd7ad774e121d5621ad64f9c7147e45@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1789386061-315CD2AC-2C5EE642/0/0
X-purgate-type: clean
X-purgate-size: 1903

On 2026-09-11 01:39, Borislav Petkov wrote:
> On Sat, Aug 22, 2026 at 03:33:21PM -0300, Mauricio Faria de Oliveira wrote:
>> Even with __builtin the compiler may decide to use the out of line function
>> instead of the inline implementation.
>> 
>> This particular one (still) generated the inline implementation as expected
>> (at least in these compiler versions) but this is not guaranteed to remain.
>> 
>> Switch the builtin to the inline implementation to address it.
>> 
>> Fixes: fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>> ---
>>  arch/x86/platform/pvh/enlighten.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
>> index f2053cbe9b0ce3d2178938269607c652ae8f528e..cb442cbd9d828619421babb281bfe9759edbca8a 100644
>> --- a/arch/x86/platform/pvh/enlighten.c
>> +++ b/arch/x86/platform/pvh/enlighten.c
>> @@ -8,6 +8,7 @@
>>  #include <asm/hypervisor.h>
>>  #include <asm/e820/api.h>
>>  #include <asm/x86_init.h>
>> +#include <asm/string.h>
>> 
>>  #include <asm/xen/interface.h>
>> 
>> @@ -129,7 +130,7 @@ void __init xen_prepare_pvh(void)
>>  	 * This must not compile to "call memset" because memset() may be
>>  	 * instrumented.
>>  	 */
>> -	__builtin_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
>> +	__inline_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
>> 
>>  	hypervisor_specific_init(xen_guest);
>> 
>> 
>> --
> 
> Why is this a separate patch from 4/5 if it is fixing the same thing?

Due to scope and review purposes (4/5 is more generic, 5/5 is specific
to PVH). If there's a strong preference to combine these, please just
let me know.

Thanks,

-- 
Mauricio

