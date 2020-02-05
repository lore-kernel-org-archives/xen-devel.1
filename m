Return-Path: <SRS0=Wd3Q=3Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B146C35254
	for <xen-devel@archiver.kernel.org>; Wed,  5 Feb 2020 13:15:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D90A2217BA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Feb 2020 13:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D90A2217BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izKW5-000553-FI; Wed, 05 Feb 2020 13:14:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izKW4-00054u-Lr
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:14:52 +0000
X-Inumbo-ID: 7e23e4d6-4819-11ea-90f5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e23e4d6-4819-11ea-90f5-12813bfff9fa;
 Wed, 05 Feb 2020 13:14:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4FD96AC69;
 Wed,  5 Feb 2020 13:14:51 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Message-ID: <62c2afe5-4ab4-50b4-f876-9324bade6ef1@suse.com>
Date: Wed, 5 Feb 2020 14:14:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/6] EFI: don't leak heap contents through
 XEN_EFI_get_next_variable_name
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDFmNGViOWQyN2QwZSAoIkVGSTogZml4IGdldHRpbmcgRUZJIHZhcmlhYmxlIGxpc3Qg
b24gc29tZQpzeXN0ZW1zIikgc3dpdGNoZWQgdG8gdXNpbmcgdGhlIGNhbGxlciBwcm92aWRlZCBz
aXplIGZvciB0aGUgY29weS1vdXQKd2l0aG91dCBtYWtpbmcgc3VyZSB0aGUgY29waWVkIGJ1ZmZl
ciBpcyBwcm9wZXJseSBzY3J1YmJlZC4KClJlcG9ydGVkLWJ5OiBJbGphIFZhbiBTcHJ1bmRlbCA8
aXZhbnNwcnVuZGVsQGlvYWN0aXZlLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxh
cEBjaXRyaXguY29tPgoKLS0tIGEveGVuL2NvbW1vbi9lZmkvcnVudGltZS5jCisrKyBiL3hlbi9j
b21tb24vZWZpL3J1bnRpbWUuYwpAQCAtNTcxLDcgKzU3MSw3IEBAIGludCBlZmlfcnVudGltZV9j
YWxsKHN0cnVjdCB4ZW5wZl9lZmlfcnUKICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwogCiAg
ICAgICAgIHNpemUgPSBvcC0+dS5nZXRfbmV4dF92YXJpYWJsZV9uYW1lLnNpemU7Ci0gICAgICAg
IG5hbWUucmF3ID0geG1hbGxvY19ieXRlcyhzaXplKTsKKyAgICAgICAgbmFtZS5yYXcgPSB4emFs
bG9jX2J5dGVzKHNpemUpOwogICAgICAgICBpZiAoICFuYW1lLnJhdyApCiAgICAgICAgICAgICBy
ZXR1cm4gLUVOT01FTTsKICAgICAgICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QobmFtZS5yYXcsIG9w
LT51LmdldF9uZXh0X3ZhcmlhYmxlX25hbWUubmFtZSwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
