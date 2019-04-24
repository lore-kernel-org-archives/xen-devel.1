Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D39C282CE
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 10:47:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DA7721773
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 10:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DA7721773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJFQj-0001zM-RT; Wed, 24 Apr 2019 10:47:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJFQi-0001zH-TG
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 10:47:08 +0000
X-Inumbo-ID: 4e1d5e8e-667e-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4e1d5e8e-667e-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 10:47:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38541A78;
 Wed, 24 Apr 2019 03:47:07 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41C153F5AF;
 Wed, 24 Apr 2019 03:47:06 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190422164106.20331-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904231709250.24598@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d664ac40-a4aa-9967-8534-ea722f8e0724@arm.com>
Date: Wed, 24 Apr 2019 11:47:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904231709250.24598@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Allow cleaning the directory even
 when CONFIG_EARLY_PRINTK is set
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
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com,
 jbeulich@suse.com, Andrew.Cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424104704.r69a93OthiiJvzSTBwCbyEAB0fiEPwXeHKaF_BCKfYw@z>

SGksCgpPbiAyNC8wNC8yMDE5IDAxOjIwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
TW9uLCAyMiBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBDT05GSUdfRUFSTFlfUFJJ
TlRLIGNhbiBvbmx5IGJlIHNldCB3aGVuIENPTkZJR19ERUJVRyBpcyBlbmFibGVkLiBJdCBjYW4K
Pj4gYmUgcXVpdGUgY29udmVuaWVudCB0byBvbmx5IG1vZGlmeSB0aGUgdGFyZ2V0Lgo+Pgo+PiBI
b3dldmVyLCB0aGUgdGFyZ2V0IGNsZWFuIHdpbGwgbm90IGluY2x1ZGUgdGhlIC5jb25maWcuCj4+
Cj4+IFRoaXMgbWVhbnMgQ09ORklHX0RFQlVHIGlzIG5vdCBlbmFibGVkIGFuZCB0aGVyZWZvcmUg
bWFrZSB3aWxsIHRocm93Cj4+IGFuIGVycm9yIHByZXZlbnRpbmcgY2xlYW4gdG8gY29udGludWUu
Cj4+Cj4+IFRoZSBjaGVjayBpcyBub3QgbW92ZWQgYXQgbGlua2luZyB0aW1lLgo+ICAgICAgICAg
ICAgICAgICBeIG5vdyA/Cj4gCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Cj4+Cj4+IC0tLQo+Pgo+PiBUaGlzIGNvZGUgaXMgcHJldHR5IG5h
c3R5LCBidXQgSSBoYXZlbid0IGZvdW5kIGEgYmV0dGVyIHdheSBmb3IgYXZvaWRpbmcKPj4gdG8g
Y2hlY2sgaWYgQ09ORklHX0RFQlVHIGlzIGVuYWJsZWQgd2hlbiB0aGUgdGFyZ2V0IGNsZWFuIGlz
IGNhbGxlZC4KPj4KPj4gSWRlYWxseSB3ZSB3aWxsIHdhbnQgdG8gbW92ZSBDT05GSUdfRUFSTFlf
UFJJTlRLIGluIEtjb25maWcuIEkgaGF2ZW4ndAo+PiBoYWQgdGltZSB5ZXQgdG8gbG9vayBhdCBp
dCBwcm9wZXJseSBzbyBmYXIuCj4gCj4gQ2FuIHdlIGluY2x1ZGUgLmNvbmZpZyBpbiB0aGUgY2xl
YW4gdGFyZ2V0PwpJIGRpZCBvbmx5IG1lbnRpb24gdGhlIGNsZWFuIHRhcmdldCBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UgYnV0IHRoZSBpc3N1ZSBpcyB0aGUgCnNhbWUgZm9yIGFueSB0YXJnZXQgbm90
IGluY2x1ZGUgLmNvbmZpZy4gRm9yIGluc3RhbmNlLCBhIGRpc3RjbGVhbiByZXN1bHRzIHRvIAp0
aGUgc2FtZSBlcnJvci4KCkl0IGFsc28gZmVlbHMgcXVpdGUgd3JvbmcgdG8gZXhwZWN0IHRoZSAu
Y29uZmlnIHRvIGJlIGluIHBsYWNlIGZvciBhbnkgdGFyZ2V0IApvdGhlciB0aGFuIGJ1aWxkLgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
