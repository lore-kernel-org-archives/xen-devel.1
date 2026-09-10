Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F350C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 13:08:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414665.1644406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4eVA-0003St-HV; Thu, 10 Sep 2026 13:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414665.1644406; Thu, 10 Sep 2026 13:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4eVA-0003Sm-Eg; Thu, 10 Sep 2026 13:07:40 +0000
Received: by outflank-mailman (input) for mailman id 1414665;
 Thu, 10 Sep 2026 13:07:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1x4eV6-0003Sa-Ne
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 13:07:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4eV6-00B0HF-4J
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 15:07:36 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa2ab8c-8faa-0a2a0a5109dd-0a2a4509dcf0-38
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 15:07:35 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa2ab96-be1a-0a2a45090019-d561b3388b02-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 15:07:35 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x4eUZ-000AkJ-Dq; Thu, 10 Sep 2026 15:07:03 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1x4eUY-000ZNN-EA; Thu, 10 Sep 2026 15:07:03 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1x4eUY-000000005On-22Sa;
 Thu, 10 Sep 2026 15:07:02 +0200
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
	bh=HcYthpHHwERyxlr750rAd0uztEIm6CVXAXuw/bKumiE=; b=Vh9k17xJz9abAm2BUHaBiJm+c5
	5h9qXx+f05o1x6NRFPiAcw7Kj4lSLnIVEIaHhRLWBQgIfM1E9Gs3MhFHzi0n2HbIe+/G1o78bo1W6
	CE8zGjgscerDiWN3A3L/Pc/ExltzlU3/EaKq7UW1yvB2JE9RonLH24FnjMGUJpUgi7gh5byX2dX/O
	8IFAic5mZ8rEW+pHmzgdbU/e1XE5FSOeCjjgzczEaRR2LJ1dlVbSk8N5K/TmifvTGL/9GPg0+Cpxo
	CiL6GwMKQd9Bk8GPjh8/bAwZmr0BwjrNgjW0qMaMHW5Q4z5UiVhJZ7E/Uka2zijZ0CnNlGoJKNurL
	5ofB+OLA==;
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 10:07:01 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
In-Reply-To: <20260910033810.GFaqImIu15e_pszuO2@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
 <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
 <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
 <c955deded411defba0de3a1f6daa78b0@igalia.com>
 <20260910033810.GFaqImIu15e_pszuO2@fat_crate.local>
Message-ID: <295ce95081662f9f0c3d8780d0e754a8@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1789045655-BD4C3034-82960098/0/0
X-purgate-type: clean
X-purgate-size: 513

On 2026-09-10 00:38, Borislav Petkov wrote:
> On Tue, Sep 08, 2026 at 06:06:21PM -0300, Mauricio Faria de Oliveira wrote:
>> Ack, and to confirm: not rename the existing one, either?
> 
> Nah, concentrate only on what you're trying to achieve.
> 
> hpa can send a patch ontop since he cares so much.
> 
> :-)

This seems to close the review feedback so far, on patches 1 and 2.

Could you please confirm whether the other patches (3-5) are OK to you?
And I can send v10.

Thanks,

-- 
Mauricio

