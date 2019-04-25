Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DC4C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 08:54:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73CC0217FA
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 08:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73CC0217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJa8c-00086e-9z; Thu, 25 Apr 2019 08:53:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJa8b-00086Z-Qx
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 08:53:49 +0000
X-Inumbo-ID: a1d220fa-6737-11e9-8528-63f461be15dc
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1d220fa-6737-11e9-8528-63f461be15dc;
 Thu, 25 Apr 2019 08:53:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 02:53:44 -0600
Message-Id: <5CC175950200007800228E80@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 02:53:41 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190423105457.17502-1-jgross@suse.com>
 <20190423105457.17502-2-jgross@suse.com>
In-Reply-To: <20190423105457.17502-2-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/3] xen/swiotlb: fix condition for calling
 xen_destroy_contiguous_region()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIzLjA0LjE5IGF0IDEyOjU0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCj4gKysrIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14
ZW4uYwo+IEBAIC0zNjAsOCArMzYwLDggQEAgeGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudChzdHJ1
Y3QgZGV2aWNlICpod2Rldiwgc2l6ZV90IHNpemUsIHZvaWQgKnZhZGRyLAo+ICAJLyogQ29udmVy
dCB0aGUgc2l6ZSB0byBhY3R1YWxseSBhbGxvY2F0ZWQuICovCj4gIAlzaXplID0gMVVMIDw8IChv
cmRlciArIFhFTl9QQUdFX1NISUZUKTsKPiAgCj4gLQlpZiAoKChkZXZfYWRkciArIHNpemUgLSAx
IDw9IGRtYV9tYXNrKSkgfHwKPiAtCSAgICByYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShw
aHlzLCBzaXplKSkKPiArCWlmICgoZGV2X2FkZHIgKyBzaXplIC0gMSA8PSBkbWFfbWFzaykgJiYK
PiArCSAgICAhV0FSTl9PTihyYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBzaXpl
KSkpCj4gIAkJeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24ocGh5cywgb3JkZXIpOwoKT24g
dGhlIGFsbG9jYXRpb24gc2lkZSB3ZSBoYXZlCgoJaWYgKCgoZGV2X2FkZHIgKyBzaXplIC0gMSA8
PSBkbWFfbWFzaykpICYmCgkgICAgIXJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5KHBoeXMs
IHNpemUpKQoJCSpkbWFfaGFuZGxlID0gZGV2X2FkZHI7CgllbHNlIHsKCQlpZiAoeGVuX2NyZWF0
ZV9jb250aWd1b3VzX3JlZ2lvbihwaHlzLCBvcmRlciwKCQkJCQkJIGZsczY0KGRtYV9tYXNrKSwg
ZG1hX2hhbmRsZSkgIT0gMCkgewoJCQl4ZW5fZnJlZV9jb2hlcmVudF9wYWdlcyhod2Rldiwgc2l6
ZSwgcmV0LCAoZG1hX2FkZHJfdClwaHlzLCBhdHRycyk7CgkJCXJldHVybiBOVUxMOwoJCX0KCX0K
CndoaWNoIGlzIChhcyBmYXIgYXMgdGhlIGZ1bmN0aW9uIGNhbGwgaXMgY29uY2VybmVkKQoKCWlm
ICgoZGV2X2FkZHIgKyBzaXplIC0gMSA+IGRtYV9tYXNrKSB8fAoJICAgIHJhbmdlX3N0cmFkZGxl
c19wYWdlX2JvdW5kYXJ5KHBoeXMsIHNpemUpKQoJCXhlbl9jcmVhdGVfY29udGlndW91c19yZWdp
b24oLi4uKTsKClNvIEkgZG9uJ3QgdGhpbmsgeW91ciB0cmFuc2Zvcm1hdGlvbiBpcyBjb3JyZWN0
LiBFdmVuIHdvcnNlLCBib3RoCnBhcnRzIG9mIHRoZSBjb25kaXRpb24gaW4geGVuX3N3aW90bGJf
ZnJlZV9jb2hlcmVudCgpIGFjdCBvbiBhbgphZGRyZXNzIHRoYXQgaXMgdGhlIF9yZXN1bHRfIG9m
IHRoZSBwcmlvcgp4ZW5fY3JlYXRlX2NvbnRpZ3VvdXNfcmVnaW9uKCksIGkuZS4gdGhlIGFkZHJl
c3Mgc2hvdWxkIGFsd2F5cwptYXRjaCBfYm90aF8gY3JpdGVyaWEgYW55d2F5LiBXaGVyZWFzIHdo
YXQgeW91IHJlYWxseSB3YW50IGlzCnVuZG8gdGhlIHhlbl9jcmVhdGVfY29udGlndW91c19yZWdp
b24oKSBvbmx5IHdoZW4gaXQgYWN0dWFsbHkKd2FzIGNhbGxlZC4gT3RoZXJ3aXNlIHlvdSBhbHNv
IHNoYXR0ZXIgY29udGlndW91cyBhbGxvY2F0aW9ucwp0aGF0IHdlcmUgY29udGlndW91cyBhbHJl
YWR5IGZvciBvdGhlciByZWFzb25zIChwZXJoYXBzIGp1c3QKbHVjaykuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
