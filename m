Return-Path: <SRS0=31Bo=UK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73816C43218
	for <xen-devel@archiver.kernel.org>; Tue, 11 Jun 2019 12:13:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416B1206E0
	for <xen-devel@archiver.kernel.org>; Tue, 11 Jun 2019 12:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416B1206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hafdw-0004UL-9m; Tue, 11 Jun 2019 12:12:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SowN=UK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hafdv-0004UG-Dk
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 12:12:47 +0000
X-Inumbo-ID: 3804e682-8c42-11e9-9d52-47ca2ece7c0e
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3804e682-8c42-11e9-9d52-47ca2ece7c0e;
 Tue, 11 Jun 2019 12:12:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 840BC344;
 Tue, 11 Jun 2019 05:12:44 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5930C3F557;
 Tue, 11 Jun 2019 05:14:25 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <92d534ef-082e-58d7-a4ff-c74cf7c23195@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b07c98a5-00cc-a51f-2eda-ba4038f0f667@arm.com>
Date: Tue, 11 Jun 2019 13:12:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <92d534ef-082e-58d7-a4ff-c74cf7c23195@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8wNi8yMDE5IDExOjIyLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IE9uIDExLjA2
LjE5IDEyOjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gQEAgLTM1LDggKzM3LDE2IEBAIGFy
Y2hfY29tcGF0X3ZjcHVfb3AoCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAh
Y29tcGF0X2hhbmRsZV9va2F5KGFyZWEuYWRkci5oLCAxKSApCj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB3aGlsZSggeGNoZygm
di0+cnVuc3RhdGVfaW5fdXNlLCAxKSA9PSAwKTsKPj4+Pgo+Pj4+IEF0IHRoZSB2ZXJ5IGxlYXN0
IHN1Y2ggbG9vcHMgd2FudCBhIGNwdV9yZWxheCgpIGluIHRoZWlyIGJvZGllcy4KPj4+PiBCdXQg
dGhpcyBiZWluZyBvbiBhIGh5cGVyY2FsbCBwYXRoIC0gYXJlIHRoZXJlIHRoZW9yZXRpY2FsIGd1
YXJhbnRlZXMKPj4+PiB0aGF0IGEgZ3Vlc3QgY2FuJ3QgYWJ1c2UgdGhpcyB0byBsb2NrIHVwIGEg
Q1BVPwo+Pj4gSG1tbSwgSSBzdWdnZXN0ZWQgdGhpcyBidXQgaXQgbG9va3MgbGlrZSBhIGd1ZXN0
IG1heSBjYWxsIHRoZSBoeXBlcmNhbGwgbXVsdGlwbGUKPj4+IHRpbWUgZnJvbSBkaWZmZXJlbnQg
dkNQVS4gU28gdGhpcyBjb3VsZCBiZSBhIHdheSB0byBkZWxheSB3b3JrIG9uIHRoZSBDUFUuCj4g
Cj4gSnVsaWVuLCBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIGhvdyB3b3JrIG9uIChwPylDUFUg
Y291bGQgYmUgZGVsYXllZC4gV2UgYXJlIAo+IGhlcmUgd2l0aCBpbnRlcnJ1cHRzIGVuYWJsZWQs
IHNvIGhlcmUgZ3Vlc3Qgd291bGQganVzdCBzcGVuZCBoaXMgb3duIHZjcHUgdGltZSAKPiBidWRn
ZXQuIAoKWGVuIG9ubHkgc3VwcG9ydHMgb25seSB2b2x1bnRhcnkgcHJlZW1wdGlvbi4gVGhpcyBt
ZWFucyB0aGF0IGlmIHRoZSBoeXBlcmNhbGwgCnJ1biBmb3IgYSBsb25nIHRpbWUsIHlvdSBoYXZl
IG5vIHdheSB0byBpbnRlcnJ1cHQgaXQgYW5kIHNjaGVkdWxlIGFub3RoZXIgdkNQVS4gCkluIG90
aGVyIHdvcmRzLCB0aGUgcmVzdCBvZiB0aGUgd29yayBvbiB0aGF0IHNwZWNpZmljIHBDUFUgd291
bGQgYmUgZGVsYXllZC4KCkluIHRoaXMgY29udGV4dCwgSSB0aGluayBKYW4gaXMgc2Vla2luZyBn
dWFyYW50ZWVzIHRoYXQgdGhlIGxvY2sgY2FuIGJlIHRha2VuIGluIAp0aW1lbHkgbWFubmVyLiBJ
ZiBub3QsIHRoZW4gd2Ugd2FudCB0byB1c2UgYSB0cnktbG9jayBzdHlsZS4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
