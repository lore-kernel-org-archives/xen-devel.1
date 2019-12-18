Return-Path: <SRS0=H5Oh=2I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0D3C43603
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 21:11:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A14B24650
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 21:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Yc9HL4dm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A14B24650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihgbD-0000K3-9a; Wed, 18 Dec 2019 21:11:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VLNm=2I=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1ihgbC-0000Jx-Er
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 21:11:14 +0000
X-Inumbo-ID: ebf35c5e-21da-11ea-a1e1-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebf35c5e-21da-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 21:11:13 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id cy15so2835452edb.4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 13:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hr7toINHw/iAnDrTVS41gqcv0IO9jGOGlaJRRX6HtRc=;
 b=Yc9HL4dmvuVtA1hqpH3w649GWiSriaIdkvI8nXwcp2OqH8ZA710XQUf7rzqbIvmvSs
 wIQ2X1WO0b68Wrbnx34fUtBQ4DUY9+cutDhxyPRLLXCzDzQgIlSmRi88M4J7y5OTFAdf
 utyUH6R7V4Wg6zCugkdFlYh+oiEMcrcthwzghhD8AeCnoCByKEw/uRG4Khy9wPOpXezo
 LVA1NJynvisLO8eCsjUz5L222tAGwjRM+e+BzIAeK379y0NcuXcnvHZ3PW8pguMmhDm5
 /oUXQ4+shDdOnc0H1rtFMsxegKAuoDq2jO7t51FvxpHfoVPyfJ96EjLF8IOi51I8dG3H
 sfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hr7toINHw/iAnDrTVS41gqcv0IO9jGOGlaJRRX6HtRc=;
 b=SCh7Z7Xhk8Udy3rl7w2ACLD6sCuVIq5Z+t+D5UeKOHTKNEHB615BXND5+uvxz76ZPn
 AGRN8pz5mU82rbsw9E08/PXbpIB3Z2VL5qes4uMI/mGm4EJ2K8eSS43FBFEfTRTP6KZH
 3Zsja0FYMq+9D1C5L+rlkBe85EfWR1gJfofMR+Em6WMtARbUeGzlx+8ciHH2NPtgM1SF
 Qnz4eIBLUYlRW+PuB1rMlZ8XZZyiUMeiyX5hEBrHQt47UNaVevoxlknks++g32FXtewQ
 dP/Lvbcl+ZitWD0cNavaX64TBuLAe3ZQj3zU0c7/XUbU1fJPeS0bG3PrZ9LD2+VSDkld
 FvjA==
X-Gm-Message-State: APjAAAVq8ee0GuDL3pe8kkGTJuMyb1LV7xr6iJJvnCsL8q5N39yFrggC
 gk8lt8OV02ZBliH6/l8Zr1KISMYiRYZVqJkDkEh8LQ==
X-Google-Smtp-Source: APXvYqxUveWYs+R5UGAvJL5Zp/Pe1Egw5UoWu7yq5s55Vn88PgYlF8axZ/QOJSQ2OANQC2UMBMt8bropFYpNPNkUfOs=
X-Received: by 2002:a05:6402:1cbb:: with SMTP id
 cz27mr4984720edb.227.1576703472972; 
 Wed, 18 Dec 2019 13:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
 <20191204232058.2500117-2-pasha.tatashin@soleen.com>
 <c5dcf342-90f4-beb5-d2b1-4a37ccedfe42@xen.org>
In-Reply-To: <c5dcf342-90f4-beb5-d2b1-4a37ccedfe42@xen.org>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 18 Dec 2019 16:11:02 -0500
Message-ID: <CA+CK2bDySpttFq1ro2QK9jPoRi5unXz6bx-6Qv1OpoNimMd6Ug@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] [PATCH v4 1/6] arm/arm64/xen: hypercall.h add
 includes guards
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Stefan Agner <stefan@agner.ch>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 boris.ostrovsky@oracle.com, Sasha Levin <sashal@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 James Morris <jmorris@namei.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 alexios.zavras@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 allison@lohutok.net, jgross@suse.com, steve.capper@arm.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+ICAgICAgIC8qCj4gPiAtICAgICAgKiBXaGVuZXZlciB3ZSByZS1lbnRlciB1c2Vyc3BhY2Us
IHRoZSBkb21haW5zIHNob3VsZCBhbHdheXMgYmUKPiA+ICsgICAgICAqIFdoZW5ldmVyIHdlIHJl
LWVudGVyIGtlcm5lbCwgdGhlIGRvbWFpbnMgc2hvdWxkIGFsd2F5cyBiZQo+Cj4gVGhpcyBmZWVs
cyB1bnJlbGF0ZWQgZnJvbSB0aGUgcmVzdCBvZiB0aGUgcGF0Y2ggYW5kIHByb2JhYmx5IHdhbnQg
YW4KPiBleHBsYW5hdGlvbi4gU28gSSB0aGluayB0aGlzIHdhbnQgdG8gYmUgaW4gYSBzZXBhcmF0
ZSBwYXRjaC4KCkkgd2lsbCBzaW1wbHkgcmVtb3ZlIHRoaXMgY29tbWVudCBmaXgsIHNpbmNlIEkg
ZG8gbm90IGNoYW5nZSBhbnl0aGluZwplbHNlIGluIHRoaXMgZmlsZSBhbnltb3JlLgoKPiBUaGUg
cmVzdCBvZiB0aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4KClRoYW5rIHlvdSBKdWxpZW4uCgo+
Cj4gQ2hlZXJzLAo+Cj4gLS0KPiBKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
