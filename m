Return-Path: <SRS0=Vqkq=ZU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A85C432C0
	for <xen-devel@archiver.kernel.org>; Thu, 28 Nov 2019 10:30:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F6D921774
	for <xen-devel@archiver.kernel.org>; Thu, 28 Nov 2019 10:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F6D921774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaH4J-0000Xu-Uk; Thu, 28 Nov 2019 10:30:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FMNu=ZU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaH4I-0000Xj-Lg
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 10:30:38 +0000
X-Inumbo-ID: 1dfc452e-11ca-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dfc452e-11ca-11ea-9db0-bc764e2007e4;
 Thu, 28 Nov 2019 10:30:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9AAB9AC45;
 Thu, 28 Nov 2019 10:30:36 +0000 (UTC)
To: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20191128022458.4428-1-sstabellini@kernel.org>
 <20191128101505.fo7slsccphjr3qih@debian>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a2d324a4-5501-f654-d95a-a05a3f636f4f@suse.com>
Date: Thu, 28 Nov 2019 11:30:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128101505.fo7slsccphjr3qih@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] tools/arm: include xen-tools/libs.h from
 libxl_arm_acpi.c
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
Cc: julien@xen.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, ian.jackson@eu.citrix.com,
 anthony.perard@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMTkgMTE6MTUsIFdlaSBMaXUgd3JvdGU6Cj4gT24gV2VkLCBOb3YgMjcsIDIwMTkg
YXQgMDY6MjQ6NThQTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBsaWJ4bF9h
cm1fYWNwaS5jIGlzIHVzaW5nIEJVSUxEX0JVR19PTiBidXQgaXQgaXMgbm90IGluY2x1ZGluZwo+
PiB4ZW4tdG9vbHMvbGlicy5oIHRoYXQgZGVmaW5lcyBpdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4KPiAKPiBB
Y2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiAKPiBKdWVyZ2VuLCB0aGlzIGlzIGEgdHJp
dmlhbCBwYXRjaC4gSSB0aGluayBpdCBjYW4gZ28gaW4gNC4xMy4KCldoeSBpcyB0aGlzIHBhdGNo
IG5lZWRlZD8KCnRvb2xzL2xpYnhsL2xpYnhsX2FybV9hY3BpLmMgaW5jbHVkZXMgbGlieGxfYXJt
LmgsIHdoaWNoIGluY2x1ZGVzCmxpYnhsX2ludGVybmFsLmgsIHdoaWNoIGluY2x1ZGVzIHhlbi10
b29scy9saWJzLmguCgpTbyB0aGlzIGlzIGEgcHVyZWx5IGNvc21ldGljIHBhdGNoLCBlc3BlY2lh
bGx5IGFzIGxpYnhsX2FybS5oIGFuZApsaWJ4bF9pbnRlcm5hbC5oIGFyZSBsaWJ4bC1pbnRlcm5h
bCBpbmNsdWRlcywgc28gdGhlcmUgaXMgYSB2ZXJ5IGxvdwpyaXNrIGZvciB0aGUgaW5jbHVkZSBv
ZiB4ZW4tdG9vbHMvbGlicy5oIHN1ZGRlbmx5IGRpc2FwcGVhcmluZywgYW5kCmV2ZW4gaXQgd291
bGQgZHVlIHRvIGEgcGF0Y2ggb2Ygb25lIG9mIHRob3NlIGluY2x1ZGUgZmlsZXMsIGl0IHdvdWxk
CmJlIGRldGVjdGVkIGJ5IGEgZmFpbGluZyBidWlsZCBpbW1lZGlhdGVseS4KClNvIEkgd29uJ3Qg
dGFrZSBpdCBmb3IgNC4xMywgZXZlbiBpZiBiZWluZyB0cml2aWFsLgoKCkp1ZXJnZW4KCj4gCj4g
V2VpLgo+IAo+PiAtLS0KPj4gICB0b29scy9saWJ4bC9saWJ4bF9hcm1fYWNwaS5jIHwgMSArCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS90b29s
cy9saWJ4bC9saWJ4bF9hcm1fYWNwaS5jIGIvdG9vbHMvbGlieGwvbGlieGxfYXJtX2FjcGkuYwo+
PiBpbmRleCBiYTg3NGMzZDMyLi41MmM0NzZmZjY1IDEwMDY0NAo+PiAtLS0gYS90b29scy9saWJ4
bC9saWJ4bF9hcm1fYWNwaS5jCj4+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2FybV9hY3BpLmMK
Pj4gQEAgLTE5LDYgKzE5LDcgQEAKPj4gICAjaW5jbHVkZSAibGlieGxfYXJtLmgiCj4+ICAgCj4+
ICAgI2luY2x1ZGUgPHN0ZGludC5oPgo+PiArI2luY2x1ZGUgPHhlbi10b29scy9saWJzLmg+Cj4+
ICAgCj4+ICAgLyogQmVsb3cgdHlwZWRlZnMgYXJlIHVzZWZ1bCBmb3IgdGhlIGhlYWRlcnMgdW5k
ZXIgYWNwaS8gKi8KPj4gICB0eXBlZGVmIHVpbnQ4X3QgdTg7Cj4+IC0tIAo+PiAyLjE3LjEKPj4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
