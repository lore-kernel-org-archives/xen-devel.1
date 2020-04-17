Return-Path: <SRS0=mRjJ=6B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A208C2D0EF
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2020 14:23:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 233EC20857
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2020 14:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 233EC20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRth-0007S6-LB; Fri, 17 Apr 2020 14:23:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPRtg-0007S1-GO
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:23:12 +0000
X-Inumbo-ID: f6666f1a-80b6-11ea-8d02-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6666f1a-80b6-11ea-8d02-12813bfff9fa;
 Fri, 17 Apr 2020 14:23:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 37530AB5F;
 Fri, 17 Apr 2020 14:23:08 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/10] x86: mm (mainly shadow) adjustments
Message-ID: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Date: Fri, 17 Apr 2020 16:23:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Large parts of this series are to further isolate pieces which
are needed for HVM only, and hence would better not be built
with HVM=n. But there are also a few other items which I've
noticed along the road.

01: mm: no-one passes a NULL domain to init_xen_l4_slots()
02: shadow: drop a stray forward structure declaration
03: shadow: monitor table is HVM-only
04: shadow: sh_update_linear_entries() is a no-op for PV
05: mm: monitor table is HVM-only
06: shadow: sh_remove_write_access_from_sl1p() can be static
07: shadow: the guess_wrmap() hook is needed for HVM only
08: mm: pagetable_dying() is HVM-only
09: shadow: the trace_emul_write_val() hook is HVM-only
10: shadow: don't open-code shadow_blow_tables_per_domain()

Jan

