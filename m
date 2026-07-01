Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19725C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 22:01:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350992.1608348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf2zO-0004xz-0s; Wed, 01 Jul 2026 22:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350992.1608348; Wed, 01 Jul 2026 22:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf2zN-0004xs-UW; Wed, 01 Jul 2026 22:01:01 +0000
Received: by outflank-mailman (input) for mailman id 1350992;
 Wed, 01 Jul 2026 22:01:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wf2zM-0004xj-7l
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 22:01:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf2zL-003o8p-4H
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 00:00:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a458e0e-5cb7-0a2a0a5109dd-0a2a450ca3a2-26
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 00:00:57 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a458e18-f399-0a2a450c0019-d561b338d27c-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 00:00:57 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wf2yt-007ljZ-Ns; Thu, 02 Jul 2026 00:00:31 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wf2yr-008Wju-Lr; Thu, 02 Jul 2026 00:00:31 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wf2yr-0000000DsjJ-1ury;
 Thu, 02 Jul 2026 00:00:29 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yaM2/r0nQ+KZa9DjbHwZn8AL8mGnTAI+bvsmHq0U8OI=; b=clzouy0BybVRLPyaWMiEL3ApQu
	zHIDnxBF5w2LC4HvrX+1geUmrI7pjYHSvksAIMFK2Mpy7+KcLOOlGutwh9F1oYiZNK9LqLopJFSUs
	gA6bjZoG4CsxeUYgSDVjPc7kwjqOekrEOt2PdmRHsaxjkUBZC32DTzWWxqX1scQ0XFceBVbioCZOq
	ycJ6ulD9ANZoBAP2Y5mhqopisw2s9RCV3DpH125RteFJV/HPHI7QAY/CP4sZ8Ci2tRuPWkywuY2NM
	gzkHc3Z6J+o+5cLkay+hqY9n0PhinyfJXycC2Eey4hBM7iBzFWit2DsHrHs1z9lQ7Bgucaa+qRk2f
	lYDUhF3w==;
MIME-Version: 1.0
Date: Wed, 01 Jul 2026 19:00:29 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH RESEND v5 1/3] x86/asm, x86/boot: expose inline memcmp
In-Reply-To: <20260701204640.GDakV8sOK1cu-0P4Bc@fat_crate.local>
References: <20260630-pvh-kasan-inline-v5-0-52afc979be81@igalia.com>
 <20260630-pvh-kasan-inline-v5-1-52afc979be81@igalia.com>
 <20260701184014.GDakVfDhIgaIKurzTb@fat_crate.local>
 <fed9dc5860b96063c06592080f957589@igalia.com>
 <20260701204640.GDakV8sOK1cu-0P4Bc@fat_crate.local>
Message-ID: <bcf2df642c56040a05ff439cf8adce70@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782943257-91F23D51-73567504/0/0
X-purgate-type: clean
X-purgate-size: 851

On 2026-07-01 17:46, Borislav Petkov wrote:
> On Wed, Jul 01, 2026 at 04:57:57PM -0300, Mauricio Faria de Oliveira wrote:
>> I'm not sure, as Reported-by and Suggested-by mean something different.
>> 
>> Maybe a simpler statement would do? e.g., '(Thanks to David Laight for
>> noticing the return value difference between inline and regular
>> memcmp())'. That gives credit while avoiding confusion with tags.
> 
> The Link tag already points to the review thread where we document who
> suggested what. We don't document who gave what review comments and
> suggestions for the simple reason that that would be intractable and the other
> simple reason is that they don't belong in the commit message.
> 
> Changelog comments belong *exactly* under the "---" line.

Ok, I'll send v6 addressing your feedback. Thanks.

-- 
Mauricio

