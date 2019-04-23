Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6021C10F03
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 16:02:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C6820811
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 16:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C6820811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIxrx-0000pU-PF; Tue, 23 Apr 2019 16:02:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RGA1=SZ=citrix.com=prvs=00953f314=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hIxrw-0000pM-JY
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 16:02:04 +0000
X-Inumbo-ID: 1f63b608-65e1-11e9-963b-4f03808271fd
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f63b608-65e1-11e9-963b-4f03808271fd;
 Tue, 23 Apr 2019 16:02:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,386,1549929600"; d="scan'208";a="89184248"
To: George Dunlap <george.dunlap@citrix.com>, Dongli Zhang
 <dongli.zhang@oracle.com>, <xen-devel@lists.xenproject.org>
References: <1555936799-15675-1-git-send-email-dongli.zhang@oracle.com>
 <d34d784e-9db9-b646-4099-8b787308fef2@citrix.com>
 <fd752460-921f-3e12-214c-029e595f81b3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c55d9f40-ae67-301b-bc80-8d73bbf053ba@citrix.com>
Date: Tue, 23 Apr 2019 17:00:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fd752460-921f-3e12-214c-029e595f81b3@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/1] xen/gnttab: print log at level
 XENLOG_ERR before panic
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
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, tim@xen.org, ian.jackson@eu.citrix.com,
 julien.grall@arm.com, jbeulich@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423160051.9DYGd00Edm1B8KeXp_ACaouISgAwzvdCpUTSQJ-xm9E@z>

T24gMjMvMDQvMjAxOSAxMjo0NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA0LzIzLzE5IDEx
OjM3IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyMi8wNC8yMDE5IDEzOjM5LCBEb25n
bGkgWmhhbmcgd3JvdGU6Cj4+PiBQcmludCBsb2cgYXQgbGV2ZWwgWEVOTE9HX0VSUiAoaW5zdGVh
ZCBYRU5MT0dfSU5GTykgYXMgZG9tYWluX2NyYXNoKCkKPj4+IGluZGljYXRlcyB0aGVyZSBpcyBm
YXRhbCBlcnJvci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEb25nbGkgWmhhbmcgPGRvbmdsaS56
aGFuZ0BvcmFjbGUuY29tPgo+Pj4gLS0tCj4+PiAgeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIHwg
MiArLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgYi94ZW4vY29tbW9u
L2dyYW50X3RhYmxlLmMKPj4+IGluZGV4IDgwNzI4ZWEuLjcyNWM2MTggMTAwNjQ0Cj4+PiAtLS0g
YS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPj4+ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFi
bGUuYwo+Pj4gQEAgLTEyODIsNyArMTI4Miw3IEBAIHVubWFwX2NvbW1vbigKPj4+ICAgICAgaWYg
KCB1bmxpa2VseSgocmQgPSByY3VfbG9ja19kb21haW5fYnlfaWQoZG9tKSkgPT0gTlVMTCkgKQo+
Pj4gICAgICB7Cj4+PiAgICAgICAgICAvKiBUaGlzIGNhbiBoYXBwZW4gd2hlbiBhIGdyYW50IGlz
IGltcGxpY2l0bHkgdW5tYXBwZWQuICovCj4+PiAtICAgICAgICBnZHByaW50ayhYRU5MT0dfSU5G
TywgIkNvdWxkIG5vdCBmaW5kIGRvbWFpbiAlZFxuIiwgZG9tKTsKPj4+ICsgICAgICAgIGdkcHJp
bnRrKFhFTkxPR19FUlIsICJDb3VsZCBub3QgZmluZCBkb21haW4gJWRcbiIsIGRvbSk7Cj4+IFdo
aWxlIEkgYWdyZWUgd2l0aCB0aGUgY2hhbmdlIGluIHByaW5jaXBsZSwgd2hhdCBkb2VzIHRoaXMg
YWN0dWFsbHkgZG8/wqAKPj4gVGhlIGVudGlyZSBwcmludGsoKSBpcyBjb21waWxlZCBvdXQgaW4g
cmVsZWFzZSBidWlsZHMsIGFuZCBkZWJ1ZyBidWlsZHMKPj4gbG9nIGFsbCBtZXNzYWdlcy4KPiAu
Li5ieSBkZWZhdWx0OyBidXQgcHJlc3VtYWJseSB5b3UgY2FuIHR1cm4gdGhhdCBkb3duLCByaWdo
dD8KClllcyB5b3UgY2FuLCBidXQgYSkgbm9vbmUgZG9lcywgYmVjYXVzZSB0aGVzZSBhcmUgZGVi
dWcgYnVpbGRzIGFuZCBiKQp0aGF0IGlzbid0IHRoZSBwb2ludC7CoCBJZiB3ZSBjYXJlIGFib3V0
IHRoaXMgbWVzc2FnZSBiZWluZyBwcmludGVkLCBpdAptdXN0buKAmXQgYmUgYSBnZHByaW50aygp
LgoKSXQgZWl0aGVyIHdhbnRzIHRvIHR1cm4gaW50byBhIGdwcmludGsoKSBhdCBYRU5MT0dfSU5G
Tywgb3Igd2FudHMKZGVsZXRpbmcgZW50aXJlbHksIGJ1dCBzaW1wbHkgc2h1ZmZsaW5nIHRoZSBl
eGFjdCBsZXZlbCBmb3IgYSBnZHByaW50aygpCmlzIHRhbnRhbW91bnQgdG8gdXNlbGVzcy4KCj4K
PiBUaGlzIGFsc28gY2hhbmdlcyB0aGUgcHJlZml4IGluIHRoZSBsb2cgb3V0cHV0LCByaWdodD8g
IFRoYXQgd291bGQgbWFrZQo+IGl0IGVhc2llciB0byBpZGVudGlmeSB3aGljaCBtZXNzYWdlIGlz
IGltcG9ydGFudCBmb3IgdW5kZXJ0YW5kaW5nIHdoeQo+IHlvdXIgZG9tYWluIGp1c3QgY3Jhc2hl
ZC4KClRoZSBwcmVmaXggaXMgY29tcGxldGVseSBpbnRlcm5hbCB0byBYZW4uwqAgQnkgdGhlIHRp
bWUgaXQgZW5kcyB1cCBpbiB0aGUKY29uc29sZSByaW5nLCB0aGUgZGF0YSBpcyBsb3N0LgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
