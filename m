Return-Path: <SRS0=VluW=XT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA17C4320D
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 15:38:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8230D20665
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 15:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8230D20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmtO-0000VQ-0h; Tue, 24 Sep 2019 15:38:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCmtM-0000VJ-R3
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:38:16 +0000
X-Inumbo-ID: 535a7a86-dee1-11e9-9621-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 535a7a86-dee1-11e9-9621-12813bfff9fa;
 Tue, 24 Sep 2019 15:38:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A26B5142F;
 Tue, 24 Sep 2019 08:38:15 -0700 (PDT)
Received: from [10.1.39.57] (unknown [10.1.39.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 394343F59C;
 Tue, 24 Sep 2019 08:38:14 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190924143515.8810-1-julien.grall@arm.com>
 <20190924143515.8810-3-julien.grall@arm.com> <877e5xagjs.fsf@epam.com>
 <ca85e985-e40e-e701-6fc4-efc541f2f00f@arm.com> <875zlhaeoq.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dcf85f61-6113-0182-e4aa-d3c2617e466d@arm.com>
Date: Tue, 24 Sep 2019 16:38:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <875zlhaeoq.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 2/2] docs: Replace all instance
 of ARM by Arm
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA5LzI0LzE5IDQ6MzcgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IAo+IEp1bGll
biBHcmFsbCB3cml0ZXM6Cj4gCj4+IEhpLAo+Pgo+PiBPbiA5LzI0LzE5IDM6NTYgUE0sIFZvbG9k
eW15ciBCYWJjaHVrIHdyb3RlOgo+Pj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPj4+Cj4+Pj4gVGhl
IGRvY3VtZW50YXRpb24gaXMgdXNpbmcgYSBtaXggb2YgQVJNIChvbGQpIGFuZCBBcm0gKG5ldyku
IFRvIHN0YXkKPj4+PiBjb25zaXN0ZW50LCB1c2Ugb25seSB0aGUgbmV3IG5hbWUuCj4+Pj4KPj4+
IEhvbmVzdGx5LCB0aGlzIHJlbmFtZSBjb25mdXNlcyBtZS4gSSB0aGluaywgdGhpcyBjb21taXQg
aXMgdGhlIGdvb2QKPj4+IHBsYWNlIHRvIGNsYXJpZnkgYSBjb3VwbGUgb2YgcXVlc3Rpb25zLgo+
Pgo+PiBJdCBkaWQgY29uZnVzZSBhIGxvdCB3aGVuIHRoZSByZW5hbWUgd2FzIG1hZGUgYnkgQXJt
Li4uIFdoYXQgSSB3YW50IHRvCj4+IGF2b2lkIGlzIG1peGluZyB0aGUgYm90aCBpbiB0aGUgZG9j
dW1lbnRhdGlvbiBhcyB0aGlzIG1ha2VzIHRoaW5ncwo+PiBtb3JlIGRpZmZpY3VsdCB0byBmb2xs
b3cuCj4+Cj4+IFRoZXJlIGFyZSBwcm9iYWJseSBtb3JlIHRvIHRpZHkgdXAsIGJ1dCB0aGVuIHlv
dSBoYXZlIHRvIHN0YXJ0IHNvbWV3aGVyZS4KPiAKPiBUaGFuayB5b3UgZm9yIGV4cGxhbmF0aW9u
LiBKdXN0IGluIGNhc2U6IEkgaGF2ZSBub3RoaW5nIGFnYWluc3QgdGhpcwo+IHBhcnRpY3VsYXIg
cGF0Y2guIEkganVzdCB3YW50ZWQgdG8gdW5kZXJzdGFuZCBob3cgdG8gdXNlIHRoaXMgbmFtZXMK
PiBjb3JyZWN0bHkuCgpJbiBzaG9ydCwgaXQgaXMgcHJldHR5IG11Y2ggdGhlIHdpbGQgd2VzdCBp
biB0aGUgZG9jdW1lbnRhdGlvbiBzbyBmYXIuIDooCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
