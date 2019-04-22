Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F352C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 10:29:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E73CB2075A
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 10:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E73CB2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIWBu-0008Hu-4y; Mon, 22 Apr 2019 10:28:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ejE3=SY=citrix.com=prvs=008c59ab4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hIWBt-0008Hp-DF
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 10:28:49 +0000
X-Inumbo-ID: 66929786-64e9-11e9-94dd-b3fa1d85c36b
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66929786-64e9-11e9-94dd-b3fa1d85c36b;
 Mon, 22 Apr 2019 10:28:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,381,1549929600"; d="scan'208";a="89117096"
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a04c5946-8c2a-72bd-0011-3cb53fd927be@citrix.com>
Date: Mon, 22 Apr 2019 11:28:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] VMI: singlestep event not received
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422102804.k9pAK_4_vwjQ_aZQt9P7pzr5UiKRM0tZmlbsQAWbJQg@z>

T24gMjEvMDQvMjAxOSAyMzoyNiwgTWF0aGlldSBUYXJyYWwgd3JvdGU6CgpBbnN3ZXJpbmcgb3V0
IG9mIG9yZGVyLgoKPiBJIGRpc2N1c3NlZCB0aGlzIGJ1ZyBvbiBJUkMgd2l0aCBhbmR5aHBwLCB3
aG8gY29udmluY2VkIG1lIHRvIG1vdmUgdGhlIGRpc2N1c3Npb24gb24gdGhlIG1haWxpbmcgbGlz
dC4KPiBBcHBhcmVudGx5IHRoZSBzaW5nbGVzdGVwcGluZyBpbiBYZW4gd2FzIGluIGEgcG9vciBx
dWFsaXR5IHN0YXRlIGJlY2F1c2Ugb2YgbXVsdGlwbGUgbGF5ZXJzIG9mIHJlZmFjdG9yaW5nLgoK
V2hhdCBJIHNhaWQgd2FzIHRoYXQgeDg2IGlzIGEgY29tcGxldGUgbWVzcy7CoCBWYXJpb3VzIGFz
cGVjdHMgb2YgZGVidWcKYmVoYXZpb3VyIGFyZW4ndCBldmVuIGRvY3VtZW50ZWQsIGFuZCBoYXZl
IGhhZCB0byBiZSByZXZlcnNlZCBlbmdpbmVlcmVkCmFmdGVyIGZpbmRpbmcgc2VjdXJpdHkgdnVs
bmVyYWJpbGl0aWVzIHdpdGggaG93IHNvZnR3YXJlIGhhbmRsZXMgdGhlbQooY2F1c2VkIGJ5IGEg
bGFjayBvZiBkb2N1bWVudGF0aW9uKS4KCj4gSSdtIHJ1bm5pbmcgb24gWGVuIHBhY2thZ2VkIGJ5
IEZlZG9yYSAyOTogNC4xMS4xLCBpbiBhIG5lc3RlZCB2aXJ0IGVudmlyb25tZW50IG9uIHRvcCBv
ZiBLVk0uCgpJIGRpZG4ndCByZWFsaXNlIHlvdSB3ZXJlIG5lc3RlZCBvbiB0b3Agb2YgS1ZNLsKg
IFRoYXQgZGVmaW5pdGVseSBpc24ndApoZWxwaW5nIHRoaW5ncywgYW5kIHRoZXJlIGlzIGFuIGVx
dWFsIGNoYW5jZSB0aGF0IHlvdSd2ZSBoaXQgYSBuZXN0ZWQKdmlydCBidWcgaW4gS1ZNLgoKUGxl
YXNlIHRyeSBhbmQgcmVwcm9kdWNlIGl0IHdpdGhvdXQgS1ZNLCB0byBydWxlIG91dCBzb21lIG9m
IHRoZSBjb21wbGV4aXR5LgoKPiBUaGUgZnVubnkgdGhpbmcgaXMgdGhhdCBpdCdzIGFsd2F5cyBh
dCB0aGUgc2FtZSBpbnN0cnVjdGlvbiB0aGF0IGl0IGZhaWxzLCB0aGUgMTA2dGggc2luZ2xlc3Rl
cCwKPiBhdCAweDgwNmQzMmRjOgo+Cj4gWzB4N2M5MGU1MTRdPiBzIDB4ODA2ZDMyZGMKPiBbMHg4
MDZkMzJkY10+IHBkIDEwCj4gICAgICAgICAgICAgMHg4MDZkMzJkYyAgICAgIDg5MGQ4MDAwZmVm
ZiAgIG1vdiBkd29yZCBbMHhmZmZlMDA4MF0sIGVjeAoKVGhpcyBpcyBhIHJlYWQgb2YgdGhlIEFQ
SUMgVFBSLCB3aGljaCBpcyB2ZXJ5IGNvbW1vbmx5IGFuIG9wZXJhdGlvbgphY2NlbGVyYXRlZCBi
eSBoYXJkd2FyZSAoYmVjYXVzZSB3aXRob3V0IGl0LCB2aXJ0dWFsaXNpbmcgd2luZG93cyBYUCBp
cwpleGNlZWRpbmdseSBzbG93KS4KCldoYXQgaXMgeW91ciBDUFUsIGFuZCBob3cgZXhhY3RseSBh
cmUgeW91IHRyeWluZyB0byBzaW5nbGVzdGVwLsKgIElzIGl0CndpdGggTVRGLCBvciB1c2luZyB0
aGUgdHJhcCBmbGFnIGluc2lkZSB0aGUgZ3Vlc3Q/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
