Return-Path: <SRS0=PAdT=UA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC07C28CC1
	for <xen-devel@archiver.kernel.org>; Sat,  1 Jun 2019 16:56:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0392B27704
	for <xen-devel@archiver.kernel.org>; Sat,  1 Jun 2019 16:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0392B27704
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hX7Ib-0004ki-T0; Sat, 01 Jun 2019 16:56:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BqHO=UA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hX7Ia-0004kd-9u
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2019 16:56:04 +0000
X-Inumbo-ID: 23fc0744-848e-11e9-ae6a-23cdef090a1a
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 23fc0744-848e-11e9-ae6a-23cdef090a1a;
 Sat, 01 Jun 2019 16:56:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43569A78;
 Sat,  1 Jun 2019 09:56:03 -0700 (PDT)
Received: from [10.37.12.21] (unknown [10.37.12.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F7ED3F5AF;
 Sat,  1 Jun 2019 09:56:01 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <06a4f534-e671-004c-93bb-31b60ed77d28@arm.com> <8736kt8f2z.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <59439dbd-dce8-072e-4258-4778f38ebe2a@arm.com>
Date: Sat, 1 Jun 2019 17:55:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8736kt8f2z.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 00/10] TEE mediator (and OP-TEE) support
 in XEN
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190601165559.s_T94yiGIMLdsTg0Ie3FO_ns6Bd6-cNWvpubvs9dDWU@z>

T24gNi8xLzE5IDU6MDcgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IAo+IEhpIEp1bGll
biwKCkhpIFZvbG9keW15ciwKCj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPiAKPj4gSGkgVm9sb2R5
bXlyLAo+Pgo+PiBJIHRyaWVkIHRvIGFwcGx5IHRoZSBwYXRjaGVzIHRvIHN0YWdpbmcgYnV0IGZh
aWwgYmVjYXVzZSB0aGUgcGF0Y2hlcwo+PiBjb250YWlucyA9MjAuIERvIHlvdSBoYXZlIGEgdHJl
ZSB3aXRoIHRoZSBzZXJpZXMgYXBwbGllZD8KPiAKPiBTdXJlLCB5b3UgY2FuIGZpbmQgdGhlbSBh
dCBbMV0KClRoYW5rIHlvdSEgVGhlIGJyYW5jaCBpcyBiYXNlZCBvbiBtYXN0ZXIuIFRoaXMgaXMg
ZmFpcmx5IGJlaGluZCBzdGFnaW5nLiAKQ291bGQgeW91IHJlYmFzZSB0aGlzIG9uIHRvcCBvZiBz
dGFnaW5nPwoKSSB3aWxsIGdvIHRocm91Z2ggdGhlIHNlcmllcyBuZXh0IHdlZWsuIEFzIHRoaXMg
aXMgYSB0ZWNoIHByZXZpZXcsIEkgYW0gCnBsYW5uaW5nIHRvIG1lcmdlIHRoaXMgdmVyc2lvbiB1
bmxlc3MgSSBmaW5kIHNvbWV0aGluZyBob3JyaWJseSB3cm9uZyBpbiBpdC4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
