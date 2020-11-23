Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF11C56202
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 13:50:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 367F1206F1
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 13:50:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="SzOSC2Zx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 367F1206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.34381.65382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCEE-0002p6-Dp; Mon, 23 Nov 2020 13:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34381.65382; Mon, 23 Nov 2020 13:50:02 +0000
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
	id 1khCEE-0002oz-AB; Mon, 23 Nov 2020 13:50:02 +0000
Received: by outflank-mailman (input) for mailman id 34381;
 Mon, 23 Nov 2020 13:50:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCEC-0002gu-W5
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:50:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c950dab6-87f7-4743-9a93-f12026a5e057;
 Mon, 23 Nov 2020 13:50:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91D0CAC0C;
 Mon, 23 Nov 2020 13:49:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCEC-0002gu-W5
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:50:01 +0000
X-Inumbo-ID: c950dab6-87f7-4743-9a93-f12026a5e057
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c950dab6-87f7-4743-9a93-f12026a5e057;
	Mon, 23 Nov 2020 13:50:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606139399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2MYR1tCC68AyvWxk3zsBK94D4ktPHWPLPWkA84rnIpc=;
	b=SzOSC2Zx2T80Yye7d/v+73IUNfdgr1+F0HyTNd7/BGDuV69JGDLQwfrbh0WS9ST9/Mr8Xy
	ywQb5f8WXrdYh1M9W5ULLn9gM/0WUtPr1+5/XVD84PUE0DRiIHDVb/QdZuzrMuXu75k6sA
	O3Qh4VF4e2DwTjVISmyTIeyP+k0fmbw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 91D0CAC0C;
	Mon, 23 Nov 2020 13:49:59 +0000 (UTC)
Subject: Ping: [PATCH 0/5] x86/PV: memory management consistency and minor
 relaxations
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Message-ID: <5534e9bc-7c89-53ba-1459-4064c209584d@suse.com>
Date: Mon, 23 Nov 2020 14:49:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.11.2020 11:54, Jan Beulich wrote:
> Especially the latter three patches provide only small possible
> gains, from all I can tell. I nevertheless wanted to put up the
> entire set for consideration.
> 
> 1: consistently inline {,un}adjust_guest_l<N>e()
> 2: fold redundant calls to adjust_guest_l<N>e()
> 3: _PAGE_RW changes may take fast path of mod_l[234]_entry()
> 4: restrict TLB flushing after mod_l[234]_entry()
> 5: avoid TLB flushing after mod_l3_entry()

Ping?

Jan

