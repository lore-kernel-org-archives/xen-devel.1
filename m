Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB705C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 21:27:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96869206A3
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 21:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96869206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK8Mx-0006Yw-1R; Fri, 26 Apr 2019 21:26:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK8Mv-0006Yl-OD
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 21:26:53 +0000
X-Inumbo-ID: 01e78de4-686a-11e9-966e-eb650963b161
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 01e78de4-686a-11e9-966e-eb650963b161;
 Fri, 26 Apr 2019 21:26:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEFEAA78;
 Fri, 26 Apr 2019 14:26:51 -0700 (PDT)
Received: from [10.37.8.211] (unknown [10.37.8.211])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 073C43F557;
 Fri, 26 Apr 2019 14:26:50 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
 <20190426164002.22381-12-ian.jackson@eu.citrix.com>
 <8ba9d00a-daa1-c09d-4b7b-7556a9d98a7e@arm.com>
Message-ID: <801bd1ba-1be4-c39c-8842-1d14623ff04e@arm.com>
Date: Fri, 26 Apr 2019 22:26:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8ba9d00a-daa1-c09d-4b7b-7556a9d98a7e@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 11/15] cross builds:
 ts-kernel-build: Support cross target armhf
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426212649.4fgr92ZVE5pUx9aH5HsBkwmoax9qp5dBD2G8KECJMYs@z>

CgpPbiA0LzI2LzE5IDEwOjIzIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgSWFuLAo+IAo+
IFRoYW5rIHlvdSBmb3IgbG9va2luZyBpbnRvIHRoaXMuCj4gCj4gT24gNC8yNi8xOSA1OjM5IFBN
LCBJYW4gSmFja3NvbiB3cm90ZToKPj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+Cj4+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgo+PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pgo+PiAtLS0KPj4gwqAgdHMta2VybmVsLWJ1aWxkIHwgMTkgKysrKysrKysrKysrKysrKysrLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvdHMta2VybmVsLWJ1aWxkIGIvdHMta2VybmVsLWJ1aWxkCj4+IGluZGV4
IDcyY2E5OGExLi4yOWM2YzQzZCAxMDA3NTUKPj4gLS0tIGEvdHMta2VybmVsLWJ1aWxkCj4+ICsr
KyBiL3RzLWtlcm5lbC1idWlsZAo+PiBAQCAtMjEsNiArMjEsNyBAQCBCRUdJTiB7IHVuc2hpZnQg
QElOQywgcXcoLik7IH0KPj4gwqAgdXNlIE9zc3Rlc3Q7Cj4+IMKgIHVzZSBPc3N0ZXN0OjpUZXN0
U3VwcG9ydDsKPj4gwqAgdXNlIE9zc3Rlc3Q6OkJ1aWxkU3VwcG9ydDsKPj4gK3VzZSBDYXJwOwo+
PiDCoCB0c3JlYWRjb25maWcoKTsKPj4gQEAgLTQ4LDkgKzQ5LDI0IEBAIG15ICRwYXJtcyA9ICRh
cmNocGFybXMtPnsgJHJ7YXJjaH0gfTsKPj4gwqAgc3ViIGVuYWJsZV94ZW5fY29uZmlnICgpOwo+
PiArb3VyICRhcmNoX2VudnZhcnMgPSAnJzsKPj4gKwo+PiDCoCBzdWIgY21kICgkJCkgewo+PiDC
oMKgwqDCoMKgIG15ICgkdGltZW91dCwgJHNjcmlwdCkgPSBAXzsKPj4gLcKgwqDCoCB0YXJnZXRf
Y21kX2J1aWxkKCRobywgJHRpbWVvdXQsICRidWlsZGRpciwgJHNjcmlwdCk7Cj4+ICvCoMKgwqAg
dGFyZ2V0X2NtZF9idWlsZCgkaG8sICR0aW1lb3V0LCAkYnVpbGRkaXIsICRhcmNoX2VudnZhcnMu
JHNjcmlwdCk7Cj4+ICt9Cj4+ICsKPj4gK3N1YiBjaGVja2FyY2ggKCkgewo+PiArwqDCoMKgIHJl
dHVybiBpZiAkcnthcmNofSBlcSAkaG8tPntBcmNofTsKPj4gK8KgwqDCoCBteSAkY2MgPSAnZ2Nj
JzsKPj4gK8KgwqDCoCBpZiAoJHJ7YXJjaH0gZXEgJ2FybWhmJykgewo+PiArwqDCoMKgIHRhcmdl
dF9pbnN0YWxsX3BhY2thZ2VzKCRobywgImNyb3NzYnVpbGQtZXNzZW50aWFsLSRye2FyY2h9Iik7
Cj4+ICvCoMKgwqAgJGFyY2hfZW52dmFycyA9IDw8RU5EOwo+PiArwqDCoMKgIGV4cG9ydCBBUkNI
PWFybSBIT1NUQ0M9JGNjIENST1NTX0NPTVBJTEU9YXJtLWxpbnV4LWdudWVhYmloZi0KPiAKPiBO
SVQ6IEhPU1RDQyBpcyBub3QgbmVjZXNzYXJ5LiBJdCB3aWxsIGJlIGRlZmF1bHQgdG8gZ2NjIGlm
IG5vdCBwYXNzZWQuCj4gCj4gT3RoZXJ3aXNlLCB0aGUgZXhwb3J0IGxvb2tzIHdyaXRlIHRvIG1l
LgoKSSBmb3Jnb3QgdG8gbWVudGlvbiB0aGF0IHlvdSBjYW4gYWRkIG15IGFjayBvbmUgaW4gYW55
IGNhc2U6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
