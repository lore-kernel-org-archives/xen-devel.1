Return-Path: <SRS0=u+XK=ZZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2762CC432C3
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 13:01:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF010206EC
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 13:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF010206EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic7np-0000Ge-Dy; Tue, 03 Dec 2019 13:01:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic7no-0000GZ-2C
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 13:01:16 +0000
X-Inumbo-ID: f904d7c1-15cc-11ea-81db-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f904d7c1-15cc-11ea-81db-12813bfff9fa;
 Tue, 03 Dec 2019 13:01:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42CF0ADCF;
 Tue,  3 Dec 2019 13:01:08 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: xen-announce@lists.xenproject.org
Message-ID: <c4b1b645-16a2-038c-5ffd-8eb276d53536@suse.com>
Date: Tue, 3 Dec 2019 14:01:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Xen 4.11.3 released
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsLAoKSSBhbSBwbGVhc2VkIHRvIGFubm91bmNlIHRoZSByZWxlYXNlIG9mIFhlbiA0LjExLjMu
IFRoaXMgaXMgYXZhaWxhYmxlCmltbWVkaWF0ZWx5IGZyb20gaXRzIGdpdCByZXBvc2l0b3J5Cmh0
dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1zaG9ydGxvZztoPXJlZnMv
aGVhZHMvc3RhYmxlLTQuMTEKKHRhZyBSRUxFQVNFLTQuMTEuMykgb3IgZnJvbSB0aGUgWGVuUHJv
amVjdCBkb3dubG9hZCBwYWdlCmh0dHBzOi8veGVucHJvamVjdC5vcmcvZG93bmxvYWRzL3hlbi1w
cm9qZWN0LWFyY2hpdmVzL3hlbi1wcm9qZWN0LTQtMTEtc2VyaWVzL3hlbi1wcm9qZWN0LTQtMTEt
My8KKHdoZXJlIGEgbGlzdCBvZiBjaGFuZ2VzIGNhbiBhbHNvIGJlIGZvdW5kKS4KCldlIHJlY29t
bWVuZCBhbGwgdXNlcnMgb2YgdGhlIDQuMTEgc3RhYmxlIHNlcmllcyB0byB1cGRhdGUgdG8gdGhp
cwpsYXRlc3QgcG9pbnQgcmVsZWFzZS4KClJlZ2FyZHMsIEphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
