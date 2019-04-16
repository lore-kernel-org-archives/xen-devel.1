Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778BEC10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 21:09:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48DC42073F
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 21:09:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qi0VQyZ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48DC42073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGVKc-0002vp-UK; Tue, 16 Apr 2019 21:09:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGVKc-0002vk-7b
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 21:09:30 +0000
X-Inumbo-ID: ebc5ffea-608b-11e9-bf5c-9b6a1b9db1e0
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebc5ffea-608b-11e9-bf5c-9b6a1b9db1e0;
 Tue, 16 Apr 2019 21:09:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04B212073F;
 Tue, 16 Apr 2019 21:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555448968;
 bh=3uIBN3RlQ6Rfi8qI5itZ3r97U84G1jI/rufcnZfdXrg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Qi0VQyZ78CBiN+woF2HO6o4xykJzdaNbFJEms+2oOxK8kV72+2gCimlJYP+mTIM09
 GrZssemYBZ2M8vLJFnVXOtfZgRQPod4b9eLnm8lQ/0DDohoe/wWOESrlYyFkZW26pq
 QIRKm9Zw03SlCSC4f4JX7Rav4dzsQ5aCIQ45qoe4=
Date: Tue, 16 Apr 2019 14:09:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190319232343.24371-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904161409220.1370@sstabellini-ThinkPad-X260>
References: <20190319232343.24371-1-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: kernel: Remove Dom prefix when
 using %pd format
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416210927.P_T3lM58SLppIRtoVwOU8zjAklqJwzSKySo3eQGyJz0@z>

T24gVHVlLCAxOSBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBmb3JtYXQgJXBk
IHdpbGwgYWxyZWFkeSBwcmVmaXggdGhlIGRvbWFpbiBJRCB3aXRoICdkJy4gU28gYXZvaWQgdG8K
PiBwcmVmaXggd2l0aCAnRG9tJy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9rZXJuZWwuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9rZXJuZWwuYyBiL3hlbi9hcmNoL2FybS9rZXJuZWwuYwo+
IGluZGV4IGQwNGE4NjJmOTkuLmUzZmZkYjJmYTEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJt
L2tlcm5lbC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2tlcm5lbC5jCj4gQEAgLTQ4NCw3ICs0ODQs
NyBAQCBpbnQgX19pbml0IGtlcm5lbF9wcm9iZShzdHJ1Y3Qga2VybmVsX2luZm8gKmluZm8sCj4g
ICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gICAgICB9Cj4gIAo+IC0gICAgcHJpbnRrKCJMb2Fk
aW5nIERvbSVwZCBrZXJuZWwgZnJvbSBib290IG1vZHVsZSBAICUiUFJJcGFkZHIiXG4iLAo+ICsg
ICAgcHJpbnRrKCJMb2FkaW5nICVwZCBrZXJuZWwgZnJvbSBib290IG1vZHVsZSBAICUiUFJJcGFk
ZHIiXG4iLAo+ICAgICAgICAgICAgIGluZm8tPmQsIGluZm8tPmtlcm5lbF9ib290bW9kdWxlLT5z
dGFydCk7Cj4gICAgICBpZiAoIGluZm8tPmluaXRyZF9ib290bW9kdWxlICkKPiAgICAgICAgICBw
cmludGsoIkxvYWRpbmcgcmFtZGlzayBmcm9tIGJvb3QgbW9kdWxlIEAgJSJQUklwYWRkciJcbiIs
Cj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
