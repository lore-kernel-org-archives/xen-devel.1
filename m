Return-Path: <SRS0=M4UH=WF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B28C433FF
	for <xen-devel@archiver.kernel.org>; Fri,  9 Aug 2019 13:33:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3535214C6
	for <xen-devel@archiver.kernel.org>; Fri,  9 Aug 2019 13:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3535214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw51E-0000IA-He; Fri, 09 Aug 2019 13:33:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw51D-0000Ht-EC
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 13:33:19 +0000
X-Inumbo-ID: 3eeaccce-baaa-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3eeaccce-baaa-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 13:33:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F116BB005;
 Fri,  9 Aug 2019 13:33:16 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: xen-announce@lists.xenproject.org
Message-ID: <d8f135ad-9574-d907-5ccc-dff7728f823d@suse.com>
Date: Fri, 9 Aug 2019 15:33:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Xen 4.12.1 released
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsLAoKSSBhbSBwbGVhc2VkIHRvIGFubm91bmNlIHRoZSByZWxlYXNlIG9mIFhlbiA0LjEyLjEu
IFRoaXMgaXMgYXZhaWxhYmxlCmltbWVkaWF0ZWx5IGZyb20gaXRzIGdpdCByZXBvc2l0b3J5Cmh0
dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1zaG9ydGxvZztoPXJlZnMv
aGVhZHMvc3RhYmxlLTQuMTIKKHRhZyBSRUxFQVNFLTQuMTIuMSkgb3IgZnJvbSB0aGUgWGVuUHJv
amVjdCBkb3dubG9hZCBwYWdlCmh0dHBzOi8veGVucHJvamVjdC5vcmcvZG93bmxvYWRzL3hlbi1w
cm9qZWN0LWFyY2hpdmVzL3hlbi1wcm9qZWN0LTQtMTItc2VyaWVzL3hlbi1wcm9qZWN0LTQtMTIt
MS8KKHdoZXJlIGEgbGlzdCBvZiBjaGFuZ2VzIGNhbiBhbHNvIGJlIGZvdW5kKS4KCldlIHJlY29t
bWVuZCBhbGwgdXNlcnMgb2YgdGhlIDQuMTIgc3RhYmxlIHNlcmllcyB0byB1cGRhdGUgdG8gdGhp
cwpmaXJzdCBwb2ludCByZWxlYXNlLgoKUmVnYXJkcywgSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
