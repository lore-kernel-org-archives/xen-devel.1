Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94169C282CE
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 18:38:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ADA721738
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 18:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ADA721738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCTja-0004Et-7N; Fri, 05 Apr 2019 18:38:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NZMc=SH=citrix.com=prvs=991a7e4b2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hCTjZ-0004Eo-0l
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 18:38:37 +0000
X-Inumbo-ID: 047fb07a-57d2-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 047fb07a-57d2-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 18:38:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,313,1549929600"; d="scan'208";a="88439272"
To: Norbert Manthey <nmanthey@amazon.de>, <xen-devel@lists.xenproject.org>
References: <1552567811-5301-1-git-send-email-nmanthey@amazon.de>
 <1552567811-5301-5-git-send-email-nmanthey@amazon.de>
 <ac21008a-3d74-2836-79fe-fbc39ca154ac@citrix.com>
 <cfb267a7-3529-c683-c12f-94445def2a9d@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <79c22e75-48d3-c894-b294-6186b98c2d49@citrix.com>
Date: Fri, 5 Apr 2019 19:38:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cfb267a7-3529-c683-c12f-94445def2a9d@amazon.de>
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
Message-ID: <20190405183832.Ru3l7K1xumW9zJd-FzRKNSeErLC0JfpjewjvtEqmHBI@z>

T24gMDUvMDQvMjAxOSAxOToyOSwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IE9uIDQvNS8xOSAx
NzozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTQvMDMvMjAxOSAxMjo1MCwgTm9yYmVy
dCBNYW50aGV5IHdyb3RlOgo+Pj4gV2hlbiBjaGVja2luZyBmb3IgYmVpbmcgYW4gaHZtIGRvbWFp
biwgb3IgUFYgZG9tYWluLCB3ZSBoYXZlIHRvIG1ha2UKPj4+IHN1cmUgdGhhdCBzcGVjdWxhdGlv
biBjYW5ub3QgYnlwYXNzIHRoYXQgY2hlY2ssIGFuZCBldmVudHVhbGx5IGFjY2Vzcwo+Pj4gZGF0
YSB0aGF0IHNob3VsZCBub3QgZW5kIHVwIGluIGNhY2hlIGZvciB0aGUgY3VycmVudCBkb21haW4g
dHlwZS4KPj4+Cj4+PiBUaGlzIGlzIHBhcnQgb2YgdGhlIHNwZWN1bGF0aXZlIGhhcmRlbmluZyBl
ZmZvcnQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBh
bWF6b24uZGU+Cj4+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
Pj4KPj4+IC0tLQo+Pj4gIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIHwgNiArKysrLS0KPj4+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oCj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+Pj4gKysrIGIveGVuL2luY2x1
ZGUveGVuL3NjaGVkLmgKPj4+IEBAIC05MjIsNyArOTIyLDggQEAgdm9pZCB3YXRjaGRvZ19kb21h
aW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKTsKPj4+ICAKPj4+ICBzdGF0aWMgaW5saW5lIGJv
b2wgaXNfcHZfZG9tYWluKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCj4+PiAgewo+Pj4gLSAgICBy
ZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUFYpID8gZC0+Z3Vlc3RfdHlwZSA9PSBndWVzdF90eXBl
X3B2IDogZmFsc2U7Cj4+PiArICAgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19QVikKPj4+ICsg
ICAgICAgICAgID8gZXZhbHVhdGVfbm9zcGVjKGQtPmd1ZXN0X3R5cGUgPT0gZ3Vlc3RfdHlwZV9w
dikgOiBmYWxzZTsKPj4+ICB9Cj4+PiAgCj4+PiAgc3RhdGljIGlubGluZSBib29sIGlzX3B2X3Zj
cHUoY29uc3Qgc3RydWN0IHZjcHUgKnYpCj4+PiBAQCAtOTUzLDcgKzk1NCw4IEBAIHN0YXRpYyBp
bmxpbmUgYm9vbCBpc19wdl82NGJpdF92Y3B1KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+Pj4gICNl
bmRpZgo+Pj4gIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19odm1fZG9tYWluKGNvbnN0IHN0cnVjdCBk
b21haW4gKmQpCj4+PiAgewo+Pj4gLSAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfSFZNKSA/
IGQtPmd1ZXN0X3R5cGUgPT0gZ3Vlc3RfdHlwZV9odm0gOiBmYWxzZTsKPj4+ICsgICAgcmV0dXJu
IElTX0VOQUJMRUQoQ09ORklHX0hWTSkKPj4+ICsgICAgICAgICAgID8gZXZhbHVhdGVfbm9zcGVj
KGQtPmd1ZXN0X3R5cGUgPT0gZ3Vlc3RfdHlwZV9odm0pIDogZmFsc2U7Cj4+PiAgfQo+PiBVbmZv
cnR1bmF0ZWx5LCB0aGlzIGJyZWFrcyB0aGUgbGl2ZXBhdGNoIGJ1aWxkLCBpbiBhIHJhdGhlciBp
bnNpZGlvdXMKPj4gd2F5LsKgIFRoZSBhc20gaW5zaWRlIGV2YWx1YXRlX25vc3BlYygpIGZvcmNl
cyB0aGVzZSBvdXQtb2YtbGluZS4KPj4KPj4gRHVwbGljYXRlIHN5bWJvbCAnZG9tY3RsLmMjaXNf
cHZfZG9tYWluLmlzcmEuMCcgKGZmZmY4MmQwODAyNzAzOTAgIT0KPj4gZmZmZjgyZDA4MDM2YTAw
NSkKPj4KPj4gT24gZm9yY2luZyB0aGVzZSB0byBiZSBhbHdheXNfaW5saW5lLCB0aGUgbmV4dCBi
aXQgb2YgYnJlYWthZ2Ugb2NjdXJzIGF0Ogo+Pgo+PiBEdXBsaWNhdGUgc3ltYm9sICdkb21jdGwu
YyNpc19wdl8zMmJpdF9kb21haW4nIChmZmZmODJkMDgwMjcwMjcwICE9Cj4+IGZmZmY4MmQwODAz
NmEwMDApCj4+Cj4+IHdoaWNoIG1lYW5zIHdlIG5vdyBoYXZlIGEgZ29vc2UgY2hhc2Ugb2YgdGhy
b3dpbmcgYWx3YXlzX2lubGluZSB0aHJvdWdoCj4+IHRoZSBjb2RlLgo+Pgo+PiBJJ20gZ29pbmcg
dG8gaGF2ZSB0byByZXZlcnQgdGhpcyBpbiBYZW5TZXJ2ZXIsIGVzcGVjaWFsbHkgc2VlaW5nIGFz
Cj4+IE9TU1Rlc3QgaXMgY3VycmVudGx5IG91dCBvZiBhY3Rpb24sIHdoaWNoIEFGQUlDVCwgbWFr
ZXMgWGVuU2VydmVyJ3MKPj4gdGVzdGluZyB0aGUgb25seSBhdXRvbWF0aWMgdGVzdGluZyB3aGlj
aCBzdGFnaW5nIGlzIGdldHRpbmcuCj4+Cj4+IEkgYWxzbyBuZWVkIHRvIHNlZSBhYm91dCB1cHN0
cmVhbWluZyBvdXQgbG9jYWwgcGF0Y2ggd2hpY2ggY2F1c2VzIHRoZQo+PiBidWlsZCB0byBwcm9w
ZXJseSBmYWlsIGluIGNhc2VzIHdoaWNoIHdlIGtub3cgd2lsbCBicmVhayB0aGUgYWJpbGl0eSB0
bwo+PiBidWlsZCBsaXZlcGF0Y2hlcy4KPiBJIHNlZSwgdGhhbmtzIGZvciB0aGUgcG9pbnRlci4g
SSBndWVzcyB0aGUgYnVpbGQgb25seSBmYWlscyBpbiBjYXNlIHlvdQo+IHBhdGNoIHNvbWUgZnVu
Y3Rpb24gdGhhdCBuZWVkcyBvbmUgb2YgdGhlIHR3bz8gSW4gY2FzZSB5b3UgaGF2ZQo+IHNvbWV0
aGluZyB0aGF0IHJlcHJvZHVjZXMgdGhlIHByb2JsZW0sIGFuZCBjYW4gYmUgc2hhcmVkLCB3ZSBt
aWdodCBoYXZlCj4gYSBsb29rLiBUaGFua3MhCgpUaGUgcHJlc2VuY2Ugb2YgZHVwbGljYXRlIHN5
bWJvbHMgYnJlYWtzIHRoZSBiaW5hcnkgZGlmZmluZyBsb2dpYyBpbiB0aGUKbGl2ZXBhdGNoIGJ1
aWxkIHByb2Nlc3MgaXRzZWxmLgoKRm9yIHJ1bnRpbWUgcGF0Y2ggYXBwbGljYXRpb24sIHlvdSBh
cmUgY29ycmVjdCB0aGF0IGl0IGlzIGZpbmUgaW4KcHJhY3RpY2Ugc28gbG9uZyBhcyB5b3UgZG9u
J3QgY2FyZSBhYm91dCBwYXRjaGluZyBJc19wdl9kb21haW4oKSBpdHNlbGYuCgoKT25lIHBhcnQg
b2YgbGl2ZXBhdGNoaW5nIHdvcmsgd2hpY2ggYXBwZWFycyBub3QgdG8gaGF2ZSBiZWVuIHVwc3Ry
ZWFtZWQKKGFuZCBJJ20gdHJ5aW5nIHRvIGZpeCB0aGlzIHJpZ2h0IG5vdyksIGlzIHRoZSBiaXQg
d2hpY2ggY2F1c2VzIGEgaGFyZApmYWlsdXJlIG9mIHRoZSBoeXBlcnZpc29yIGJ1aWxkIHdoZW4g
eW91IHNlbGVjdCBDT05GSUdfTElWRVBBVENIIGFuZApkdXBsaWNhdGUgc3ltYm9scyBhcmUgZGV0
ZWN0ZWQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
