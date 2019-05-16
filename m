Return-Path: <SRS0=BdeL=TQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC60BC04AAF
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 11:53:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB90E20645
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 11:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB90E20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREwk-00051q-KP; Thu, 16 May 2019 11:53:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hREwj-00051Z-EM
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:53:13 +0000
X-Inumbo-ID: 2e4983c5-77d1-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2e4983c5-77d1-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:53:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 05:53:11 -0600
Message-Id: <5CDD4F26020000780022F9DC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 05:53:10 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Brian Woods" <brian.woods@amd.com>,
 "Suravee Suthikulpanit" <suravee.suthikulpanit@amd.com>
References: <5CADB95A0200007800226174@prv1-mh.provo.novell.com>
 <8c5dd813-4166-1ed1-e52b-87323430c4ec@citrix.com>
In-Reply-To: <8c5dd813-4166-1ed1-e52b-87323430c4ec@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] Ping: [PATCH] AMD/IOMMU: adjust IOMMU list head
 initialization
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190516115310.BomnN7oTndUwrlPzGI2HOglx1PXdCTeMJPz-FMVJ5ow@z>

Pj4+IE9uIDEwLjA0LjE5IGF0IDEyOjEyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTAvMDQvMjAxOSAxMDozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IERvIHRoaXMg
c3RhdGljYWxseSwgd2hpY2ggd2lsbCBhbGxvdyBhY2Nlc3NpbmcgdGhlIChlbXB0eSkgbGlzdCBl
dmVuCj4+IHdpdGhvdXQgaGF2aW5nIGNvbWUgdGhyb3VnaCBhY3BpX2l2cnNfaW5pdCgpLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gUmV2
aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpTbyBq
dXN0IGxpa2UgZG9uZSBhIG1pbnV0ZSBhZ28gZm9yICJBTUQvSU9NTVU6IGRvbid0IG9wZW4tY29k
ZQpmb3JfZWFjaF9hbWRfaW9tbXUoKSIgSSBpbnRlbmQgdG8gY29tbWl0IHRoaXMgdHJpdmlhbCBw
YXRjaCBpbiBhCmRheSBvciB0d28gd2l0aG91dCBtYWludGFpbmVyIGFjaywgdW5sZXNzIEkgaGVh
ciBiYWNrIG90aGVyd2lzZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
