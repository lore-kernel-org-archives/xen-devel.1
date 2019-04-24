Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC77C282E1
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:34:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6BE121773
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6BE121773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJJuv-0008UP-2A; Wed, 24 Apr 2019 15:34:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ea5E=S2=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hJJut-0008UK-N9
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 15:34:35 +0000
X-Inumbo-ID: 754d99c6-66a6-11e9-92d7-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 754d99c6-66a6-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 15:34:33 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 A37253011F2B; Wed, 24 Apr 2019 18:34:32 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 956DC306E477;
 Wed, 24 Apr 2019 18:34:32 +0300 (EEST)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
 <5c0480bb-24bc-81cf-066b-a66b2e83d51f@bitdefender.com>
 <jYLnqeXXkfLqocyaorTwgUHTTQ7AozmbsPb8X4HGvjuGF2shfDIkAw7G363xoRRWmSZShCUqzriK-bBF3S93QKQkXS_9wUFrlKbdjKr6tUM=@protonmail.com>
 <CABfawhmwxVTK4yq88R87JX78ZNiy5WnBjE_SGCSeUyQcBVMr1w@mail.gmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <ddf62960-ba73-63dd-8957-7b0e17efe68c@bitdefender.com>
Date: Wed, 24 Apr 2019 18:34:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawhmwxVTK4yq88R87JX78ZNiy5WnBjE_SGCSeUyQcBVMr1w@mail.gmail.com>
Content-Language: en-US-large
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424153419.MeBBnu-VCJ1dWL6mhjYyTLwQs_zobFbQeLXhXiOnQLc@z>

CgpPbiA0LzI0LzE5IDY6MjUgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiBPbiBNb24sIEFw
ciAyMiwgMjAxOSBhdCA2OjAwIFBNIE1hdGhpZXUgVGFycmFsCj4gPG1hdGhpZXUudGFycmFsQHBy
b3Rvbm1haWwuY29tPiB3cm90ZToKPj4KPj4gT24gTW9uZGF5IDIyIEFwcmlsIDIwMTkgMTE6MjIs
IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+Cj4+
PiBPbiA0LzIyLzE5IDE6MjYgQU0sIE1hdGhpZXUgVGFycmFsIHdyb3RlOgo+Pj4KPj4+PiBUaGUg
cHJvYmxlbSBpcyB0aGF0IFJ0bFVzZXJUaHJlYWRTdGFydCBpcyBwYWdlZC1vdXQsIHNvIGknbSB0
cnlpbmcgdG8gcmVhY2ggaXQgdmlhIHNpbmdsZXN0ZXBwaW5nIGFzIGEgYmFja3VwIHNvbHV0aW9u
Lgo+Pj4KPj4+IEZXSVcsIHlvdSBjYW4ganVzdCB1c2UgeGNfaHZtX2luamVjdF90cmFwKCkgd2l0
aCBhIFRSQVBfcGFnZV9mYXVsdAo+Pj4gcGFyYW1ldGVyIHRvIGNhdXNlIHRoZSBPUyB0byBicmlu
ZyBhIHBhZ2VkIG91dCBwYWdlIGJhY2sgaW50byBtYWluIG1lbW9yeS4KPj4KPj4gVGhlIHByb2Js
ZW0gaXMgdGhhdCBpJ20gZnVsbHkgYmFzZWQgb24gTGliVk1JLCB3aGljaCBkb2Vzbid0IHByb3Zp
ZGUgYW4gQVBJIGZvciBwYWdlIGluamVjdGlvbiB5ZXQuCj4+Cj4+IEkgdGhpbmsgVGFtYXMgd2Fz
IHdhaXRpbmcgZm9yIGEgZnVsbCBzdXBwb3J0IG9mIHBhZ2VmYXVsdCBpbmplY3Rpb24gb24gWGVu
IGJlZm9yZSBvcGVuaW5nIGFuIEFQSS4KPj4KPj4gTWF5YmUgd2Ugc2hvdWxkIG9wZW4gYW4gaXNz
dWUgdG8gdHJhY2sgdGhlIHByb2dyZXNzIGFib3V0IGl0Lgo+Pgo+PiBUaGFua3MgYW55d2F5IGZv
ciB0aGUgc3VnZ2VzdGlvbiAhCj4gCj4gTm90IGhhdmluZyBhIExpYlZNSSB3cmFwcGVyIHNob3Vs
ZCBub3QgcHJldmVudCB5b3UgZnJvbSB1c2luZyBhIGxpYnhjCj4gZnVuY3Rpb24gZGlyZWN0bHku
IFRoZXJlIGFyZSBtYW55IGNvcm5lci1jYXNlcyByZWdhcmRpbmcgd2hlbiBpdCBpcwo+IHNhZmUg
dG8gaW5qZWN0IGEgcGFnZWZhdWx0IGludG8gdGhlIGd1ZXN0IHRvIGJyaW5nIGJhY2sgcGFnZXMg
YW5kIHRoYXQKPiBsb2dpYyBpcyBub3QgdHJpdmlhbCBlbm91Z2ggdG8gYmUgaW1wbGVtZW50ZWQg
aW4gTGliVk1JLiBJdCdzIHdheSB0b28KPiBzcGVjaWZpYyB0byB0aGUgdXNlY2FzZSB0byBkZWNp
ZGUgd2hlbiBpdCdzIHNhZmUgdG8gZG8gdGhhdC4gU28gaW4KPiB0aGlzIGNhc2UsIGlmIHlvdSBr
bm93IHlvdSBhcmUgaW4gcmluZzMgb2YgeW91ciB0YXJnZXQgcHJvY2VzcyB5b3UgY2FuCj4ganVz
dCBjYWxsIHRoZSBsaWJ4YyBmdW5jdGlvbiBkaXJlY3RseS4KClRoYXQncyB2ZXJ5IHZlcnkgdHJ1
ZSwgaG93ZXZlciBJIHRoaW5rIHdlIHNob3VsZCBhc3N1bWUgdGhhdCBsaWJyYXJpZXMgCnN1Y2gg
YXMgbGlidm1pIGFuZCBsaWJiZHZtaSBhcmUgdXNlZCBieSBjbGllbnQgY29kZSBzbWFydCBlbm91
Z2ggdG8gCmZpZ3VyZSBvdXQsIHVzaW5nIHNhaWQgbGlicmFyaWVzLCBlbm91Z2ggdGhpbmdzIGFi
b3V0IHdoYXQncyBhcHByb3ByaWF0ZSAKKG9yIG5vdCkgdG8gZG8sIGFuZCAgbGV0IHRoZW0gZG8g
aXQgcmF0aGVyIHRoYW4gc2Vjb25kLWd1ZXNzIHRoZW0uIApIZW5jZSwgaW4gbGliYmR2bWkgSSd2
ZSB3cmFwcGVkIHRoYXQsIGFuZCBhZGRlZCBhIGNvbW1lbnQgYmFzaWNhbGx5IApzYXlpbmcgd2hh
dCB5b3UncmUgc2F5aW5nIGFib3ZlOgoKaHR0cHM6Ly9naXRodWIuY29tL2JpdGRlZmVuZGVyL2xp
YmJkdm1pL2Jsb2IvbWFzdGVyL3NyYy94ZW5kcml2ZXIuY3BwI0w1NDIKCklmIHdlIGVuZCB1cCBo
YXZpbmcgdGhlIGNsaWVudCBjb2RlIGNhbGwgYmFja2VuZC1zcGVjaWZpYyBjb2RlIGRpcmVjdGx5
IAp3ZSdyZSBub3QsIGFmdGVyIGFsbCwgcmVhbGx5IGFic3RyYWN0aW5nIGl0IHdpdGggb3VyIHdy
YXBwZXIgbGlicmFyaWVzLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
