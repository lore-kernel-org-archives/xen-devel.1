Return-Path: <SRS0=w8Ow=ZH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF1FC43141
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 14:18:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B02520730
	for <xen-devel@archiver.kernel.org>; Fri, 15 Nov 2019 14:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B02520730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVcQF-00041K-05; Fri, 15 Nov 2019 14:18:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVcQE-00041F-6P
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:18:02 +0000
X-Inumbo-ID: baca7942-07b2-11ea-a26f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id baca7942-07b2-11ea-a26f-12813bfff9fa;
 Fri, 15 Nov 2019 14:18:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 22069AF22;
 Fri, 15 Nov 2019 14:18:00 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
 <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
 <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
 <607854b0-00a2-df11-d977-af6498050c40@citrix.com>
 <f9c4d160-1567-d622-e056-f61b7085198e@citrix.com>
 <b6bf2826-eb8f-4e3c-42ce-a9923d3af1c3@citrix.com>
 <380e865b-3092-6a85-0d77-dc99e33678e4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f27d518-e6c4-a728-e59d-237acc92d493@suse.com>
Date: Fri, 15 Nov 2019 15:18:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <380e865b-3092-6a85-0d77-dc99e33678e4@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Steven Haigh <netwiz@crc.id.au>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andreas Kinzler <hfp@posteo.de>, IanJackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxNToxMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSAy
OjA2IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNS8xMS8yMDE5IDE0OjA0LCBHZW9y
Z2UgRHVubGFwIHdyb3RlOgo+Pj4+PiBJdCdzIG5vdCBlbnRpcmVseSB1bmNvbW1vbiB0byAoYWxz
bykgY29uc2lkZXIgaG93IHRoZSByZXN1bHRpbmcKPj4+Pj4gZGlmZiB3b3VsZCBsb29rIGxpa2Ug
d2hlbiBwdXR0aW5nIHRvZ2V0aGVyIGEgY2hhbmdlLiBBbmQgYmVzaWRlcwo+Pj4+PiB0aGUgcmV2
aWV3IGFzcGVjdCwgdGhlcmUncyBhbHNvIHRoZSBhcmNoZW9sb2d5IG9uZSAtICJnaXQgYmxhbWUi
Cj4+Pj4+IHlpZWxkcyBtdWNoIG1vcmUgaGVscGZ1bCByZXN1bHRzIHdoZW4gY29kZSBkb2Vzbid0
IGdldCBtb3ZlZAo+Pj4+PiBhcm91bmQgbW9yZSB0aGFuIG5lY2Vzc2FyeS4gQnV0IHllcywgdGhl
cmUncyBubyB2ZXJ5IGNsZWFyICJ0aGlzCj4+Pj4+IGlzIHRoZSBiZXR0ZXIgb3B0aW9uIiBoZXJl
LiBJJ3ZlIHRha2VuIGFub3RoZXIgbG9vayBhdCB0aGUgY29kZQo+Pj4+PiBiZWZvcmUgeW91ciBj
aGFuZ2UgdGhvdWdoIC0gZXZlcnl0aGluZyBpcyBhbHJlYWR5IG5pY2VseSBpbiBvbmUKPj4+Pj4g
cGxhY2Ugd2l0aCBBbmRyZXcncyBtb3N0IHJlY2VudCBjb2RlIHJlb3JnLiBTbyBJJ20gbm93IGhh
dmluZyBhbgo+Pj4+PiBldmVuIGhhcmRlciB0aW1lIHNlZWluZyB3aHkgeW91IHdhbnQgdG8gbW92
ZSB0aGluZ3MgYXJvdW5kIGFnYWluLgo+Pj4+IFdlIGRvbid0LsKgIEkndmUgcmVjb21tZW5kIHR3
aWNlIG5vdyB0byBoYXZlIGEgc2luZ2xlICJlbHNlIGlmIiBodW5rCj4+Pj4gd2hpY2ggaXMgbmVh
cmx5IGVtcHR5LCBhbmQgbXVjaCBtb3JlIG9idmlvdXNseSBhIGdyb3NzICJtYWtlIGl0IHdvcmsg
Zm9yCj4+Pj4gNC4xMyIgYm9kZ2UuCj4+PiBUaGUgcmVzdWx0cyBhcmUgYSB0aW55IGJpdCBiZXR0
ZXIsIGJ1dCBub3QgbXVjaCByZWFsbHkgKHNlZSBhdHRhY2hlZCkuCj4+Cj4+IFdoYXQgSSBtZWFu
dCB3YXM6Cj4+Cj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgYi90
b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+Pj4gaW5kZXggMzEyYzQ4MWYxZS4uYmMwODhlNDVm
MCAxMDA2NDQKPj4+IC0tLSBhL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4+PiArKysgYi90
b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+Pj4gQEAgLTU3OSw1MiArNTc5LDcxIEBAIGludCB4
Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90IGRvbWlkLAo+
Pj4gICAgICB9Cj4+Cj4+IGVsc2UgaWYgKCBnZXRlbnYoKSApCj4+IHsKPj4gwqDCoMKgIC4uLgo+
PiB9Cj4+Cj4+PiAgICAgIGVsc2UKPj4+ICAgICAgewo+Pgo+PiBXaXRoIG5vIGRlbHRhIHRvIHRo
aXMgYmxvY2sgYXQgYWxsLgo+IAo+IFRoZW4gd2UgaGF2ZSB0byBkdXBsaWNhdGUgdGhpcyBjb2Rl
IGluIGJvdGggYmxvY2tzOgo+IAo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIFRoZXNlIHNldHRp
bmdzIGFyZSBuZWNlc3NhcnkgdG8gY2F1c2UgZWFybGllcgo+IEhWTV9QQVJBTV9ORVNURURIVk0g
Lwo+ICAgICAgICAgICogWEVOX0RPTUNUTF9kaXNhYmxlX21pZ3JhdGUgc2V0dGluZ3MgdG8gYmUg
cmVmbGVjdGVkIGNvcnJlY3RseSBpbgo+ICAgICAgICAgICogQ1BVSUQuICBYZW4gd2lsbCBkaXNj
YXJkIHRoZXNlIGJpdHMgaWYgY29uZmlndXJhdGlvbiBoYXNuJ3QgYmVlbgo+ICAgICAgICAgICog
c2V0IGZvciB0aGUgZG9tYWluLgo+ICAgICAgICAgICovCj4gICAgICAgICBwLT5leHRkLml0c2Mg
PSB0cnVlOwo+ICAgICAgICAgcC0+YmFzaWMudm14ID0gdHJ1ZTsKPiAgICAgICAgIHAtPmV4dGQu
c3ZtID0gdHJ1ZTsKPiAKPiBJIHdvbid0IG9iamVjdCBpZiB0aGF0J3Mgd2hhdCB5b3UgZ3V5cyBy
ZWFsbHkgd2FudC4KClBlcnNvbmFsbHkgSSB0aGluayB0aGUgZHVwbGljYXRpb24gaXMgbGVzcyBi
YWQgdGhhbiB0aGUgZmFyCmhlYXZpZXIgb3JpZ2luYWwgY29kZSBjaHVybiwgYnV0IHRvIGJlIGhv
bmVzdCwgZXNwZWNpYWxseSB3aXRoCnRoaXMgaW50ZW5kZWQgdG8gZ28gYXdheSBhZ2FpbiBzb29u
IGFueXdheSwgSSdkIG5vdCBiZSBvcHBvc2VkCmF0IGFsbCB0bwoKICAgIC4uLgogICAgZWxzZSBp
ZiAoIGdldGVudigpICkKICAgICAgICBnb3RvIG5vX2Zha2VfaHQ7CiAgICBlbHNlCiAgICB7CiAg
ICAuLi4KIG5vX2Zha2VfaHQ6CiAgICAgICAgLyoKICAgICAgICAgKiBUaGVzZSBzZXR0aW5ncyBh
cmUgbmVjZXNzYXJ5IHRvIGNhdXNlIGVhcmxpZXIgSFZNX1BBUkFNX05FU1RFREhWTSAvCiAgICAg
ICAgICogWEVOX0RPTUNUTF9kaXNhYmxlX21pZ3JhdGUgc2V0dGluZ3MgdG8gYmUgcmVmbGVjdGVk
IGNvcnJlY3RseSBpbgogICAgICAgICAqIENQVUlELiAgWGVuIHdpbGwgZGlzY2FyZCB0aGVzZSBi
aXRzIGlmIGNvbmZpZ3VyYXRpb24gaGFzbid0IGJlZW4KICAgICAgICAgKiBzZXQgZm9yIHRoZSBk
b21haW4uCiAgICAgICAgICovCiAgICAgICAgcC0+ZXh0ZC5pdHNjID0gdHJ1ZTsKICAgICAgICBw
LT5iYXNpYy52bXggPSB0cnVlOwogICAgICAgIHAtPmV4dGQuc3ZtID0gdHJ1ZTsKICAgIH0KCihk
ZXNwaXRlIG15IGdlbmVyYWwgZGlzbGlrZSBvZiBnb3RvKS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
