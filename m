Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F5DC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 20:45:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E868D21773
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 20:45:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8clAaSC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E868D21773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGrQn-0002Ea-4K; Wed, 17 Apr 2019 20:45:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CUiA=ST=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGrQl-0002EV-US
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 20:45:19 +0000
X-Inumbo-ID: b6522aac-6151-11e9-ae85-c3750ba2d625
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6522aac-6151-11e9-ae85-c3750ba2d625;
 Wed, 17 Apr 2019 20:45:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 717BE21773;
 Wed, 17 Apr 2019 20:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555533918;
 bh=OMMYkf1XveQleYkUfFx6mm6faMaJKRb1+Gf5A+vUxpk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=a8clAaSClHumLpfFiSypUOTGD58TmmYEHk7JdMr6iVWi4M+CG5C/Lt9PCXO4oTbT6
 KCBtXI61oyhAUG8DTlFT/NuxejS9tbM8eKztuQvJX2vsxkGrWLLy2P+Gmqd+ns4uJD
 bLXx1WAmWuHlH2VN2eX8A5jHnunambWRCB6L2EC4=
Date: Wed, 17 Apr 2019 13:45:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190327184531.30986-3-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-3-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 02/12] xen/arm: fix get_cpu_info() when
 built with clang
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
 sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417204518.FIf6jfiBvT86VFzpoyXa5jxFUfqKNE59zpDFA47J3U4@z>

T24gV2VkLCAyNyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENsYW5nIHVuZGVyc3Rh
bmRzIHRoZSBHQ0Npc20gaW4gdXNlIGhlcmUsIGJ1dCBzdGlsbCBjb21wbGFpbnMgdGhhdCBzcCBp
cwo+IHVuaXRpYWxpc2VkLiBJbiBzdWNoIGNhc2VzLCByZXNvcnQgdG8gdGhlIG9sZGVyIHZlcnNp
b25zIG9mIHRoaXMgY29kZSwKPiB3aGljaCBkaXJlY3RseSByZWFkIHNwIGludG8gdGhlIHRlbXBv
cmFyeSB2YXJpYWJsZS4KPiAKPiBOb3RlIHRoYXQgd2Ugc3RpbGwga2VlcCB0aGUgR0NDaXNtIGlu
IHRoZSBkZWZhdWx0IGNhc2UsIGFzIGl0IGNhdXNlcyBHQ0MKPiB0byBjcmVhdGUgcmF0aGVyIGJl
dHRlciBhc3NlbWJseS4KPiAKPiBUaGlzIGlzIGJhc2VkIG9uIHRoZSB4ODYgY291bnRlcnBhcnQu
CgpJIHVuZGVyc3RhbmQgdGhpcyBpcyBiYXNlZCBvbiBhbiBleGlzdGluZyBhcHByb2FjaCBidXQg
d2hhdCBhYm91dCBvdGhlcgpjb21waWxlcnM/IEkgaGF2ZSBhIHN1Z2dlc3Rpb24gYmVsb3cuCgoK
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0t
LQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2N1cnJlbnQuaCB8IDEwICsrKysrKysrKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2N1cnJlbnQuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0v
Y3VycmVudC5oCj4gaW5kZXggYzRhZjY2ZmJiOS4uNmI3YzFkZjY0ZCAxMDA2NDQKPiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20tYXJtL2N1cnJlbnQuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0v
Y3VycmVudC5oCj4gQEAgLTI4LDggKzI4LDE2IEBAIHN0cnVjdCBjcHVfaW5mbyB7Cj4gIAo+ICBz
dGF0aWMgaW5saW5lIHN0cnVjdCBjcHVfaW5mbyAqZ2V0X2NwdV9pbmZvKHZvaWQpCj4gIHsKPiAr
I2lmZGVmIF9fY2xhbmdfXwo+ICsgICAgdW5zaWduZWQgbG9uZyBzcDsKPiArCj4gKyAgICBhc20g
KCJtb3YgJTAsIHNwIiA6ICI9ciIgKHNwKSk7Cj4gKyNlbHNlCj4gICAgICByZWdpc3RlciB1bnNp
Z25lZCBsb25nIHNwIGFzbSAoInNwIik7Cj4gLSAgICByZXR1cm4gKHN0cnVjdCBjcHVfaW5mbyAq
KSgoc3AgJiB+KFNUQUNLX1NJWkUgLSAxKSkgKyBTVEFDS19TSVpFIC0gc2l6ZW9mKHN0cnVjdCBj
cHVfaW5mbykpOwo+ICsjZW5kaWYKPiArCj4gKyAgICByZXR1cm4gKHN0cnVjdCBjcHVfaW5mbyAq
KSgoc3AgJiB+KFNUQUNLX1NJWkUgLSAxKSkgKwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgU1RBQ0tfU0laRSAtIHNpemVvZihzdHJ1Y3QgY3B1X2luZm8pKTsKPiAgfQoKSSB0aGlu
ayBpdCBtYWtlcyBzZW5zZSB0byBzd2l0Y2ggdGhlICNpZmRlZiBhcm91bmQ6CgojaWZkZWYgX19H
TlVDX18KICAgIC8qIGdjYyBzcGVjaWZpYyBvcHRpbWl6YXRpb24gKi8KI2Vsc2UKICAgLyogcmVn
dWxhciBpbXBsZW1lbnRhdGlvbiAqLwojZW5kaWYKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
