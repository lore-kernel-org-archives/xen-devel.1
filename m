Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11AEC10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:20:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7963E206B7
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7963E206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEsM1-0003iA-Nu; Fri, 12 Apr 2019 09:20:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCWt=SO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEsM0-0003i5-Ct
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 09:20:12 +0000
X-Inumbo-ID: 2c47da4b-5d04-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2c47da4b-5d04-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 09:20:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 52668C0546F8;
 Fri, 12 Apr 2019 09:20:11 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-65.rdu2.redhat.com
 [10.10.120.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6DE8600C5;
 Fri, 12 Apr 2019 09:20:09 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-20-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <cf21ea86-8e6a-ebb1-dc01-dc364530553a@redhat.com>
Date: Fri, 12 Apr 2019 11:20:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-20-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 12 Apr 2019 09:20:11 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 19/31]
 OvmfPkg/XenPlatformPei: Introduce XenPvhDetected
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412092008.CFhkY4Pkvt6Rnt_sawHi-1IZK-ksm3ZoJAIpJXu2hT4@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IENvbnRyaWJ1dGVkLXVu
ZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oIHwgIDUgKysrKysKPiAgT3ZtZlBrZy9YZW5Q
bGF0Zm9ybVBlaS9YZW4uYyAgICAgIHwgMTMgKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9QbGF0Zm9ybS5oIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCj4gaW5k
ZXggYTUyNGMyM2E0My4uYzVhMTM5ZjAxNiAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblBsYXRm
b3JtUGVpL1BsYXRmb3JtLmgKPiArKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3Jt
LmgKPiBAQCAtMTA1LDYgKzEwNSwxMSBAQCBYZW5Idm1sb2FkZXJEZXRlY3RlZCAoCj4gICAgVk9J
RAo+ICAgICk7Cj4gIAo+ICtCT09MRUFOCj4gK1hlblB2aERldGVjdGVkICgKPiArICBWT0lECj4g
KyAgKTsKPiArCj4gIFZPSUQKPiAgQW1kU2V2SW5pdGlhbGl6ZSAoCj4gICAgVk9JRAo+IGRpZmYg
LS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9YZW4uYwo+IGluZGV4IGIzNmVmZjUyNGQuLjIzZmYzMTAyYjUgMTAwNjQ0Cj4gLS0tIGEv
T3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+ICsrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1Q
ZWkvWGVuLmMKPiBAQCAtMjE3LDYgKzIxNywxOSBAQCBYZW5Idm1sb2FkZXJEZXRlY3RlZCAoCj4g
ICAgcmV0dXJuIChtWGVuSHZtbG9hZGVySW5mbyAhPSBOVUxMKTsKPiAgfQo+ICAKPiArQk9PTEVB
Tgo+ICtYZW5QdmhEZXRlY3RlZCAoCj4gKyAgVk9JRAo+ICsgICkKPiArewo+ICsgIC8vCj4gKyAg
Ly8gVGhpcyBmdW5jdGlvbiBzaG91bGQgb25seSBiZSB1c2VkIGFmdGVyIFhlbkNvbm5lY3QKPiAr
ICAvLwo+ICsgIEFTU0VSVCAobVhlbkluZm8uVmVyc2lvbk1ham9yICE9IDApOwo+ICsKPiArICBy
ZXR1cm4gbVhlbkh2bWxvYWRlckluZm8gPT0gTlVMTDsKPiArfQo+ICsKPiAgVk9JRAo+ICBYZW5Q
dWJsaXNoUmFtUmVnaW9ucyAoCj4gICAgVk9JRAo+IAoKKDEpIFBsZWFzZSB3cml0ZSBhIG5vbmVt
cHR5IGNvbW1pdCBtZXNzYWdlIGJvZHkuCgp3aXRoIHRoYXQKCkFja2VkLWJ5OiBMYXN6bG8gRXJz
ZWsgPGxlcnNla0ByZWRoYXQuY29tPgoKVGhhbmtzCkxhc3psbwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
