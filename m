Return-Path: <SRS0=nxqH=V4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780F5C433FF
	for <xen-devel@archiver.kernel.org>; Wed, 31 Jul 2019 12:05:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FC40206A3
	for <xen-devel@archiver.kernel.org>; Wed, 31 Jul 2019 12:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FC40206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsnMQ-0005at-Sl; Wed, 31 Jul 2019 12:05:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsnMP-0005ao-N8
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 12:05:37 +0000
X-Inumbo-ID: 8130d897-b38b-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 8130d897-b38b-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 12:05:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E29D9344;
 Wed, 31 Jul 2019 05:05:35 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CA8E3F71F;
 Wed, 31 Jul 2019 05:05:34 -0700 (PDT)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5b954e12-0a2e-6cbf-4ead-ad7f84092e4f@arm.com>
Date: Wed, 31 Jul 2019 13:05:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Raspberry Pi 4 support
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
 Jan Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3Rld2FydCwKCk9uIDI5LzA3LzIwMTkgMTQ6MTksIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90
ZToKPiBUaGlzIGlzIGEgc2VyaWVzIHRvIGVuYWJsZSBVQVJUIGNvbnNvbGUgZm9yIFJhc3BiZXJy
eSBQaSA0LiBOb3RlIHRoYXQgSSdtIHJlbHlpbmcgb24gdGhlIGZpcm13YXJlIHRvIGluaXRpYWxp
emUgdGhlIFVBUlQgKGkuZS4gZW5hYmxlX3VhcnQ9MSBpbiBjb25maWcudHh0KSwgc2luY2UgZnVs
bCBVQVJUIGluaXRpYWxpemF0aW9uIG9uIHRoaXMgcGxhdGZvcm0gcmVxdWlyZXMgYWNjZXNzaW5n
IHNvbWUgcmVnaXN0ZXJzIG91dHNpZGUgdGhlIHJhbmdlIHNwZWNpZmllZCBpbiB0aGUgYnJjbSxi
Y20yODM1LWF1eC11YXJ0IG5vZGUuCj4gCj4gSSBoYXZlIGJlZW4gYWJsZSB0byBnZXQgWGVuK2Rv
bTArZG9tVXMgYm9vdGluZy4gVGVzdGVkIHdpdGggWGVuIDQuMTIgYW5kIDQuMTMtdW5zdGFibGUg
KGI0YzhhMjdkNWIpIGFuZCBMaW51eCA0LjE5LnkgKFJhc3BiZXJyeSBQaSBsaW51eCB0cmVlICsg
YSBjb3VwbGUgb2YgcGF0Y2hlcykuIFBsZWFzZSBzZWUgWzFdIGZvciBidWlsZCBpbnN0cnVjdGlv
bnMgYW5kIGxpbWl0YXRpb25zLgo+IAo+IE5ldyBpbiB2MjoKPiAqIERyb3AgZWFybHkgcHJpbnRr
IGFsaWFzCj4gKiBTZXQgcmVnLXNoaWZ0IGFuZCByZWctaW8td2lkdGggaW4gdGhlIFhlbiBkcml2
ZXIKPiAqIEJsYWNrbGlzdCBvdGhlciBhdXggcGVyaXBoZXJhbHMgaW4gcGxhdGZvcm0gc2V0dGlu
Z3MgKHNwaTEsIHNwaTIsIGFuZCBhIGNvdXBsZSBvZiBiYXNlIGF1eCByZWdpc3RlcnMpCj4gCj4g
VGhhbmtzLAo+IFN0ZXdhcnQgSGlsZGVicmFuZAo+IERvcm5lcldvcmtzLCBMdGQKPiAKPiBbMV0g
aHR0cHM6Ly9naXRodWIuY29tL2Rvcm5lcndvcmtzL3hlbi1ycGk0LWJ1aWxkZXIKPiAKPiBTdGV3
YXJ0IEhpbGRlYnJhbmQgKDIpOgo+ICAgIG5zMTY1NTA6IEFkZCBjb21wYXRpYmxlIHN0cmluZyBm
b3IgUmFzcGJlcnJ5IFBpIDQKCkkgaGF2ZSBjb21taXR0ZWQgdGhpcyBwYXRjaC4uLgoKPiAgICB4
ZW4vYXJtOiBwbGF0Zm9ybTogQWRkIFJhc3BiZXJyeSBQaSBwbGF0Zm9ybQouLi4gdGhpcyBvbmUg
bmVlZCBhbiBhbnN3ZXIgcmVnYXJkaW5nIHRoZSBpbXBhY3Qgb24gYmxhY2tsaXN0IHNwaTEgYW5k
IHNwaTIuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
