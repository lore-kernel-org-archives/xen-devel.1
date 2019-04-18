Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58925C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 13:36:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 270F220652
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 13:36:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cardoe.com header.i=@cardoe.com header.b="eW4wev/6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 270F220652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cardoe.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH7DF-0003TM-Aa; Thu, 18 Apr 2019 13:36:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l666=SU=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1hH7DD-0003TH-Ki
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 13:36:23 +0000
X-Inumbo-ID: f42bf015-61de-11e9-92d7-bc764e045a96
Received: from mail-yw1-xc2e.google.com (unknown [2607:f8b0:4864:20::c2e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f42bf015-61de-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 13:36:22 +0000 (UTC)
Received: by mail-yw1-xc2e.google.com with SMTP id x67so345199ywg.11
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2019 06:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=swdfu9f0B4aYYNGbv39txseokOq6zPStBgTnPBJ8XXQ=;
 b=eW4wev/6uNJoWxytlXEI2hPglpe0Rg1lnpK1XJJ9QPj6ai6h49W/iLuzFod7GUp3z2
 crVlsUIStfrG1tHlsShJ4t6/rr0hsZdbZTZ7khNHdasSwa2+qhHgkF6iRkr15Cx2FhL1
 75cv6DK3QBCyx60osVtuRL7Mkp0LsNDZzuet4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=swdfu9f0B4aYYNGbv39txseokOq6zPStBgTnPBJ8XXQ=;
 b=GpoeBVd9YIdWSKR91+JT/C4mZcjyCfVMOvhfNyiGMl02gTK54+tk/+qya3CdlgnqsD
 OltFCcTPamk4T7NVRFxAfG5p4XXFAOVXX1plinWmWHYHdzYgtrlRVijMHj1jg79V4lvj
 XFYE/aPf6x2v7D3YNpUPSLi9cDX73Y3YwCf+L83rPhOOI8LEOxKdvrVRala6t9/G5LgS
 5KLwCN3LYANypySTe3ooauAFxC58KqGEKwEXUG317E/g8t7Isxz7jZJJ4J8Cy6blusxz
 5rKp5nnJbqwhMItEzaHibNmyOHaa0d7Gka+wC0gi8RXlAkLRQ1P65PNOZMH9PiQj5bEv
 etKw==
X-Gm-Message-State: APjAAAWZ9E1DrMYPquEDrfUEza/BynIksZd70S7n+4hvl64TmT3BTyE+
 8wXCh4L5YV6a2yFbJdEOcjeGnQ==
X-Google-Smtp-Source: APXvYqzbmrO8SmsAelunEBrsarAq0UF5smbqK+InbT55upe3aOQQtYteKDQUUkerfWBrdLusozt8hQ==
X-Received: by 2002:a81:a350:: with SMTP id a77mr75440735ywh.66.1555594581628; 
 Thu, 18 Apr 2019 06:36:21 -0700 (PDT)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:d0f8:5fd1:4a57:4c31])
 by smtp.gmail.com with ESMTPSA id m5sm1025486ywm.67.2019.04.18.06.36.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 06:36:21 -0700 (PDT)
Date: Thu, 18 Apr 2019 08:36:19 -0500
From: Doug Goldstein <cardoe@cardoe.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190418133552.7ta2dy4ecpcwycmx@doug-macbook.localdomain>
Mail-Followup-To: Ian Jackson <ian.jackson@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Committers <committers@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
 <23736.31208.463641.725834@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23736.31208.463641.725834@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] Xen project CI systems and committer workflow
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Committers <committers@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418133619.z_LfhyyaXD3JudFzTjfh8yuGMRgOCyvU56lkIIg7jDc@z>

T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMDI6MjE6NDRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gCj4gPiBHaXRsYWIgQ0kgZG9lc24ndCBoYXZlIGEgc2VsZiBwdXNoZ2F0ZS4gSWYgaXQg
aXMgYnJva2VuIGJ5IGFjY2lkZW50IE9zc3Rlc3QKPiA+IHdpbGwgYmUgYmxvY2tlZC4KPiAKPiBD
b3VsZCB3ZSBwbGFuIHNvbWUga2luZCBvZiBwcm9jZWR1cmFsIG9yIHJvYm90aWMgd29ya2Fyb3Vu
ZCA/CgpTbyBteSB0aG91Z2h0cyBhcm91bmQgdGhpcyBhcmUgb24gcHJpb3JpdHkgdmFsdWVzLiBB
ZG1pdHRlZGx5IGl0IGNvdWxkCnVzZSBzb21lIHJlZmluZW1lbnQgYnV0IHJvdWdobHkgc3BlYWtp
bmcgaWYgc29tZW9uZSBwdXNoZWQgYSBzZXJpZXMgdGhhdApicm9rZSBvc3N0ZXN0IHdlIGNvdWxk
IGhhdmUgYSBmaXgtdXAgc2VyaWVzL3BhdGNoIHdoZXJlIGl0IHdhcyBhY2tlZCBhbmQKaXQgd2Fz
IGdpdmVuIGEgcHJpb3JpdHkgd2VpZ2h0IGhpZ2hlciB0aGFuIGFueSBvdGhlciBzZXJpZXMuIFRo
aXMgd291bGQKY2F1c2UgdGhlIEdpdExhYiBDSSBsb29wIHRvIHRlc3QgdGhhdCBzZXJpZXMgYW5k
IGdldCB0aGF0IHB1c2hlZCBhYm92ZQphbGwgb3RoZXJzLgoKU2ltaWxhcmx5IHRvIGF2b2lkIGJv
Z2dpbmcgZG93biB0ZXN0aW5nIGZvciBzbWFsbCBjaGFuZ2VzIGxpa2UKZG9jcy9jb21tZW50cy9l
dGMgaGF2aW5nIGEgInJvbGx1cCIgdGFnIHdoaWNoIHdvdWxkIGhhdmUgR2l0TGFiIENJCmNyZWF0
ZSBhIHNlcmllcyBmcm9tIGFsbCB0aGluZ3MgY3VycmVudGx5IGxhYmVsZWQgInJvbGx1cCIgYXMg
cHVzaCB0aGVtCmFzIGEgd2hvbGUuCgotLQpEb3VnCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
