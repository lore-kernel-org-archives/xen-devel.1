Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A4DC4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 15:35:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A118021726
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 15:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A118021726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCQrl-0005IE-DJ; Fri, 05 Apr 2019 15:34:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NZMc=SH=citrix.com=prvs=991a7e4b2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hCQrk-0005I9-HM
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 15:34:52 +0000
X-Inumbo-ID: 579e668a-57b8-11e9-8611-d3953674a121
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 579e668a-57b8-11e9-8611-d3953674a121;
 Fri, 05 Apr 2019 15:34:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,313,1549929600"; d="scan'208";a="88430112"
To: Norbert Manthey <nmanthey@amazon.de>, <xen-devel@lists.xenproject.org>
References: <1552567811-5301-1-git-send-email-nmanthey@amazon.de>
 <1552567811-5301-5-git-send-email-nmanthey@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ac21008a-3d74-2836-79fe-fbc39ca154ac@citrix.com>
Date: Fri, 5 Apr 2019 16:34:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1552567811-5301-5-git-send-email-nmanthey@amazon.de>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH L1TF v10 4/8] is_hvm/pv_domain: block
 speculation
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>,
 Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405153409.hVxxd8Gg2aw9PQ_hj941RdryJIMz_EzEVlIAa9f93yc@z>

T24gMTQvMDMvMjAxOSAxMjo1MCwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IFdoZW4gY2hlY2tp
bmcgZm9yIGJlaW5nIGFuIGh2bSBkb21haW4sIG9yIFBWIGRvbWFpbiwgd2UgaGF2ZSB0byBtYWtl
Cj4gc3VyZSB0aGF0IHNwZWN1bGF0aW9uIGNhbm5vdCBieXBhc3MgdGhhdCBjaGVjaywgYW5kIGV2
ZW50dWFsbHkgYWNjZXNzCj4gZGF0YSB0aGF0IHNob3VsZCBub3QgZW5kIHVwIGluIGNhY2hlIGZv
ciB0aGUgY3VycmVudCBkb21haW4gdHlwZS4KPgo+IFRoaXMgaXMgcGFydCBvZiB0aGUgc3BlY3Vs
YXRpdmUgaGFyZGVuaW5nIGVmZm9ydC4KPgo+IFNpZ25lZC1vZmYtYnk6IE5vcmJlcnQgTWFudGhl
eSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4KPiAtLS0KPiAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCA2ICsrKystLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVk
LmgKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hl
bi9zY2hlZC5oCj4gQEAgLTkyMiw3ICs5MjIsOCBAQCB2b2lkIHdhdGNoZG9nX2RvbWFpbl9kZXN0
cm95KHN0cnVjdCBkb21haW4gKmQpOwo+ICAKPiAgc3RhdGljIGlubGluZSBib29sIGlzX3B2X2Rv
bWFpbihjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+ICB7Cj4gLSAgICByZXR1cm4gSVNfRU5BQkxF
RChDT05GSUdfUFYpID8gZC0+Z3Vlc3RfdHlwZSA9PSBndWVzdF90eXBlX3B2IDogZmFsc2U7Cj4g
KyAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUFYpCj4gKyAgICAgICAgICAgPyBldmFsdWF0
ZV9ub3NwZWMoZC0+Z3Vlc3RfdHlwZSA9PSBndWVzdF90eXBlX3B2KSA6IGZhbHNlOwo+ICB9Cj4g
IAo+ICBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcHZfdmNwdShjb25zdCBzdHJ1Y3QgdmNwdSAqdikK
PiBAQCAtOTUzLDcgKzk1NCw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19wdl82NGJpdF92Y3B1
KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+ICAjZW5kaWYKPiAgc3RhdGljIGlubGluZSBib29sIGlz
X2h2bV9kb21haW4oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKPiAgewo+IC0gICAgcmV0dXJuIElT
X0VOQUJMRUQoQ09ORklHX0hWTSkgPyBkLT5ndWVzdF90eXBlID09IGd1ZXN0X3R5cGVfaHZtIDog
ZmFsc2U7Cj4gKyAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfSFZNKQo+ICsgICAgICAgICAg
ID8gZXZhbHVhdGVfbm9zcGVjKGQtPmd1ZXN0X3R5cGUgPT0gZ3Vlc3RfdHlwZV9odm0pIDogZmFs
c2U7Cj4gIH0KClVuZm9ydHVuYXRlbHksIHRoaXMgYnJlYWtzIHRoZSBsaXZlcGF0Y2ggYnVpbGQs
IGluIGEgcmF0aGVyIGluc2lkaW91cwp3YXkuwqAgVGhlIGFzbSBpbnNpZGUgZXZhbHVhdGVfbm9z
cGVjKCkgZm9yY2VzIHRoZXNlIG91dC1vZi1saW5lLgoKRHVwbGljYXRlIHN5bWJvbCAnZG9tY3Rs
LmMjaXNfcHZfZG9tYWluLmlzcmEuMCcgKGZmZmY4MmQwODAyNzAzOTAgIT0KZmZmZjgyZDA4MDM2
YTAwNSkKCk9uIGZvcmNpbmcgdGhlc2UgdG8gYmUgYWx3YXlzX2lubGluZSwgdGhlIG5leHQgYml0
IG9mIGJyZWFrYWdlIG9jY3VycyBhdDoKCkR1cGxpY2F0ZSBzeW1ib2wgJ2RvbWN0bC5jI2lzX3B2
XzMyYml0X2RvbWFpbicgKGZmZmY4MmQwODAyNzAyNzAgIT0KZmZmZjgyZDA4MDM2YTAwMCkKCndo
aWNoIG1lYW5zIHdlIG5vdyBoYXZlIGEgZ29vc2UgY2hhc2Ugb2YgdGhyb3dpbmcgYWx3YXlzX2lu
bGluZSB0aHJvdWdoCnRoZSBjb2RlLgoKSSdtIGdvaW5nIHRvIGhhdmUgdG8gcmV2ZXJ0IHRoaXMg
aW4gWGVuU2VydmVyLCBlc3BlY2lhbGx5IHNlZWluZyBhcwpPU1NUZXN0IGlzIGN1cnJlbnRseSBv
dXQgb2YgYWN0aW9uLCB3aGljaCBBRkFJQ1QsIG1ha2VzIFhlblNlcnZlcidzCnRlc3RpbmcgdGhl
IG9ubHkgYXV0b21hdGljIHRlc3Rpbmcgd2hpY2ggc3RhZ2luZyBpcyBnZXR0aW5nLgoKSSBhbHNv
IG5lZWQgdG8gc2VlIGFib3V0IHVwc3RyZWFtaW5nIG91dCBsb2NhbCBwYXRjaCB3aGljaCBjYXVz
ZXMgdGhlCmJ1aWxkIHRvIHByb3Blcmx5IGZhaWwgaW4gY2FzZXMgd2hpY2ggd2Uga25vdyB3aWxs
IGJyZWFrIHRoZSBhYmlsaXR5IHRvCmJ1aWxkIGxpdmVwYXRjaGVzLgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
