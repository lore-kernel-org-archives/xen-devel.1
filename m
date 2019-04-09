Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D670C282CE
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:23:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 320B620857
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 320B620857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpmn-00008s-D2; Tue, 09 Apr 2019 12:23:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpml-00007i-Tw
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:23:31 +0000
X-Inumbo-ID: 47fc1670-5ac2-11e9-8687-4b473677c2b1
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47fc1670-5ac2-11e9-8687-4b473677c2b1;
 Tue, 09 Apr 2019 12:23:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83100382"
Date: Tue, 9 Apr 2019 13:23:19 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: "Nuernberger, Stefan" <snu@amazon.de>
Message-ID: <20190409122319.GB30543@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-33-wei.liu2@citrix.com>
 <1552943684.6788.106.camel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1552943684.6788.106.camel@amazon.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH RFC 32/55] efi: switch EFI L4 table to use
 new APIs
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409122319.noPKQDZwGtj0vAA38wJXzkiPhpxGSZpK7TwuMkzvl1g@z>

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDk6MTQ6NDRQTSArMDAwMCwgTnVlcm5iZXJnZXIsIFN0
ZWZhbiB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDItMDcgYXQgMTY6NDQgKzAwMDAsIFdlaSBMaXUg
d3JvdGU6Cj4gPiBUaGlzIHJlcXVpcmVzIHN0b3JpbmcgdGhlIE1GTiBpbnN0ZWFkIG9mIGxpbmVh
ciBhZGRyZXNzIG9mIHRoZSBMNAo+ID4gdGFibGUuIEFkanVzdCBjb2RlIGFjY29yZGluZ2x5Lgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4g
LS0tCj4gPiDCoHhlbi9hcmNoL3g4Ni9lZmkvcnVudGltZS5oIHwgMTIgKysrKysrKysrLS0tCj4g
PiDCoHhlbi9jb21tb24vZWZpL2Jvb3QuY8KgwqDCoMKgwqDCoHzCoMKgOCArKysrKystLQo+ID4g
wqB4ZW4vY29tbW9uL2VmaS9lZmkuaMKgwqDCoMKgwqDCoMKgfMKgwqAzICsrLQo+ID4gwqB4ZW4v
Y29tbW9uL2VmaS9ydW50aW1lLmPCoMKgwqB8wqDCoDggKysrKy0tLS0KPiA+IMKgNCBmaWxlcyBj
aGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9lZmkvcnVudGltZS5oIGIveGVuL2FyY2gveDg2L2VmaS9ydW50
aW1lLmgKPiA+IGluZGV4IGQ5ZWI4ZjVjMjcuLjI3N2QyMzc5NTMgMTAwNjQ0Cj4gPiAtLS0gYS94
ZW4vYXJjaC94ODYvZWZpL3J1bnRpbWUuaAo+ID4gKysrIGIveGVuL2FyY2gveDg2L2VmaS9ydW50
aW1lLmgKPiA+IEBAIC0yLDExICsyLDE3IEBACj4gPiDCoCNpbmNsdWRlIDxhc20vbWMxNDY4MThy
dGMuaD4KPiA+IMKgCj4gPiDCoCNpZm5kZWYgQ09NUEFUCj4gPiAtbDRfcGdlbnRyeV90ICpfX3Jl
YWRfbW9zdGx5IGVmaV9sNF9wZ3RhYmxlOwo+ID4gK21mbl90IF9fcmVhZF9tb3N0bHkgZWZpX2w0
X21mbiA9IElOVkFMSURfTUZOX0lOSVRJQUxJWkVSOwo+ID4gwqAKPiA+IMKgdm9pZCBlZmlfdXBk
YXRlX2w0X3BndGFibGUodW5zaWduZWQgaW50IGw0aWR4LCBsNF9wZ2VudHJ5X3QgbDRlKQo+ID4g
wqB7Cj4gPiAtwqDCoMKgwqBpZiAoIGVmaV9sNF9wZ3RhYmxlICkKPiA+IC3CoMKgwqDCoMKgwqDC
oMKgbDRlX3dyaXRlKGVmaV9sNF9wZ3RhYmxlICsgbDRpZHgsIGw0ZSk7Cj4gPiArwqDCoMKgwqBp
ZiAoICFtZm5fZXEoZWZpX2w0X21mbiwgSU5WQUxJRF9NRk4pICkKPiA+ICvCoMKgwqDCoHsKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgbDRfcGdlbnRyeV90ICpsNHQ7Cj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgwqDCoGw0dCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhlZmlfbDRfbWZuKTsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgbDRlX3dyaXRlKGw0dCArIGw0aWR4LCBsNGUpOwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsNHQpOwo+IAo+IG5pdDogVGhpcyBkb2Vzbid0
IG5lZWQgdGhlIGltcGxpY2l0IE5VTEwgYXNzaWdubWVudC4gVGhlIG5vbi1tYWNybwo+IHVubWFw
X3hlbl9wYWdldGFibGVfbmV3IGlzIHN1ZmZpY2llbnQgaGVyZS4gRG8geW91IGhhdmUgYSBndWlk
ZWxpbmUgb24KPiB3aGVuIHRvIHVzZSB0aGUgbWFjcm8gb3ZlciB0aGUgZnVuY3Rpb24gY2FsbD8g
SSBhc3N1bWUgdGhlIGNvbXBpbGVyCj4gZWxpbWluYXRlcyBtb3N0IG9mIHRoZSBkZWFkIHN0b3Jl
cyBvbiBmdW5jdGlvbiByZXR1cm4uCj4gCgpJIGludHJvZHVjZWQgdGhlIG1hY3JvIHN1Y2ggdGhh
dCBhbnkgbWlzdXNlIG9mIHN0YWxlIHBvaW50ZXIgY291bGQgYmUKY2F1Z2h0IGFzIGVhcmx5IGFz
IHBvc3NpYmxlLiBXZSd2ZSBnb3Qgc2ltaWxhciBjb25zdHJ1Y3QgLS0gc2VlIFhGUkVFLgoKSSBj
ZXJ0YWlubHkgaG9wZSBjb21waWxlcnMgY2FuIGJlY29tZSBzbWFydCBlbm91Z2guIFdlIGNhbiBh
bHNvCmVsaW1pbmF0ZSB1c2VsZXNzIGFzc2lnbm1lbnQgaW4gYSBsYXRlciBzZXJpZXMuIEkgZGlk
bid0IHNwZW5kIG11Y2ggdGltZQpnb2luZyBvdmVyIGFsbCB0aGUgcGxhY2VzIGR1cmluZyB0aGUg
ZGV2ZWxvcG1lbnQgb2YgdGhpcyBzZXJpZXMuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
