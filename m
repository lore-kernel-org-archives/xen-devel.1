Return-Path: <SRS0=Jwwc=ES=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C52C2D0A3
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 13:43:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF2D520825
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 13:43:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="kNGAjSM8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF2D520825
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.25897.53954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdCsp-0001GE-8W; Thu, 12 Nov 2020 13:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25897.53954; Thu, 12 Nov 2020 13:43:27 +0000
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
	id 1kdCsp-0001G7-3o; Thu, 12 Nov 2020 13:43:27 +0000
Received: by outflank-mailman (input) for mailman id 25897;
 Thu, 12 Nov 2020 13:43:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdCsn-0001G2-HY
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:43:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b82396ce-b2ee-49e1-9b2b-69d9369c4f10;
 Thu, 12 Nov 2020 13:43:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE7FDAC1D;
 Thu, 12 Nov 2020 13:43:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdCsn-0001G2-HY
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:43:25 +0000
X-Inumbo-ID: b82396ce-b2ee-49e1-9b2b-69d9369c4f10
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b82396ce-b2ee-49e1-9b2b-69d9369c4f10;
	Thu, 12 Nov 2020 13:43:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605188604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uK18gfZ7Cv4BatXuQtSCa+4tfAYmJ4mvF4Bk1+DC59w=;
	b=kNGAjSM8uF343l01k6tEvPOai9MsOjuRr+JyzD2NKcBgzNJYfBNiDQBKs1OXa+PmQ96RPw
	9K8t76XIqLdJ1u8NHMbXn0X9V3Vw6eSp2bdc14YHNyWY72MhO8E9gJ5se1l6PLoM89s+TS
	e3dXFdZn5D58S0TeDOSz0dFQl5KDNtk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DE7FDAC1D;
	Thu, 12 Nov 2020 13:43:23 +0000 (UTC)
Subject: Re: [PATCH v5 2/3] xen/oprofile: use NMI continuation for sending
 virq to guest
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201112131424.9930-1-jgross@suse.com>
 <20201112131424.9930-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c03669ae-e09f-681b-c98b-5719932033cd@suse.com>
Date: Thu, 12 Nov 2020 14:43:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201112131424.9930-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.11.2020 14:14, Juergen Gross wrote:
> Instead of calling send_guest_vcpu_virq() from NMI context use the
> NMI continuation framework for that purpose. This avoids taking locks
> in NMI mode.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

