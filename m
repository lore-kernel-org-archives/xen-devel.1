Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA116C282E1
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 09:02:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A206F214C6
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 09:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A206F214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJaGM-0000fG-Jh; Thu, 25 Apr 2019 09:01:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJaGL-0000fB-AI
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 09:01:49 +0000
X-Inumbo-ID: c10cfb60-6738-11e9-9bd3-97e285df14fe
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c10cfb60-6738-11e9-9bd3-97e285df14fe;
 Thu, 25 Apr 2019 09:01:47 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 03:01:46 -0600
Message-Id: <5CC177740200007800228EB2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 03:01:40 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190423105457.17502-1-jgross@suse.com>
 <20190423105457.17502-4-jgross@suse.com>
 <alpine.DEB.2.10.1904230955190.24598@sstabellini-ThinkPad-X260>
 <e744c7eb-1685-13b6-7ae9-e952f8f53ab0@suse.com>
In-Reply-To: <e744c7eb-1685-13b6-7ae9-e952f8f53ab0@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
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
 iommu@lists.linux-foundation.org, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIzLjA0LjE5IGF0IDIwOjM2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
My8wNC8yMDE5IDE5OjA1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+IE9uIFR1ZSwgMjMg
QXByIDIwMTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBJbnN0ZWFkIG9mIGFsd2F5cyBjYWxs
aW5nIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCkgaW4gY2FzZSB0aGUKPj4+IG1lbW9y
eSBpcyBETUEtYWJsZSBmb3IgdGhlIHVzZWQgZGV2aWNlLCBkbyBzbyBvbmx5IGluIGNhc2UgaXQg
aGFzIGJlZW4KPj4+IG1hZGUgRE1BLWFibGUgdmlhIHhlbl9jcmVhdGVfY29udGlndW91c19yZWdp
b24oKSBiZWZvcmUuCj4+Pgo+Pj4gVGhpcyB3aWxsIGF2b2lkIGEgbG90IG9mIHhlbl9kZXN0cm95
X2NvbnRpZ3VvdXNfcmVnaW9uKCkgY2FsbHMgZm9yCj4+PiA2NC1iaXQgY2FwYWJsZSBkZXZpY2Vz
Lgo+Pj4KPj4+IEFzIHRoZSBtZW1vcnkgaW4gcXVlc3Rpb24gaXMgb3duZWQgYnkgc3dpb3RsYi14
ZW4gdGhlIFBHX293bmVyX3ByaXZfMQo+Pj4gZmxhZyBvZiB0aGUgZmlyc3QgYWxsb2NhdGVkIHBh
Z2UgY2FuIGJlIHVzZWQgZm9yIHJlbWVtYmVyaW5nLgo+PiAKPj4gQWx0aG91Z2ggdGhlIHBhdGNo
IGxvb2tzIE9LLCB0aGlzIHNlbnRlbmNlIHB1enpsZXMgbWUuIFdoeSBkbyB5b3Ugc2F5Cj4+IHRo
YXQgdGhlIG1lbW9yeSBpbiBxdWVzdGlvbiBpcyBvd25lZCBieSBzd2lvdGxiLXhlbj8gQmVjYXVz
ZSBpdCB3YXMKPj4gcmV0dXJuZWQgYnkgeGVuX2FsbG9jX2NvaGVyZW50X3BhZ2VzPyBCb3RoIHRo
ZSB4ODYgYW5kIHRoZSBBcm0KPj4gaW1wbGVtZW50YXRpb24gcmV0dXJuIGZyZXNoIG5ldyBtZW1v
cnksIGhlbmNlLCBpdCBzaG91bGQgYmUgc2FmZSB0byBzZXQKPj4gdGhlIFBhZ2VPd25lclByaXYx
IGZsYWc/Cj4+IAo+PiBNeSBjb25jZXJuIHdpdGggdGhpcyBhcHByb2FjaCBpcyB3aXRoIHRoZSBz
ZW1hbnRpY3Mgb2YgUEdfb3duZXJfcHJpdl8xLgo+PiBJcyBhIHBhZ2UgbWFya2VkIHdpdGggUEdf
b3duZXJfcHJpdl8xIG9ubHkgc3VwcG9zZWQgdG8gYmUgdXNlZCBieSB0aGUKPj4gb3duZXI/Cj4g
Cj4gVGhlIG93bmVyIG9mIHRoZSBwYWdlIGlzIGZyZWUgdG8gdXNlIHRoZSBmbGFnLgo+IAo+IExp
a2UgR3JhbnQgcGFnZXMgYXJlIG1hcmtlZCBieSB0aGUgZ3JhbnQgZHJpdmVyIHVzaW5nIHRoaXMg
ZmxhZy4gQW5kCj4gWGVuIHBhZ2UgdGFibGVzIGFyZSB1c2luZyBpdCBpbiBQVi1ndWVzdHMgZm9y
IGluZGljYXRpbmcgYSAiUGlubmVkIgo+IHBhZ2UgdGFibGUuCgpDb25zaWRlcmluZyB0aGUgYmFj
a2dyb3VuZCBvZiB0aGUgc2VyaWVzLCBpc24ndCBzdWNoIG11bHRpLXB1cnBvc2UgdXNlCm9mIHRo
ZSBmbGFnIGEgcG9zc2libGUgcHJvYmxlbT8gWW91J3JlIGFscmVhZHkgc3VzcGVjdGluZyBhIHdy
b25nIGNhbGwKaW50byBoZXJlLiBUaGUgZnVuY3Rpb24gZmluZGluZyB0aGUgZmxhZyBzZXQgKGJ1
dCBmb3IgYW5vdGhlciByZWFzb24pCm1pZ2h0IGFkZCB0byB0aGUgY29uZnVzaW9uLiBCdXQgSSBy
ZWFsaXplIHRoZXJlIGFyZSBvbmx5IHNvIG1hbnkgcGFnZQpmbGFncyBhdmFpbGFibGUuCgpQZXJo
YXBzIHRoZSBmcmVlaW5nIGZ1bmN0aW9uIHNob3VsZCwgZmlyc3QgdGhpbmcsIGNoZWNrIHRoZSBo
YW5kZWQKc3BhY2UgYWN0dWFsbHkgbWF0Y2hlcyB0aGUgY3JpdGVyaWEgKHdpdGhpbiBkbWFfbWFz
ayBhbmQgY29udGlndW91cyk/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
