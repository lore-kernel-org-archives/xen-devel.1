Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A871DC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 08:10:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74C3E217D4
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 08:10:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5GAehY6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74C3E217D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEUmT-0000uP-3U; Thu, 11 Apr 2019 08:09:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D0GR=SN=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hEUmR-0000uK-4t
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 08:09:55 +0000
X-Inumbo-ID: 2fb52af6-5c31-11e9-92d7-bc764e045a96
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2fb52af6-5c31-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 08:09:54 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w1so6061773wrp.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2019 01:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=5gXAcL8iRjaQZfZ7ifCmzqhLYfZFbHB3NCX64+eHN44=;
 b=p5GAehY6L5h5Rjujc1iuNv/Soo4EROB7MHOGUii4DL+znng4uTokyLV2OpDgMSxh2V
 y9OGcFdaEnneoHRs1i9/1Cb9PQkibNHCXvQ+/2v74xdGnkF0Uxi7Wfpk09l1wYAz0/pV
 hg3EatlB1edfTkFKlmNPac0OxyYzIuohnCYPl7W7AUvRrUvTjKeEs/3r8UIDISFH/Jgg
 CZrtiTd7OM6kusS4X9IHDwxD2YhrR10hgJxmnAhb03JnlVmXDB1+ruyCo8nOA5rSz1nS
 7los3rtI6yK0OEYH8tHypksbeycTlAlQ8UVHs4T1W1WgkwjaTg6qVVbiQwQJJKJBZ1Tu
 IsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=5gXAcL8iRjaQZfZ7ifCmzqhLYfZFbHB3NCX64+eHN44=;
 b=Xxlh59iCVqXk9+AFiO0Cp/P+4DkOZUxajkws+UEnI7PCzvX9SEGTNsQEgwkO6MIpJe
 Z0P+wLPo6uf7M4XfPoaO2QkanOKEGy4DKyD0l130AuRHG1wwdAHWFYQ85QXCXXvwkQBz
 PzId69NwzIpucMSAiJ6dOdBywjVKOa2727QJBcg0K9ZEvhnEDbnKAEgs5WVdp6tRnXs2
 4W6Rc2feUEH1wgiyOovIa1De4OxvpCFPcDMSEcnQiNYQAOMyTNgOaBr2xjg8/QnVGLOh
 tguEBXiMj3mwQ090C7mSlyVrZdd40L3IzjP1uFoV43I9wm4TfN5yQtsvqclvI1fEcdT9
 mlLw==
X-Gm-Message-State: APjAAAViOVPW5iEkvgJPgdjEnslyWFjvNaJ1y6Kt1yaw1EPSbBsHKu90
 vPtatVzItD6EIAIHoGRPE068MVLUSlXjt0YYpMkL2h7o
X-Google-Smtp-Source: APXvYqyZW+uLXx63+mclxlaAFFe3Q7z+0aGsWsfhUn6iS0V2vg5XjTrPyDreLST1sUixH/D67nZ+wfKm0Wh8LCdzf+I=
X-Received: by 2002:adf:e50d:: with SMTP id j13mr32017403wrm.165.1554970193080; 
 Thu, 11 Apr 2019 01:09:53 -0700 (PDT)
MIME-Version: 1.0
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Thu, 11 Apr 2019 16:09:42 +0800
Message-ID:
 <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] Xen commit 9b0bc91b3 possibly removed too much info
 from README
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411080942.vWOwT_aYa0CesCSPUYny9JQtC-qdDGt8gPZghzYU1QM@z>

Rmlyc3RseSwgd2FudCB0byBzYXkgaG93IGhhcHB5IEkgd2FzIHRvIHNlZSB0aGUgcmVsaWFuY2Ug
b24gUHl0aG9uMiBnbywKbm90IGxlYXN0LCBhcyBhIExpbnV4IEZyb20gU2NyYXRjaCBidWlsZGVy
LCB3aGVyZSBQeXRob24zIGlzIG5vdyBwYXJ0Cm9mIHRoZSAiY29yZSBPUyIsIG9uZSBkb2Vzbid0
IGhhdmUgdG8gYWxzbyBpbnN0YWxsIFB5dGhvbjIsIGhvd2V2ZXIsCgpJIGdyYWJiZWQgeW91ciBt
YXN0ZXIgYnJhbmNoIGxhc3QgbmlnaHQgKGNiNzBhMjYpIHRvIHRyeSB0aGluZ3Mgb3V0IGFuZApz
dGlsbCBmZWxsIGZvdWwgb2YgYSAibmVlZCB0byBkZWZpbmUgUFlUSE9OIiBhdCB0aGUgdG9vbHMv
Y29uZmlndXJlIHN0YWdlLgoKTXkgaXNzdWUgaXMgcmVzdWx0aW5nIGZyb20gdGhlIGZhY3QgdGhh
dCBQeXRob24zIGhhcyBvbmx5IGJlZW4gaW5zdGFsbGVkIGFzCiJweXRob24zIiwgd2hlcmVhcyB0
aGUgY29uZmlndXJlIHNjcmlwdCBpbiB0aGUgdG9vbHMgZGlyZWN0b3J5IGFwcGVhcnMgdG8KYmUg
bG9va2luZyBmb3IgYSBiYXJlICJweXRob24iLgoKTm93LCB0aGUgcmVsZXZhbnQgdGV4dCBpbiB0
aGUgb2xkIFJFQURNRSB1c2VkIHRvIHNheQoKLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0t
LS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLQpOb3RlIHRoYXQg
dGhlIGJ1aWxkIHN5c3RlbSBleHBlY3RzIGBweXRob25gIHRvIGJlIHB5dGhvbjIuICBJZiB5b3Vy
IHN5c3RlbQpoYXMgYHB5dGhvbmAgcG9pbnRpbmcgdG8gcHl0aG9uMyAoYXMgaW4gdGhlIGNhc2Ug
b2YgQXJjaCBMaW51eCBvciBBbmFjb25kYSksCnlvdSdsbCBuZWVkIHRvIHNwZWNpZnkgYSBwYXRo
IHRvIGEgcHl0aG9uMiBiaW5hcnkgd2hlbiBydW5uaW5nIGNvbmZpZ3VyZToKCiAgICAgUFlUSE9O
PS91c3IvYmluL3B5dGhvbjIgLi9jb25maWd1cmUKLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0t
LS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLQoKCmJ1dCBp
dCBzdHJpa2VzIG1lIHRoYXQgc29tZSBzeXN0ZW1zIG1heSBvbmx5IGhhdmUgYW4gZXhwbGljaXRs
eSBuYW1lZApweXRob24zLCBpbiB3aGljaCBjYXNlLCBpdCBtaWdodCBoYXZlIGJlZW4gYmV0dGVy
IHRvIG5vdCBoYXZlIGNvbXBsZXRlbHkKcmVtb3ZlZCB0aGUgImhvdyB0byBkZWZpbmUgeW91ciBs
b2NhbCBQWVRIT04iIHBhcmFncmFwaCwgYnV0IHRvIGhhdmUKcmUtd29yZGVkIGl0IHRvIG5vdGUg
dGhhdCBpZiBvbmx5IGhhdmUgcHl0aG9uMyAob3IgcGVyaGFwcyBkb24ndCBoYXZlIGEKYmFyZSBw
eXRoaW4pIHRoZW4geW91J2xsIG5lZWQgdG8gZXhwbGljaXRseSBkZWZpbmUgaXQgYXQgdGhlIGNv
bmZpZ3VyZSBzdGFnZQphbmQgdG8gc2hvdyBob3cgaXQncyBkb25lLgoKSG9waW5nIHRoYXQncyB1
c2VmdWwsCktldmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
