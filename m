Return-Path: <SRS0=1L59=T6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CD5C28CC0
	for <xen-devel@archiver.kernel.org>; Thu, 30 May 2019 09:36:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05AE425651
	for <xen-devel@archiver.kernel.org>; Thu, 30 May 2019 09:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05AE425651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxnavi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWHTy-0006aD-Be; Thu, 30 May 2019 09:36:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8x6=T6=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hWHTw-0006a1-MA
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 09:36:20 +0000
X-Inumbo-ID: 601320f5-82be-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 601320f5-82be-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 09:36:19 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 30 May
 2019 17:34:05 +0800
To: George Dunlap <George.Dunlap@citrix.com>
References: <b58d05ded93cd0f64c6278b091fdeb79@sslemail.net>
 <BBCA5C60-5657-47B6-8B7B-B1206AFA2561@citrix.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <e0297fad-f05e-5a75-c958-7e7bb78e28a6@mxnavi.com>
Date: Thu, 30 May 2019 17:36:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BBCA5C60-5657-47B6-8B7B-B1206AFA2561@citrix.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen: 'keyhandler' is not used in null
 scheduler
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190530093615.N8IWb2i94q9gNPGjLib_OVzdXBvY9NI9-V5mEX1HarY@z>

SGVsbG8gR2VvcmdlLAoKT24gNS8zMC8xOSAxNzowNSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4g
T24gTWF5IDMwLCAyMDE5LCBhdCA2OjQ3IEFNLCBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25nQG14
bmF2aS5jb20+IHdyb3RlOgo+Pgo+PiBTbyByZW1vdmUgJ2tleWhhbmRsZXIuaCcgaW5jbHVkZS4K
Pj4gQWxzbyBhZGQgJ3N0YXRpYycgcHJlZml4IGZvciAnc2NodWRfYnVsbF9kZWYnCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4KPiBUaGFu
a3MgZm9yIHRoZSBwYXRjaCDigJQgdGhlc2UgY2hhbmdlcyBsb29rIGdvb2QuICBJIHRoaW5rIHRo
ZSB0aXRsZSB3b3VsZCBiZSBiZXR0ZXIgc29tZXRoaW5nIGxpa2U6Cj4KPiB4ZW4vc2NoZWRfbnVs
bDogU3VwZXJmaWNpYWwgY2xlYW4tdXBzCj4KPiBUaGVuIGp1c3QgbGlzdCBib3RoIGluIGJ1bGxl
dCBwb2ludHM7IHNvbWV0aGluZyBsaWtlOgo+Cj4gKiBSZW1vdmUgdW51c2VkIGRlcGVuZGVuY3kg
4oCYa2V5aGFuZGxlci7igJloCj4gKiBNYWtlIHNjaGVkX251bGxfZGVmIHN0YXRpYwo+Cj4gV291
bGQgeW91IG1pbmQgcmUtc2VuZGluZyB0aGUgcGF0Y2g/ICBZb3UgY2FuIGFkZDoKPgo+IFJldmll
d2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+ClRoYW5rcyBm
b3IgeW91ciByZXZpZXcsIHJlc2VudC4KPiBUaGFua3MsCj4gICAtR2VvcmdlCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
