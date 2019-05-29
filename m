Return-Path: <SRS0=GvgA=T5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A447C28CC0
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 16:06:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E887F23CE0
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 16:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E887F23CE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW15d-0000es-5s; Wed, 29 May 2019 16:06:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hW15b-0000en-6N
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 16:06:07 +0000
X-Inumbo-ID: a8b74e86-822b-11e9-9192-7b59b86a1625
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8b74e86-822b-11e9-9192-7b59b86a1625;
 Wed, 29 May 2019 16:06:04 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 29 May 2019 10:06:03 -0600
Message-Id: <5CEEADE80200007800233811@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 29 May 2019 10:06:00 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <ian.jackson@citrix.com>
References: <E1hSRQF-0006xk-BS@osstest.test-lab.xenproject.org>
 <23778.34168.78221.110803@mariner.uk.xensource.com>
 <20190520114147.GU2798@zion.uk.xensource.com>
 <5CE2B0DA0200007800230A08@prv1-mh.provo.novell.com>
 <23790.44034.186393.25330@mariner.uk.xensource.com>
In-Reply-To: <23790.44034.186393.25330@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] Linux 3.18 no longer boots under Xen,
 Xen CI dropping it
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, stable@vger.kernel.org,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI5LjA1LjE5IGF0IDE3OjU3LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gTGludXggMy4xOCBubyBsb25nZXIgYm9vdHMgdW5kZXIgWGVuLgo+IAo+IFRoaXMgaGFzIGJl
ZW4gdHJ1ZSBmb3Igb3ZlciBoYWxmIGEgeWVhci4gIFRoZSBYZW4gcHJvamVjdCBDSSBoYXMgYmVl
bgo+IHNlbmRpbmcgYXV0b21hdGljIG1haWxzIGluY2x1ZGluZyBiaXNlY3Rpb24gcmVwb3J0cyAo
c2VlIGJlbG93KS4KPiBJIGVtYWlsZWQgWGVuIGtlcm5lbCBmb2xrcyBhbmQgZ290IG5vIHRha2Vy
cyBmb3IgZml4aW5nIHRoaXMuCj4gCj4gVW5sZXNzIHRoaXMgaXMgZml4ZWQgc29vbiwgb3IgYXQg
bGVhc3Qgc29tZW9uZSBzaG93cyBzb21lIGluY2xpbmF0aW9uCj4gdG8gaW52ZXN0aWdhdGUgdGhp
cyByZWdyZXNzaW9uLCBJIGludGVuZCB0byBkcm9wIGFsbCB0ZXN0aW5nIG9mIHRoaXMKPiAic3Rh
YmxlIiBicmFuY2guICBJdCBoYXMgcm90dGVkIGFuZCBuby1vbmUgaXMgZml4aW5nIGl0LgoKQWZh
aWNzIDMuMTggaGFzIGJlZW4gbWFya2VkIEVPTCB1cHN0cmVhbS4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
