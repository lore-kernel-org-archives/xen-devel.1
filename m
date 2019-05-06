Return-Path: <SRS0=pwZ6=TG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585CFC04AAA
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 08:52:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FF48205C9
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 08:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FF48205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNZLi-0002Ml-Rg; Mon, 06 May 2019 08:51:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNZLh-0002Mg-P6
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:51:49 +0000
X-Inumbo-ID: 2ed35ecd-6fdc-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2ed35ecd-6fdc-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 08:51:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7B0F9AEFF;
 Mon,  6 May 2019 08:51:47 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-31-jgross@suse.com> <5CCFF238020000780022C0F9@suse.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9111da86-634d-14a9-1862-b828265b0195@suse.com>
Date: Mon, 6 May 2019 10:51:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CCFF238020000780022C0F9@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH RFC V2 30/45] xen/sched: rework and rename
 vcpu_force_reschedule()
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190506085146.GJ-IxERTh6Pf0JQGEC8ZcIDOfmOnAffvdGPhiwZuxHQ@z>

T24gMDYvMDUvMjAxOSAxMDozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMDUuMTkg
YXQgMDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMKPj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+IEBAIC04MDgsMjEgKzgw
OCwyNCBAQCBzdGF0aWMgdm9pZCB2Y3B1X21pZ3JhdGVfZmluaXNoKHN0cnVjdCB2Y3B1ICp2KQo+
PiAgfQo+PiAgCj4+ICAvKgo+PiAtICogRm9yY2UgYSBWQ1BVIHRocm91Z2ggYSBkZXNjaGVkdWxl
L3Jlc2NoZWR1bGUgcGF0aC4KPj4gLSAqIEZvciBleGFtcGxlLCB1c2luZyB0aGlzIHdoZW4gc2V0
dGluZyB0aGUgcGVyaW9kaWMgdGltZXIgcGVyaW9kIG1lYW5zIHRoYXQKPj4gLSAqIG1vc3QgcGVy
aW9kaWMtdGltZXIgc3RhdGUgbmVlZCBvbmx5IGJlIHRvdWNoZWQgZnJvbSB3aXRoaW4gdGhlIHNj
aGVkdWxlcgo+PiAtICogd2hpY2ggY2FuIHRodXMgYmUgZG9uZSB3aXRob3V0IG5lZWQgZm9yIHN5
bmNocm9uaXNhdGlvbi4KPj4gKyAqIFNldCB0aGUgcGVyaW9kaWMgdGltZXIgb2YgYSB2Y3B1Lgo+
PiAgICovCj4+IC12b2lkIHZjcHVfZm9yY2VfcmVzY2hlZHVsZShzdHJ1Y3QgdmNwdSAqdikKPj4g
K3ZvaWQgdmNwdV9zZXRfcGVyaW9kaWNfdGltZXIoc3RydWN0IHZjcHUgKnYsIHNfdGltZV90IHZh
bHVlKQo+PiAgewo+PiAtICAgIHNwaW5sb2NrX3QgKmxvY2sgPSBpdGVtX3NjaGVkdWxlX2xvY2tf
aXJxKHYtPnNjaGVkX2l0ZW0pOwo+PiArICAgIHNfdGltZV90IG5vdyA9IE5PVygpOwo+PiAgCj4+
IC0gICAgaWYgKCB2LT5zY2hlZF9pdGVtLT5pc19ydW5uaW5nICkKPj4gLSAgICAgICAgdmNwdV9t
aWdyYXRlX3N0YXJ0KHYpOwo+PiArICAgIGlmICggdiAhPSBjdXJyZW50ICkKPj4gKyAgICAgICAg
dmNwdV9wYXVzZSh2KTsKPj4gKyAgICBlbHNlCj4+ICsgICAgICAgIHN0b3BfdGltZXIoJnYtPnBl
cmlvZGljX3RpbWVyKTsKPj4gIAo+PiAtICAgIGl0ZW1fc2NoZWR1bGVfdW5sb2NrX2lycShsb2Nr
LCB2LT5zY2hlZF9pdGVtKTsKPj4gKyAgICB2LT5wZXJpb2RpY19wZXJpb2QgPSB2YWx1ZTsKPj4g
KyAgICB2LT5wZXJpb2RpY19sYXN0X2V2ZW50ID0gbm93Owo+IAo+IEJ5IHRoZSB0aW1lIHlvdSBj
b21lIGhlcmUsIE5PVygpIG1heSBhbHJlYWR5IGJlIHBhc3Qgbm93ICsgdmFsdWUuCj4gSXQncyBu
b3QgY2xlYXIgdG8gbWUgd2hldGhlciB0aGF0J2xsIHdvcmsgY29ycmVjdGx5OyBJIHRoaW5rIGl0
IHdvdWxkIGJlCj4gYmV0dGVyIHRvIGxhdGNoIE5PVygpIG9ubHkgYXQgdGhpcyBwb2ludC4KCkkg
YWdyZWUuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
