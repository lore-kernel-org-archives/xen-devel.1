Return-Path: <SRS0=VluW=XT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B849C432C1
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 14:43:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 057B720640
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 14:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 057B720640
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCm2R-0001sZ-8T; Tue, 24 Sep 2019 14:43:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCm2Q-0001sE-8Q
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:43:34 +0000
X-Inumbo-ID: ae93ef02-ded9-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ae93ef02-ded9-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 14:43:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AF054AC93;
 Tue, 24 Sep 2019 14:43:32 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190924143515.8810-1-julien.grall@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <43c10068-99d6-656e-50db-ab1aeae21f78@suse.com>
Date: Tue, 24 Sep 2019 16:43:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924143515.8810-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 0/2] Errata implementation and
 doc update
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTY6MzUsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBhbGwsCj4gCj4gVGhl
IHR3byBwYXRjaGVzIGFyZSBub3QgcmVsYXRlZCBidXQgdGhlIHNlY29uZCBvbmUgZGVwZW5kZW5k
cyBvbiB0aGUgZmlyc3QKPiBvbmUuIFNvIEkgZGVjaWRlZCB0byBtZXJnZSB0aGVtIHRvZ2V0aGVy
Lgo+IAo+IENoZWVycywKPiAKPiBKdWxpZW4gR3JhbGwgKDIpOgo+ICAgIHhlbi9hcm06IEltcGxl
bWVudCB3b3JrYXJvdW5kIGZvciBDb3J0ZXggQS01NyBhbmQgQ29ydGV4IEE3MiBBVAo+ICAgICAg
c3BlY3VsYXRlCj4gICAgZG9jczogUmVwbGFjZSBhbGwgaW5zdGFuY2Ugb2YgQVJNIGJ5IEFybQoK
Rm9yIHRoZSBzZXJpZXM6CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
