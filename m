Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E48C10F12
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 09:43:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CAE4206B6
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 09:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CAE4206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGh5Y-00032R-As; Wed, 17 Apr 2019 09:42:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGh5W-00032M-Pv
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 09:42:42 +0000
X-Inumbo-ID: 24acb704-60f5-11e9-9a58-a3f20d460795
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 24acb704-60f5-11e9-9a58-a3f20d460795;
 Wed, 17 Apr 2019 09:42:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEAAE374;
 Wed, 17 Apr 2019 02:42:40 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 518F63F68F;
 Wed, 17 Apr 2019 02:42:38 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <970b4dcfb4e3c04bc9502c7656caa61d2f8c0677.camel@epam.com>
 <8210e96d-c7cd-384e-3277-21fdbfc32105@arm.com>
 <alpine.DEB.2.10.1904161543460.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <34d8cf3f-e262-e3ab-b9e3-3c0dcbd75e37@arm.com>
Date: Wed, 17 Apr 2019 10:42:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904161543460.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 00/12] xen/arm: Add support to build with
 clang
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417094236.uGTAiAzMXzApfDwOrP5vOEo1fiwAu77gFwaowy0uMD4@z>

SGksCgpPbiAxNi8wNC8yMDE5IDIzOjQzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
RnJpLCAyOSBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAyOC8wMy8yMDE5IDEx
OjI3LCBBcnRlbSBNeWdhaWV2IHdyb3RlOgo+Pj4gSGkgSnVsaWVuLAo+Pgo+PiBIaSBBcnRlbSwK
Pj4KPj4+IE9uIFdlZCwgMjAxOS0wMy0yNyBhdCAxODo0NSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+Pj4+IEhpIGFsbCwKPj4+Pgo+Pj4+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCB0byBi
dWlsZCBYZW4gQXJtIHdpdGggY2xhbmcuIFRoaXMgc2VyaWVzIHdhcwo+Pj4+IHRlc3RlZAo+Pj4+
IHdpdGggY2xhbmcgOC4wLgo+Pj4+Cj4+Pj4gTm90ZSB0aGF0IEkgb25seSBkaWQgYnVpbGQgZm9y
IGFybTY0LiBJIHN0aWxsIG5lZWQgdG8gbG9vayBhdCB0aGUgYXJtMzIKPj4+PiBidWlsZC4KPj4+
Pgo+Pj4KPj4+IEkgd29uZGVyIGlmIHlvdSBoYXZlIHRpbWUgdG8gdHJ5IHRoZSBzZXJpZXMgd2l0
aCBBcm0gQ29tcGlsZXIgNj8gSSBhbQo+Pj4gYXNraW5nIGJlY2F1c2UgQUZBSUsgaXQgaXMgYmFz
ZWQgb24gY2xhbmcvbGx2bSBbMV0gYW5kIHRoZXJlJ3MgYQo+Pj4gc2FmZXR5LWNvbXBsaWFudCB2
ZXJzaW9uIG9mIGl0IGNlcnRpZmllZCBieSBUVVYgWzJdLiBJIGRvbid0IGhhdmUgYQo+Pj4gbGlj
ZW5zZSB5ZXQgc28gY2Fubm90IHRyeSBpdCBteXNlbGYgYnV0IG1heWJlIHlvdSBoYXZlIGFjY2Vz
cy4KPj4gSSBnYXZlIGEgcXVpY2sgdHJ5IHRvIHRoZSBBcm0gQ29tcGlsZXIuIEkgaGFkIHRvIGhh
Y2sgYSBiaXQgY29uZmlnL1N0ZEdOVS5tawo+PiB0byBwYXNzIGFybWNsYW5nIGFuZCB0aGUgYXBw
cm9wcmlhdGUgdGFyZ2V0IG9wdGlvbi4KPj4KPj4gSSBhbHNvIGhhZCBhIGxpbmtpbmcgaXNzdWUg
YXQgdGhlIGVuZCB3aGVyZSBfXzJzbnByaW50ZiB3YXMgbm90IGZvdW5kLiBJdAo+PiBzZWVtcyB0
aGUgY29tcGlsZXIgcmVwbGFjZSBzbnByaW50ZiB3aXRoIF9fMnNucHJpbnRmLCBJIGhhdmVuJ3Qg
ZmlndXJlZCBvdXQKPj4gd2h5IHlldC4KPiAKPiBCdXQgYWZ0ZXIgdGhlc2UgY2hhbmdlcywgZG9l
cyBpdCB3b3JrPwoKSSBoYXZlbid0IHRyaWVkIHRvIGZpeCB0aGUgbGlua2luZyBpc3N1ZXMuIEkg
b25seSBnYXZlIGEgcXVpY2sgdHJ5IGJlY2F1c2UgQXJ0ZW0gCmFza2VkLiBJIGhhdmUgbm8gcGxh
biBhdCB0aGUgbW9tZW50IHRvIGdvIGZ1cnRoZXIgdGhhbiB0aGF0IGZvciBub3cuCgpQYXRjaGVz
IGFyZSB3ZWxjb21lZCB0byBhZGQgc3VwcG9ydCBmb3IgYXJtY2xhbmcuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
