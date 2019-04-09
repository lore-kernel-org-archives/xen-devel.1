Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47FDC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 13:00:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A61682084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 13:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A61682084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDqMi-0004vU-7w; Tue, 09 Apr 2019 13:00:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDqMg-0004vM-Mc
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 13:00:38 +0000
X-Inumbo-ID: 776cfbea-5ac7-11e9-9adf-1785af25a390
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 776cfbea-5ac7-11e9-9adf-1785af25a390;
 Tue, 09 Apr 2019 13:00:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83103581"
Date: Tue, 9 Apr 2019 14:00:28 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190409130028.GP30543@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-33-wei.liu2@citrix.com>
 <1552943684.6788.106.camel@amazon.de>
 <20190409122319.GB30543@zion.uk.xensource.com>
 <5CAC96980200007800225DCB@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CAC96980200007800225DCB@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Stefan Nuernberger <snu@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409130028.bQ3c1pE910CLqwbgLoX6geKHE6eNXtkgqUtJ62oPgvM@z>

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDY6NTY6NTZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA5LjA0LjE5IGF0IDE0OjIzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBNb24sIE1hciAxOCwgMjAxOSBhdCAwOToxNDo0NFBNICswMDAwLCBOdWVybmJl
cmdlciwgU3RlZmFuIHdyb3RlOgo+ID4+IE9uIFRodSwgMjAxOS0wMi0wNyBhdCAxNjo0NCArMDAw
MCwgV2VpIExpdSB3cm90ZToKPiA+PiA+IFRoaXMgcmVxdWlyZXMgc3RvcmluZyB0aGUgTUZOIGlu
c3RlYWQgb2YgbGluZWFyIGFkZHJlc3Mgb2YgdGhlIEw0Cj4gPj4gPiB0YWJsZS4gQWRqdXN0IGNv
ZGUgYWNjb3JkaW5nbHkuCj4gPj4gPiAKPiA+PiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4gPj4gPiAtLS0KPiA+PiA+ICB4ZW4vYXJjaC94ODYvZWZpL3J1
bnRpbWUuaCB8IDEyICsrKysrKysrKy0tLQo+ID4+ID4gIHhlbi9jb21tb24vZWZpL2Jvb3QuYyAg
ICAgIHwgIDggKysrKysrLS0KPiA+PiA+ICB4ZW4vY29tbW9uL2VmaS9lZmkuaCAgICAgICB8ICAz
ICsrLQo+ID4+ID4gIHhlbi9jb21tb24vZWZpL3J1bnRpbWUuYyAgIHwgIDggKysrKy0tLS0KPiA+
PiA+ICA0IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+
ID4+ID4gCj4gPj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2VmaS9ydW50aW1lLmggYi94
ZW4vYXJjaC94ODYvZWZpL3J1bnRpbWUuaAo+ID4+ID4gaW5kZXggZDllYjhmNWMyNy4uMjc3ZDIz
Nzk1MyAxMDA2NDQKPiA+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9lZmkvcnVudGltZS5oCj4gPj4g
PiArKysgYi94ZW4vYXJjaC94ODYvZWZpL3J1bnRpbWUuaAo+ID4+ID4gQEAgLTIsMTEgKzIsMTcg
QEAKPiA+PiA+ICAjaW5jbHVkZSA8YXNtL21jMTQ2ODE4cnRjLmg+Cj4gPj4gPiAgCj4gPj4gPiAg
I2lmbmRlZiBDT01QQVQKPiA+PiA+IC1sNF9wZ2VudHJ5X3QgKl9fcmVhZF9tb3N0bHkgZWZpX2w0
X3BndGFibGU7Cj4gPj4gPiArbWZuX3QgX19yZWFkX21vc3RseSBlZmlfbDRfbWZuID0gSU5WQUxJ
RF9NRk5fSU5JVElBTElaRVI7Cj4gPj4gPiAgCj4gPj4gPiAgdm9pZCBlZmlfdXBkYXRlX2w0X3Bn
dGFibGUodW5zaWduZWQgaW50IGw0aWR4LCBsNF9wZ2VudHJ5X3QgbDRlKQo+ID4+ID4gIHsKPiA+
PiA+IC0gICAgaWYgKCBlZmlfbDRfcGd0YWJsZSApCj4gPj4gPiAtICAgICAgICBsNGVfd3JpdGUo
ZWZpX2w0X3BndGFibGUgKyBsNGlkeCwgbDRlKTsKPiA+PiA+ICsgICAgaWYgKCAhbWZuX2VxKGVm
aV9sNF9tZm4sIElOVkFMSURfTUZOKSApCj4gPj4gPiArICAgIHsKPiA+PiA+ICsgICAgICAgIGw0
X3BnZW50cnlfdCAqbDR0Owo+ID4+ID4gKwo+ID4+ID4gKyAgICAgICAgbDR0ID0gbWFwX3hlbl9w
YWdldGFibGVfbmV3KGVmaV9sNF9tZm4pOwo+ID4+ID4gKyAgICAgICAgbDRlX3dyaXRlKGw0dCAr
IGw0aWR4LCBsNGUpOwo+ID4+ID4gKyAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDR0
KTsKPiA+PiAKPiA+PiBuaXQ6IFRoaXMgZG9lc24ndCBuZWVkIHRoZSBpbXBsaWNpdCBOVUxMIGFz
c2lnbm1lbnQuIFRoZSBub24tbWFjcm8KPiA+PiB1bm1hcF94ZW5fcGFnZXRhYmxlX25ldyBpcyBz
dWZmaWNpZW50IGhlcmUuIERvIHlvdSBoYXZlIGEgZ3VpZGVsaW5lIG9uCj4gPj4gd2hlbiB0byB1
c2UgdGhlIG1hY3JvIG92ZXIgdGhlIGZ1bmN0aW9uIGNhbGw/IEkgYXNzdW1lIHRoZSBjb21waWxl
cgo+ID4+IGVsaW1pbmF0ZXMgbW9zdCBvZiB0aGUgZGVhZCBzdG9yZXMgb24gZnVuY3Rpb24gcmV0
dXJuLgo+ID4+IAo+ID4gCj4gPiBJIGludHJvZHVjZWQgdGhlIG1hY3JvIHN1Y2ggdGhhdCBhbnkg
bWlzdXNlIG9mIHN0YWxlIHBvaW50ZXIgY291bGQgYmUKPiA+IGNhdWdodCBhcyBlYXJseSBhcyBw
b3NzaWJsZS4gV2UndmUgZ290IHNpbWlsYXIgY29uc3RydWN0IC0tIHNlZSBYRlJFRS4KPiA+IAo+
ID4gSSBjZXJ0YWlubHkgaG9wZSBjb21waWxlcnMgY2FuIGJlY29tZSBzbWFydCBlbm91Z2guIFdl
IGNhbiBhbHNvCj4gPiBlbGltaW5hdGUgdXNlbGVzcyBhc3NpZ25tZW50IGluIGEgbGF0ZXIgc2Vy
aWVzLiBJIGRpZG4ndCBzcGVuZCBtdWNoIHRpbWUKPiA+IGdvaW5nIG92ZXIgYWxsIHRoZSBwbGFj
ZXMgZHVyaW5nIHRoZSBkZXZlbG9wbWVudCBvZiB0aGlzIHNlcmllcy4KPiAKPiBCdXQgaXQgc3Vy
ZWx5IHdvdWxkbid0IGJlIHRvbyBoYXJkIHRvIHN3aXRjaCB0byB0aGUgbG93ZXItY2FzZQo+IHNp
YmxpbmcgZnVuY3Rpb24gaW4gY2FzZXMgd2hlcmUgdGhlIE5VTEwgYXNzaWdubWVudCBpcyBwb2lu
dGxlc3M/CgpJdCBjYW4gYmUgZG9uZSB3aGVuIEknbSByZWFzb25hYmx5IHN1cmUgYWJvdXQgdGhl
IGZpbmFsIGluY2FybmF0aW9uIG9mCnRoaXMgc2VyaWVzLgoKV2VpLgoKPiAKPiBKYW4KPiAKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
