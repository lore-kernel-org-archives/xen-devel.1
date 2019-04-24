Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69639C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 20:19:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FE4B206BA
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 20:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FE4B206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJOM6-0007r3-Vj; Wed, 24 Apr 2019 20:18:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJOM5-0007qx-Bf
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 20:18:57 +0000
X-Inumbo-ID: 2fe27c3e-66ce-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 2fe27c3e-66ce-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 20:18:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 442E3374;
 Wed, 24 Apr 2019 13:18:56 -0700 (PDT)
Received: from [10.37.9.114] (unknown [10.37.9.114])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88F103F557;
 Wed, 24 Apr 2019 13:18:53 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <JBeulich@suse.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-2-julien.grall@arm.com>
 <5C9C9A22020000780022265A@prv1-mh.provo.novell.com>
 <25c9291b-51dc-e45c-2fc7-b6d6c89f05b8@arm.com>
 <5C9DEFFA0200007800222BF1@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1904191145530.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cde7bb60-417f-d70f-b8b4-94f4bfcdc1ed@arm.com>
Date: Wed, 24 Apr 2019 21:18:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904191145530.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 01/12] xen: clang: Support correctly
 cross-compile
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
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424201851.NNpPE2iNHLYJny52SCGo15mNUdqwit7nD1ulLc7aPYw@z>

SGksCgpPbiA0LzE5LzE5IDc6NDcgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBG
cmksIDI5IE1hciAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjkuMDMuMTkgYXQg
MTA6NDEsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBPbiAyOC8wMy8yMDE5IDA5
OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyNy4wMy4xOSBhdCAxOTo0NSwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+Pj4gQ2xhbmcgdXNlcyAiLXRhcmdldCIgb3B0
aW9uIGZvciBjcm9zcy1jb21waWxhdGlvbi4KPj4+Pgo+Pj4+PiAtLS0gYS9jb25maWcvU3RkR05V
Lm1rCj4+Pj4+ICsrKyBiL2NvbmZpZy9TdGRHTlUubWsKPj4+Pj4gQEAgLTEsOCArMSwxMyBAQAo+
Pj4+PiAgICBBUyAgICAgICAgID0gJChDUk9TU19DT01QSUxFKWFzCj4+Pj4+ICAgIExEICAgICAg
ICAgPSAkKENST1NTX0NPTVBJTEUpbGQKPj4+Pj4gICAgaWZlcSAoJChjbGFuZykseSkKPj4+Pj4g
LUNDICAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpY2xhbmcKPj4+Pj4gLUNYWCAgICAgICAgPSAk
KENST1NTX0NPTVBJTEUpY2xhbmcrKwo+Pj4+PiAraWZuZXEgKCQoQ1JPU1NfQ09NUElMRSksKQo+
Pj4+PiArQ0MgICAgICAgICA9IGNsYW5nIC10YXJnZXQgJChDUk9TU19DT01QSUxFOi09KQo+Pj4+
PiArQ1hYICAgICAgICA9IGNsYW5nKysgLXRhcmdldCAkKENST1NTX0NPTVBJTEU6LT0pCj4+Pj4K
Pj4+PiBJcyBkcm9wcGluZyBkYXNoZXMgZnJvbSB0aGUgdmFyaWFibGUgdW5pZm9ybWx5IGNvcnJl
Y3Q/IElmIHNvLAo+Pj4+IGNvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSBpbiB0aGUgY29tbWl0IG1l
c3NhZ2Ugd2h5IHRoYXQgaXM/Cj4+PiBUaGUgdGFyZ2V0IG9wdGlvbiByZXF1aXJlcyB0aGUgZm9s
bG93aW5nIGZvcm1hdDoKPj4+Cj4+PiA8YXJjaD48c3ViPi08dmVuZG9yPi08c3lzPi08YWJpPgo+
Pj4KPj4+IEluIG90aGVyIHBsYWNlcywgd2UgbmVlZCB0aGUgdHJhaWxpbmcgZGFzaCBhcyBHTlUg
dG9vbHMgYXJlIHVzaW5nIHRoZSBzYW1lCj4+PiBmb3JtYXQgYXMgYWJvdmUgd2l0aCBhIGRhc2gg
dG8gc2VwYXJhdGUgdGhlIHRvb2wgbmFtZS4KPj4KPj4gT2gsIEknbSBzb3JyeSAtIEkga2VlcCBm
b3JnZXR0aW5nIHRoYXQgdGhlIHN1YnN0aXR1dGlvbiBmb3JtIHlvdQo+PiB1c2Ugb25seSBmaWRk
bGVzIHdpdGggdHJhaWxpbmcgZGFzaGVzLiBPZiBjb3Vyc2UgSSB3b24ndCBpbnNpc3QsIGJ1dAo+
PiBJJ2QgcHJlZmVyIHRoZSBtb3JlIG9idmlvdXMgJChwYXRzdWJzdCAlLSwlLCQoQ1JPU1NfQ09N
UElMRSkpCj4+IHRvIGJlIHVzZWQgaW5zdGVhZCwgZGVzcGl0ZSByZWFsaXppbmcgdGhhdCBpdCdz
IG1lYW5pbmdmdWxseSBsb25nZXIuCj4gCj4gRWl0aGVyIHdheSB0byBkbyB2YXJpYWJsZSBtYW5p
cHVsYXRpb24gaXMgT0ssIGJ1dCBpdCB3b3VsZCBiZSBnb29kIHRvCj4gYWRkIEp1bGllbidzIGV4
cGxhbmF0aW9uIG9mIHRoZSAtdGFyZ2V0IGV4cGVjdGVkIGZvcm1hdCBpbiB0aGUgY29tbWl0Cj4g
bWVzc2FnZS4gSSBkb24ndCBoYXZlIGFueSBvdGhlciBjb21tZW50cyBvbiB0aGlzIHBhdGNoLgoK
Tm90IGV2ZW4gcmVnYXJkaW5nIDxiNDQwNWNhZi02YjA2LTYwNjYtOGY0OC1mMzViYTY3YmJkZDJA
YXJtLmNvbT4/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
