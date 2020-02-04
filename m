Return-Path: <SRS0=o/65=3Y=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB9EC2D0B1
	for <xen-devel@archiver.kernel.org>; Tue,  4 Feb 2020 12:37:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 639062087E
	for <xen-devel@archiver.kernel.org>; Tue,  4 Feb 2020 12:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 639062087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyxRg-0001KN-Ji; Tue, 04 Feb 2020 12:36:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyxRe-0001KI-Vz
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 12:36:47 +0000
X-Inumbo-ID: 01484dfe-474b-11ea-8f2f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01484dfe-474b-11ea-8f2f-12813bfff9fa;
 Tue, 04 Feb 2020 12:36:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 241FBAD48;
 Tue,  4 Feb 2020 12:36:45 +0000 (UTC)
To: Julien Grall <jgrall@amazon.com>
References: <20200204093411.15887-1-julien@xen.org>
 <20200204093411.15887-3-julien@xen.org> <20200204105156.GH4679@Air-de-Roger>
 <58bc6c70-89f5-cdcf-552c-1ea5a3fa5508@xen.org>
 <20200204112807.GK4679@Air-de-Roger>
 <4b5f37a3-b3ac-6a2c-70cc-b7773beea792@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d2287d4-56a1-dcb9-38a3-31d8f66d050c@suse.com>
Date: Tue, 4 Feb 2020 13:36:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <4b5f37a3-b3ac-6a2c-70cc-b7773beea792@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxMjo0NCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFzaWRlIHRoZSBNSVNS
QSwgdGhlcmUgYXJlIHNvbWUgY2FzZXMgd2hlcmUgSSBmZWVsIHRoZSBleHBsaWNpdCAKPiBjb21w
YXJpc29ucyBtYWtlIHNlbnNlLiBCdXQgSSBkb24ndCBoYXZlIGFueSByYXRpb25hbCBmb3IgdGhl
bSBhbmQgdmlldyAKPiB0aGlzIGFzIGEgbWF0dGVyIG9mIHRhc3RlLiBTbyBJIHdvdWxkIGxlYXZl
IGl0IHRvIHRoZSBhdXRob3Igb2YgdGhlIAo+IHBhdGNoIHRoZSBjaG9pY2UuCgpGV0lXLCBJIGRp
c2FncmVlIG9uIHRoaXMgYXNwZWN0LiBDb25zaXN0ZW5jeSBvZiB0aGUgY29kZSBiYXNlCmlzLCBJ
IHRoaW5rLCBtb3JlIGltcG9ydGFudCBhbiBhc3BlY3QuIFllcywgd2UgbGlrZWx5IG5ldmVyCndv
bid0IHJlYWNoIGEgZnVsbHkgY29uc2lzdGVudCBzdGF0ZSwgYXMgZ29hbHMgc2hpZnQsIGJ1dAph
bnl3YXkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
