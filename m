Return-Path: <SRS0=O6u+=2A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999C3C43603
	for <xen-devel@archiver.kernel.org>; Tue, 10 Dec 2019 09:57:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70AD920409
	for <xen-devel@archiver.kernel.org>; Tue, 10 Dec 2019 09:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70AD920409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecGb-0004Z2-Rr; Tue, 10 Dec 2019 09:57:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iecGZ-0004Yq-P8
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 09:57:15 +0000
X-Inumbo-ID: 710ad196-1b33-11ea-8910-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 710ad196-1b33-11ea-8910-12813bfff9fa;
 Tue, 10 Dec 2019 09:57:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B417BABD6;
 Tue, 10 Dec 2019 09:57:13 +0000 (UTC)
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
References: <20191208100713.19559-1-rcojocaru@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <99188936-c5d5-de5c-2f2b-650170944f2b@suse.com>
Date: Tue, 10 Dec 2019 10:57:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191208100713.19559-1-rcojocaru@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] Remove myself as vm_event maintainer
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, mdontu@bitdefender.com,
 ian.jackson@eu.citrix.com, tamas@tklengyel.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTIuMjAxOSAxMTowNywgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IC0tLQo+ICBNQUlO
VEFJTkVSUyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggOWM4MjdhZDc1OS4uMDEy
Yzg0N2ViZCAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4g
QEAgLTQyOCw3ICs0MjgsNiBAQCBMOgl4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiAg
RjoJdW5tb2RpZmllZF9kcml2ZXJzL2xpbnV4LTIuNi8KPiAgCj4gIFZNIEVWRU5ULCBNRU0gQUND
RVNTIGFuZCBNT05JVE9SCj4gLU06CVJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVu
ZGVyLmNvbT4KPiAgTToJVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+ICBS
OglBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KPiAgUjoJUGV0cmUg
UGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KCk5vIG1hdHRlciB0aGUgY29u
dGVudHMsIEkgZ3Vlc3MgdGhpcyBzdGlsbCBuZWVkcyBhbiBTLW8tYiBvZiB5b3Vycy4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
