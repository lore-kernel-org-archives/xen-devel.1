Return-Path: <SRS0=h4f+=V2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C50EC7618B
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jul 2019 13:18:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79A0D2070B
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jul 2019 13:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79A0D2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dornerworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs5Y4-0004Sg-9w; Mon, 29 Jul 2019 13:18:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZKY6=V2=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1hs5Y3-0004Sb-48
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 13:18:43 +0000
X-Inumbo-ID: 617e0887-b203-11e9-8980-bc764e045a96
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 617e0887-b203-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 13:18:42 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Julien Grall <julien.grall@arm.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/2] Raspberry Pi 4 support
Thread-Index: AdVCKTNrhqec33CFSM29ddylSiacxAAJwNIAAO/C4+A=
Date: Mon, 29 Jul 2019 13:19:55 +0000
Message-ID: <9dc0ad87d10b44cb844b5ad1e1ef5646@dornerworks.com>
References: <b947a9eee2bb43d490ddb4f9378f2ff5@dornerworks.com>
 <e85ac1a4-4ef4-3423-35f3-6796f45b72b2@arm.com>
In-Reply-To: <e85ac1a4-4ef4-3423-35f3-6796f45b72b2@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.12.5]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 0/2] Raspberry Pi 4 support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkbmVzZGF5LCBKdWx5IDI0LCAyMDE5IDEwOjQ3IEFNLCBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPkFsc28sIHRoZXJlIGEgZmV3IG90aGVyIGludGVyZXN0
aW5nIHByb2JsZW1zIHdpdGggdGhlIFJQSTQgdGhhdCB3aWxsIG5lZWQgdG8gYmUKPnNvbHZlZDoK
PiAgICAxKSBUaGUgVUFSVCBpcyBzaGFyaW5nIHRoZSBzYW1lIHBhZ2UgYXMgc29tZSBvdGhlciBk
ZXZpY2VzLiBXZSBlaXRoZXIKPm5lZWQKPnRvIGJsYWNrbGlzdCB0aGVtIHNvIHRoZXkgY2FuJ3Qg
YmUgdXNlZCBieSBhIGd1ZXN0IChpbmNsdWRpbmcgRG9tMCksIG9yIHdlCj5uZWVkCj50byB0cmFw
IGFuZCBzYW5pdGl6ZSBhY2Nlc3MuCgpJdCdzIGFsc28gc2hhcmluZyBhbiBJUlEgd2l0aCB0aGUg
b3RoZXIgImF1eCIgcGVyaXBoZXJhbHMuIEkgd2lsbCBzZW5kIGEgcGF0Y2ggdG8gYmxhY2tsaXN0
IGZvciBub3cuCgo+ICAgIDIpIFhlbiBpcyBtYXBwaW5nIG1lbW9yeSB1c2luZyAxR0IgbWFwcGlu
Zy4gQUZBSUssIHRoZXJlIGFyZSAxR0Igc2xvdAo+dGhhdAo+aXMgc2hhcmVkIGJldHdlZW4gUkFN
IGFuZCBNTUlPLiBUaGlzIHdpbGwgcmVzdWx0IHRvIGNhY2hlIGluY29oZXJlbmN5LgoKVGhhbmtz
IGZvciB0aGUgaW5mby4gVGhlcmUgaXMgYWxzbyBhIDFHQiBzbG90IHNoYXJlZCB3aXRoIEdQVSBb
MV0uCgpTdGV3YXJ0IEhpbGRlYnJhbmQKRG9ybmVyV29ya3MsIEx0ZAoKWzFdIGh0dHBzOi8vZ2l0
aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9pc3N1ZXMvMzA5MyNpc3N1ZWNvbW1lbnQtNTE1NDM4
NjI3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
