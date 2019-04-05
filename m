Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BEFC10F00
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:01:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B38B21872
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B38B21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCPOx-0005KE-GY; Fri, 05 Apr 2019 14:01:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NmJK=SH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hCPOw-0005K6-HD
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:01:02 +0000
X-Inumbo-ID: 3ebad9b2-57ab-11e9-b6ef-6f749629179b
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3ebad9b2-57ab-11e9-b6ef-6f749629179b;
 Fri, 05 Apr 2019 14:01:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FE861BF7;
 Fri,  5 Apr 2019 07:01:01 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B68CE3F73D;
 Fri,  5 Apr 2019 07:00:59 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
References: <20190404140410.1156-1-julien.grall@arm.com>
 <5CA6125502000078002249AE@prv1-mh.provo.novell.com>
 <e07f677f-0d8d-7b52-987b-39ea3933444e@arm.com>
 <1fe8d50a-d8b9-148b-ddf4-778cd619ca5a@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b53c9b39-f324-21f9-cbec-57593b256798@arm.com>
Date: Fri, 5 Apr 2019 15:00:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1fe8d50a-d8b9-148b-ddf4-778cd619ca5a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Move xen/lib/x86 under x86
 maintainership
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405140058.Mwwj180k2mwKOQ1yY9eJ4_t4WkLbDOqlP02anN0zimA@z>

CgpPbiAwNC8wNC8yMDE5IDE1OjMzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDA0LzA0LzIw
MTkgMTU6MjAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDA0LzA0LzIwMTkg
MTU6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDQuMDQuMTkgYXQgMTY6MDQsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gQXQgdGhlIG1vbWVudCwgeGVuL2xpYi94
ODYgaXMgY292ZXJlZCBieSB0aGUgIlJFU1QiLiBIb3dldmVyLCB0aGlzIGlzCj4+Pj4geDg2LW9u
bHksIHNvIHRoaXMgY2FuIGZhbGwgdW5kZXIgdGhlIHg4NiBtYWludGFpbmVyc2hpcC4KPj4+Pgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+
Pgo+Pj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+Cj4+PiBU
aGFua3MgZm9yIG5vdGljaW5nLiBXb3VsZCB5b3UgbWluZCBhZGRpbmcgeGVuL2luY2x1ZGUveGVu
L2xpYi94ODYvCj4+PiBhdCB0aGlzIG9jY2FzaW9uIGFzIHdlbGw/Cj4+Cj4+IEkgd2lsbCBkbyBp
dC4gQXJlIHlvdSBoYXBweSBpZiBJIGRvIGl0IG9uIGNvbW1pdD8KPj4KPj4gQEFuZHJldzogTWF5
IEkga2VlcCB5b3VyIHJldmlld2VkLWJ5IHdpdGggdGhpcyBhZGRpdGlvbj8KPiAKPiBZZXMKClRo
YW5rIHlvdSB0byB5b3UgYW5kIEphbiEgSXQgaXMgbm93IGNvbW1pdHRlZC4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
