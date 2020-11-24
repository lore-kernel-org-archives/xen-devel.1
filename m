Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762F6C63798
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 16:58:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B73B206D8
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 16:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KgYlNLBw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B73B206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.36607.68573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khbdy-0004Qz-UH; Tue, 24 Nov 2020 16:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36607.68573; Tue, 24 Nov 2020 16:58:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khbdy-0004Qs-RC; Tue, 24 Nov 2020 16:58:18 +0000
Received: by outflank-mailman (input) for mailman id 36607;
 Tue, 24 Nov 2020 16:58:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khbdx-0004QI-Dg
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 16:58:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa61e201-fa76-4625-82da-7264d5f3d9be;
 Tue, 24 Nov 2020 16:58:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C429AAC6A;
 Tue, 24 Nov 2020 16:58:15 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khbdx-0004QI-Dg
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 16:58:17 +0000
X-Inumbo-ID: aa61e201-fa76-4625-82da-7264d5f3d9be
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id aa61e201-fa76-4625-82da-7264d5f3d9be;
	Tue, 24 Nov 2020 16:58:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606237095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUellZBDDRYg6aYj/PtKvu3LQ9tnp34aTi25Ik3zNhw=;
	b=KgYlNLBwJbzvtFNTV4KIdmREVidI34IRVU8OtMPOI8qMb28fV2xLsI4/PT2KfHnu8QSF9D
	StsKNxYp70uZ2jIf8nRqlUhD1GKaqbsrJvaW7+/CF/AcckPD5UHBjr+P6Awx8upkQ75DY1
	Zgc+vWpfaMETdQiYXNv0bzJFbQIL4QM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C429AAC6A;
	Tue, 24 Nov 2020 16:58:15 +0000 (UTC)
Subject: Re: [PATCH v2 09/12] viridian: add ExProcessorMasks variant of the
 IPI hypercall
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201120094900.1489-1-paul@xen.org>
 <20201120094900.1489-10-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a9cfdedf-7bf1-56a2-d716-f13ea9a37179@suse.com>
Date: Tue, 24 Nov 2020 17:58:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120094900.1489-10-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 10:48, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> A previous patch introduced variants of the flush hypercalls that take a
> 'Virtual Processor Set' as an argument rather than a simple 64-bit mask.
> This patch introduces a similar variant of the HVCALL_SEND_IPI hypercall
> (HVCALL_SEND_IPI_EX).
> 
> NOTE: As with HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE/LIST_EX, a guest should
>       not yet issue the HVCALL_SEND_IPI_EX hypercall as support for
>       'ExProcessorMasks' is not yet advertised via CPUID.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

I guess most remarks given for the previous patch apply here
as well.

Jan

