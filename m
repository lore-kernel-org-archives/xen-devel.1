Return-Path: <SRS0=LPZd=2H=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7D7C43603
	for <xen-devel@archiver.kernel.org>; Tue, 17 Dec 2019 16:17:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98CFD21582
	for <xen-devel@archiver.kernel.org>; Tue, 17 Dec 2019 16:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98CFD21582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihFXV-0007q0-Kz; Tue, 17 Dec 2019 16:17:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fMX9=2H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihFXU-0007pt-9c
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:17:36 +0000
X-Inumbo-ID: b785a8f2-20e8-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b785a8f2-20e8-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 16:17:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE895B217;
 Tue, 17 Dec 2019 16:17:26 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe06b109-7a64-a4f1-f8a8-b436b04a6ac1@suse.com>
Date: Tue, 17 Dec 2019 17:17:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191213190436.24475-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/6] x86/suspend: State cleanup
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAyMDowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBBbmRyZXcgQ29vcGVy
ICg2KToKPiAgIHg4Ni9zdXNwZW5kOiBDbGFyaWZ5IGFuZCBpbXByb3ZlIHRoZSBiZWhhdmlvdXIg
b2YgZG9fc3VzcGVuZF9sb3dsZXZlbCgpCj4gICB4ODYvc3VzcGVuZDogRG9uJ3QgYm90aGVyIHNh
dmluZyAlY3IzLCAlc3Mgb3IgZmxhZ3MKPiAgIHg4Ni9zdXNwZW5kOiBEb24ndCBzYXZlIHVubmVj
ZXNzYXJ5IEdQUnMKPiAgIHg4Ni9zdXNwZW5kOiBSZXN0b3JlIGNyNCBsYXRlciBkdXJpbmcgcmVz
dW1lCj4gICB4ODYvc3VzcGVuZDogRXhwYW5kIG1hY3JvcyBpbiB3YWtldXBfcHJvdC5TCj4gICB4
ODYvc3VzcGVuZDogRHJvcCBzYXZlX3Jlc3RfcHJvY2Vzc29yX3N0YXRlKCkgY29tcGxldGVseQo+
IAo+ICB4ZW4vYXJjaC94ODYvYWNwaS9zdXNwZW5kLmMgICAgIHwgIDU1ICsrLS0tLS0tLS0tLS0t
LS0KPiAgeGVuL2FyY2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUyB8IDEzNiArKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHhlbi9hcmNoL3g4Ni9ib290L3dha2V1cC5T
ICAgICAgfCAgIDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAxNDcg
ZGVsZXRpb25zKC0pCgpCYXNlZCBvbiBSb2dlcidzIHJldmlldwpBY2tlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKT25lIHJlbWFyayBvbiB0aGUgY29tYmluYXRpb24gb2Yg
cGF0Y2hlcyAyIGFuZCA1OiBUaGUgbG9hZGluZyBvZgp0aGUgc3RhY2sgcmVsYXRlZCByZWdpc3Rl
cnMgd291bGQgbm93IHNlZW0gdG8gYmUgYSBmYWlyIGNhbmRpZGF0ZQpmb3IgdXNpbmcgTFNTIChn
ZW5lcmFsbHkgdG8gYmUgcHJlZmVycmVkIG92ZXIgTU9WLXRvLVNTKS4KCkphbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
