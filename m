Return-Path: <SRS0=CqUQ=5N=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A65AC43331
	for <xen-devel@archiver.kernel.org>; Sat, 28 Mar 2020 11:01:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3988220716
	for <xen-devel@archiver.kernel.org>; Sat, 28 Mar 2020 11:01:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="PZNfuurN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3988220716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jI9Dl-0006E0-C1; Sat, 28 Mar 2020 11:01:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8l4x=5N=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jI9Dj-0006Du-C6
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 11:01:43 +0000
X-Inumbo-ID: 814f4a18-70e3-11ea-8b31-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 814f4a18-70e3-11ea-8b31-12813bfff9fa;
 Sat, 28 Mar 2020 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=ATXuFGKP7FvxRHoPx3tOR5a71SugR7oDDFASKEsgYjc=; b=PZNfuurNMf3qSSKKQmAHc8oOz6
 BUCt5+d9ecTZoEnAMPBkFMqDNdHRCiPgCtjaI5D7OSTICPFxtPm9WKtxFIknM3moYh+ivWh51xWoE
 Ig6FnJEQ41lvdsii9yPoX62vjvrAq/fRMPW9GxpUWkI7ki2V5gujtbTTe0QaK4Eyw+qE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jI9Dh-00082l-4o; Sat, 28 Mar 2020 11:01:41 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jI9Dg-00079p-S5; Sat, 28 Mar 2020 11:01:41 +0000
Date: Sat, 28 Mar 2020 11:01:38 +0000
From: Wei Liu <wl@xen.org>
To: Julien Grall <julien@xen.org>
Message-ID: <20200328110138.inohkfimiiij73vk@debian>
References: <20200327190546.21580-1-julien@xen.org>
 <20200327190546.21580-2-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327190546.21580-2-julien@xen.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 1/3] xen/x86: ioapic: Use true/false in
 bad_ioapic_register()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Mar 27, 2020 at 07:05:44PM +0000, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> bad_ioapic_register() is return a bool, so we should switch to
> true/false.

is return -> returns / is returning

> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Wei Liu <wl@xen.org>

