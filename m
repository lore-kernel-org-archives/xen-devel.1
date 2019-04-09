Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC0BC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:57:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E87972084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E87972084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDqJC-00045n-AG; Tue, 09 Apr 2019 12:57:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDqJB-00045i-1m
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:57:01 +0000
X-Inumbo-ID: f64374ac-5ac6-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f64374ac-5ac6-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 12:56:59 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 09 Apr 2019 06:56:58 -0600
Message-Id: <5CAC96980200007800225DCB@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 09 Apr 2019 06:56:56 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-33-wei.liu2@citrix.com>
 <1552943684.6788.106.camel@amazon.de>
 <20190409122319.GB30543@zion.uk.xensource.com>
In-Reply-To: <20190409122319.GB30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Stefan Nuernberger <snu@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409125656.j9eGY56C0HQhSO5JZW5saGh7Rq-xoaxDwkeN2H5Mugg@z>

Pj4+IE9uIDA5LjA0LjE5IGF0IDE0OjIzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDk6MTQ6NDRQTSArMDAwMCwgTnVlcm5iZXJnZXIsIFN0
ZWZhbiB3cm90ZToKPj4gT24gVGh1LCAyMDE5LTAyLTA3IGF0IDE2OjQ0ICswMDAwLCBXZWkgTGl1
IHdyb3RlOgo+PiA+IFRoaXMgcmVxdWlyZXMgc3RvcmluZyB0aGUgTUZOIGluc3RlYWQgb2YgbGlu
ZWFyIGFkZHJlc3Mgb2YgdGhlIEw0Cj4+ID4gdGFibGUuIEFkanVzdCBjb2RlIGFjY29yZGluZ2x5
Lgo+PiA+IAo+PiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
Cj4+ID4gLS0tCj4+ID4gIHhlbi9hcmNoL3g4Ni9lZmkvcnVudGltZS5oIHwgMTIgKysrKysrKysr
LS0tCj4+ID4gIHhlbi9jb21tb24vZWZpL2Jvb3QuYyAgICAgIHwgIDggKysrKysrLS0KPj4gPiAg
eGVuL2NvbW1vbi9lZmkvZWZpLmggICAgICAgfCAgMyArKy0KPj4gPiAgeGVuL2NvbW1vbi9lZmkv
cnVudGltZS5jICAgfCAgOCArKysrLS0tLQo+PiA+ICA0IGZpbGVzIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+PiA+IAo+PiA+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvZWZpL3J1bnRpbWUuaCBiL3hlbi9hcmNoL3g4Ni9lZmkvcnVudGltZS5oCj4+ID4gaW5k
ZXggZDllYjhmNWMyNy4uMjc3ZDIzNzk1MyAxMDA2NDQKPj4gPiAtLS0gYS94ZW4vYXJjaC94ODYv
ZWZpL3J1bnRpbWUuaAo+PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9lZmkvcnVudGltZS5oCj4+ID4g
QEAgLTIsMTEgKzIsMTcgQEAKPj4gPiAgI2luY2x1ZGUgPGFzbS9tYzE0NjgxOHJ0Yy5oPgo+PiA+
ICAKPj4gPiAgI2lmbmRlZiBDT01QQVQKPj4gPiAtbDRfcGdlbnRyeV90ICpfX3JlYWRfbW9zdGx5
IGVmaV9sNF9wZ3RhYmxlOwo+PiA+ICttZm5fdCBfX3JlYWRfbW9zdGx5IGVmaV9sNF9tZm4gPSBJ
TlZBTElEX01GTl9JTklUSUFMSVpFUjsKPj4gPiAgCj4+ID4gIHZvaWQgZWZpX3VwZGF0ZV9sNF9w
Z3RhYmxlKHVuc2lnbmVkIGludCBsNGlkeCwgbDRfcGdlbnRyeV90IGw0ZSkKPj4gPiAgewo+PiA+
IC0gICAgaWYgKCBlZmlfbDRfcGd0YWJsZSApCj4+ID4gLSAgICAgICAgbDRlX3dyaXRlKGVmaV9s
NF9wZ3RhYmxlICsgbDRpZHgsIGw0ZSk7Cj4+ID4gKyAgICBpZiAoICFtZm5fZXEoZWZpX2w0X21m
biwgSU5WQUxJRF9NRk4pICkKPj4gPiArICAgIHsKPj4gPiArICAgICAgICBsNF9wZ2VudHJ5X3Qg
Kmw0dDsKPj4gPiArCj4+ID4gKyAgICAgICAgbDR0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGVm
aV9sNF9tZm4pOwo+PiA+ICsgICAgICAgIGw0ZV93cml0ZShsNHQgKyBsNGlkeCwgbDRlKTsKPj4g
PiArICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsNHQpOwo+PiAKPj4gbml0OiBUaGlz
IGRvZXNuJ3QgbmVlZCB0aGUgaW1wbGljaXQgTlVMTCBhc3NpZ25tZW50LiBUaGUgbm9uLW1hY3Jv
Cj4+IHVubWFwX3hlbl9wYWdldGFibGVfbmV3IGlzIHN1ZmZpY2llbnQgaGVyZS4gRG8geW91IGhh
dmUgYSBndWlkZWxpbmUgb24KPj4gd2hlbiB0byB1c2UgdGhlIG1hY3JvIG92ZXIgdGhlIGZ1bmN0
aW9uIGNhbGw/IEkgYXNzdW1lIHRoZSBjb21waWxlcgo+PiBlbGltaW5hdGVzIG1vc3Qgb2YgdGhl
IGRlYWQgc3RvcmVzIG9uIGZ1bmN0aW9uIHJldHVybi4KPj4gCj4gCj4gSSBpbnRyb2R1Y2VkIHRo
ZSBtYWNybyBzdWNoIHRoYXQgYW55IG1pc3VzZSBvZiBzdGFsZSBwb2ludGVyIGNvdWxkIGJlCj4g
Y2F1Z2h0IGFzIGVhcmx5IGFzIHBvc3NpYmxlLiBXZSd2ZSBnb3Qgc2ltaWxhciBjb25zdHJ1Y3Qg
LS0gc2VlIFhGUkVFLgo+IAo+IEkgY2VydGFpbmx5IGhvcGUgY29tcGlsZXJzIGNhbiBiZWNvbWUg
c21hcnQgZW5vdWdoLiBXZSBjYW4gYWxzbwo+IGVsaW1pbmF0ZSB1c2VsZXNzIGFzc2lnbm1lbnQg
aW4gYSBsYXRlciBzZXJpZXMuIEkgZGlkbid0IHNwZW5kIG11Y2ggdGltZQo+IGdvaW5nIG92ZXIg
YWxsIHRoZSBwbGFjZXMgZHVyaW5nIHRoZSBkZXZlbG9wbWVudCBvZiB0aGlzIHNlcmllcy4KCkJ1
dCBpdCBzdXJlbHkgd291bGRuJ3QgYmUgdG9vIGhhcmQgdG8gc3dpdGNoIHRvIHRoZSBsb3dlci1j
YXNlCnNpYmxpbmcgZnVuY3Rpb24gaW4gY2FzZXMgd2hlcmUgdGhlIE5VTEwgYXNzaWdubWVudCBp
cyBwb2ludGxlc3M/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
