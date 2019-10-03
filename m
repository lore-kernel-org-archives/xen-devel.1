Return-Path: <SRS0=xXFq=X4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CC6C10F14
	for <xen-devel@archiver.kernel.org>; Thu,  3 Oct 2019 09:27:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF9AE2133F
	for <xen-devel@archiver.kernel.org>; Thu,  3 Oct 2019 09:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF9AE2133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFxOH-0007q8-Tj; Thu, 03 Oct 2019 09:27:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=leaW=X4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFxOG-0007pz-Gg
 for xen-devel@lists.xen.org; Thu, 03 Oct 2019 09:27:16 +0000
X-Inumbo-ID: fd0495a0-e5bf-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id fd0495a0-e5bf-11e9-bf31-bc764e2007e4;
 Thu, 03 Oct 2019 09:27:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 745C81000;
 Thu,  3 Oct 2019 02:27:15 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7AE33F739;
 Thu,  3 Oct 2019 02:27:14 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1909301628540.2594@sstabellini-ThinkPad-T480s>
 <20190930233032.2120-5-sstabellini@kernel.org>
 <b3424309-d315-7ff8-7bd7-66782db279cd@arm.com>
 <alpine.DEB.2.21.1910021512400.2691@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e9817ef5-6d5a-7430-e952-dcc288c87df1@arm.com>
Date: Thu, 3 Oct 2019 10:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910021512400.2691@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7b 5/8] xen/arm: assign devices to boot
 domains
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDAyLzEwLzIwMTkgMjM6NDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDIgT2N0IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+ICsgICAgICAg
IGlmICggIWZvdW5kICkKPj4+ICsgICAgICAgIHsKPj4+ICsgICAgICAgICAgICByZXMgPSBmZHRf
cHJvcGVydHkoZmR0LCBuYW1lLCBwcm9wLT5kYXRhLAo+Pj4gZmR0MzJfdG9fY3B1KHByb3AtPmxl
bikpOwo+Pj4gKyAgICAgICAgICAgIGlmICggcmVzICkKPj4+ICsgICAgICAgICAgICAgICAgcmV0
dXJuIHJlczsKPj4+ICsgICAgICAgIH0KPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICAvKgo+Pj4g
KyAgICAgKiBPbmx5IGhhbmRsZSBwYXNzdGhyb3VnaCBwcm9wZXJ0aWVzIGlmIGJvdGggeGVuLHJl
ZyBhbmQgeGVuLHBhdGgKPj4+ICsgICAgICogYXJlIHByZXNlbnQsIG9yIGlmIHhlbixmb3JjZS1h
c3NpZ24td2l0aG91dC1pb21tdSBpcyBzcGVjaWZpZWQuCj4+PiArICAgICAqLwo+Pj4gKyAgICBp
ZiAoIHhlbl9yZWcgIT0gTlVMTCAmJiAoeGVuX3BhdGggIT0gTlVMTCB8fCB4ZW5fZm9yY2UpICkK
Pj4+ICsgICAgewo+Pj4gKyAgICAgICAgcmVzID0gaGFuZGxlX3Bhc3N0aHJvdWdoX3Byb3Aoa2lu
Zm8sIHhlbl9yZWcsIHhlbl9wYXRoLCB4ZW5fZm9yY2UsCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzKTsKPj4+ICsgICAg
ICAgIGlmICggcmVzIDwgMCApCj4+PiAgICAgICAgICAgICAgICByZXR1cm4gcmVzOwo+Pj4gICAg
ICAgIH0KPj4KPj4gSSB3b3VsZCBwcmludCBhbiBlcnJvciBzbyB0aGUgdXNlciBrbm93cyB3aGF0
IGhhcHBlbiBoZXJlLgo+IAo+IEFsbCByaWdodCwgSSdsbCBhZGQ6Cj4gCj4gICAgcHJpbnRrKFhF
TkxPR19FUlIgIkZhaWxlZCB0byBhc3NpZ24gZGV2aWNlIHRvICVwZFxuIiwga2luZm8tPmQpOwo+
IAo+IE1vcmUgc3BlY2lmaWMgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHR5cGUgb2YgZmFpbHVyZSBp
cyBhbHJlYWR5IHByaW50ZWQKPiBieSBoYW5kbGVfcGFzc3Rocm91Z2hfcHJvcC4KCkkgYW0gbGVz
cyBjb25jZXJuZWQgYWJvdXQgdGhlIGVycm9yIHdoZW4gaGFuZGxlX3Bhc3N0aHJvdWdoX3Byb3Au
IFdoYXQgSSBhbSAKY29uY2VybmVkIGFib3V0IGlmIHRoZSBmYWN0IHlvdSB3aWxsIGlnbm9yZSB4
ZW4scGF0aCBpZiB4ZW4scmVnIGlzIG5vdCBwcmVzZW50LgoKV2Ugc2hvdWxkIGF0IGxlYXN0IHdh
cm4gdGhlIHVzZXIgaWYgbm90IHJldHVybmluZyBhbiBlcnJvci4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
