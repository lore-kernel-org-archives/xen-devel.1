Return-Path: <SRS0=QSaH=BO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146F9C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 15:26:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBAC72086A
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 15:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBAC72086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2ypI-0001zo-1i; Tue, 04 Aug 2020 15:26:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2ypG-0001zj-Sh
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 15:26:02 +0000
X-Inumbo-ID: 7e0f829e-1eb2-4ce4-a626-014105533bb1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e0f829e-1eb2-4ce4-a626-014105533bb1;
 Tue, 04 Aug 2020 15:26:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F62FAF4C;
 Tue,  4 Aug 2020 15:26:17 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: comment update after "drop high compat r/o M2P table
 address range"
Message-ID: <f561f170-77ab-0108-d8bc-b897e4a8272f@suse.com>
Date: Tue, 4 Aug 2020 17:26:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit 5af040ef8b57 clearly should also have updated the comment, not
just the #define-s.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -144,18 +144,16 @@ extern unsigned char boot_edid_info[128]
  *  0xffff82d000000000 - 0xffff82d03fffffff [1GB,   2^30 bytes, PML4:261]
  *    Compatibility machine-to-phys translation table.
  *  0xffff82d040000000 - 0xffff82d07fffffff [1GB,   2^30 bytes, PML4:261]
- *    High read-only compatibility machine-to-phys translation table.
- *  0xffff82d080000000 - 0xffff82d0bfffffff [1GB,   2^30 bytes, PML4:261]
  *    Xen text, static data, bss.
 #ifndef CONFIG_BIGMEM
- *  0xffff82d0c0000000 - 0xffff82dfffffffff [61GB,              PML4:261]
+ *  0xffff82d080000000 - 0xffff82dfffffffff [62GB,              PML4:261]
  *    Reserved for future use.
  *  0xffff82e000000000 - 0xffff82ffffffffff [128GB, 2^37 bytes, PML4:261]
  *    Page-frame information array.
  *  0xffff830000000000 - 0xffff87ffffffffff [5TB, 5*2^40 bytes, PML4:262-271]
  *    1:1 direct mapping of all physical memory.
 #else
- *  0xffff82d0c0000000 - 0xffff82ffffffffff [189GB,             PML4:261]
+ *  0xffff82d080000000 - 0xffff82ffffffffff [190GB,             PML4:261]
  *    Reserved for future use.
  *  0xffff830000000000 - 0xffff847fffffffff [1.5TB, 3*2^39 bytes, PML4:262-264]
  *    Page-frame information array.

