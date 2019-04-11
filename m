Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C881BC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 07:17:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B3A02133D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 07:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B3A02133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hETx0-00047R-Se; Thu, 11 Apr 2019 07:16:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4K+I=SN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hETwz-00047M-LK
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 07:16:45 +0000
X-Inumbo-ID: c247b65c-5c29-11e9-92d7-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c247b65c-5c29-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 07:16:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9DEF2AD05;
 Thu, 11 Apr 2019 07:16:42 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190329150934.17694-1-jgross@suse.com>
 <8f88c0017bcd6bace30e485547efe8e982469086.camel@suse.com>
 <59657c28f62cf82860560efaece6d0bfb0983846.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f3631a2a-f818-c940-8cec-3d2ace741158@suse.com>
Date: Thu, 11 Apr 2019 09:16:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <59657c28f62cf82860560efaece6d0bfb0983846.camel@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH RFC 00/49] xen: add core scheduling support
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411071640.0qx_iDmFnBbs7AZzMyK_Hg6XshsDTqiooQ307DaYEWQ@z>

T24gMTEvMDQvMjAxOSAwMjozNCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gRnJpLCAyMDE5
LTAzLTI5IGF0IDE5OjE2ICswMTAwLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4gT24gRnJpLCAy
MDE5LTAzLTI5IGF0IDE2OjA4ICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gSSBoYXZl
IGRvbmUgc29tZSB2ZXJ5IGJhc2ljIHBlcmZvcm1hbmNlIHRlc3Rpbmc6IG9uIGEgNCBjcHUgc3lz
dGVtCj4+PiAoMiBjb3JlcyB3aXRoIDIgdGhyZWFkcyBlYWNoKSBJIGRpZCBhICJtYWtlIC1qIDQi
IGZvciBidWlsZGluZyB0aGUKPj4+IFhlbgo+Pj4gaHlwZXJ2aXNvci4gV2l0aCBUaGlzIHRlc3Qg
aGFzIGJlZW4gcnVuIG9uIGRvbTAsIG9uY2Ugd2l0aCBubyBvdGhlcgo+Pj4gZ3Vlc3QgYWN0aXZl
IGFuZCBvbmNlIHdpdGggYW5vdGhlciBndWVzdCB3aXRoIDQgdmNwdXMgcnVubmluZyB0aGUKPj4+
IHNhbWUKPj4+IHRlc3QuCj4+IEp1c3QgYXMgYW4gaGVhZHMgdXAgZm9yIHBlb3BsZSAoYXMgSnVl
cmdlbiBrbm93cyB0aGlzIGFscmVhZHkgOi1EKSwKPj4gSSdtCj4+IHBsYW5uaW5nIHRvIHJ1biBz
b21lIHBlcmZvcm1hbmNlIGV2YWx1YXRpb24gb2YgdGhpcyBwYXRjaGVzLgo+Pgo+PiBJJ3ZlIGdv
dCBhbiA4IENQVXMgc3lzdGVtICg0IGNvcmVzLCAyIHRocmVhZHMgZWFjaCwgbm8tTlVNQSkgYW5k
IGFuCj4+IDE2Cj4+IENQVXMgc3lzdGVtICgyIHNvY2tldHMvTlVNQSBub2RlcywgNCBjb3JlcyBl
YWNoLCAyIHRocmVhZHMgZWFjaCkgb24KPj4gd2hpY2ggSSBzaG91bGQgYmUgYWJsZSB0byBnZXQg
c29tZSBiZW5jaCBzdWl0ZSBydW5uaW5nIHJlbGF0aXZlbHkKPj4gZWFzeQo+PiBhbmQgKGhvcGVm
dWxseSkgcXVpY2suCj4+Cj4+IEknbSBwbGFubmluZyB0byBldmFsdWF0ZToKPj4gLSB2YW5pbGxh
IChpLmUuLCB3aXRob3V0IHRoaXMgc2VyaWVzKSwgU01UIGVuYWJsZWQgaW4gQklPUwo+PiAtIHZh
bmlsbGEgKGkuZS4sIHdpdGhvdXQgdGhpcyBzZXJpZXMpLCBTTVQgZGlzYWJsZWQgaW4gQklPUwo+
PiAtIHBhdGNoZWQgKGkuZS4sIHdpdGggdGhpcyBzZXJpZXMpLCBncmFudWxhcml0eT10aHJlYWQK
Pj4gLSBwYXRjaGVkIChpLmUuLCB3aXRoIHRoaXMgc2VyaWVzKSwgZ3JhbnVsYXJpdHk9Y29yZQo+
Pgo+PiBJJ2xsIGRvIHN0YXJ0IHdpdGggbm8gb3ZlcmNvbW1pdG1lbnQsIGFuZCB0aGVuIG1vdmUg
dG8gMngKPj4gb3ZlcmNvbW1pdG1lbnQgKGFzIHlvdSBkaWQgYWJvdmUpLgo+Pgo+IEkndmUgZ290
IHRoZSBmaXJzdCBzZXQgb2YgcmVzdWx0cy4gSXQncyBmZXdlciB0aGFuIEkgd2FudGVkL2V4cGVj
dGVkIHRvCj4gaGF2ZSBhdCB0aGlzIHBvaW50IGluIHRpbWUsIGJ1dCBzdGlsbC4uLgo+IAo+IEFs
c28sIGl0J3MgUGhvcm9uaXggYWdhaW4uIEkgZG9uJ3QgZXNwZWNpYWxseSBsb3ZlIGl0LCBidXQg
SSdtIHN0aWxsCj4gd29ya2luZyBvbiBjb252aW5jaW5nIG91ciBvd24gaW50ZXJuYWwgYXV0b21h
dGVkIGJlbmNobWFya2luZyB0b29sCj4gKHdoaWNoIEkgbGlrZSBhIGxvdCBtb3JlIDotKSApIHRv
IGJlIGEgZ29vZCBmcmllbmQgb2YgWGVuLiA6LVAKCkkgdGhpbmsgdGhlIFBob3Jvbml4IHRlc3Rz
IGFzIHN1Y2ggYXJlIG5vdCB0aGF0IGJhZCwgaXRzIHRoZSB3YXkgdGhleQphcmUgdXNlZCBieSBQ
aG9yb25peCB3aGljaCBpcyBjb21wbGV0ZWx5IGlkaW90aWMuCgo+IEl0J3MgYSBub3QgdG9vIGJp
ZyBzZXQgb2YgdGVzdHMsIGRvbmUgaW4gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgo+IC0gaGFy
ZHdhcmU6IEludGVsIFhlb24gRTU2MjA7IDIgTlVNQSBub2RlcywgNCBjb3JlcyBhbmQgMiB0aHJl
YWRzIGVhY2gKPiAtIHNsb3cgZGlzayAob2xkIHJvdGF0aW9uYWwgSEREKQo+IC0gYmVuY2htYXJr
cyBydW4gaW4gZG9tMAo+IC0gQ1BVLCBtZW1vcnkgYW5kIHNvbWUgZGlzayBJTyBiZW5jaG1hcmtz
Cj4gLSBhbGwgU3BlYyZNZWx0IG1pdGlnYXRpb25zIGRpc2FibGVkIGJvdGggYXQgWGVuIGFuZCBk
b20wIGtlcm5lbCBsZXZlbAo+IC0gY3B1ZnJlcSBnb3Zlcm5vciA9IHBlcmZvcm1hbmNlLCBtYXhf
Y3N0YXRlID0gQzEKPiAtICpub24qIGRlYnVnIGh5cGVydmlzb3IKPiAKPiBJbiBqdXN0IG9uZSBz
ZW50ZW5jZSwgd2hhdCBJJ2Qgc2F5IGlzICJTbyBmYXIgc28gZ29kIiA6LUQKPiAKPiBodHRwczov
L29wZW5iZW5jaG1hcmtpbmcub3JnL3Jlc3VsdC8xOTA0MTA1LVNQLTE5MDQxMDBEQTM4CgpUaGFu
a3MgZm9yIGRvaW5nIHRoYXQhCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
