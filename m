Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF76C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 13:08:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16B6C2133D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 13:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16B6C2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEZQu-0001S1-Fj; Thu, 11 Apr 2019 13:08:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xe+J=SN=citrix.com=prvs=9977b2ae1=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hEZQt-0001Rw-1N
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 13:07:59 +0000
X-Inumbo-ID: d2d96ffd-5c5a-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d2d96ffd-5c5a-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 13:07:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,337,1549929600"; d="scan'208";a="83328320"
Date: Thu, 11 Apr 2019 14:07:32 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20190411130732.GK1435@perard.uk.xensource.com>
References: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
 <1554779560-26204-2-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1554779560-26204-2-git-send-email-igor.druzhinin@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH v2 1/3] OvmfPkg/XenSupport: remove usage of
 prefetchable PCI host bridge aperture
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
Cc: ard.biesheuvel@linaro.org, jordan.l.justen@intel.com,
 edk2-devel@lists.01.org, julien.grall@arm.com, xen-devel@lists.xenproject.org,
 lersek@redhat.com, devel@edk2.groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411130732.5ApFcdkryoxYGaZ5mjhKSL34QDckZgjp82HSyEQyCXg@z>

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDQ6MTI6MzhBTSArMDEwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gVGhpcyBhcGVydHVyZSBkb2Vzbid0IGV4aXN0IGluIFFFTVUtWEVOIGFuZCBodm1s
b2FkZXIgcGxhY2VzIEJBUnMKPiBpbiBhcmJpdHJhcnkgb3JkZXIgZGlzcmVnYXJkaW5nIHByZWZl
dGNoYWJsZSBiaXQuIFRoaXMgbWFrZXMKPiBwcmVmZXRjaGFibGUgYW5kIG5vbi1wcmVmZXRjaGFi
bGUgQkFScyB0byBmb2xsb3cgZWFjaCBvdGhlciB0aGF0J3MKPiBxdWl0ZSBsaWtlbHkgd2l0aCBQ
Q0kgcGFzc3Rocm91Z2ggZGV2aWNlcy4gSW4gdGhhdCBjYXNlLCB0aGUgZXhpc3RpbmcKPiBjb2Rl
LCB0aGF0IHRyaWVzIHRvIHdvcmsgb3V0IGFwZXJ0dXJlIGJvdW5kYXJpZXMgYnkgcmVhZGluZyBo
dm1sb2FkZXIKPiBCQVIgcGxhY2VtZW50LCB3aWxsIHJlcG9ydCBhIGJvZ3VzIHByZWZldGNoYWJs
ZSBhcGVydHVyZSB3aGljaCBvdmVybGFwcwo+IHdpdGggdGhlIHJlZ3VsYXIgb25lLiBJdCB3aWxs
IGV2ZW50dWFsbHkgdHJpZ2dlciBhbiBhc3NlcnRpb24gaW4KPiBEWEUgUENJIGluaXRpYWxpemF0
aW9uIGNvZGUuCj4gCj4gRG8gdGhlIHNhbWUgdGhpbmcgYXMgT1ZNRiBvbiBRRU1VLUtWTSBhbmQg
cGFzcyBhIG5vbi1leGlzdGluZyBhcGVydHVyZQo+IHRoZXJlLiBJdCdzIG5vdCBuZWNlc3Nhcnkg
dG8gcGFzcyBhZGRpdGlvbmFsIGFsbG9jYXRpb24gZmxhZ3MgYXMgd2Ugc2V0Cj4gUmVzb3VyY2VB
c3NpZ25lZCBmbGFnIG9uIHRoZSByb290IGJyaWRnZSB3aGljaCBtZWFucyB0aGV5IHdpbGwgYmUg
aWdub3JlZC4KPiAKPiBDb250cmlidXRlZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBB
Z3JlZW1lbnQgMS4xCj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhp
bmluQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAqIHJlbW92ZSB1c2FnZSBv
ZiBwcmVmZXRjaGFibGUgYXBlcnR1cmUgZW50aXJlbHkKPiAqIGV4cGxhaW5lZCByYXRpb25hbGUg
Zm9yIHRoZSBjaGFuZ2UgaW4gdGhlIGRlc2NyaXB0aW9uCj4gLS0tCgpSZXZpZXdlZC1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFua3MsCgotLSAKQW50
aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
