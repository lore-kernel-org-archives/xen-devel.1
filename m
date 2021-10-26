Return-Path: <SRS0=UA04=PO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8B8C433EF
	for <xen-devel@archiver.kernel.org>; Tue, 26 Oct 2021 15:03:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D3F1604AC
	for <xen-devel@archiver.kernel.org>; Tue, 26 Oct 2021 15:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D3F1604AC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.216478.376100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfNzB-0002B8-Ky; Tue, 26 Oct 2021 15:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216478.376100; Tue, 26 Oct 2021 15:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfNzB-0002B1-HN; Tue, 26 Oct 2021 15:03:33 +0000
Received: by outflank-mailman (input) for mailman id 216478;
 Tue, 26 Oct 2021 15:03:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfNzA-0002Av-CH
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 15:03:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfNzA-0002is-BI
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 15:03:32 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfNzA-00072G-AD
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 15:03:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mfNz6-0004hm-Mb; Tue, 26 Oct 2021 16:03:28 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=UOcGou6JjWfk9xiV5fD9V5/6lQc0RcCX8tuJ3F7loLw=; b=IsFN59LVagPm+QEK1Q3s3o0pbI
	S30iLgClyyXpmDxpXe0mEkZ57Hki8W9TE7virbcXwIB+SFO5V8UqQ94dF38bb151+tHjhTL/g43EO
	/WS3lRTru6a23m7qKZvDOh981d/y0M5UXW5ve39Bvj5Z2qkljGRBVtQypRNiC7CM4x3g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24952.6336.118472.417096@mariner.uk.xensource.com>
Date: Tue, 26 Oct 2021 16:03:28 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] osstest: explicitly set either enable or disable qemu-traditional
In-Reply-To: <20211026135645.31488-1-jgross@suse.com>
References: <20211026135645.31488-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH] osstest: explicitly set either enable or disable qemu-traditional"):
> Instead of setting "--enable-qemu-traditional" or not, switch to
> setting "--enable-qemu-traditional" or "--disable-qemu-traditional".
> 
> This avoids a latent bug in the disable case, as the availability
> of the option is tested via grep, which will otherwise grep for
> nothing.
...
> +    my $qemutrad_opt = $r{arch} =~ m/amd64|i386/ ? "--enable-qemu-traditional" : "--disable-qemu-traditional";

The effect of this is that we will now explicitly disable qemu trad on
non-x86 architectures (assuming configure supports it).  I think that
is fine.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

For the avoidance of any doubt,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

too.  So I will push this now.

Thanks,
Ian.

