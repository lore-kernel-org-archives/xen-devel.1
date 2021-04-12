Return-Path: <SRS0=44Tx=JJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A865DC433ED
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 11:47:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 417866124C
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 11:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 417866124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.109039.208124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVv1w-0006nc-Ax; Mon, 12 Apr 2021 11:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109039.208124; Mon, 12 Apr 2021 11:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVv1w-0006nV-7t; Mon, 12 Apr 2021 11:47:00 +0000
Received: by outflank-mailman (input) for mailman id 109039;
 Mon, 12 Apr 2021 11:46:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVv1v-0006nQ-4t
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 11:46:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eaa62d50-df37-4042-b528-adae9f86b9f4;
 Mon, 12 Apr 2021 11:46:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CB3BAE03;
 Mon, 12 Apr 2021 11:46:57 +0000 (UTC)
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
X-Inumbo-ID: eaa62d50-df37-4042-b528-adae9f86b9f4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618228017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2sr8uJRV+XUC2EnsLouQ9m2mkuBpJ2AifP761PcY6wo=;
	b=ttUKYC1NKyVtzRQqQ0Prnyr7VQM4XxxbXEoyGRmNOE37G0raEsy/vAnqxszcr88iEWI+5W
	j9tjzUAa0G3bSI+j5oymldtqNtxX8QiedAs82nuT2eZP1ux1l7iL08PzT1lD2p0zBzYCjt
	FOQ9zbTxvxCXl5zqei0YL8OgrPWnN3E=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/shadow: shadow_get_page_from_l1e() adjustments
Message-ID: <e410c8e6-351d-bd98-7485-eb57268dc378@suse.com>
Date: Mon, 12 Apr 2021 13:46:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The aspect of the function the second patch here changes has been
puzzling me for many years. I finally thought I ought to make an
attempt at reducing this to just a single get_page_from_l1e()
invocation. The first patch mainly helps readability (of the code
in general as well as the second patch).

Note that the first patch here takes "VMX: use a single, global APIC
access page" as a prereq; it could be re-based ahead of that one.

1: re-use variables in shadow_get_page_from_l1e()
2: streamline shadow_get_page_from_l1e()

Jan

