Return-Path: <SRS0=m2Ej=UD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFC3C282CE
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 08:42:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 956DC24AE7
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 08:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 956DC24AE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY50t-0003wS-CQ; Tue, 04 Jun 2019 08:41:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQpj=UD=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hY50s-0003wM-BE
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 08:41:46 +0000
X-Inumbo-ID: 923f0df6-86a4-11e9-8e31-e315d46a7eb6
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 923f0df6-86a4-11e9-8e31-e315d46a7eb6;
 Tue, 04 Jun 2019 08:41:40 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4FA1E3074B6B; Tue,  4 Jun 2019 11:41:39 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3037D303442F;
 Tue,  4 Jun 2019 11:41:39 +0300 (EEST)
To: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>
References: <20190516213752.1701-1-tamas@tklengyel.com>
 <20190516213752.1701-4-tamas@tklengyel.com>
 <5CF4D9CC02000078002346DC@prv1-mh.provo.novell.com>
 <CABfawh=LbZ6dTQhYS+pxkPLA_=8OrGpeYYnPeZ60bhZ6kzT2Ew@mail.gmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <ce707b41-6952-4497-838a-2eee825d1fdb@bitdefender.com>
Date: Tue, 4 Jun 2019 11:41:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=LbZ6dTQhYS+pxkPLA_=8OrGpeYYnPeZ60bhZ6kzT2Ew@mail.gmail.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v5 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190604084135.64o_fozrMkod40UXsXgin5CCmV2VpGdTvdGx_nbUbpc@z>

T24gNi8zLzE5IDc6MzggUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiBPbiBNb24sIEp1biAz
LCAyMDE5IGF0IDI6MjYgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToK
Pj4KPj4+Pj4gT24gMTYuMDUuMTkgYXQgMjM6MzcsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90
ZToKPj4+IERpc2FibGUgaXQgYnkgZGVmYXVsdCBhcyBpdCBpcyBvbmx5IGFuIGV4cGVyaW1lbnRh
bCBzdWJzeXN0ZW0uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1h
c0B0a2xlbmd5ZWwuY29tPgo+Pj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Pj4+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4gQ2M6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4+PiBDYzogUm9nZXIgUGF1IE1vbm5lIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KPj4+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFw
QGV1LmNpdHJpeC5jb20+Cj4+PiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+Cj4+PiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+IENj
OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4+PiBDYzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+Pj4gQ2M6IFRpbSBE
ZWVnYW4gPHRpbUB4ZW4ub3JnPgo+Pj4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBA
ZXUuY2l0cml4LmNvbT4KPj4+IC0tLS0KPj4+IHY0OiBhZGQgQVNTRVJUX1VOUkVBQ0hBQkxFIHRv
IGlubGluZWQgZnVuY3Rpb25zIHdoZXJlIGFwcGxpY2FibGUgJiBvdGhlcgo+Pj4gZml4dXBzCj4+
PiAtLS0KPj4+ICAgeGVuL2FyY2gveDg2L0tjb25maWcgICAgICAgICAgICAgIHwgIDYgKysrKyst
Cj4+PiAgIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgICB8ICAyICsrCj4+PiAgIHhl
bi9hcmNoL3g4Ni9kb21jdGwuYyAgICAgICAgICAgICB8ICAyICsrCj4+PiAgIHhlbi9hcmNoL3g4
Ni9tbS9NYWtlZmlsZSAgICAgICAgICB8ICAyICstCj4+PiAgIHhlbi9hcmNoL3g4Ni94ODZfNjQv
Y29tcGF0L21tLmMgICB8ICAyICsrCj4+PiAgIHhlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYyAgICAg
ICAgICB8ICAyICsrCj4+PiAgIHhlbi9jb21tb24vS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAz
IC0tLQo+Pj4gICB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgICAgICAgfCAgMiArLQo+Pj4g
ICB4ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgICAgICAgICAgfCAgMiArLQo+Pj4gICB4ZW4vY29t
bW9uL21lbW9yeS5jICAgICAgICAgICAgICAgfCAgMiArLQo+Pj4gICB4ZW4vY29tbW9uL3ZtX2V2
ZW50LmMgICAgICAgICAgICAgfCAgNiArKystLS0KPj4+ICAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9t
ZW1fc2hhcmluZy5oIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gICB4ZW4v
aW5jbHVkZS9hc20teDg2L21tLmggICAgICAgICAgfCAgMyArKysKPj4+ICAgeGVuL2luY2x1ZGUv
eGVuL3NjaGVkLmggICAgICAgICAgIHwgIDIgKy0KPj4+ICAgeGVuL2luY2x1ZGUveHNtL2R1bW15
LmggICAgICAgICAgIHwgIDIgKy0KPj4+ICAgeGVuL2luY2x1ZGUveHNtL3hzbS5oICAgICAgICAg
ICAgIHwgIDQgKystLQo+Pj4gICB4ZW4veHNtL2R1bW15LmMgICAgICAgICAgICAgICAgICAgfCAg
MiArLQo+Pj4gICB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgICAgICAgICAgICAgfCAgNCArKy0tCj4+
PiAgIDE4IGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+
Pgo+PiBEYW5pZWwsIGl0IGxvb2tzIGxpa2UgeW91IHdlcmVuJ3QgQ2MtZWQgaGVyZSwgYnV0IHlv
dXIgYWNrIGlzIG5lZWRlZC4KPiAKPiBJbmRlZWQsIEkndmUgYWxzbyBzZWVtIHRvIGhhdmUgbWlz
c2VkIENDLWluZyBSYXp2YW4gKGZpeGVkIG5vdykuCgpBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1
IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
