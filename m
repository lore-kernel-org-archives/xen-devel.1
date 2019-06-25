Return-Path: <SRS0=P3Gq=UY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BC0C48BD5
	for <xen-devel@archiver.kernel.org>; Tue, 25 Jun 2019 10:13:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F4F620644
	for <xen-devel@archiver.kernel.org>; Tue, 25 Jun 2019 10:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F4F620644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfiRU-0005sx-0P; Tue, 25 Jun 2019 10:12:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HbZU=UY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hfiRS-0005ss-PH
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 10:12:46 +0000
X-Inumbo-ID: c6b9d0e9-9731-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c6b9d0e9-9731-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 10:12:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 439FD360;
 Tue, 25 Jun 2019 03:12:45 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F54D3F71E;
 Tue, 25 Jun 2019 03:12:44 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <a6616d8c-af45-c3d7-24e7-f4b513fdc008@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d971f90d-e241-f530-79f6-a7765469f20f@arm.com>
Date: Tue, 25 Jun 2019 11:12:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <a6616d8c-af45-c3d7-24e7-f4b513fdc008@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] UBSAN report in find_next_bit()
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
 George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMjQvMDYvMjAxOSAxNzoyNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBB
Uk02NCdzIGZpbmRfbmV4dF9iaXQoKSBleHBsaWNpdGx5IGNvcGVzIHdpdGggb2Zmc2V0ID49IHNp
emUsIGFuZCB3aGlsZQo+IEkgZG9uJ3Qgc3BlYWsgQVJNIGFzbSB3ZWxsIGVub3VnaCB0byB3b3Jr
IG91dCB3aGV0aGVyCj4gX2ZpbmRfZmlyc3RfYml0X2xlKCkgY29wZXMgd2l0aCBvZmZzZXQgPT0g
c2l6ZSwgdGhlIHZnaWMuYyBjb2RlCj4gZGVmaW5pdGVseSBleHBlY3RzIGl0IHRvIGZ1bmN0aW9u
IGluIHRoaXMgd2F5LgoKSSBsb29rZWQgYXQgdGhlIGluc3RhbmNlIG9mIGZpbmRfKiBpbiBhcmNo
L2FybS92Z2ljLmMuIEFGQUlDVCwgYWxsIG9mIHRoZW0gd2lsbCAKYWx3YXlzIGJlIGNhbGxlZCB3
aXRoIG9mZnNldCA8IHNpemUuIENvdWxkIHlvdSBwb2ludCB3aGljaCBvbmUgeW91IHRoaW5rIHdp
bGwgCnJlbGllcyBvbiBvZmZzZXQgPT0gc2l6ZT8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
