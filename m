Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B764CC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:15:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8750D217FA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8750D217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGrtv-00055O-T1; Wed, 17 Apr 2019 21:15:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGrtu-00055J-NV
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 21:15:26 +0000
X-Inumbo-ID: eb08ada6-6155-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id eb08ada6-6155-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 21:15:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3844C15AB;
 Wed, 17 Apr 2019 14:15:25 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E93D03F59C;
 Wed, 17 Apr 2019 14:15:23 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-8-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171327100.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <970bfa4e-192e-967a-b211-16dee9cb7ed8@arm.com>
Date: Wed, 17 Apr 2019 22:15:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904171327100.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 07/12] xen/arm: cpuerrata: Match register
 size with value size in check_workaround_*
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417211521.-N-GtqodDjLzfKwYKVrUAf6c9RsbLCpS0K5F5zg-3G8@z>

SGksCgpPbiA0LzE3LzE5IDk6MjggUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBX
ZWQsIDI3IE1hciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENsYW5nIGlzIHBpY2tpZXIg
dGhhbiBHQ0MgZm9yIHRoZSByZWdpc3RlciBzaXplIGluIGFzbSBzdGF0ZW1lbnQuIEl0Cj4+IGV4
cGVjdHMgdGhlIHJlZ2lzdGVyIHNpemUgdG8gbWF0Y2ggdGhlIHZhbHVlIHNpemUuCj4+Cj4+IFRo
ZSBhc20gc3RhdGVtZW50IGV4cGVjdHMgYSAzMi1iaXQgKHJlc3AuIDY0LWJpdCkgdmFsdWUgb24g
QXJtMzIKPj4gKHJlc3AuIEFybTY0KSB3aGVyZWFzIHRoZSB2YWx1ZSBpcyBhIGJvb2xlYW4gKENs
YW5nIGNvbnNpZGVyIHRvIGJlCj4+IDMyLWJpdCkuCj4+Cj4+IEl0IHdvdWxkIGJlIHBvc3NpYmxl
IHRvIGltcG9zZSAzMi1iaXQgcmVnaXN0ZXIgZm9yIGJvdGggYXJjaGl0ZWN0dXJlCj4+IGJ1dCB0
aGlzIHJlcXVpcmUgdGhlIGNvZGUgdG8gdXNlIF9fT1AzMi4gSG93ZXZlciwgaXQgZG9lcyBub3Qg
cmVhbGx5Cj4+IGltcHJvdmUgdGhlIGFzc2VtYmx5IGdlbmVyYXRlZC4gSW5zdGVhZCwgcmVwbGFj
ZSBzd2l0Y2ggdGhlIHZhcmlhYmxlCj4+IHRvIHVzZSByZWdpc3Rlcl90Lgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+PiAtLS0KPj4gICB4
ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWVycmF0YS5oIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9jcHVlcnJhdGEuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZXJyYXRh
LmgKPj4gaW5kZXggNTVkZGZkYTI3Mi4uODhlZjNjYTkzNCAxMDA2NDQKPj4gLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9jcHVlcnJhdGEuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2Nw
dWVycmF0YS5oCj4+IEBAIC0xNCw3ICsxNCw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBjaGVja193
b3JrYXJvdW5kXyMjZXJyYXR1bSh2b2lkKSAgICAgICAgICAgICBcCj4+ICAgICAgICAgICByZXR1
cm4gZmFsc2U7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4g
ICAgICAgZWxzZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+PiAgICAgICB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4+IC0gICAgICAgIGJvb2wgcmV0OyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICByZWdpc3Rl
cl90IHJldDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+PiAgICAgICAgICAgYXNtIHZvbGF0aWxlIChBTFRFUk5BVElWRSgibW92ICUwLCAj
MCIsICAgICAgICAgICAgICAgICBcCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJtb3YgJTAsICMxIiwgICAgICAgICAgICAgICAgIFwKPiAKPiBUaGlzIGlzIE9LLiBDb3Vs
ZCB5b3UgcGxlYXNlIGFsc28gY2hhbmdlIHRoZSByZXR1cm4gc3RhdGVtZW50IGJlbG93Pwo+IE1h
eWJlIHNvbWV0aGluZyBsaWtlOgo+IAo+ICAgIHJldHVybiB1bmxpa2VseSghIXJldCk7CldoeT8g
VGhlIGNvbXBpbGVyIHdpbGwgaW1wbGljaXRseSBjb252ZXJ0IHRoZSBpbnQgdG8gYm9vbC4gMCB3
aWxsIHR1cm4gCnRvIGZhbHNlLCBhbGwgdGhlIG90aGVyIHdpbGwgYmUgdHJ1ZS4KCldlIGFjdHVh
bGx5IGJlZW4gYWN0aXZlbHkgcmVtb3ZpbmcgISEgd2hlbiB0aGUgdHlwZSBpcyBib29sIChzZWUg
dGhlIApleGFtcGxlIGluIGdldF9wYWdlZF9mcmFtZSBpbiBjb21tb24vZ3JhbnRfdGFibGUuYyku
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
