Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA8FC531CC
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 00:52:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369780.1618327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn491-0002Wc-SL; Fri, 24 Jul 2026 00:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369780.1618327; Fri, 24 Jul 2026 00:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn491-0002WV-Oq; Fri, 24 Jul 2026 00:52:07 +0000
Received: by outflank-mailman (input) for mailman id 1369780;
 Fri, 24 Jul 2026 00:52:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wn490-0002WO-BW
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 00:52:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn48z-00H912-HW
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 02:52:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62b70b-e002-0a2a0a5209dd-0a2a45038a1e-26
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 02:52:05 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a62b734-fae8-0a2a45030019-d561b338a384-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 02:52:04 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wn48e-003fgj-Mk; Fri, 24 Jul 2026 02:51:44 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wn48c-00205n-Kh; Fri, 24 Jul 2026 02:51:44 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wn48c-000000032b5-1lMV;
 Fri, 24 Jul 2026 02:51:42 +0200
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
	bh=zdmddBTnxu3ecQxTHZrj1U5FRs6aMjme2tgnifhIgMo=; b=J/GoU1YGDbVnh24W+ablo26MIH
	0LmOITnPxpA63P0EpkmJ9Mf8dIMowGPhx5vysRSERbQ5hYNErUcqflMSCRUPgo4btBkkqyt85i8aW
	JaUR0PWXRFXmbmaTbvInttaN1jARlhl3O+BLnH8CdnsbsEiYBoetm9r/PPEPhEnw+B114h6+ZlKs8
	pj4+qXSho71cHKhDcjjboaONgrdAsgLUAcUe9Db9WAEc1dOkmLzXAhhklZ5+vpNf6gxWiZiGhIjl+
	QJO7i0JuFx4uk6Gm8cZ/cD/Kdz7XpnRZAKRD2lJPOJIV8yZRNxTQ5vaAbneQDCLjXY/5/XfzMCQRR
	fOFu3NRA==;
MIME-Version: 1.0
Date: Thu, 23 Jul 2026 21:51:42 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 3/5] x86/asm: group inline string functions
In-Reply-To: <20260723215928.GBamKOwB3PIaHrQFbs@fat_crate.local>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-3-38979a50cef0@igalia.com>
 <20260723215928.GBamKOwB3PIaHrQFbs@fat_crate.local>
Message-ID: <1f3f0d30b592f4ddbb8f64f9d8fed429@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1784854324-762FD4E9-FDA9B4D7/0/0
X-purgate-type: clean
X-purgate-size: 1438

On 2026-07-23 18:59, Borislav Petkov wrote:
> On Tue, Jul 21, 2026 at 12:56:44PM -0300, Mauricio Faria de Oliveira wrote:
>> Group the __inline string functions in the same header.
>> 
>> Use <asm/shared/string.h> since __inline_memcmp() must remain there for use
>> by arch/x86/boot/string.c.
> 
> "No functional changes."

Ok, added.

> 
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>> ---
>>  arch/x86/include/asm/shared/string.h | 26 ++++++++++++++++++++++++++
>>  arch/x86/include/asm/string.h        | 21 +--------------------
>>  2 files changed, 27 insertions(+), 20 deletions(-)
>> 
>> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
>> index 166274e44f3cb49e3dccab3cdac281d67aef5d44..9714fbda8b734e20686bfb88a6ca857bfee59e1a 100644
>> --- a/arch/x86/include/asm/shared/string.h
>> +++ b/arch/x86/include/asm/shared/string.h
>> @@ -2,6 +2,32 @@
>>  #ifndef _ASM_X86_SHARED_STRING_H
>>  #define _ASM_X86_SHARED_STRING_H
>>  
>> +/*
>> + * The __inline string functions are grouped in this file for consistency and
>> + * for use by arch/x86/boot code due to limitations on including asm/string.h.
> 
> What limitations?
> 
> Either explain them or don't bother adding a comment. asm/shared/ is generally
> an understood concept if you grep the tree and you don't really need a comment
> here.

Ok, removed.

Thanks,

-- 
Mauricio

