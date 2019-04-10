Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE71C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 18:38:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 771D220830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 18:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 771D220830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEI6x-0003DX-Fn; Wed, 10 Apr 2019 18:38:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sbnS=SM=intel.com=jordan.l.justen@srs-us1.protection.inumbo.net>)
 id 1hEI6w-0003DS-Ak
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 18:38:14 +0000
X-Inumbo-ID: cb3b7a01-5bbf-11e9-92d7-bc764e045a96
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb3b7a01-5bbf-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 18:38:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Apr 2019 11:37:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,334,1549958400"; d="scan'208";a="222309304"
Received: from askirtik-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.254.188.249])
 by orsmga001.jf.intel.com with ESMTP; 10 Apr 2019 11:37:10 -0700
MIME-Version: 1.0
In-Reply-To: <a3e5b97c-6dc7-788f-99a8-769e37f3a8d5@redhat.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-3-anthony.perard@citrix.com>
 <155488970861.20447.12525571872411959890@jljusten-skl>
 <a3e5b97c-6dc7-788f-99a8-769e37f3a8d5@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
 Laszlo Ersek <lersek@redhat.com>, devel@edk2.groups.io
From: Jordan Justen <jordan.l.justen@intel.com>
Message-ID: <155492143006.23894.8253130602441997952@jljusten-skl>
User-Agent: alot/0.8
Date: Wed, 10 Apr 2019 11:37:10 -0700
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 02/31] OvmfPkg: Create
 platform XenOvmf
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410183710.QD2n2cVo58QaOrJAP6zcBDySnNcPxjOj_jBgwu22toM@z>

T24gMjAxOS0wNC0xMCAwNzoyNzoxNSwgTGFzemxvIEVyc2VrIHdyb3RlOgo+IE9uIDA0LzEwLzE5
IDExOjQ4LCBKb3JkYW4gSnVzdGVuIHdyb3RlOgo+ID4gT24gMjAxOS0wNC0wOSAwNDowODoxNSwg
QW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPj4gVGhpcyBpcyBhIGNvcHkgb2YgT3ZtZlg2NCwgcmVt
b3ZpbmcgVmlydElPIGFuZCBzb21lIFNNTS4KPiA+Pgo+ID4+IFRoaXMgbmV3IHBsYXRmb3JtIHdp
bGwgYmUgY2hhbmdlZCB0byBtYWtlIGl0IHdvcmtzIG9uIHR3byB0eXBlcyBvZiBYZW4KPiA+PiBn
dWVzdDogSFZNIGFuZCBQVkguCj4gPj4KPiA+PiBDb21wYXJlIHRvIE92bWZYNjQsIHRoaXMgcGF0
Y2g6Cj4gPj4KPiA+PiAtIGNoYW5nZWQ6IFBMQVRGT1JNX0dVSUQsIE9VVFBVVF9ESVJFQ1RPUlks
IEZMQVNIX0RFRklOSVRJT04KPiA+PiAtIHJlbW92ZWQ6IFZpcnRpb0xpYiBjbGFzcyByZXNvbHV0
aW9uCj4gPj4gLSByZW1vdmVkOiBhbGwgVUVGSV9EUklWRVIgbW9kdWxlcyBmb3IgdmlydGlvIGRl
dmljZXMKPiA+PiAtIHJlbW92ZWQ6IERYRV9TTU1fRFJJVkVSIGFuZCBTTU1fQ09SRSBsaWIgY2xh
c3MgcmVzb2x1dGlvbnMKPiA+PiAtIHJlbW92ZWQ6IERYRV9TTU1fRFJJVkVSIGFuZCBTTU1fQ09S
RSBGREYgcnVsZXMKPiA+PiAtIHJlbW92ZWQ6IEV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBTTU1fUkVR
VUlSRT09dHJ1ZQo+ID4+IC0gcmVtb3ZlZDogRXZlcnl0aGluZyByZWxhdGVkIHRvIFNFQ1VSRV9C
T09UX0VOQUJMRT09dHJ1ZQo+ID4+IC0gcmVtb3ZlZDogRXZlcnl0aGluZyByZWxhdGVkIHRvIFRQ
TTJfRU5BQkxFPT10cnVlCj4gPj4gLSBjaGFuZ2VkOiBQY2RQY2lEaXNhYmxlQnVzRW51bWVyYXRp
b24gZHluYW1pYyBkZWZhdWx0IGZsaXBwZWQgdG8gVFJVRQo+ID4+IC0gY2hhbmdlZDogZGVmYXVs
dCBGRF9TSVpFX0lOX0tCIHRvIDJNLgo+ID4+Cj4gPj4gQ29udHJpYnV0ZWQtdW5kZXI6IFRpYW5v
Q29yZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQo+ID4+IFNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+ID4+IC0tLQo+ID4+ICBPdm1m
UGtnL3tPdm1mUGtnWDY0LmRzYyA9PiBYZW5Pdm1mLmRzY30gICAgIHwgMjAyICstLS0tLS0tLS0t
LS0tLS0tLS0tCj4gPiAKPiA+IEkgZ3Vlc3Mgd2UgYWxsIHdhbnQgb3VyIG5hbWUgdG8gYmUgZmly
c3QgOiksIGJ1dCBPdm1mWGVuIHNlZW1zIG1vcmUKPiA+IGxpa2UgdGhlIHBhdHRlcm4gdGhhdCBl
ZGsyIHVzZXMgd2hlbiBtYWtpbmcgc3ViLXBsYXRmb3Jtcy4KCkZvciBleGFtcGxlOiBBcm1WaXJ0
UGtnL0FybVZpcnRYZW4uZHNjCgo+ID4gCj4gPiBBbHNvLCBpbiBzb21lIGNhc2VzIHdlJ3ZlIHVz
ZWQgIWlmZGVmIHR5cGUgdGhpbmdzIHRvIGtlZXAgZHNjIGFuZCBmZGYKPiA+IGZpbGVzIGNvbW1v
bi4gV291bGQgdGhhdCBub3QgYmUgd29ya2FibGUgaGVyZT8gTWF5YmUgaXQgd291bGQgZ2V0IHRv
bwo+ID4gdWdseS4gOlwKPiAKPiBJJ3ZlIGJlZW4gaGFwcHkgd2l0aCBhIHNpbWlsYXIgWGVuPC0+
UUVNVSBzcGxpdCB1bmRlciBBcm1WaXJ0UGtnLgo+IER1cGxpY2F0aW9ucyBpbiB1cGRhdGVzIGFy
ZSB1c3VhbGx5IG5vdCBhIGh1Z2UgYnVyZGVuLCBhbmQga2VlcGluZyB0aGUKPiBmaWxlcyBzZXBh
cmF0ZSBoYXMgcHJvdmVkIHZlcnkgaGVscGZ1bCBmb3IgZGV0ZXJtaW5pbmcKPiBtYWludGFpbmVy
L3Jldmlld2VyL3Rlc3RlciByZXNwb25zaWJpbGl0eS4KPiAKPiA+IEl0IGNvdWxkIGhlbHAgdG8g
cHJldmVudCBoYXZpbmcgdG8gc3luYyBkc2MgY2hhbmdlcyBhY3Jvc3MsIGFuZAo+ID4gcHJldmVu
dCBjaGFuZ2VzIGZyb20gYmVpbmcgb21pdHRlZCBmb3IgWGVuIG9uIGFjY2lkZW50Lgo+IAo+IFRy
dWUsIGJ1dCBpbiBteSBleHBlcmllbmNlIHRoYXQncyBiZWVuIHRoZSBzbWFsbGVyIHByb2JsZW0u
IFRoZSBsYXJnZXIKPiBwcm9ibGVtIGhhcyBiZWVuIG1vZGlmeWluZyBYZW4gc3R1ZmYgaW4gdW5p
bnRlbmRlZCB3YXlzICg9IHJlZ3Jlc3NpbmcKPiBYZW4pLCBiZWNhdXNlIHdlIGNhbid0IHRlc3Qg
KG9yIGRvbid0IGV2ZW4gbm90aWNlKSB0aGUgWGVuLXNpZGUKPiBpbXBsaWNhdGlvbnMgb2YgY2hh
bmdlcyBtYWRlIHRvIGNvbW1vbiBzb3VyY2UuCgpEb2VzIHRoYXQgbWVhbiB5b3UgYXZvaWQgY2hh
bmdpbmcgQXJtVmlydFhlbi5kc2MgZW50aXJlbHksIG9yIHlvdSB0cnkKdG8gdXBkYXRlIGl0IHdo
ZW4gaXQgc2VlbXMgbGlrZWx5IHRvIG5vdCBjYXVzZSB0cm91YmxlPyBJIGNvdWxkIHNlZQp1bmlu
dGVuZGVkIGJyZWFrYWdlIGVpdGhlciB3YXkuCgpBbnl3YXksIGl0IHNvdW5kcyBsaWtlIGl0J3Mg
Z2VuZXJhbGx5IHdvcmtpbmcgb3V0IG9rYXkgd2l0aApBcm1WaXJ0WGVuLCBzbyBpdCBzZWVtcyBv
a2F5IHRvIGZvbGxvdyB0aGF0IHVuZGVyIE92bWZQa2cuCgotSm9yZGFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
