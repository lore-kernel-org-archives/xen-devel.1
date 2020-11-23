Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D7AC2D0E4
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 11:33:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5D8D2072C
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 11:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="eSNbLbZe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5D8D2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.34036.64885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khA5v-0003OL-Cu; Mon, 23 Nov 2020 11:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34036.64885; Mon, 23 Nov 2020 11:33:19 +0000
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
	id 1khA5v-0003OE-9G; Mon, 23 Nov 2020 11:33:19 +0000
Received: by outflank-mailman (input) for mailman id 34036;
 Mon, 23 Nov 2020 11:33:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khA5u-0003Nv-3Z
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 11:33:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d8f3a34-8ff3-4ea1-8170-84fc69e6ed6f;
 Mon, 23 Nov 2020 11:33:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81559AC41;
 Mon, 23 Nov 2020 11:33:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khA5u-0003Nv-3Z
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 11:33:18 +0000
X-Inumbo-ID: 9d8f3a34-8ff3-4ea1-8170-84fc69e6ed6f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9d8f3a34-8ff3-4ea1-8170-84fc69e6ed6f;
	Mon, 23 Nov 2020 11:33:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606131196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SDONeI7DyKyFUimEW6bd/Hu8WdJdN9YQcEQmWQvjWKs=;
	b=eSNbLbZeieuC8Bs9yq1hcybeAzibyyOGgkloaJ8rW8WSTb2+i27NZiohfViVHMO8WRTSBW
	/gpF0o6z/jps0I3pLb523Lm75OPiy5yI8p93rPbD2ct+gdS6Y5i/WvOO1EM5ORUcrlJpbx
	KVl17wvz9hpgKaynUAp0wBuPWpL/yq4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 81559AC41;
	Mon, 23 Nov 2020 11:33:16 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/DMI: fix SMBIOS pointer range check
Message-ID: <7823a8e0-6388-08f6-0ce6-36bd7139ff54@suse.com>
Date: Mon, 23 Nov 2020 12:33:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Forever since its introduction this has been using an inverted relation
operator.

Fixes: 54057a28f22b ("x86: support SMBIOS v3")
Signed-off-by: Jan Beulich <JBeulich@suse.com>

--- a/xen/arch/x86/dmi_scan.c
+++ b/xen/arch/x86/dmi_scan.c
@@ -357,7 +357,7 @@ static int __init dmi_iterate(void (*dec
 			memcpy_fromio(&smbios3, q, sizeof(smbios3));
 			if (memcmp(smbios3.anchor, "_SM3_", 5) ||
 			    smbios3.length < sizeof(smbios3) ||
-			    q < p + 0x10000 - smbios3.length ||
+			    q > p + 0x10000 - smbios3.length ||
 			    !dmi_checksum(q, smbios3.length))
 				smbios3.length = 0;
 		}

