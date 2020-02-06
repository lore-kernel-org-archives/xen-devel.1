Return-Path: <SRS0=8zAd=32=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57010C33CAC
	for <xen-devel@archiver.kernel.org>; Thu,  6 Feb 2020 15:35:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 321AE21D7D
	for <xen-devel@archiver.kernel.org>; Thu,  6 Feb 2020 15:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 321AE21D7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izjB0-0006PF-MK; Thu, 06 Feb 2020 15:34:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izjAz-0006PA-37
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 15:34:45 +0000
X-Inumbo-ID: 3279b0c8-48f6-11ea-afe2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3279b0c8-48f6-11ea-afe2-12813bfff9fa;
 Thu, 06 Feb 2020 15:34:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EC984AEBF;
 Thu,  6 Feb 2020 15:34:42 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1964edd2-18aa-1130-2744-fcf9d480b567@suse.com>
Date: Thu, 6 Feb 2020 16:34:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] VT-d: drop stray "list" field from struct
 user_rmrr
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
Cc: Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZpZWxkIGxvb2tzIHRvIGhhdmUgYmVlbiBib2d1c2x5IGFkZGVkIGJ5IHRoZSBwYXRjaCBp
bnRyb2R1Y2luZyB0aGUKc3RydWN0ICg0MzE2ODVlOGRlYjYgIlZULWQ6IGFkZCBjb21tYW5kIGxp
bmUgb3B0aW9uIGZvciBleHRyYSBybXJycyIpLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2Rt
YXIuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jCkBAIC04MzksNyAr
ODM5LDYgQEAgb3V0OgogLyogUk1SUiB1bml0cyBkZXJpdmVkIGZyb20gY29tbWFuZCBsaW5lIHJt
cnIgb3B0aW9uLiAqLwogI2RlZmluZSBNQVhfVVNFUl9STVJSX0RFViAyMAogc3RydWN0IHVzZXJf
cm1yciB7Ci0gICAgc3RydWN0IGxpc3RfaGVhZCBsaXN0OwogICAgIHVuc2lnbmVkIGxvbmcgYmFz
ZV9wZm4sIGVuZF9wZm47CiAgICAgdW5zaWduZWQgaW50IGRldl9jb3VudDsKICAgICB1MzIgc2Jk
ZltNQVhfVVNFUl9STVJSX0RFVl07CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
