Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8125C79F89
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 07:54:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410615.1641415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3UBT-0000Sf-6Z; Mon, 07 Sep 2026 07:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410615.1641415; Mon, 07 Sep 2026 07:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3UBT-0000SY-2z; Mon, 07 Sep 2026 07:54:31 +0000
Received: by outflank-mailman (input) for mailman id 1410615;
 Mon, 07 Sep 2026 07:54:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x3UBR-0000SS-Qi
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 07:54:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x3UBQ-0036KC-12;
 Mon, 07 Sep 2026 07:54:28 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x3UBQ-00F9Mb-2X;
 Mon, 07 Sep 2026 07:54:28 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=TjaK1aNsxcIM7rgTT/kjgetUHqMwYgfVRiGkAesnSd0=; b=h/LnFSj72cNOcv7NmV0usANS3m
	ZyigNSP672EM/0ywWcvAuJG3YS678hnuxG15HQMttVuXTCGeYdzCKUiOjD8Sz+o1Fuo4By6r3/pY/
	HuQPF+h43FtmXhPnNfVkzmkbdd5i0O/TF+mmio+9nCnhLyyZfWwQoqlWuk7QDw6sBaYs=;
Date: Mon, 7 Sep 2026 09:54:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 05/14] x86/altcall: hide casting away of const
Message-ID: <ap5tnr5WHFCalJIn@macbook.local>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <a13607cb-3d06-4668-85fe-275da2b716c9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a13607cb-3d06-4668-85fe-275da2b716c9@suse.com>

On Wed, Sep 02, 2026 at 08:32:09AM +0200, Jan Beulich wrote:
> ALT_CALL_PTR() really means to get rid of const (when necessary, i.e. when
> used from apply_alt_calls()): We want to patch the original call site,
> after all, and memory-wise that's unrelated to the struct alt_call * that
> we start from.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

