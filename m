Return-Path: <SRS0=QCGW=QC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3ADC433EF
	for <xen-devel@archiver.kernel.org>; Mon, 15 Nov 2021 12:03:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021216322D
	for <xen-devel@archiver.kernel.org>; Mon, 15 Nov 2021 12:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 021216322D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=srcf.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.225833.390065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmahu-0001Ar-Md; Mon, 15 Nov 2021 12:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225833.390065; Mon, 15 Nov 2021 12:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmahu-0001Ak-JO; Mon, 15 Nov 2021 12:03:30 +0000
Received: by outflank-mailman (input) for mailman id 225833;
 Mon, 15 Nov 2021 12:03:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jrjg=QC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mmaht-0001Ae-8G
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:03:29 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a41c909-460c-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 13:03:27 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40174)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mmahq-000hGf-2v (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 15 Nov 2021 12:03:26 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 820381FC18;
 Mon, 15 Nov 2021 12:03:26 +0000 (GMT)
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
X-Inumbo-ID: 0a41c909-460c-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH for-4.16] freebsd/privcmd: fix MMAP_RESOURCE ioctl
 definition
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
References: <20211115110851.1462-1-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Message-ID: <11c7c89d-ba8f-e1da-e2af-4ba186f92fbe@srcf.net>
Date: Mon, 15 Nov 2021 12:03:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115110851.1462-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 15/11/2021 11:08, Roger Pau Monne wrote:
> Current ioctl definition was wrong in both FreeBSD and Xen sources, as
> the MMAP_RESOURCE ioctl needs to copy back the size of the resource
> when passed a zero address and size. FreeBSD encodes in the definition
> of the ioctl number whether parameters should be copied in (W) and/or
> copied out (R). The current definition for MMAP_RESOURCE is lacking
> the copy out part (R), and thus the call to query the size of a
> resource would always return 0.
>
> This change will break the current ioctl interface, the tools can
> however fall back to using the foreign memory interface in order to
> map resources from guests.
>
> This was a shortcoming from when the hypercall and ioctl gained the
> ability to query the size of the resources, as originally the
> MMAP_RESOURCE ioctl didn't need to copy out any data.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
>
> The change only affects FreeBSD, and it's only a change in a
> definition of an ioctl, so it's unlikely to break existing code logic.
> Without this change Xen tools won't be able to use the MMAP_RESOURCE
> ioctl.

I guess you found this while trying to fix test-resource, in which case
a further argument for the change is "the unit tests now pass on FreeBSD" ?

~Andrew

