Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B77C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 21:24:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58A54206A3
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 21:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58A54206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK8KU-0006N4-Ib; Fri, 26 Apr 2019 21:24:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK8KT-0006Mp-Et
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 21:24:21 +0000
X-Inumbo-ID: a7937d12-6869-11e9-8166-1b2ef887d252
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a7937d12-6869-11e9-8166-1b2ef887d252;
 Fri, 26 Apr 2019 21:24:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B095A78;
 Fri, 26 Apr 2019 14:24:20 -0700 (PDT)
Received: from [10.37.8.211] (unknown [10.37.8.211])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 765DB3F557;
 Fri, 26 Apr 2019 14:24:19 -0700 (PDT)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
 <20190426164002.22381-15-ian.jackson@eu.citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fb17e257-83b0-ae65-4a47-d3c10d47b1d1@arm.com>
Date: Fri, 26 Apr 2019 22:24:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426164002.22381-15-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 14/15] cross builds: Build armhf
 kernels on amd64 hosts
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426212417.BkeYQMM8LLQZ43JOVWpkUN7cVsGEDVPJohb_hjw0AUA@z>

SGkgSWFuLAoKT24gNC8yNi8xOSA1OjQwIFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPiBPdXIgYXJt
aGYgaG9zdHMgYXJlIGRldmJvYXJkcyBhbmQgdmVyeSBzbG93LCBhcyB3ZWxsIGFzIHNjYXJjZS4g
IEl0Cj4gNXRha2VzIDE3a3Mgb3Igc28gZm9yIGEga2VybmVsIGJ1aWxkLiAgVGhpcyB3aWxsIGdv
ICptdWNoKiBmYXN0ZXIgb24KCk5JVDogcy81dGFrZXMvdGFrZXMvCgo+IGFuIGFtZDY0IGJveCBh
bmQgd2UgaGF2ZSBsb3RzIG9mIHRob3NlIHRvby4KPiAKPiBzdGFuZGFsb25lLWdlbmVyYXRlLWR1
bXAtZmxpZ2h0LXJ1bnZhcnMgc2hvd3MgdGhhdCB0aGUgb25seSBjaGFuZ2UgaXMKPiB0byBjaGFu
Z2UgaG9zdF9hcmNoIGZyb20gYXJtaGYgdG8gYW1kNjQgaW4gYnVpbGQtYXJtaGYtcHZvcHMgam9i
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDQzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKRldJVzoKCkFja2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKPiAtLS0KPiAgIG1maS1jb21t
b24gfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvbWZpLWNvbW1vbiBiL21maS1jb21tb24KPiBpbmRleCA3YjVj
ODk0Zi4uMzBmMjY5MmQgMTAwNjQ0Cj4gLS0tIGEvbWZpLWNvbW1vbgo+ICsrKyBiL21maS1jb21t
b24KPiBAQCAtNDI0LDcgKzQyNCw3IEBAIGNyZWF0ZV9idWlsZF9qb2JzICgpIHsKPiAgICAgICBm
aQo+ICAgCj4gICAgICAgam9iX2NyZWF0ZV9idWlsZF9jcm9zc2FibGUgYnVpbGQtJGFyY2gtcHZv
cHMgYnVpbGQta2VybiAkYXJjaCAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAgICAgIC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gKyAgICAgICAgICAgICAgICBhcm1oZiBhbWQ2NCAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICAgIGtjb25maWdob3c9
eGVuLWVuYWJsZS14ZW4tY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAg
ICAgICAgICAgICAgICAgJFJVTlZBUlMgJEJVSUxEX1JVTlZBUlMgJEJVSUxEX0xJTlVYX1JVTlZB
UlMgJGFyY2hfcnVudmFycyAgIFwKPiAgICAgICAgICAgICAgICAgICAkaG9zdG9zX3J1bnZhcnMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IAoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
