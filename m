Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335E0C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 21:33:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 033882054F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 21:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cardoe.com header.i=@cardoe.com header.b="CpBH6oLy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 033882054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cardoe.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHEev-00048H-CO; Thu, 18 Apr 2019 21:33:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l666=SU=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1hHEeu-00048C-JK
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 21:33:28 +0000
X-Inumbo-ID: 9a3ae5b3-6221-11e9-92d7-bc764e045a96
Received: from mail-yb1-xb43.google.com (unknown [2607:f8b0:4864:20::b43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9a3ae5b3-6221-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 21:33:27 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id n19so1370444ybf.10
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2019 14:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=++YhaJToFFQSg2tbpTTQI3j284K+HdjBXxOcta2XD8E=;
 b=CpBH6oLyE0b2crU0y/bDI9p2FNxs8usu9lFgDOEErZEbdzSF6RISPKc0NKMZJMEgmM
 JBq5InK3Nwn/0GJOYJnCioPeYf6I0xTX5QsKqUtxQABGKQsF+dIq4QxpX+zQcP/k53RG
 tUiHAGWifld7sckkwvKJEnQc/HU7JijW+DW9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=++YhaJToFFQSg2tbpTTQI3j284K+HdjBXxOcta2XD8E=;
 b=KEoLs9nhyHZT6I4K6DH1WJCUPa4U4P7CJbf6h6lBo2v/HgZUZKp20UE0UjKslQLdB3
 SnEZyt3zkCnsBOwPcjJ/YzdbeRYBtLP+5z8A4wfwsEJBWQBEcQlWOOMk3MKtAxxPnXFq
 6dz6rB7M/m6i8dZz1B0BoJAuSCKhghEZMsr8hYMHACCh3gZQw8G4hwCumMSbAoO/pT3s
 3Gafdu04jniI1aefZ2JK0oKEKd5X9HZgH0di8UcNf9Kg5q5uebqd+SngSXRUNIgf53Zo
 AaxmH/DlVI0ZUNuDyFhfZ2oiMy9v7z8XVqDgSb5edEbA1N2KhSUVmhGUfWrDClaAUSB0
 DVPg==
X-Gm-Message-State: APjAAAW32Kyy5QmZNrAngOYVgYhDUOfcI9LJ9K4YEeH5YVME/mNc689e
 6JWKOxSLzr7mHvrvE/aWlIhUBeNNE9o=
X-Google-Smtp-Source: APXvYqywjABG+WP2YaiGkDdBpc1xnroQJHPZ8l4CwpmZ3vD11Fcbc3vK3yK6yD4sPEnNpzmydOOANA==
X-Received: by 2002:a25:604:: with SMTP id 4mr10101977ybg.292.1555623206957;
 Thu, 18 Apr 2019 14:33:26 -0700 (PDT)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:d0f8:5fd1:4a57:4c31])
 by smtp.gmail.com with ESMTPSA id x13sm3096806ywx.63.2019.04.18.14.33.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 14:33:26 -0700 (PDT)
Date: Thu, 18 Apr 2019 16:33:25 -0500
From: Doug Goldstein <cardoe@cardoe.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190418213325.4e2ckrb44vgpzgyd@doug-macbook.localdomain>
Mail-Followup-To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Committers <committers@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
 <5b7cd86e-e664-d5f1-9262-f7671dc3395a@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b7cd86e-e664-d5f1-9262-f7671dc3395a@citrix.com>
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
Message-ID: <20190418213325.qjuNEpv17OzmRnDfMdq9UkluvccFsmivv8k3fQq-YhQ@z>

T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMDI6NTk6MTdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOC8wNC8yMDE5IDEzOjMxLCBXZWkgTGl1IHdyb3RlOgo+ID4gSGkgYWxsCj4g
Pgo+ID4gV2Ugbm93IGhhdmUgR2l0bGFiIENJIGFzIGEgY29tcGxlbWVudGFyeSBzeXN0ZW0gdG8g
T3NzdGVzdCBhbmQgaGF2ZSBwbGFubmVkIHRvCj4gPiBhZGQgYm90cy4gSXQncyBoaWdoIHRpbWUg
d2UgdGhpbmsgYWJvdXQgaG93IHdlIGludGVncmF0ZSB0aGVtIGFuZCBob3cgaXQgbWF5Cj4gPiBp
bXByb3ZlIG91ciB3b3JrZmxvdy4KPiA+Cj4gPiAjIyBSZXF1aXJlbWVudHMKPiA+Cj4gPiAxLiBX
ZSB3YW50IHRvIGhhdmUgbGlnaHQgd2VpZ2h0IGJ1aWxkIHRlc3RzIGJlZm9yZSBhIHBhdGNoIHNl
cmllcyBpcyByZXZpZXdlZAo+ID4gb3IgY29tbWl0dGVkLgo+ID4KPiA+IDIuIFdlIGRvbid0IHdh
bnQgdG8gcHVzaCBicm9rZW4gcGF0Y2hlcyB0byBjZW50cmFsIHJlcG9zaXRvcnkgc3VjaCB0aGF0
Cj4gPiBldmVyeW9uZSBpcyBibG9ja2VkLgo+ID4KPiA+IDMuIFdlIGRvbid0IHdhbnQgdG8gc2ln
bmlmaWNhbnRseSBjaGFuZ2UgY29tbWl0dGVyIHdvcmtmbG93Lgo+ID4KPiA+IFJlcXVpcmVtZW50
IDIgbWVhbnMgdGhhdCBvdXIgY3VycmVudCBicmFuY2hpbmcgbW9kZWwgd2lsbCBuZWVkIHRvIGJl
IGNoYW5nZWQuCj4gPiBEZXRhaWxzIHdpbGwgZm9sbG93Lgo+IAo+IFdoaWxlIGV2ZXJ5dGhpbmcg
cHJlc2VudGVkIGhlcmUgaXMgZmluZSB0byBkbyBhcyBhIG1hdHRlciBvZiBwb2xpY3ksIHRoZQo+
IGNvbW1pdHRlcnMgc3RpbGwgbmVlZCB0byByZXRhaW4gdGhlIGFiaWxpdHkgdG8gYWN0dWFsbHkg
cHVzaCBkaXJlY3RseSB0bwo+IHRoZSBzdGFnaW5nIGJyYW5jaGVzIG9uIHhlbi5naXQKPiAKPiBU
aGUgc2VjdXJpdHkgdGVhbSBuZWVkcyB0byBiZSBhYmxlIHRvIG1ha2UgZW1iYXJnb2VkIGNvbnRl
bnQgYXBwZWFyIGF0Cj4gdGhlIHBvaW50IG9mIHB1YmxpYyBkaXNjbG9zdXJlLsKgIFRoZSBzZWN1
cml0eSB0ZWFtIGFscmVhZHkgdGFrZXMKPiByZXNwb25zaWJpbGl0eSBmb3IgYWxsIHRlc3Rpbmcg
b2YgdGhpcyBjb250ZW50IGJlZm9yZSB0aGUgcHVibGljIGVtYmFyZ28KPiBwb2ludCwgYW5kIHRo
aXMgcG9saWN5IHdpbGwgbmVlZCB0byBjb250aW51ZS4KPiAKPiB+QW5kcmV3CgpXaGF0IGFib3V0
IHRoZSBhYmlsaXR5IHRvIHB1c2ggYSBicmFuY2ggdG8gdGhlIENJIGxvb3Agd2l0aCB0aGUgaGln
aGVzdApwcmlvcml0eSBzbyB0aGF0IGl0cyBwaWNrZWQgdXAgaW1tZWRpYXRlbHk/IFRoZXJlIGhh
cyBiZWVuIG1vcmUgdGhhbiBvbmUKWFNBIHdoZXJlIHRoZSBwYXRjaGVzIHByb3ZpZGVkIGluIHRo
ZSBlbWFpbHMgZG9uJ3QgYXBwbHkgY2xlYW5seSBvcgpkb24ndCBidWlsZCBzbyBpdCBkb2VzIHNl
ZW0gdmFsdWFibGUgdG8gc3RpbGwgcnVuIHRoZSBDSSBsb29wLgoKLS0KRG91ZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
