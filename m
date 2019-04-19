Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D63AC282DA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 06:20:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6AEC217F9
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 06:20:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhqOmYml"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6AEC217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHMsK-0003gt-0T; Fri, 19 Apr 2019 06:19:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yXLQ=SV=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hHMsJ-0003go-2y
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 06:19:51 +0000
X-Inumbo-ID: 2284e171-626b-11e9-92d7-bc764e045a96
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2284e171-626b-11e9-92d7-bc764e045a96;
 Fri, 19 Apr 2019 06:19:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a15so1255006wrw.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2019 23:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=C2W3/r+GEreezH+13zV2X9+Eoi6DJ0wQHdKMBonfjTU=;
 b=IhqOmYmlyInomlU2SaUsAMgGRX76UXSKEo8NNFulTrQ3Xhd1Wy7Q6dey5neCdGS/wW
 +OLTt40p3hU9MWu1VqHAKtJHTkamDrDEu1Fg7P9mfvkmvhCNUYNaN6pr2Li9wqrgyNhM
 8gTmOluOeIUffhz72w3Cn+slS9D6Ml1qFX4AVk1mURNOyW2TJMvmFQYFaTVjJ6aXsNkk
 U4yhY+h5QL7IpGU2W+6dHJTyGOZ18VegSXhpoEYwQRQJ1VsjRSLd2CSpDl5U3L00HuGK
 nI6/eSGXEoTciA35bIYPy4OmvZQHJwSQhLU6KI6UfDrnYZFb17GcP0TbpXF3HPjkJyZ8
 ls1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=C2W3/r+GEreezH+13zV2X9+Eoi6DJ0wQHdKMBonfjTU=;
 b=dcI44eEHML1RQpKDbvWVzERftE/GXjpxCovdY8Vobpn11FWGUvdT/AkXX36/gAwIGg
 /84x45hWG0nXMLYwexozQmnwovrs2MSuOLkx2336GtsNn4J1rGvTFBGooA/ZIpiHtp/W
 eQf9+7YH/dyqmD3inUTPexf9WcdaUvDTXXpD3NjLVJYOVV8ycr6GixHJUp5Wd27GXpSL
 CYez83lYYZH3uC/W8e5Sas86MPp9NVQ1wujhtcKiNaTjDKIF2fqfAAX7KZg3SCBDOhKJ
 RcBoTnsAlvQ3UdXjtsdZY4OiavOoScCcftywxYrNcZImsdMhf/6+Fi1HiiMmC6Jgb9lm
 Dm6Q==
X-Gm-Message-State: APjAAAUqARuTl3YSZ38DTQ4xxvKjDG2kSSpDPbWOzgDuYnBonuATsRUu
 4ipFBkMRXgBUItm/wHYlsBWnf+3HaddefD9XGFedZ3lxG0g=
X-Google-Smtp-Source: APXvYqxEmyG8keIBtyWeXESec5uQyYjpfDoRbd4ArjMpP5qNXHy2CD5BiNBVWaLF17YGh1JE3OfpJ2xty4XiNwt2Av8=
X-Received: by 2002:adf:eb0b:: with SMTP id s11mr1709605wrn.140.1555654788725; 
 Thu, 18 Apr 2019 23:19:48 -0700 (PDT)
MIME-Version: 1.0
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Fri, 19 Apr 2019 14:19:37 +0800
Message-ID:
 <CABwOO=fyyChrzXiOkdKGinSHy0NQns4VbNuPiY9DffdDS84=Zw@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] tools/Makefile: the qemu-xen-dir-remote directory in
 qemu-xen-dir-force-update target
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
Message-ID: <20190419061937.yCpwiy2wK3PE76TucVateuvKZ0B1CL7tUApP903A3ds@z>

SSBhbSBsb29raW5nIHRvIGJ1aWxkIGEgWGVuIGZyb20gYSBkb3dubG9hZGVkIHNvdXJjZSB0cmVl
IGF0IGNvbW1pdCBjYjcwYTI2CgpJbiB0aGUgdG9vbHMvTWFrZWZpbGUsIHRoZXJlIGlzIHRoaXMg
dGFyZ2V0IGF0IExpbmUgMjA0CgouUEhPTlk6IHFlbXUteGVuLWRpci1mb3JjZS11cGRhdGUKcWVt
dS14ZW4tZGlyLWZvcmNlLXVwZGF0ZTogcWVtdS14ZW4tZGlyLWZpbmQKICAgICAgICBzZXQgLWV4
OyBcCiAgICAgICAgaWYgWyAiJChRRU1VX1VQU1RSRUFNX1JFVklTSU9OKSIgXTsgdGhlbiBcCiAg
ICAgICAgICAgICAgICBjZCBxZW11LXhlbi1kaXItcmVtb3RlOyBcCiAgICAgICAgICAgICAgICAk
KEdJVCkgZmV0Y2ggb3JpZ2luOyBcCiAgICAgICAgICAgICAgICAkKEdJVCkgcmVzZXQgLS1oYXJk
ICQoUUVNVV9VUFNUUkVBTV9SRVZJU0lPTik7IFwKICAgICAgICBmaQoKaG93ZXZlciwgaSBjYW4n
dCBmaW5kIGFueSBvdGhlciBtZW50aW9uIG9mIHRoZSBkaXJlY3RvcnkgInFlbXUteGVuLWRpci1y
ZW1vdGU7IgppbiB0aGUgc291cmNlIHRyZWUsIG90aGVyIHRoYW4gdGhlIHJlbW92YWwgb2YgaXQg
aW4gdGhlIHNhbWUKTWFrZWZpbGUncyBkaXN0Y2xlYW4KdGFyZ2V0LCB2aXM6CgouUEhPTlk6IGRp
c3RjbGVhbgpkaXN0Y2xlYW46IHN1YmRpcnMtZGlzdGNsZWFuIGNsZWFuCiAgICAgICAgcm0gLXJm
IHFlbXUteGVuLXRyYWRpdGlvbmFsLWRpciBxZW11LXhlbi10cmFkaXRpb25hbC1kaXItcmVtb3Rl
CiAgICAgICAgcm0gLXJmIHFlbXUteGVuLWRpciBxZW11LXhlbi1kaXItcmVtb3RlIHFlbXUteGVu
LWJ1aWxkCiAgICAgICAgcm0gLXJmIC4uL2NvbmZpZy9Ub29scy5tayBjb25maWcuaCBjb25maWcu
bG9nIGNvbmZpZy5zdGF0dXMgXAogICAgICAgICAgICAgICAgY29uZmlnLmNhY2hlIGF1dG9tNHRl
LmNhY2hlCgpzbyB3aGVyZSB3b3VsZCBpdCBnZXQgY3JlYXRlZCA/CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
