Return-Path: <SRS0=BdeL=TQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CB6C04AAF
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 13:24:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F06820815
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 13:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F06820815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGMX-0006H4-De; Thu, 16 May 2019 13:23:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRGMW-0006Gz-Fu
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:23:56 +0000
X-Inumbo-ID: da5fe8f4-77dd-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id da5fe8f4-77dd-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:23:55 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: u6iVtaG81jRwkgS1wOGLVtbDopQ89l1k+RfRjF6GCHI9ebgJU1axwZ5b9nGvJwBBPr/ZIbkYI7
 w+cImiprXLrXNwMv6ihQlbqcbRUb/8gmd7Fh45QuTL/uV9twkr4TCsO4hlv7wKpluxhJxFC/Qe
 sCqhu3EtL60FaEYWoBnogWB0+NrGzoDS/1X/ZJLO1wyBa2HYjEDfkbhp97GQ8dlGXlmsai3NG0
 ddPAZwzbJSa6nLFWFKiyUtAvGXK3vMT9qgPcFRsfbRwYIaJNR9BDcmkg1Adk/glewKkH4Xas1A
 yDA=
X-SBRS: 2.7
X-MesageID: 520271
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="520271"
Date: Thu, 16 May 2019 14:23:52 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190516132352.GF2798@zion.uk.xensource.com>
References: <20190515114015.25492-1-anthony.perard@citrix.com>
 <651154bc-9710-5e03-23a2-d04a894853cc@citrix.com>
 <20190515125530.GB1245@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515125530.GB1245@perard.uk.xensource.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] libxc: elf_kernel loader: Remove check for
 shstrtab
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190516132352.vGinPKaVsD8IDvAcPvWC9uUtQ3_u9FH3q-8tiipLJPQ@z>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDE6NTU6MzBQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDE6MDc6MDNQTSArMDEwMCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPiA+IE9uIDE1LzA1LzIwMTkgMTI6NDAsIEFudGhvbnkgUEVSQVJEIHdy
b3RlOgo+ID4gPiBUaGlzIHdhcyBwcm9iYWJseSB1c2VmdWwgdG8gbG9hZCBFTEYgTm90ZSwgYnV0
IG5vdyBFTEYgbm90ZXMKPiA+ID4gInNob3VsZCBsaXZlIGluIGEgUFRfTk9URSBzZWdtZW50IiAo
ZWxmbm90ZS5oKS4KPiA+ID4KPiA+ID4gV2l0aCBub3RlcyBsaXZpbmcgaW4gc2VnbWVudCwgdGhl
cmUgYXJlIG5vIG5lZWQgZm9yIHNlY3Rpb25zLCBzbyB0aGVyZQo+ID4gPiBpcyBub3RoaW5nIHRv
IGJlIHN0b3JlZCBpbiB0aGUgc2hzdHJ0YWIuCj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggd291bGQg
YWxsb3cgdG8gd3JpdGUgYSBzaW1wbGVyIEVMRiBoZWFkZXIgZm9yIGFuIE9WTUYgYmxvYgo+ID4g
PiAod2hpY2ggaXNuJ3QgYW4gRUxGKSBhbmQgYWxsb3cgaXQgdG8gYmUgbG9hZGVkIGFzIGEgUFZI
IGtlcm5lbC4gVGhlCj4gPiA+IGhlYWRlciBvbmx5IG5lZWRzIHRvIGRlY2xhcmUgdHdvIHByb2dy
YW0gc2VnbWVudHM6Cj4gPiA+IC0gb25lIHRvIHRlbGwgYW4gRUxGIGxvYWRlciB3aGVyZSB0byBw
dXQgdGhlIGJsb2IsCj4gPiA+IC0gb25lIGZvciBhIFhlbiBFTEZOT1RFLgo+ID4gPgo+ID4gPiBU
aGUgRUxGTk9URSBpcyB0byBjb21wbHkgdG8gdGhlIHB2aCBkZXNpZ24gd2hpY2ggd2FudHMgdGhl
Cj4gPiA+IFhFTl9FTEZOT1RFX1BIWVMzMl9FTlRSWSB0byBkZWNsYXJlIGEgYmxvYiBhcyBjb21w
YXB0aWJsZSB3aXRoIHRoZSBQVkgKPiA+ID4gYm9vdCBBQkkuCj4gPiA+Cj4gPiA+IE5vdGUgdGhh
dCB3aXRob3V0IHRoZSBFTEZOT1RFLCBsaWJ4YyB3aWxsIGxvYWQgYW4gRUxGIGJ1dCB3aXRoCj4g
PiA+IHRoZSBwbGFpbiBFTEYgbG9hZGVyLCB3aGljaCBkb2Vzbid0IGNoZWNrIGZvciBzaHN0cnRh
Yi4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgdG9vbHMvbGlieGMveGNfZG9tX2VsZmxv
YWRlci5jIHwgOSAtLS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygt
KQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfZG9tX2VsZmxvYWRlci5j
IGIvdG9vbHMvbGlieGMveGNfZG9tX2VsZmxvYWRlci5jCj4gPiA+IGluZGV4IDgyYjVmMmVlNzku
LmIzMjdkYjIxOWQgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rvb2xzL2xpYnhjL3hjX2RvbV9lbGZsb2Fk
ZXIuYwo+ID4gPiArKysgYi90b29scy9saWJ4Yy94Y19kb21fZWxmbG9hZGVyLmMKPiA+ID4gQEAg
LTE2NSwxNSArMTY1LDYgQEAgc3RhdGljIGVsZl9uZWdlcnJub3ZhbCB4Y19kb21fcGFyc2VfZWxm
X2tlcm5lbChzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20pCj4gPiA+ICAgICAgICAgIHJldHVybiBy
YzsKPiA+ID4gICAgICB9Cj4gPiA+ICAKPiA+ID4gLSAgICAvKiBGaW5kIHRoZSBzZWN0aW9uLWhl
YWRlciBzdHJpbmdzIHRhYmxlLiAqLwo+ID4gPiAtICAgIGlmICggRUxGX1BUUlZBTF9JTlZBTElE
KGVsZi0+c2VjX3N0cnRhYikgKQo+ID4gPiAtICAgIHsKPiA+ID4gLSAgICAgICAgeGNfZG9tX3Bh
bmljKGRvbS0+eGNoLCBYQ19JTlZBTElEX0tFUk5FTCwgIiVzOiBFTEYgaW1hZ2UiCj4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAiIGhhcyBubyBzaHN0cnRhYiIsIF9fRlVOQ1RJT05fXyk7Cj4g
PiA+IC0gICAgICAgIHJjID0gLUVJTlZBTDsKPiA+ID4gLSAgICAgICAgZ290byBvdXQ7Cj4gPiA+
IC0gICAgfQo+ID4gCj4gPiBUaGlzIG1pZ2h0IGJlIGZpbmUgZm9yIG5ld2VyIGJpbmFyaWVzLCBi
dXQgeW91J2xsIGJyZWFrIG9sZGVyIG9uZXMuCj4gPiAKPiA+IEluc3RlYWQsIHlvdSBzaG91bGQg
c2tpcCBzZWFyY2hpbmcgZm9yIHN0cnRhYiBpZiB3ZSd2ZSBhbHJlYWR5IGxvY2F0ZWQKPiA+IHRo
ZSBYZW4gbm90ZXMuCj4gCj4gOi0oLCBtYXliZSBJIHNob3VsZCBoYXZlIGdvbmUgZnV0aGVyIG9u
IGV4cGxhaW5pbmcgd2h5IHRoaXMgY2hlY2sgaXMKPiB1c2VsZXNzIChhbmQgcHJvYmFibHkgYXQg
dGhlIHdyb25nIHBsYWNlLCBhdCBsZWFzdCBub3cpLgo+IAo+IFRoZSBuZXh0IHRoaW5nIHRoYXQn
cyBkb25lIGFmdGVyIHRoYXQgY2hlY2sgaXM6Cj4gZWxmX3BhcnNlX2JpbmFyeSgpCj4gZWxmX3hl
bl9wYXJzZSgpCj4gVGhvc2UgYXJlIGxvY2F0ZWQgaW4gInhlbi9jb21tb24vbGliZWxmIiwgYW5k
IHRob3NlIGFyZSB0aGUgZnVuY3Rpb25zCj4gdGhhdCBhY3R1YWxseSB0YWtlcyBjYXJlIG9mIGV4
dHJhY3RpbmcgZGF0YSBmcm9tIHRoZSBlbGYuCj4gCj4gZWxmX3hlbl9wYXJzZSgpIGZpcnN0IGxv
b2sgZm9yIFhlbiBFTEZOT1RFIGluIHRoZSBwcm9ncmFtIHNlZ21lbnRzCj4gKHBoZHIsIFBUX05P
VEUpIGFuZCBza2lwIHJlYWRpbmcgc2VjdGlvbiBhbmQgc3RydGFiIGlmIGZvdW5kLgo+IAo+IFNv
LCBsaWJlbGYgYWxyZWFkeSBkb2VzIHdoYXQgeW91IGFza2VkIGZvciA7LSkuCj4gCj4gVGhlIHNo
c3RydGFiIGFyZSBvbmx5IHVzZWQgdG8gbG9vayBmb3IgbGVnYWN5IF9feGVuX2d1ZXN0IHNlY3Rp
b24gbmFtZXMuCj4gU2luY2UgRUxGTk9URXMgd2FzIHVzZWQsIHRoZSBuYW1lIG9mIHNlY3Rpb24g
YXJlbid0IGxvb2tlZCBhdC4KPiAKPiBJIGhvcGUgdGhhdCBoZWxwLgo+IAoKQW5kcmV3LCBkbyB5
b3Ugc3RpbGwgaGF2ZSBjb25jZXJuPwoKV2VpLgoKPiBUaGFua3MsCj4gCj4gLS0gCj4gQW50aG9u
eSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
