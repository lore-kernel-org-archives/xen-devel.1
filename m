Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6F9C282CE
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 18:30:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0770D21738
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 18:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="B18yzI3g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0770D21738
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCTbY-0003yB-6v; Fri, 05 Apr 2019 18:30:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LeQ2=SH=amazon.de=prvs=9916b9811=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hCTbW-0003y6-Ux
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 18:30:19 +0000
X-Inumbo-ID: dcb5cd64-57d0-11e9-906d-5fbf2a25b0d4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcb5cd64-57d0-11e9-906d-5fbf2a25b0d4;
 Fri, 05 Apr 2019 18:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1554489017; x=1586025017;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=x+b1Q5lwMX0hqnLFlQ0vc1D6cjeXyKn/M5nMfLRdtBE=;
 b=B18yzI3gYWXHmvgYnHa7svaCyw/fXSuQyOo7t3eAdUtWNv20gA5ILxVe
 qWONsFRQl39mAnoQ8Du1c0cowH6ez/n22NLM/BwLFHVuocfwuw+93j69V
 Y0RAemkZLhbLklD097SgvKLtgXhINBrBB64aT8sETRq+fm1GU/ZODG1ib A=;
X-IronPort-AV: E=Sophos;i="5.60,313,1549929600"; d="scan'208";a="726299245"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 05 Apr 2019 18:30:15 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x35IU73q077954
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Fri, 5 Apr 2019 18:30:11 GMT
Received: from EX13D02EUB001.ant.amazon.com (10.43.166.150) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 5 Apr 2019 18:30:11 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.43.160.65) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 5 Apr 2019 18:30:03 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <1552567811-5301-1-git-send-email-nmanthey@amazon.de>
 <1552567811-5301-5-git-send-email-nmanthey@amazon.de>
 <ac21008a-3d74-2836-79fe-fbc39ca154ac@citrix.com>
From: Norbert Manthey <nmanthey@amazon.de>
Openpgp: preference=signencrypt
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <cfb267a7-3529-c683-c12f-94445def2a9d@amazon.de>
Date: Fri, 5 Apr 2019 20:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ac21008a-3d74-2836-79fe-fbc39ca154ac@citrix.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.65]
X-ClientProxiedBy: EX13P01UWB002.ant.amazon.com (10.43.161.191) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH L1TF v10 4/8] is_hvm/pv_domain: block
 speculation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan
 Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>,
 Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405182957.dOG2_sTDLfal_B_-VErrrhU8PHhuxziLfCcskF5_ByM@z>

T24gNC81LzE5IDE3OjM0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDE0LzAzLzIwMTkgMTI6
NTAsIE5vcmJlcnQgTWFudGhleSB3cm90ZToKPj4gV2hlbiBjaGVja2luZyBmb3IgYmVpbmcgYW4g
aHZtIGRvbWFpbiwgb3IgUFYgZG9tYWluLCB3ZSBoYXZlIHRvIG1ha2UKPj4gc3VyZSB0aGF0IHNw
ZWN1bGF0aW9uIGNhbm5vdCBieXBhc3MgdGhhdCBjaGVjaywgYW5kIGV2ZW50dWFsbHkgYWNjZXNz
Cj4+IGRhdGEgdGhhdCBzaG91bGQgbm90IGVuZCB1cCBpbiBjYWNoZSBmb3IgdGhlIGN1cnJlbnQg
ZG9tYWluIHR5cGUuCj4+Cj4+IFRoaXMgaXMgcGFydCBvZiB0aGUgc3BlY3VsYXRpdmUgaGFyZGVu
aW5nIGVmZm9ydC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhl
eUBhbWF6b24uZGU+Cj4+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+Cj4+IC0tLQo+PiAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCA2ICsrKystLQo+PiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgK
Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLmgKPj4gQEAgLTkyMiw3ICs5MjIsOCBAQCB2b2lkIHdhdGNoZG9nX2RvbWFpbl9kZXN0
cm95KHN0cnVjdCBkb21haW4gKmQpOwo+PiAgCj4+ICBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcHZf
ZG9tYWluKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCj4+ICB7Cj4+IC0gICAgcmV0dXJuIElTX0VO
QUJMRUQoQ09ORklHX1BWKSA/IGQtPmd1ZXN0X3R5cGUgPT0gZ3Vlc3RfdHlwZV9wdiA6IGZhbHNl
Owo+PiArICAgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19QVikKPj4gKyAgICAgICAgICAgPyBl
dmFsdWF0ZV9ub3NwZWMoZC0+Z3Vlc3RfdHlwZSA9PSBndWVzdF90eXBlX3B2KSA6IGZhbHNlOwo+
PiAgfQo+PiAgCj4+ICBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcHZfdmNwdShjb25zdCBzdHJ1Y3Qg
dmNwdSAqdikKPj4gQEAgLTk1Myw3ICs5NTQsOCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcHZf
NjRiaXRfdmNwdShjb25zdCBzdHJ1Y3QgdmNwdSAqdikKPj4gICNlbmRpZgo+PiAgc3RhdGljIGlu
bGluZSBib29sIGlzX2h2bV9kb21haW4oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKPj4gIHsKPj4g
LSAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfSFZNKSA/IGQtPmd1ZXN0X3R5cGUgPT0gZ3Vl
c3RfdHlwZV9odm0gOiBmYWxzZTsKPj4gKyAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfSFZN
KQo+PiArICAgICAgICAgICA/IGV2YWx1YXRlX25vc3BlYyhkLT5ndWVzdF90eXBlID09IGd1ZXN0
X3R5cGVfaHZtKSA6IGZhbHNlOwo+PiAgfQo+IFVuZm9ydHVuYXRlbHksIHRoaXMgYnJlYWtzIHRo
ZSBsaXZlcGF0Y2ggYnVpbGQsIGluIGEgcmF0aGVyIGluc2lkaW91cwo+IHdheS7CoCBUaGUgYXNt
IGluc2lkZSBldmFsdWF0ZV9ub3NwZWMoKSBmb3JjZXMgdGhlc2Ugb3V0LW9mLWxpbmUuCj4KPiBE
dXBsaWNhdGUgc3ltYm9sICdkb21jdGwuYyNpc19wdl9kb21haW4uaXNyYS4wJyAoZmZmZjgyZDA4
MDI3MDM5MCAhPQo+IGZmZmY4MmQwODAzNmEwMDUpCj4KPiBPbiBmb3JjaW5nIHRoZXNlIHRvIGJl
IGFsd2F5c19pbmxpbmUsIHRoZSBuZXh0IGJpdCBvZiBicmVha2FnZSBvY2N1cnMgYXQ6Cj4KPiBE
dXBsaWNhdGUgc3ltYm9sICdkb21jdGwuYyNpc19wdl8zMmJpdF9kb21haW4nIChmZmZmODJkMDgw
MjcwMjcwICE9Cj4gZmZmZjgyZDA4MDM2YTAwMCkKPgo+IHdoaWNoIG1lYW5zIHdlIG5vdyBoYXZl
IGEgZ29vc2UgY2hhc2Ugb2YgdGhyb3dpbmcgYWx3YXlzX2lubGluZSB0aHJvdWdoCj4gdGhlIGNv
ZGUuCj4KPiBJJ20gZ29pbmcgdG8gaGF2ZSB0byByZXZlcnQgdGhpcyBpbiBYZW5TZXJ2ZXIsIGVz
cGVjaWFsbHkgc2VlaW5nIGFzCj4gT1NTVGVzdCBpcyBjdXJyZW50bHkgb3V0IG9mIGFjdGlvbiwg
d2hpY2ggQUZBSUNULCBtYWtlcyBYZW5TZXJ2ZXIncwo+IHRlc3RpbmcgdGhlIG9ubHkgYXV0b21h
dGljIHRlc3Rpbmcgd2hpY2ggc3RhZ2luZyBpcyBnZXR0aW5nLgo+Cj4gSSBhbHNvIG5lZWQgdG8g
c2VlIGFib3V0IHVwc3RyZWFtaW5nIG91dCBsb2NhbCBwYXRjaCB3aGljaCBjYXVzZXMgdGhlCj4g
YnVpbGQgdG8gcHJvcGVybHkgZmFpbCBpbiBjYXNlcyB3aGljaCB3ZSBrbm93IHdpbGwgYnJlYWsg
dGhlIGFiaWxpdHkgdG8KPiBidWlsZCBsaXZlcGF0Y2hlcy4KCkkgc2VlLCB0aGFua3MgZm9yIHRo
ZSBwb2ludGVyLiBJIGd1ZXNzIHRoZSBidWlsZCBvbmx5IGZhaWxzIGluIGNhc2UgeW91CnBhdGNo
IHNvbWUgZnVuY3Rpb24gdGhhdCBuZWVkcyBvbmUgb2YgdGhlIHR3bz8gSW4gY2FzZSB5b3UgaGF2
ZQpzb21ldGhpbmcgdGhhdCByZXByb2R1Y2VzIHRoZSBwcm9ibGVtLCBhbmQgY2FuIGJlIHNoYXJl
ZCwgd2UgbWlnaHQgaGF2ZQphIGxvb2suIFRoYW5rcyEKCkJlc3QsCk5vcmJlcnQKCgoKCkFtYXpv
biBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJl
cmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmlj
aApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJs
b3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
