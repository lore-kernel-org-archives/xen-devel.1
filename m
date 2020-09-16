Return-Path: <SRS0=Rhtt=CZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB0FC43461
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 13:04:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08BF722268
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 13:04:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=suse.com header.i=@suse.com header.b="LaV3rRSc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08BF722268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIX6X-00036L-9W; Wed, 16 Sep 2020 13:04:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIX6V-00036G-KO
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 13:04:07 +0000
X-Inumbo-ID: 4b88a622-60b3-4302-826e-5288822f95a9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b88a622-60b3-4302-826e-5288822f95a9;
 Wed, 16 Sep 2020 13:04:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600261446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rsYpQPr9XZ2jsAls9iWzS/yvMAnNrHqzeM6AwMfqFUY=;
 b=LaV3rRSch1qb8QH6vhsBcOKQzHPXTX3Zi2KWLaXIEn0IvLYWUc2cuGGE1bMxGjCYubEraz
 JcrWKTbfB5b1LLyqo8q/uF3yPM9s8zRzoPIvNW7+j6FRnMrBr3rHLKPzq2D/zwaJYRITsG
 KHj5Aw+nX7OC6bbw3cI8n7erjXKeI+Ela/SQDMsJnpCr4Ybt0YuOZSX/wf2jo426e6VvPa
 dHPAHZq3Z0cyUH2d3HDY1f6KfhC2uOn64pqAcaM5fHL5xIKc73ISWAXBzy5lsmARAYy7pQ
 9woA3dmlHYPDxRJ4liqeitrdTlUgX0S7kUO5c8wNmkM12yoWVsHo4ws+JazBDA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E01CB2A3;
 Wed, 16 Sep 2020 13:04:21 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/4] x86: shim building adjustments (plus shadow follow-on)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
Message-ID: <c6b9c903-02eb-d473-86e3-ccb67aff6cd7@suse.com>
Date: Wed, 16 Sep 2020 15:04:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The first change is simply addressing a build issue noticed by
Andrew. The build breakage goes beyond this specific combination
though - PV_SHIM_EXCLUSIVE plus HVM is similarly an issue. This
is what the last patch tries to take care of, in a shape already
on irc noticed to be controversial. I'm submitting the change
nevertheless because for the moment there looks to be a majority
in favor of going this route. One argument not voiced there yet:
What good does it do to allow a user to enable HVM when then on
the resulting hypervisor they still can't run HVM guests (for
the hypervisor still being a dedicated PV shim one). On top of
this, the alternative approach is likely going to get ugly.

1: fix build with PV_SHIM_EXCLUSIVE and SHADOW_PAGING
2: adjust Kconfig defaults
3: don't permit HVM and PV_SHIM_EXCLUSIVE at the same time
4: refactor shadow_vram_{get,put}_l1e()

Jan

