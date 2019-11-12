Return-Path: <SRS0=/kPz=ZE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCBEC43331
	for <xen-devel@archiver.kernel.org>; Tue, 12 Nov 2019 14:45:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CDCD20679
	for <xen-devel@archiver.kernel.org>; Tue, 12 Nov 2019 14:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CDCD20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUXPt-0002Hh-J3; Tue, 12 Nov 2019 14:45:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ifzZ=ZE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iUXPs-0002Hc-Ll
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 14:45:12 +0000
X-Inumbo-ID: 074298b8-055b-11ea-a21d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 074298b8-055b-11ea-a21d-12813bfff9fa;
 Tue, 12 Nov 2019 14:45:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8ADF0B131;
 Tue, 12 Nov 2019 14:45:10 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191112141943.245215-1-anthony.perard@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d006b888-f0e4-b1b9-ad2b-e2df1de5467e@suse.com>
Date: Tue, 12 Nov 2019 15:45:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191112141943.245215-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] libxl: Fix
 libxl_retrieve_domain_configuration error path
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
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTEuMTkgMTU6MTksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEZyb206IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBnbWFpbC5jb20+Cj4gCj4gSWYgYW4gZXJyb3Igd2VyZSB0
byBoYXBwZW4gYmVmb3JlIHRoZSBsYXN0IHN0ZXAsIGZvciBleGFtcGxlIHRoZQo+IGRvbWFpbl9j
b25maWd1cmF0aW9uIGlzIG1pc3NpbmcsIHRoZSBlcnJvciB3b3VsZG4ndCBiZSBjaGVjayBieSB0
aGUKPiBfZW5kIGNhbGxiYWNrLgo+IAo+IEZpeCB0aGF0LCBhbHNvIGluaXRpYWxpc2UgYGxvY2sn
IHRvIE5VTEwgYmVjYXVzZSB0aGUgZXhpdCBwYXRoIGNoZWNrcwo+IGl0Lgo+IAo+IFRoZSBpc3N1
ZSBzaG93cyB1cCB3aGVuIHRoZXJlJ3MgYSBzdHViZG9tLCBhbmQgcnVubmluZyBgeGwgbGlzdCAt
bGAKPiBhYm9ydHMuIEluc3RlYWQsIHdpdGggdGhpcyBwYXRjaCwgYHhsIGxpc3QgLWxgIHdpbGwg
bm90IGxpc3Qgc3R1YmRvbSwKPiBwcm9iYWJseSBsaWtlIGJlZm9yZS4KPiAKPiBSZXBvcnRlZC1i
eTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3Ns
YWIuY29tPgo+IEZpeGVzOiA2MTU2MzQxOTI1N2VkNDAyNzg5MzhkYjJjY2U3ZDY5N2FlZDQ0ZjVk
Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
