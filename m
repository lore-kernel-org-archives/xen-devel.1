Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDEDC10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 11:59:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EC0A20879
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 11:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EC0A20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDSvW-0005Y2-Mh; Mon, 08 Apr 2019 11:59:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng3J=SK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDSvV-0005Xx-Et
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 11:59:01 +0000
X-Inumbo-ID: b248767c-59f5-11e9-951c-9f7e5feba007
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b248767c-59f5-11e9-951c-9f7e5feba007;
 Mon, 08 Apr 2019 11:59:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3094915BF;
 Mon,  8 Apr 2019 04:59:00 -0700 (PDT)
Received: from [10.37.12.9] (unknown [10.37.12.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08E0D3F718;
 Mon,  8 Apr 2019 04:58:57 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dd1d63dd-0eda-b66a-fa89-160220e65912@arm.com>
Date: Mon, 8 Apr 2019 12:58:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] memory: restrict
 XENMEM_remove_from_physmap to translated guests
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408115856.szWE13h-7yPaui-pN1x4sxSsvCY3C6EAMtYRiMtdfts@z>

SGkgSmFuLAoKT24gMy81LzE5IDE6MjggUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IEBAIC0yOTgs
NyArMjk4LDcgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX2FkZF90b19waHlzbQo+ICAg
Cj4gICAvKgo+ICAgICogVW5tYXBzIHRoZSBwYWdlIGFwcGVhcmluZyBhdCBhIHBhcnRpY3VsYXIg
R1BGTiBmcm9tIHRoZSBzcGVjaWZpZWQgZ3Vlc3Qncwo+IC0gKiBwc2V1ZG9waHlzaWNhbCBhZGRy
ZXNzIHNwYWNlLgo+ICsgKiBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlICh0cmFuc2xhdGVkIGd1ZXN0
cyBvbmx5KS4KCldoaWxlIHlvdSBtb2RpZnkgdGhlIGNvbW1lbnQsIGNhbiB5b3UgcmVwbGFjZSBH
UEZOIHdpdGggR0ZOPwoKT3RoZXIgdGhhbiB0aGF0OgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcixzCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
