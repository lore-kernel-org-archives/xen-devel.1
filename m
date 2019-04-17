Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA13C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:16:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10920217FA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10920217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGrum-0005De-7u; Wed, 17 Apr 2019 21:16:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGrul-0005DV-9f
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 21:16:19 +0000
X-Inumbo-ID: 0aa33e44-6156-11e9-b269-6b2c918bce53
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0aa33e44-6156-11e9-b269-6b2c918bce53;
 Wed, 17 Apr 2019 21:16:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38F7315AB;
 Wed, 17 Apr 2019 14:16:18 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A66AA3F59C;
 Wed, 17 Apr 2019 14:16:16 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-9-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171328360.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c45f1fae-24c4-c9e2-18c9-090dba909ed9@arm.com>
Date: Wed, 17 Apr 2019 22:16:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904171328360.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 08/12] xen/arm: cpufeature: Match register
 size with value size in cpus_have_const_cap
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
Message-ID: <20190417211614.GQ6n2LdcNEMfbafJVef-yN-H3mQIhQyGHTljY8d2Wew@z>

CgpPbiA0LzE3LzE5IDk6MjkgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBXZWQs
IDI3IE1hciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENsYW5nIGlzIHBpY2tpZXIgdGhh
biBHQ0MgZm9yIHRoZSByZWdpc3RlciBzaXplIGluIGFzbSBzdGF0ZW1lbnQuIEl0Cj4+IGV4cGVj
dHMgdGhlIHJlZ2lzdGVyIHNpemUgdG8gbWF0Y2ggdGhlIHZhbHVlIHNpemUuCj4+Cj4+IFRoZSBh
c20gc3RhdGVtZW50IGV4cGVjdHMgYSAzMi1iaXQgKHJlc3AuIDY0LWJpdCkgdmFsdWUgb24gQXJt
MzIKPj4gKHJlc3AuIEFybTY0KSB3aGVyZWFzIHRoZSB2YWx1ZSBpcyBhIGJvb2xlYW4gKENsYW5n
IGNvbnNpZGVyIHRvIGJlCj4+IDMyLWJpdCkuCj4+Cj4+IEl0IHdvdWxkIGJlIHBvc3NpYmxlIHRv
IGltcG9zZSAzMi1iaXQgcmVnaXN0ZXIgZm9yIGJvdGggYXJjaGl0ZWN0dXJlCj4+IGJ1dCB0aGlz
IHJlcXVpcmUgdGhlIGNvZGUgdG8gdXNlIF9fT1AzMi4gSG93ZXZlciwgaXQgZG9lcyBubyByZWFs
bHkKPj4gaW1wcm92ZSB0aGUgYXNzZW1ibHkgZ2VuZXJhdGVkLiBJbnN0ZWFkLCByZXBsYWNlIHN3
aXRjaCB0aGUgdmFyaWFibGUgdG8KPj4gdXNlIHJlZ2lzdGVyX3QuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IC0tLQo+PiAgIHhlbi9p
bmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLWFybS9jcHVmZWF0dXJlLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1cmUu
aAo+PiBpbmRleCBjMmM4ZjM0MTdjLi5kMDZmMDllY2ZhIDEwMDY0NAo+PiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20tYXJtL2NwdWZlYXR1cmUuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2Nw
dWZlYXR1cmUuaAo+PiBAQCAtNjcsNyArNjcsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgY3B1c19o
YXZlX2NhcCh1bnNpZ25lZCBpbnQgbnVtKQo+PiAgIAo+PiAgIC8qIFN5c3RlbSBjYXBhYmlsaXR5
IGNoZWNrIGZvciBjb25zdGFudCBjYXAgKi8KPj4gICAjZGVmaW5lIGNwdXNfaGF2ZV9jb25zdF9j
YXAobnVtKSAoeyAgICAgICAgICAgICAgICAgXAo+PiAtICAgICAgICBib29sIF9fcmV0OyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICAgcmVnaXN0ZXJfdCBfX3Jl
dDsgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gICAgICAgICAgIGFzbSB2b2xhdGls
ZSAoQUxURVJOQVRJVkUoIm1vdiAlMCwgIzAiLCAgICAgXAo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAibW92ICUwLCAjMSIsICAgICBcCj4gCj4gQXMgcGVyIHRoZSBwcmV2
aW91cyBvbmUsIHRoaXMgaXMgZmluZSwgYnV0IGNvdWxkIHlvdSBhbHNvIGNoYW5nZSB0aGUKPiBs
YXN0IHN0YXRlbWVudCBiZWxvdyB0byB1bmxpa2VseSghIV9fcmV0KTsKCkFzIHBlciB0aGUgcHJl
dmlvdXMgb25lLCB0aGUgY3VycmVudCBjb2RlIGlzIHZhbGlkLiBQbGVhc2UganVzdGlmeSB3aHkg
CiEhIGlzIG5lY2Vzc2FyeS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
