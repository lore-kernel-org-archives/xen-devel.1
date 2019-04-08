Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56C1C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:47:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD1F120883
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD1F120883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDRoI-0007TE-MA; Mon, 08 Apr 2019 10:47:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng3J=SK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDRoH-0007T9-6b
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:47:29 +0000
X-Inumbo-ID: b3b565ae-59eb-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b3b565ae-59eb-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 10:47:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF83C15AD;
 Mon,  8 Apr 2019 03:47:27 -0700 (PDT)
Received: from [10.37.12.9] (unknown [10.37.12.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95B723F718;
 Mon,  8 Apr 2019 03:47:25 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190307210404.12346-1-volodymyr_babchuk@epam.com>
 <20190307210404.12346-10-volodymyr_babchuk@epam.com>
 <5bfba14c-f7ce-04e5-19da-87d3e566240d@arm.com> <87tvfx8t2a.fsf@epam.com>
 <b096f8cc-4a82-807d-bbd7-43d117e0faa1@arm.com> <87lg198oq1.fsf@epam.com>
 <66bd65d4-1b00-f16f-9df8-f7591157f4b8@arm.com> <87d0m092ap.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3ae72330-47db-2c8c-d777-1aede2608780@arm.com>
Date: Mon, 8 Apr 2019 11:47:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87d0m092ap.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
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
Cc: Wei Liu <wei.liu2@citrix.com>, Volodymyr Babchuk <vlad.babchuk@gmail.com>,
 Achin Gupta <achin.gupta@arm.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408104722.Nk6VMbCkOTwzoO9cczjp9lUPuSt5p7MU0-q39pdCNRI@z>

SGksCgpPbiA0LzUvMTkgMTE6MjUgQU0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IAo+IEhp
IEp1bGllbiwKPiAKPiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBIaSwKPj4KPj4gT24gMjAv
MDMvMjAxOSAxNzowMSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pgo+Pj4gSnVsaWVuIEdy
YWxsIHdyaXRlczoKPj4+Cj4+Pj4gT24gMjAvMDMvMjAxOSAxNToyNywgVm9sb2R5bXlyIEJhYmNo
dWsgd3JvdGU6Cj4+Pj4+Cj4+Pj4+IEhlbGxvIEp1bGllbiwKPj4+Pj4KPj4+Pj4gSnVsaWVuIEdy
YWxsIHdyaXRlczoKPj4+Pj4KPj4+Pj4+IE9uIDA3LzAzLzIwMTkgMjE6MDQsIFZvbG9keW15ciBC
YWJjaHVrIHdyb3RlOgo+Pj4+Pj4+IEZyb206IFZvbG9keW15ciBCYWJjaHVrIDx2bGFkLmJhYmNo
dWtAZ21haWwuY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyBlbnVtZXJhdGlvbiBjb250cm9scyBU
RUUgdHlwZSBmb3IgYSBkb21haW4uIEN1cnJlbnRseSB0aGVyZSBpcwo+Pj4+Pj4+IHR3byBwb3Nz
aWJsZSBvcHRpb25zOiBlaXRoZXIgJ25vbmUnIG9yICduYXRpdmUnLgo+Pj4+Pj4+Cj4+Pj4+Pj4g
J25vbmUnIGlzIHRoZSBkZWZhdWx0IHZhbHVlIGFuZCBpdCBiYXNpY2FsbHkgZGlzYWJsZXMgVEVF
IHN1cHBvcnQgYXQKPj4+Pj4+PiBhbGwuCj4+Pj4+Pj4KPj4+Pj4+PiAnbmF0aXZlJyBlbmFibGVz
IGFjY2VzcyB0byBhICJyZWFsIiBURUUgaW5zdGFsbGVkIG9uIGEgcGxhdGZvcm0uCj4+Pj4+Pgo+
Pj4+Pj4gSSBhbSBhd2FyZSBJIG1hZGUgdGhhdCBzdWdnZXN0aW9uLiBCdXQgSSB0aGluayB0aGUg
bmFtaW5nIGlzIG5vdCBpZGVhbAo+Pj4+Pj4gYmV0d2VlbiB0aGUgdXNlciBhbmQgdGhlIHRvb2xz
dGFjay4gVGhlIHF1ZXN0aW9uIGlzIGhvdyB0aGlzIGlzIGdvaW5nCj4+Pj4+PiB0byBmaXQgd2l0
aCB0aGUgUy1FTDIgZmVhdHVyZSB3aGVyZSBtdWx0aXBsZSBURUUgY2FuIHJ1biB0b2dldGhlcj8K
Pj4+Pj4gWW91IHNlZSwgc3VwcG9ydCBmb3IgUy1FTDIgb3Igc3VwcG9ydCBmb3IgbXVsdGlwbGUg
VEVFcyBpcyBhIG11Y2ggYnJvYWRlcgo+Pj4+PiB0b3BpYy4gRm9yIG1lLCBuYW1pbmcgZm9yIGNv
bmZpZ3VyYXRpb24gb3B0aW9uIGlzIHRoZSBsZWFzdCBpbXBvcnRhbnQKPj4+Pj4gdGhpbmcgaW4g
dGhpcyBjYXNlIDotKQo+Pj4+Cj4+Pj4gTmFtaW5nIGV4cG9zZWQgdG8gdXNlcnMgYXJlIGhhcmQg
dG8gcmVtb3ZlLiBJZiB0aGUgbmFtaW5nIGlzIHRvbwo+Pj4+IGFtYmlndW91cywgdGhlbiB3ZSB3
aWxsIGhhdmUgdG8gaW50cm9kdWNlIGEgbmV3IG9wdGlvbiBsYXRlciBvbi4gVGhpcwo+Pj4+IGlz
IG5vdCB2ZXJ5IGlkZWFsLCBzbyBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgd2UgY2FuIGZpbmQgc29t
ZXRoaW5nCj4+Pj4gZGlmZmVyZW50Lgo+Pj4+Cj4+Pj4+Cj4+Pj4+IFJpZ2h0IHRoZXJlIGlzIG5v
IGNsZWFyIHZpc2lvbiBob3cgaXQgd2lsbCBldmVyIHdvcmsuIEkgc2Nhbm5lZCB0aHJvdWdoCj4+
Pj4+IFNQQ0kgc3BlYyBhbmQgSSBhbHJlYWR5IGhhdmUgYSBjb3VwbGUgb2YgcXVlc3Rpb25zLiBJ
IG5lZWQgdG8gc3R1ZHkgaXQKPj4+Pj4gaGFyZGVyIHRvIG1ha2Ugc2VyaW91cyBzdGF0ZW1lbnRz
LCBidXQgSSBhbHJlYWR5IHNlZSB0aGF0IGN1cnJlbnQKPj4+Pj4gbWVkaWF0b3IgZnJhbWV3b3Jr
IHdpbGwgaGFyZGx5IGZpdCBpbnRvIFNQQ0kgc3R1ZmYuIEZyYW5rbHksIEkgaGF2ZQo+Pj4+PiBj
b25jZXJucyB0aGF0IE9QLVRFRSAob3IgYW55IG90aGVyIGV4aXN0aW5nIFRFRSkgd2lsbCBiZSBj
b21wYXRpYmxlCj4+Pj4+IHdpdGggU1BDSS1lbmFibGVkIHN5c3RlbXMgd2l0aG91dCBtYWpvciBy
ZXdvcmsuIFNvLCB3ZSB3aWxsIG5lZWQgdG8gZG8KPj4+Pj4gYmlnIG92ZXJoYXVsIGFueXdheXMs
IHdoZW4gdGhlcmUgd2lsbCBhcHBlYXIgZmlyc3QgU1BDSS1jb21wYXRpYmxlIFRFRXMgYW5kCj4+
Pj4+IHNlY3VyZSBoeXBlcnZpc29ycy4KPj4+Pj4KPj4+Pj4gQUZBSUssIHRoZXJlIGlzIG5vIEFS
TXY4LjQgcGxhdGZvcm1zLCBubyBTLUVMMiBoeXBlcnZpc29ycyBhbmQgc28gb24uIEl0Cj4+Pj4+
IHdpbGwgdGFrZSBhdCBsZWFzdCBjb3VwbGUgb2YgeWVhcnMgYmVmb3JlIFMtRUwyIHdpbGwgaGl0
IHRoZSBtYXJrZXQuIFNvCj4+Pj4+IGluIG15IG9waW5pb24gaXQgaXMgdG9vIGVhcmx5IHRvIG1h
a2UgYW55IGFzc3VtcHRpb25zIG9uIGhvdyB0byBzdXBwb3J0Cj4+Pj4+IGFsbCB0aGlzIGluIFhl
bi4gTGV0cyBzdGljayB0byB0aGUgY3VycmVudCBtYXR0ZXJzLgo+Pj4+Cj4+Pj4gSSBhbSBmdWxs
eSBhd2FyZSB0aGF0IG1vcmUgd29yayB3aWxsIG5lZWQgdG8gYmUgZG9uZSB3aXRoIFMtRUwyLiBJ
IGFtCj4+Pj4gbm90IGV4cGVjdGluZyB5b3UgKG9yIGFueW9uZSBlbHNlIGhlcmUpIHRvIGNvbWUg
d2l0aCB0aGUKPj4+PiBpbXBsZW1lbnRhdGlvbiBub3cuIE15IHBvaW50IGlzIHRoZSBuYW1pbmcg
c2hvdWxkIGJlIGNob3NlbiBzbyBpdAo+Pj4+IHByZXZlbnRzIGFtYmlndWl0eSB3aXRoIHdoYXRl
dmVyIHdlIGtub3cgd2lsbCBjb21lIHVwIGluIHRoZSBmdXR1cmUuCj4+Pj4KPj4+Pj4KPj4+Pj4g
SSdtIG5vdCBpbnNpc3Rpbmcgb24gIm5hdGl2ZSIuIEJ1dCBJIGNhbid0IGludmVudCBzb21ldGhp
bmcgYmV0dGVyIHJpZ2h0Cj4+Pj4+IG5vdy4gUHJvYmFibHksIFNQQ0ktZW5hYmxlZCBURUUgYWxz
byB3aWxsIGJlIGNvbnNpZGVyZWQgIm5hdGl2ZSIgYXMKPj4+Pj4gb3Bwb3NlZCB0bywgc2F5LCAi
ZW11bGF0ZWQiLiA+Cj4+Pj4+IEFzIEkgc2FpZCwgSSBjYW4ndCBjb21lIHdpdGggYW55dGhpbmcg
YmV0dGVyIHRoYW4gIm5hdGl2ZSIuIEJ1dCBJJ20gb3Blbgo+Pj4+PiB0byBhbnkgc3VnZ2VzdGlv
bnMuCj4+Pj4KPj4+PiBXZWxsIG9uZSBzb2x1dGlvbiBpcyB0byBkaXRjaCAibmF0aXZlIiBhbmQg
bmFtZSBpdCAib3B0ZWUiLiBCeSBnaXZpbmcKPj4+PiB0aGUgbmFtZSB5b3UgYXZvaWQgYW1iaWd1
aXR5LiBJZiB3ZSBldmVyIGhhdmUgbXVsdGlwbGUgb3AtdGVlIGluc3RhbmNlCj4+Pj4gcnVubmlu
ZywgdGhlbiBpdCBjb3VsZCBlYXNpbHkgYmUgZXh0ZW5kIHdpdGggYSBjb21tYS4gU28geW91IGFs
bG93Cj4+Pj4gYmFja3dhcmQgY29tcGF0aWJpbGl0eS4KPj4+Cj4+PiBJIGNvbnNpZGVyZWQgdGhp
cy4gQnV0IElmIEkgcmVtZW1iZXIgcmlnaHQsIGlkZWEgd2FzIHRvIHF1ZXJ5IFhlbiBhYm91dAo+
Pj4gYXZhaWxhYmxlIFRFRSwgYW5kIGNvbmZpZ3VyZSBndWVzdCBpbiB0aGUgYXBwcm9wcmlhdGUg
d2F5LiBTbyAibmF0aXZlIgo+Pj4gKG9yIHNvbWUgb3RoZXIgZ2VuZXJpYyB3YXkpIGNvdWxkIGJl
IHVzZWQgZm9yIE9QLVRFRSwgR29vZ2xlIFRydXN0eSBvcgo+Pj4gYW55IG90aGVyIFRFRSwgd2l0
aG91dCBjaGFuZ2luZyBndWVzdCBjb25maWd1cmF0aW9uLgo+Pj4KPj4+IFVzaW5nICJvcHRlZSIg
d2lsbCBjYXVzZSBleHBsaWNpdCBjb25maWd1cmF0aW9uIGZvciBPUC1URUUgb25seS4gSSBjYW4n
dAo+Pj4gc2F5IHRoYXQgdGhpcyBpcyBnb29kIG9yIGJhZC4gSXQganVzdCBkaWZmZXJlbnQuIERv
IHlvdSB0aGluayB0aGF0IHdvdWxkCj4+PiBiZSBiZXR0ZXIgYXBwcm9hY2g/Cj4+Cj4+IFlvdSBo
YXZlIDIgZGlmZmVyZW50IGNhc2VzIHRvIHRha2UgaW50byBhY2NvdW50Ogo+PiAgICAgLSBBIGd1
ZXN0IGlzIGFibGUgdG8gZGVhbCB3aXRoIGFsbCBzdXBwb3J0ZWQgVHJ1c3RlZCBPUy4gU28KPj4g
Im5hdGl2ZSIgd2lsbCBsZXQgdGhlIHRvb2xzdGFjayBxdWVyeSB0aGUgY3VycmVudCBUcnVzdGVk
IE9TIGFuZAo+PiBleHBvc2UgaXQgdG8gdGhlIGd1ZXN0Lgo+PiAgICAgLSBBIGd1ZXN0IGNhbiBv
bmx5IGRlYWwgd2l0aCBhIHNwZWNpZmljIFRydXN0ZWQgT1MuIEluIHRoYXQgY2FzZSwKPj4gdGhl
IHVzZXIgbWlnaHQgd2FudCB0byBzcGVjaWZ5IGluIHRoZSBjb25maWd1cmF0aW9uIHRoZSBleHBl
Y3RlZAo+PiBUcnVzdGVkIE9TIHNvIGl0IGNhbid0IGJvb3QgaWYgbm90IGF2YWlsYWJsZS4KPj4K
Pj4gV2hhdCBJIHN1Z2dlc3QgaXMgZGVmZXJyaW5nIHRoZSBmb3JtZXIgY2FzZSB1bnRpbCB3ZSBo
YXZlIGFub3RoZXIgVEVFCj4+IGluIGhhbmQuIE1heWJlIGF0IHRoYXQgdGltZSwgd2Ugd2lsbCBo
YXZlIGEgYmV0dGVyIG5hbWluZyA6KS4KPiAKPiBPa2F5LCBzbyBzdW1tYXJpemluZyB0aGlzIHVw
LCB5b3UgYXJlIHByb3Bvc2luZyB0byB1c2UgIm9wdGVlIi4gQW0gSSBnb3QKPiB5b3UgcmlnaHQ/
CgpJIGFtIHN1Z2dlc3RpbmcgJ3RlZSA9ICJvcHRlZSInIGZvciBub3cuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
