Return-Path: <SRS0=SN9p=EE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4A5C2D0A3
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 17:10:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A99B20759
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 17:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="MQJ29yPq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A99B20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.14395.35559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBRR-00026o-Gu; Thu, 29 Oct 2020 17:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14395.35559; Thu, 29 Oct 2020 17:10:25 +0000
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
	id 1kYBRR-00026h-Cs; Thu, 29 Oct 2020 17:10:25 +0000
Received: by outflank-mailman (input) for mailman id 14395;
 Thu, 29 Oct 2020 17:10:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYBRP-00026X-VF
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:10:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 847c457d-17cf-4b40-bc43-e1ed0460cb81;
 Thu, 29 Oct 2020 17:10:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A389ACF6;
 Thu, 29 Oct 2020 17:10:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYBRP-00026X-VF
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:10:23 +0000
X-Inumbo-ID: 847c457d-17cf-4b40-bc43-e1ed0460cb81
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 847c457d-17cf-4b40-bc43-e1ed0460cb81;
	Thu, 29 Oct 2020 17:10:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603991422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E+ezQCTGakbRm0syNT/lctbw8ycn2F425iJ8DjN9kNw=;
	b=MQJ29yPq1EqSqtt+PS4dtHxn0Lg2YBlLrBvwllE1Rk3+X7ucOObj2y+G07fZhWB5281NTE
	BOd+b7THGBPjq7uGOmjTExQOhLKzS8JHWqY7p95y54kGlh1o9BpkEC6T5McTH3JLKn+yQz
	f7K7ZMZrqp7nh5Erf8jdvbJr5CYAL+0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7A389ACF6;
	Thu, 29 Oct 2020 17:10:22 +0000 (UTC)
Subject: [PATCH 2/2] x86: PV shim doesn't need GRANT_TABLE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <94c18ebf-632d-8a2c-220c-c31d6e37eb55@suse.com>
Message-ID: <17fb04fb-99b6-7e20-0583-421ebb666ddc@suse.com>
Date: Thu, 29 Oct 2020 18:10:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <94c18ebf-632d-8a2c-220c-c31d6e37eb55@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The only reference into the code controlled by this option is from the
hypercall table, and that hypercall table entry gets overwritten.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -9,6 +9,7 @@ CONFIG_EXPERT=y
 CONFIG_SCHED_NULL=y
 # Disable features not used by the PV shim
 # CONFIG_XEN_SHSTK is not set
+# CONFIG_GRANT_TABLE is not set
 # CONFIG_HYPFS is not set
 # CONFIG_BIGMEM is not set
 # CONFIG_KEXEC is not set


