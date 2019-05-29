Return-Path: <SRS0=GvgA=T5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DBBC28CC0
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 17:23:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5283723F44
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 17:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5283723F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW2I9-0007Vt-RM; Wed, 29 May 2019 17:23:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hW2I8-0007Vo-Ro
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 17:23:08 +0000
X-Inumbo-ID: 6cad0593-8236-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6cad0593-8236-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 17:23:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 444BF341;
 Wed, 29 May 2019 10:23:07 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 748503F5AF;
 Wed, 29 May 2019 10:23:05 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190514122456.28559-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1de6f672-e272-b48f-cea1-5f8e9be9fc38@arm.com>
Date: Wed, 29 May 2019 18:23:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514122456.28559-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 00/19] xen/arm: Clean-up
 & fixes in boot/mm code
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr_Tyshchenko@epam.com, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wei.liu2@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190529172304.gR_KWWR_5yAovABqb230b-SDHzI-SpmadVX3JJaU84g@z>

SGksCgpJIGFtIG1pc3Npbmcgc29tZSByZXBseS9yZXZpZXcgZnJvbSBTdGVmYW5vIChzZWUgYmVs
b3cpLgoKT24gMTQvMDUvMjAxOSAxMzoyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEp1bGllbiBH
cmFsbCAoMTkpOgo+ICAgIHhlbi9hcm06IFJld29yayBIU0NUTFJfQkFTRQoKTW9yZSBkZXRhaWxz
IGlucHV0IG9uIGhpcyBjbGFpbS4uLiBhbmQgcmV2aWV3IGZvciB0aGUgZm9sbG93aW5nIHBhdGNo
ZXM6Cgo+ICAgIHhlbi9hcm06IFJlbW92ZSBwYXJhbWV0ZXIgY3B1aWQgZnJvbSBzdGFydF94ZW4K
PiAgICB4ZW4vYXJtMzI6IGhlYWQ6IENvcnJlY3RseSByZXBvcnQgdGhlIEhXIENQVSBJRAo+ICAg
IHhlbi9hcm0zMjogaGVhZDogRG9uJ3Qgc2V0IE1BSVIwIGFuZCBNQUlSMQo+ICAgIHhlbi9hcm0z
MjogaGVhZDogQWx3YXlzIHplcm8gcjMgYmVmb3JlIHVwZGF0ZSBhIHBhZ2UtdGFibGUgZW50cnkK
PiAgICB4ZW4vYXJtMzI6IG1tOiBBdm9pZCB0byB6ZXJvIGFuZCBjbGVhbiBjYWNoZSBmb3IgQ1BV
MCBkb21oZWFwCj4gICAgeGVuL2FybTMyOiBtbTogQXZvaWQgY2xlYW5pbmcgdGhlIGNhY2hlIGZv
ciBzZWNvbmRhcnkgQ1BVcyBwYWdlLXRhYmxlcwo+ICAgIHhlbi9hcm06IG1tOiBJbnRyb2R1Y2Ug
REVGSU5FX1BBR0VfVEFCTEV7LFN9IGFuZCB1c2UgaXQKPiAgICB4ZW4vYXJtOiBtbTogUHJvdGVj
dCBYZW4gcGFnZS10YWJsZSB1cGRhdGUgd2l0aCBhIHNwaW5sb2NrCj4gICAgeGVuL2FybTogbW06
IEluaXRpYWxpemUgcGFnZS10YWJsZXMgZWFybGllcgo+ICAgIHhlbi9hcm06IG1tOiBDaGVjayBz
dGFydCBpcyBhbHdheXMgYmVmb3JlIGVuZCBpbiB7ZGVzdHJveSwKPiAgICAgIG1vZGlmeX1feGVu
X21hcHBpbmdzCj4gICAgeGVuL2FybTogUGFpciBjYWxsIHRvIHNldF9maXhtYXAgd2l0aCBjYWxs
IHRvIGNsZWFyX2ZpeG1hcCBpbgo+ICAgICAgY29weV9mcm9tX3BhZGRyCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
