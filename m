Return-Path: <SRS0=tVhX=W6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A6CC3A5A2
	for <xen-devel@archiver.kernel.org>; Tue,  3 Sep 2019 10:01:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C21222CF7
	for <xen-devel@archiver.kernel.org>; Tue,  3 Sep 2019 10:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C21222CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i55cD-0000Y8-U9; Tue, 03 Sep 2019 10:00:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i55cC-0000Y3-9r
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 10:00:44 +0000
X-Inumbo-ID: b07fbf98-ce31-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b07fbf98-ce31-11e9-8980-bc764e2007e4;
 Tue, 03 Sep 2019 10:00:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A4006AF37;
 Tue,  3 Sep 2019 10:00:41 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <393f2e3f-d15c-270b-9938-4ebcc251b482@suse.com>
Date: Tue, 3 Sep 2019 12:00:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828080028.18205-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/4] xen: use common output function in
 debugtrace
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDguMjAxOSAxMDowMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUb2RheSBkdW1waW5n
IHRoZSBkZWJ1Z3RyYWNlIGJ1ZmZlcnMgaXMgZG9uZSB2aWEgc2VyY29uX3B1dHMoKSwgd2hpbGUK
PiBkaXJlY3QgcHJpbnRpbmcgb2YgdHJhY2UgZW50cmllcyAoYWZ0ZXIgdG9nZ2xpbmcgb3V0cHV0
IHRvIHRoZSBjb25zb2xlKQo+IGlzIHVzaW5nIHNlcmlhbF9wdXRzKCkuCj4gCj4gVXNlIHNlcmNv
bl9wdXRzKCkgaW4gYm90aCBjYXNlcywgYXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBib3RoIGlz
IG5vdAo+IHJlYWxseSBtYWtpbmcgc2Vuc2UuCgpObyBtYXR0ZXIgdGhhdCBJIGxpa2UgdGhpcyBj
aGFuZ2UsIEknbSBub3QgY29udmluY2VkIGl0J3MgY29ycmVjdDoKVGhlcmUgYXJlIHR3byBkaWZm
ZXJlbmNlcyBiZXR3ZWVuIHRoZSBmdW5jdGlvbnMsIG5laXRoZXIgb2Ygd2hpY2gKSSBjb3VsZCBx
dWFsaWZ5IGFzICJub3QgcmVhbGx5IG1ha2luZyBzZW5zZSI6IFdoeSBpcyBpdCBvYnZpb3VzCnRo
YXQgaXQgbWFrZXMgbm8gc2Vuc2UgZm9yIHRoZSBkZWJ1Z3RyYWNlIG91dHB1dCB0byBieXBhc3Mg
b25lIG9yCmJvdGggb2Ygc2VyaWFsX3N0ZWFsX2ZuKCkgYW5kIHB2X2NvbnNvbGVfcHV0cygpPyBJ
ZiB5b3UncmUKY29udmluY2VkIG9mIHRoaXMsIHBsZWFzZSBwcm92aWRlIHRoZSAid2h5Ii1zIGJl
aGluZCB0aGUgc2VudGVuY2UKYWJvdmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
