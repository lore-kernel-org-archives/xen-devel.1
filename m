Return-Path: <SRS0=vb+Z=HG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EB3C433E6
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 13:34:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3CE264F4E
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 13:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3CE264F4E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81303.150027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7em2-00027P-4t; Thu, 04 Feb 2021 13:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81303.150027; Thu, 04 Feb 2021 13:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7em2-00027I-1f; Thu, 04 Feb 2021 13:34:18 +0000
Received: by outflank-mailman (input) for mailman id 81303;
 Thu, 04 Feb 2021 13:34:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NYWw=HG=nefkom.net=whitebox@srs-us1.protection.inumbo.net>)
 id 1l7em0-00027D-EJ
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 13:34:16 +0000
Received: from mail-out.m-online.net (unknown [212.18.0.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 914f9f3f-8109-49e1-9de9-5f08a272a037;
 Thu, 04 Feb 2021 13:34:14 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DWffG1C5Kz1s31m;
 Thu,  4 Feb 2021 14:34:13 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DWffF5Ypmz1t6pZ;
 Thu,  4 Feb 2021 14:34:13 +0100 (CET)
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id wR0RSaN2C-6g; Thu,  4 Feb 2021 14:34:13 +0100 (CET)
Received: from igel.home (ppp-46-244-168-92.dynamic.mnet-online.de
 [46.244.168.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  4 Feb 2021 14:34:13 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 89D152C374E; Thu,  4 Feb 2021 14:34:12 +0100 (CET)
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
X-Inumbo-ID: 914f9f3f-8109-49e1-9de9-5f08a272a037
X-Virus-Scanned: amavisd-new at mnet-online.de
X-Auth-Info: 5ltc2JxgnLIR97X4BLuo0FY2Dr0RCBzjAsxE4ktmpk8Thl+RVnwMr3lZT84qtEOB
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jan Beulich via Binutils <binutils@sourceware.org>
Cc: Jan Beulich <jbeulich@suse.com>,  "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: ld 2.36 regression linking EFI binary from ELF input with debug
 info
References: <79812876-b43d-7729-da34-3b4cd1c31f24@suse.com>
X-Yow: Sometime in 1993 NANCY SINATRA will lead a BLOODLESS COUP on GUAM!!
Date: Thu, 04 Feb 2021 14:34:12 +0100
In-Reply-To: <79812876-b43d-7729-da34-3b4cd1c31f24@suse.com> (Jan Beulich via
	Binutils's message of "Thu, 4 Feb 2021 14:21:05 +0100")
Message-ID: <875z38vtwr.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.91 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

On Feb 04 2021, Jan Beulich via Binutils wrote:

> For reference, the probing is as simple as
>
> $(LD) -mi386pep --subsystem=10 -o efi/check.efi efi/check.o
>
> As was to be expected, the errors disappear with -S, but that's
> an option only for the probing, not for the actual linking of
> the binary.
>
> Thanks for pointers (or better yet, a fix),

Does it work to link to ELF and use objcopy to convert to PE?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

