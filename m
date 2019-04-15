Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B137EC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:29:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A43220825
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A43220825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG1fm-0008Nd-2L; Mon, 15 Apr 2019 13:29:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6R5j=SR=citrix.com=prvs=00163ee2b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hG1fk-0008NY-4I
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:29:20 +0000
X-Inumbo-ID: 773fc3a0-5f82-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 773fc3a0-5f82-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 13:29:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,353,1549929600"; d="scan'208";a="88840670"
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-7-anthony.perard@citrix.com>
 <2fbfe0f2-5c34-9faa-bda5-88223770c936@citrix.com>
 <20190415112547.GB1354@perard.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fb77cdf3-66a4-2c62-223e-58a4912e4fb3@citrix.com>
Date: Mon, 15 Apr 2019 14:28:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415112547.GB1354@perard.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 06/31] OvmfPkg/XenResetVector: Add new
 entry point for Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415132812.M_Pl7F9puMaaPLjaxmnXdOC8Cy0__DBhhm_ZCTLhCQ0@z>

T24gMTUvMDQvMjAxOSAxMjoyNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTEsIDIwMTkgYXQgMDE6NTI6MjdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24g
MDkvMDQvMjAxOSAxMjowOCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+PiBkaWZmIC0tZ2l0IGEv
T3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtIGIvT3ZtZlBrZy9YZW5S
ZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
Pj4gaW5kZXggMDAwMDAwMDAwMC4uYzQ4MDJiZjRkMQo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysr
IGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtCj4+PiBAQCAtMCww
ICsxLDQ3IEBACj4+PiArOy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gKzsgQGZpbGUKPj4+ICs7
IEFuIGVudHJ5IHBvaW50IHVzZSBieSBYZW4gd2hlbiBhIGd1ZXN0IGlzIHN0YXJ0ZWQgaW4gUFZI
IG1vZGUuCj4+PiArOwo+Pj4gKzsgQ29weXJpZ2h0IChjKSAyMDE5LCBDaXRyaXggU3lzdGVtcywg
SW5jLgo+Pj4gKzsKPj4+ICs7IFRoaXMgcHJvZ3JhbSBhbmQgdGhlIGFjY29tcGFueWluZyBtYXRl
cmlhbHMgYXJlIGxpY2Vuc2VkIGFuZCBtYWRlIGF2YWlsYWJsZQo+Pj4gKzsgdW5kZXIgdGhlIHRl
cm1zIGFuZCBjb25kaXRpb25zIG9mIHRoZSBCU0QgTGljZW5zZSB3aGljaCBhY2NvbXBhbmllcyB0
aGlzCj4+PiArOyBkaXN0cmlidXRpb24uICBUaGUgZnVsbCB0ZXh0IG9mIHRoZSBsaWNlbnNlIG1h
eSBiZSBmb3VuZCBhdAo+Pj4gKzsgaHR0cDovL29wZW5zb3VyY2Uub3JnL2xpY2Vuc2VzL2JzZC1s
aWNlbnNlLnBocAo+Pj4gKzsKPj4+ICs7IFRIRSBQUk9HUkFNIElTIERJU1RSSUJVVEVEIFVOREVS
IFRIRSBCU0QgTElDRU5TRSBPTiBBTiAiQVMgSVMiIEJBU0lTLCBXSVRIT1VUCj4+PiArOyBXQVJS
QU5USUVTIE9SIFJFUFJFU0VOVEFUSU9OUyBPRiBBTlkgS0lORCwgRUlUSEVSIEVYUFJFU1MgT1Ig
SU1QTElFRC4KPj4+ICs7Cj4+PiArOy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gKwo+Pj4gK0JJ
VFMgICAgMzIKPj4+ICsKPj4+ICt4ZW5QVkhNYWluOgo+Pj4gKyAgICBtb3YgICAgIGRpLCAnQlAn
Cj4+PiArCj4+PiArICAgIDsgRVNQIC0gIEluaXRpYWwgdmFsdWUgb2YgdGhlIEVBWCByZWdpc3Rl
ciAoQklTVDogQnVpbHQtaW4gU2VsZiBUZXN0KQo+Pj4gKyAgICBtb3YgICAgIGVzcCwgZWF4Cj4+
IFdoZXJlIGlzIHRoZSBBQkkgZGVzY3JpYmVkP8KgIFhlbiBoYXMgbm8gQklTVCwgc28gdGhpcyB3
aWxsIGFsd2F5cyBoYXZlCj4+IHRoZSB2YWx1ZSAwLiBTdGFzaGluZyBpdCBpbiB0aGUgc3RhY2sg
cG9pbnRlciBzZWVtcyBsaWtlIGEgd2VpcmQgY2hvaWNlLAo+PiBhbmQgYSByZWNpcGUgZm9yIHN1
YnRsZSBidWdzLgo+IEkndmUganVzdCBjb3BpZWQgb3ZlciB3aGF0IHdhcyBkb25lIGluIHRoZSBI
Vk0gY2FzZS4gSSdsbCBjaGFuZ2UgdGhhdAo+IGFuZCBpZ25vcmUgdGhlIHZhbHVlIGluIGBlYXgn
LgoKVGhlIEFTQ0lJIEJQIGluICVkaSBpcyBhbHNvIGJpemFycmUgd2l0aG91dCBhbiBleHBsYW5h
dGlvbiBvZiB3aGVyZSBpdAppcyBpbnRlbmRlZCB0byBiZSB1c2VkLgoKPj4+ICsKPj4+ICsgICAg
bW92ICAgICBlYXgsIFNFQ19ERUZBVUxUX0NSMAo+Pj4gKyAgICBtb3YgICAgIGNyMCwgZWF4Cj4+
PiArCj4+PiArICAgIGptcCAgICAgTElORUFSX0NPREVfU0VMOkFERFJfT0YoLmptcFRvTmV3Q29k
ZVNlZykKPj4+ICsuam1wVG9OZXdDb2RlU2VnOgo+Pj4gKwo+Pj4gKyAgICBtb3YgICAgIGVheCwg
U0VDX0RFRkFVTFRfQ1I0Cj4+PiArICAgIG1vdiAgICAgY3I0LCBlYXgKPj4+ICsKPj4+ICsgICAg
bW92ICAgICBheCwgTElORUFSX1NFTAo+Pj4gKyAgICBtb3YgICAgIGRzLCBheAo+Pj4gKyAgICBt
b3YgICAgIGVzLCBheAo+Pj4gKyAgICBtb3YgICAgIGZzLCBheAo+Pj4gKyAgICBtb3YgICAgIGdz
LCBheAo+Pj4gKyAgICBtb3YgICAgIHNzLCBheAo+Pj4gKwo+Pj4gKyAgICA7IHJldHVybiB0byB0
aGUgTWFpbjE2Cj4+PiArICAgIE9uZVRpbWVDYWxsUmV0IFRyYW5zaXRpb25Gcm9tUmVhbDE2VG8z
MkJpdEZsYXQKPj4gSXMgdGhlcmUgYW55IGRlc2NyaXB0aW9uIG9mIHdoYXQgT25lVGltZUNhbGxS
ZXQgaXMsIGFuZCB3aHkgYSBzaW1wbGUgam1wCj4+IHdvbnQgZG8/Cj4gVGhhdCdzIGlzIHVzZWQg
dG8gcmV0dXJuIHRvIHdoZXJlIHRoZSBgT25lVGltZUNhbGwnIG1hY3JvIGhhcyBiZWVuCj4gdXNl
ZC4gSW4gdGhpcyBhc3NlbWJseSwgdGhleSBkb24ndCB1c2UgYGNhbGwnIGFuZCBgcmV0JywgaW5z
dGVhZCB0aGVyZQo+IGlzIGEgc2V0IG9mIHR3byBtYWNyb3M6Cj4KPiAlbWFjcm8gIE9uZVRpbWVD
YWxsIDEKPiAgICAgam1wICAgICAlMQo+ICUxICUrIE9uZVRpbWVyQ2FsbFJldHVybjoKPiAlZW5k
bWFjcm8KPgo+ICVtYWNybyAgT25lVGltZUNhbGxSZXQgMQo+ICAgICBqbXAgICAgICUxICUrIE9u
ZVRpbWVyQ2FsbFJldHVybgo+ICVlbmRtYWNybwoKSSBmb3VuZCB0aGVzZSwgYnV0IHRoZSBjb21w
bGV0ZSBsYWNrIG9mIGFueSBkb2N1bWVudGF0aW9uIG1ha2VzIHRoZW0KZW50aXJlbHkgb3BhcXVl
LCBlc3BlY2lhbGx5IGFzIHRoZXkgYXJlIG5vdCBhY3R1YWxseSBjYWxsL3JldCBpbnN0cnVjdGlv
bnMuCgpFdmVuIGlmIHRoZXkgYXJlIHN1cHBvc2UgdG8gYmUgdXNlZCBpbiBtYXRjaGluZyBwYWly
cywgT25lVGltZUNhbGwKaGFzbid0IGJlZW4gdXNlZCBzbyBmYXIgaW4gdGhlIFBWSCBjb2RlLCBz
byB3aGVyZSBpcyB0aGlzIGdvaW5nIHRvCmFjdHVhbGx5IGdvIHRvPwoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
