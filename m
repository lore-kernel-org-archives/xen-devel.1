Return-Path: <SRS0=/O7i=SW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2762CC282DD
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 05:10:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8A9F21855
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 05:09:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9EeJSbi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8A9F21855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHiG4-0004zo-Mk; Sat, 20 Apr 2019 05:09:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtSH=SW=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hHiG3-0004zh-F0
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2019 05:09:47 +0000
X-Inumbo-ID: 7d7e1d5b-632a-11e9-92d7-bc764e045a96
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7d7e1d5b-632a-11e9-92d7-bc764e045a96;
 Sat, 20 Apr 2019 05:09:46 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id w15so8248101wmc.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2019 22:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9oi4mBCwY0LSVdRduDsGyF3xjPDlfX5s67+DH+Xo5/4=;
 b=d9EeJSbiE56rN1I/LZGu5kgAU2/BBDzUoyieoLpAZRRDMuXyYLVzuWDcV3H/MCVYps
 0zcNe2BNqbmhrEfyfjofz3CcrbMMaAfhzp8Mz7CiUx2PdDbE/Xt7r8xAGddfcwCEh+eR
 w3P6buyZ4PWiciTgIq4C93t2iG5tjAY0IYMo/rk8mUED/0196IXbuaJuodBpHvPHSRfo
 1IWVrYhQJRA3Nf/NOyluCEMcWn3ZwX8VlyjKW7RBz+lCUa9w4TJSQkfFMa+9Fkj/9fab
 9lV8PiLsjV89GtmiLDn72Xmiu0+iTFArB5DM7BaVwv/C9D18JYuxzNT817uCxxxEoZ/0
 y5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9oi4mBCwY0LSVdRduDsGyF3xjPDlfX5s67+DH+Xo5/4=;
 b=NC+iZKZF4ss6PiHpTsFrcQNgh5+4ChzJpAtmGxURoy1THdM3+vAboY2ISSxH4gjwr0
 mKKQ3du18+1ZNDwsXmQplsvZWOnlGWkkoMVeb5Dbgl3KoNsjwB3hb18j2tyG/feAM617
 gfkIZQQZF1bpE5F36sziiw4A4Dsadqnr6t7ACg0i2AKrg46t7d6j7F4HoLxjVARWnrwe
 ZVfbioQjBL3CBaDcm/vBhZldK+6jt8V2rqaLcRP18R8xhYd2A1b3yXnYi84LaGjRIIwn
 OA+j0rnDMJHhj9zn3BybR0X9v4HkaYFAhiU+Gt85TjBYFNxOvywGZ0hko2bGvRDcgww5
 lmHw==
X-Gm-Message-State: APjAAAU2jNvQ0dJGJlbYqSXM4QSW3PZ31S+otUHfg4rZYeo3S9L9Z90J
 A1c2QhqIvT63ImVb/CAsOOrbo5EuXvpPNBh7NOp+TJBfagM=
X-Google-Smtp-Source: APXvYqzqk0gjBtozZ+4RSXOnJcL5OHIqKmi37Sq0S0+BHzGybC6hMaVC39E/DAw0BRWZlfmdsNIWw8SwVUfSSEVvvxs=
X-Received: by 2002:a1c:7e10:: with SMTP id z16mr5049717wmc.117.1555736975190; 
 Fri, 19 Apr 2019 22:09:35 -0700 (PDT)
MIME-Version: 1.0
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Sat, 20 Apr 2019 13:09:24 +0800
Message-ID:
 <CABwOO=c+9+LrU1ni3M9Mq8JDpepGG2624g+oCL4GWKJBRwuT1Q@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] "make world" clobbers doc/man{1, 5, 7,
 8} but doesn't always receate them
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190420050924.pSAxqqZ9LwyHqq8bni8s-GyX1arhiHf5JZ5YfVeP9jk@z>

SXNzdWluZyBhICJtYWtlIHdvcmxkIiBjbG9iYmVycyBmb3VyIGRpcmVjdG9yaWVzIHdpdGhpbiB0
aGUKc291cmNlIHRyZWUKCiBkb2MvbWFuWzEsNSw3LDh9CgphcyBwYXJ0IG9mIHRoZSAibWFrZSBj
bGVhbiIKClRob3NlIGRpcmVjdG9yaWVzIGRvbid0IGFwcGVhciB0byBiZSByZS1jcmVhdGVkIGR1
cmluZyB0aGUKIm1ha2UgZGlzdCIgd2l0aGluIG15IHJlY2VudCBidWlsZC4KCkFzIHRoZSB0b3Bs
ZXZlbCBNYWtlZmlsZSBoYXMKCm1ha2Ugd29ybGQ6CiAgICAkKE1BS0UpIGNsZWFuCiAgICAkKE1B
S0UpIGRpc3QKCkkgZm91bmQgdGhhdCBieSBkb2luZyB0aG9zZSB0d28gc3BlcmF0ZWx5LCBJIHdh
cyBhZmZvcmRlZAphbiBvcHBvcnR1bml0eSB0byByZS1jcmVhdGUgdGhvc2UgZGlyZWN0b3JpZXMK
Cm1ha2UgY2xlYW4KCm1rZGlyIGRvY3MvbWFuMSBkb2NzL21hbjUgZG9jcy9tYW43IGRvY3MvbWFu
OAoKbWFrZSBkaXN0LgoKU2hvdWxkIEkgbmVlZCB0byBkbyB0aGF0LCBvciBpcyB0aGVyZSBhIHBh
dGgsIGFsYmVpdCBvbmUgbGVzcwp0cm9kZGVuLCBpbiB0aGUgYnVpbGQgc3lzdGVtLCB0aGF0IGNh
biBzZWUgYSAibWFrZSB3b3JsZCIKY2xlYW4gdGhlIGRpcnMgYnV0IG5vdCByZWNyZWF0ZSB0aGVt
PwoKS2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
