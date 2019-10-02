Return-Path: <SRS0=BXCD=X3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45482C4360C
	for <xen-devel@archiver.kernel.org>; Wed,  2 Oct 2019 19:18:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13B49207FF
	for <xen-devel@archiver.kernel.org>; Wed,  2 Oct 2019 19:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13B49207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFk8I-0003PL-Uq; Wed, 02 Oct 2019 19:17:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFk8H-0003PG-9i
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 19:17:53 +0000
X-Inumbo-ID: 52b9d892-e549-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 52b9d892-e549-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 19:17:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C9B028;
 Wed,  2 Oct 2019 12:17:49 -0700 (PDT)
Received: from [10.37.12.166] (unknown [10.37.12.166])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB1D03F534;
 Wed,  2 Oct 2019 12:17:47 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20191002180047.17144-1-julien.grall@arm.com>
 <20191002180047.17144-4-julien.grall@arm.com>
 <85006b86-5a6b-5f36-cf02-a2a2a08fcbf6@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <66e897d7-d46f-1191-1ff4-492eff872efe@arm.com>
Date: Wed, 2 Oct 2019 20:17:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <85006b86-5a6b-5f36-cf02-a2a2a08fcbf6@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 3/6] xen/arm: cpuerrata: Match
 register size with value size in check_workaround_*
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
Cc: Artem_Mygaiev@epam.com, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMTAvMi8xOSA3OjQyIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9u
IDAyLzEwLzIwMTkgMTk6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQ2xhbmcgaXMgcGlja2ll
ciB0aGFuIEdDQyBmb3IgdGhlIHJlZ2lzdGVyIHNpemUgaW4gYXNtIHN0YXRlbWVudC4gSXQKPj4g
ZXhwZWN0cyB0aGUgcmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUgc2l6ZS4KPj4KPj4g
VGhlIGFzbSBzdGF0ZW1lbnQgZXhwZWN0cyBhIDMyLWJpdCAocmVzcC4gNjQtYml0KSB2YWx1ZSBv
biBBcm0zMgo+PiAocmVzcC4gQXJtNjQpIHdoZXJlYXMgdGhlIHZhbHVlIGlzIGEgYm9vbGVhbiAo
Q2xhbmcgY29uc2lkZXIgdG8gYmUKPj4gMzItYml0KS4KPj4KPj4gSXQgd291bGQgYmUgcG9zc2li
bGUgdG8gaW1wb3NlIDMyLWJpdCByZWdpc3RlciBmb3IgYm90aCBhcmNoaXRlY3R1cmUKPj4gYnV0
IHRoaXMgcmVxdWlyZSB0aGUgY29kZSB0byB1c2UgX19PUDMyLiBIb3dldmVyLCBpdCBkb2VzIG5v
dCByZWFsbHkKPj4gaW1wcm92ZSB0aGUgYXNzZW1ibHkgZ2VuZXJhdGVkLiBJbnN0ZWFkLCByZXBs
YWNlIHN3aXRjaCB0aGUgdmFyaWFibGUKPj4gdG8gdXNlIHJlZ2lzdGVyX3QuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Cj4+IC0tLQo+
PiAgICAgIENoYW5nZXMgaW4gdjI6Cj4+ICAgICAgICAgIC0gVXNlICEhIHBlciBTdGVmYW5vJ3Mg
cmVxdWVzdAo+IAo+IFlvdSBhcmUgYXdhcmUgdGhhdCB1bmxpa2xleSgpLCBkZWxpYmVyYXRlbHks
IGhhcyBhbiBlbWJlZGRlZCAhISA/CgpJIGZvcmdvdCBpdCwgc29ycnkgYWJvdXQgdGhhdCA6Ly4g
U3RlZmFubyBhcmUgeW91IGhhcHB5IGlmIEkgcmV2ZXJ0IHRvIHYxPwoKPiAKPiBpbmNsdWRlL3hl
bi9jb21waWxlci5oOjExOiNkZWZpbmUgdW5saWtlbHkoeCnCoMKgIF9fYnVpbHRpbl9leHBlY3Qo
ISEoeCksMCkKPiAKPiB+QW5kcmV3Cj4gCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
