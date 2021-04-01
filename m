Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60319C433B4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 10:15:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E231160FDB
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 10:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E231160FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104277.199257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuLt-0000Nu-Ee; Thu, 01 Apr 2021 10:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104277.199257; Thu, 01 Apr 2021 10:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuLt-0000Nn-B8; Thu, 01 Apr 2021 10:15:01 +0000
Received: by outflank-mailman (input) for mailman id 104277;
 Thu, 01 Apr 2021 10:15:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuLr-0000Ne-UC
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:14:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef0fa20b-faed-45ce-be13-d0a8d0402ad1;
 Thu, 01 Apr 2021 10:14:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 315A3AEA6;
 Thu,  1 Apr 2021 10:14:58 +0000 (UTC)
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
X-Inumbo-ID: ef0fa20b-faed-45ce-be13-d0a8d0402ad1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xH4wjHy3MHm3MpA5OfQg5m/IJ+YbG9hbx8Zy+5IXfxo=;
	b=tydK5NWUI55HS5wCoTczdxtLYmoHEXm0erkuM8nnRMZy2oSA6OmJQuJIsQqkYdOoaHKAYI
	PULWKNdS1+FWh/9rm5Al6DVOy8nO1xYpRytglkQEWucX1SkzjquWeJ70U/AHaAJu9diu41
	jNzOel7cbwWZCMN7e8r2OEuzFPkEXHA=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/23] further population of xen/lib/
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Date: Thu, 1 Apr 2021 12:14:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is to dissolve / move xen/common/lib.c and xen/common/string.c.
One benefit of moving these functions into an archive is that we can
drop some of the related __HAVE_ARCH_* #define-s: By living in an
archive, the per-arch functions will preempt any loading of the
respective functions (objects) from the archive. (Down the road we
may want to move the per-arch functions into archives as well, at
which point the per-arch archive(s) would need to be specified ahead
of the common one(s) to the linker.)

01: lib: move muldiv64()
02: lib: move 64-bit div/mod compiler helpers
03: string: drop redundant declarations
04: lib: move memset()
05: lib: move memcpy()
06: lib: move memmove()
07: lib: move memcmp()
08: lib: move memchr()
09: lib: move memchr_inv()
10: lib: move strlen()
11: lib: move strnlen()
12: lib: move strcmp()
13: lib: move strncmp()
14: lib: move strlcpy()
15: lib: move strlcat()
16: lib: move strchr()
17: lib: move strrchr()
18: lib: move strstr()
19: lib: move strcasecmp()
20: lib: move/rename strnicmp() to strncasecmp()
21: lib: move strspn()
22: lib: move strpbrk()
23: lib: move strsep()

Jan

