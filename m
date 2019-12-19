Return-Path: <SRS0=c1+a=2J=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED97AC43603
	for <xen-devel@archiver.kernel.org>; Thu, 19 Dec 2019 19:50:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4CA224679
	for <xen-devel@archiver.kernel.org>; Thu, 19 Dec 2019 19:50:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prSGgmHh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4CA224679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii1ob-0002NA-Ux; Thu, 19 Dec 2019 19:50:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8Kc=2J=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ii1oa-0002N5-IP
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 19:50:28 +0000
X-Inumbo-ID: cdfa843e-2298-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cdfa843e-2298-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 19:50:27 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so6900621wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 11:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5wpPHnpDeyeFDidsCIMMYMVD1TOgl8+nb04zRKgbJOg=;
 b=prSGgmHhl3EWH3L1UZ0hJ3rxqrB4a8xAUfkLJBT49KSizYaB1woTWXFZx7XvhbVrJi
 tD7+uaLI+C5qBpov2PpV5cE+boq8przGVovy2GAwwaxwsA0BYvb0uuYBUTnw0+svsjbf
 UCwu4PMT0BNDE1hx5dWU9qs9LCvNlcdJAoQc54b1cIT6njWZostajXpg96oPJCdVPdmD
 RMA0NE1gCvB3h0P96voQ00hS33T9mffnb+PWl1zUzOvjAcfYzbJq5SQDOqviQqtkpgjy
 TkCHln/LRCroAhUP83v5iux8l5s9j04fyq0Ok8HYKj6Dr6D8BsVmocJGOakqx2/ySoHA
 m+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5wpPHnpDeyeFDidsCIMMYMVD1TOgl8+nb04zRKgbJOg=;
 b=gC9CuNvaSOZowIn9TmREt98gl9wCsM+gRRondk6vxntmtutpRfcQjUNjSOcDrtlz+D
 gFdzOkna44WvZRCOTgRPHJ264JUaE/zlqEsgrOlpWZahQPyiMIgZwnK47pQk21XYfoRl
 aYjuqt1X4SEV1rEv4u8JfBj57ZM7ugsemDRCmN3s4fZe/2Y+7cydHgvJ5CMqqK22lnad
 P9WtmKHGazv2kiULpx4BiF3VGfzQoNL2bgxgiti9+nOHizzBnMs5yfbt2hONaLZIBnC3
 Luu67Qy2wh91+m7Dj2W0pCPmvNIVYatmpnzQtqJoeqnPwBXi+OUXunAwET0Wy/YupHQ/
 oCDw==
X-Gm-Message-State: APjAAAXo91QGXKAJae0FxBWtxj/ixEMSyyfl8na3oYVnnAOyB/PUjlUb
 vWTgX0TvJOsNk45bXvFA6EZUaWS1a6+ijsHnbgw=
X-Google-Smtp-Source: APXvYqxTiIH77CdU/GIsy15vUjCSFbOW9nQe/5Tpjo3vtutq+r12Cmg8Z0puaexXevlNi1p7M66K16BkXByogTLoN3k=
X-Received: by 2002:a1c:7918:: with SMTP id l24mr12707630wme.125.1576785027079; 
 Thu, 19 Dec 2019 11:50:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <04757755-7464-07d6-9a0f-14f78f20bb4d@citrix.com>
 <CABfawhkaLMX9aM0dFP1M7foRUa9fi7ZaoQwXpw0ZXAcjVmYsuw@mail.gmail.com>
 <19a06020-924b-be4c-8015-2093cc8d1a33@citrix.com>
In-Reply-To: <19a06020-924b-be4c-8015-2093cc8d1a33@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 19 Dec 2019 12:49:50 -0700
Message-ID: <CABfawhm_MjH=AgGjqT-EFPS=q=+6TMrnm50Aq_KX-2Wa815qeA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMTI6NDEgUE0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxOS8xMi8yMDE5IDE5OjM4LCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5o
Cj4gPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCj4gPj4+IEBAIC0zMzUs
NiArMzM1LDEwIEBAIHVuc2lnbmVkIGxvbmcgaHZtX2NyNF9ndWVzdF92YWxpZF9iaXRzKGNvbnN0
IHN0cnVjdCBkb21haW4gKmQsIGJvb2wgcmVzdG9yZSk7Cj4gPj4+ICBib29sIGh2bV9mbHVzaF92
Y3B1X3RsYihib29sICgqZmx1c2hfdmNwdSkodm9pZCAqY3R4dCwgc3RydWN0IHZjcHUgKnYpLAo+
ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqY3R4dCk7Cj4gPj4+Cj4gPj4+ICsv
KiBDYWxsZXIgbXVzdCBob2xkIGRvbWFpbiBsb2NrcyAqLwo+ID4+IEhvdyBhYm91dCBhc3NlcnRp
bmcgc28/Cj4gPiBBRkFJQ1QgdGhlcmUgaXMgbm8gImRvbWFpbl9sb2NrZWRfYnlfbWUiIGZ1bmN0
aW9uLCBvbmx5Cj4gPiBwYWdpbmcvcDJtL2dmbl9sb2NrZWRfYnlfbWUuIFNvIGFueSBzdWdnZXN0
aW9uIG9uIGhvdyB0byBhY2hpZXZlIHRoYXQ/Cj4KPiBzcGluX2lzX2xvY2tlZCgpIGdldHMgeW91
IG1vc3Qgb2YgdGhlIHdheSwgYW5kIHdvdWxkIGJlIGEgc3RhcnQuCj4KPiBCdXQgeWVzIC0gbm93
IHlvdSBzYXkgdGhpcywgSSByZW1lbWJlciB0aGF0IHdlIGRvbid0IGN1cnJlbnRseSBoYXZlCj4g
c3VpdGFibGUgaW5mcmFzdHJ1Y3R1cmUuCgpJcyB0aGUgZG9tYWluIGxvY2sgZXZlbiBhIHNwaW4g
bG9jayAodGhlIG9uIHlvdSB1c2UgYnkKcmN1X2xvY2tfbGl2ZV9yZW1vdGVfZG9tYWluX2J5X2lk
KT8gTG9va3MgdG8gbWUgaXQganVzdCBnb2VzIGRvd24gdG8KInJjdV9yZWFkX2xvY2siIHdoaWNo
IG9ubHkgZG9lcyBhIHByZWVtcHRfZGlzYWJsZSgpIGNhbGwgby5PCgpUYW1hcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
