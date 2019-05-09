Return-Path: <SRS0=7Zzv=TJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501BFC04AB1
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 18:12:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FC502084E
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 18:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FC502084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOnWq-00079H-JY; Thu, 09 May 2019 18:12:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kt3J=TJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOnWp-000799-RD
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 18:12:23 +0000
X-Inumbo-ID: fd864415-7285-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id fd864415-7285-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 18:12:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDB6B374;
 Thu,  9 May 2019 11:12:21 -0700 (PDT)
Received: from [10.37.9.129] (unknown [10.37.9.129])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 583BE3F738;
 Thu,  9 May 2019 11:12:19 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091104530.25766@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <51dbab9b-b0a5-c207-f1ef-e70b997a0078@arm.com>
Date: Thu, 9 May 2019 19:12:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1905091104530.25766@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/14] xen: Introduce HAS_M2P config and use
 to protect mfn_to_gmfn call
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
Cc: Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, andrii_anisov@epam.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190509181217.caApziv6xkR6CgOIwxqTRizJjXn0ETooNZ6jPzrzEJw@z>

SGksCgpPbiA1LzkvMTkgNzowNiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1
ZSwgNyBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL2RvbWFpbi5oIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oCj4+IGluZGV4IGQx
YmZjODJmNTcuLmYxNzYxZmUxODMgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kb21h
aW4uaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgKPj4gQEAgLTExOCw0ICsxMTgs
MTIgQEAgc3RydWN0IHZudW1hX2luZm8gewo+PiAgIAo+PiAgIHZvaWQgdm51bWFfZGVzdHJveShz
dHJ1Y3Qgdm51bWFfaW5mbyAqdm51bWEpOwo+PiAgIAo+PiArI2lmZGVmIENPTkZJR19IQVNfTTJQ
Cj4+ICsjZGVmaW5lIGRvbWFpbl9zaGFyZWRfaW5mb19nZm4oZCkgKHsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+PiArICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKmRfID0gKGQpOyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAgbWZuX3RvX2dm
bihkXywgX21mbihfX3ZpcnRfdG9fbWZuKGRfLT5zaGFyZWRfaW5mbykpKTsgICAgICAgXAo+IAo+
IEFyZW4ndCB5b3UgbWlzc2luZyBhIF9nZm4gaGVyZT8KPiAKPiAgICBfZ2ZuKG1mbl90b19nZm4o
ZCwgX21mbihfX3ZpcnRfdG9fbWZuKGQtPnNoYXJlZF9pbmZvKSkpKTsKClBhdGNoICMzIG9mIHRo
aXMgc2VyaWVzIGNvbnZlcnQgbWZuX3RvX2dmbiB0byB1c2UgdHlwZXNhZmUgTUZOICYgR0ZOLiBT
byAKdGhlIGZ1bmN0aW9uIG5vdyByZXR1cm4gYSBnZm5fdC4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
