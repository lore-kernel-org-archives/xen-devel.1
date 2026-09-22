Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436DAC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 08:13:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428321.1651050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8vcQ-0001SG-Lq; Tue, 22 Sep 2026 08:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428321.1651050; Tue, 22 Sep 2026 08:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8vcQ-0001S9-JA; Tue, 22 Sep 2026 08:12:50 +0000
Received: by outflank-mailman (input) for mailman id 1428321;
 Tue, 22 Sep 2026 08:12:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x8vcP-0001S1-IZ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:12:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x8vcO-00AgsG-14;
 Tue, 22 Sep 2026 08:12:48 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x8vcO-003bxv-2e;
 Tue, 22 Sep 2026 08:12:48 +0000
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
	bh=6VTN88SjBuYNs1nRC0ISw/3lDgxFPUOXRaAn6oA/2TI=; b=mKseR2icXmN0MVatlBCFyDVGQr
	zpqBsYeQAwtZ+xiKsLreYfGDZaYUdEbWZJD+um+oSbCaSHAt079pS1BWm01b6+9w1T06igUJqZ8uU
	rbFolLl06GhIhMv3au009RvCByI47lnN+8wYRTECYQBDLIFdNW/o2Wpd/QRB76w74tGk=;
Date: Tue, 22 Sep 2026 10:12:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 2/2] symbols: also special-case symbols aliasing
 _sinittext
Message-ID: <arI4fhUcMV1QWo6q@macbook.local>
References: <bd5ed50e-e537-4033-b5b9-98167886690a@suse.com>
 <fd7dc2f7-6505-42e2-8eaf-fb8e9af21bd4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd7dc2f7-6505-42e2-8eaf-fb8e9af21bd4@suse.com>

On Tue, Aug 25, 2026 at 04:29:25PM +0200, Jan Beulich wrote:
> A recent 4.22 randconfig build job hit a situation where (LIVEPATCH=n,
> i.e. --all-symbols not specified) both __note_gnu_build_id_end and
> _erodata aliased _sinittext on the 1st linking pass, but they didn't on
> the 2nd one. As a result two fewer symbols were emitted on the 2nd pass,
> causing $(call compare-symbol-tables, ...) to fail.
> 
> Extend the existing "corner case" by also considering aliases with
> _sinittext (_stext really shouldn't have anything ahead of it), but
> discard only non-text symbols.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

(with the _sextratext mention removed)

Thanks, Roger.

