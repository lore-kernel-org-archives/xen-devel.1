Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24B8C282E0
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 23:14:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A90F92171F
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 23:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3XNUyFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A90F92171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHchX-0001nM-2I; Fri, 19 Apr 2019 23:13:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4FrJ=SV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHchV-0001nH-Iv
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 23:13:45 +0000
X-Inumbo-ID: c662c002-62f8-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c662c002-62f8-11e9-92d7-bc764e045a96;
 Fri, 19 Apr 2019 23:13:43 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B6F52171F;
 Fri, 19 Apr 2019 23:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555715622;
 bh=Myj4N7IQh5WWjM+xDtYqfWWNbLZlxEv8FS23w88ITTA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=A3XNUyFjd5A/FLwqu6gYL79MSfCTb7xweFwQus5vFsyfXkHRg2NAYC9hB/oe4jAZP
 CCYqh34+LMpg0g1T0hFK4llqC5++MQBJ0u7IIJJeAKi8EmnVSwa4DmvkGaRCyj1U+E
 A2eJ9zuxmJbCT7Pfr3WSNMt7/of3wI9fvkLvhy1Q=
Date: Fri, 19 Apr 2019 16:13:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <eb3d1ead-2bc9-8c95-3c07-1d29a13b6b54@arm.com>
Message-ID: <alpine.DEB.2.10.1904191453540.1370@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-3-git-send-email-sstabellini@kernel.org>
 <eb3d1ead-2bc9-8c95-3c07-1d29a13b6b54@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/6] libxl/xl: add cacheability option to
 iomem
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 ian.jackson@eu.citrix.com, wei.liu2@citrix.com,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190419231342.r6cn0-Fd_kYSuFg_OMMoYR1YIeV89SedAPhylN34rdc@z>

T24gV2VkLCAyNyBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMi8yNi8xOSAxMTowNyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gUGFy
c2UgYSBuZXcgY2FjaGVhYmlsaXR5IG9wdGlvbiBmb3IgdGhlIGlvbWVtIHBhcmFtZXRlciwgaXQg
Y2FuIGJlCj4gPiAiZGV2bWVtIiBmb3IgZGV2aWNlIG1lbW9yeSBtYXBwaW5ncywgd2hpY2ggaXMg
dGhlIGRlZmF1bHQsIG9yICJtZW1vcnkiCj4gPiBmb3Igbm9ybWFsIG1lbW9yeSBtYXBwaW5ncy4K
PiA+IAo+ID4gU3RvcmUgdGhlIHBhcmFtZXRlciBpbiBhIG5ldyBmaWVsZCBpbiBsaWJ4bF9pb21l
bV9yYW5nZS4KPiA+IAo+ID4gUGFzcyB0aGUgY2FjaGVhYmlsaXR5IG9wdGlvbiB0byB4Y19kb21h
aW5fbWVtb3J5X21hcHBpbmcuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiA+IENDOiBpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tCj4gPiBDQzogd2VpLmxpdTJAY2l0cml4LmNvbQo+ID4gLS0tCj4gPiAgIGRvY3MvbWFuL3hs
LmNmZy5wb2QuNS5pbiAgICB8ICA0ICsrKy0KPiA+ICAgdG9vbHMvbGlieGwvbGlieGxfY3JlYXRl
LmMgIHwgMTIgKysrKysrKysrKystCj4gPiAgIHRvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbCB8
ICA3ICsrKysrKysKPiAKPiBFeHRlbnNpb24gb2YgdGhlIGxpYnhsX3R5cGVzLmlkbCBzaG91bGQg
YmUgY29tcGFuaWVkIHdpdGggYSBuZXcgZGVmaW5lIGluCj4gbGlieGwuaC4gU28gYSB0b29sc3Rh
Y2sgY2FuIGRlYWwgd2l0aCBtdWx0aXBsZSBsaWJ4bCB2ZXJzaW9uLgoKSSdsbCBkbwoKCj4gPiAg
IHRvb2xzL3hsL3hsX3BhcnNlLmMgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKy0tCj4gPiAg
IDQgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLmNmZy5wb2QuNS5pbiBiL2RvY3MvbWFuL3hsLmNm
Zy5wb2QuNS5pbgo+ID4gaW5kZXggYjFjMGJlMS4uNjU1MDA4YSAxMDA2NDQKPiA+IC0tLSBhL2Rv
Y3MvbWFuL3hsLmNmZy5wb2QuNS5pbgo+ID4gKysrIGIvZG9jcy9tYW4veGwuY2ZnLnBvZC41Lmlu
Cj4gPiBAQCAtMTIyMiw3ICsxMjIyLDcgQEAgaXMgZ2l2ZW4gaW4gaGV4YWRlY2ltYWwgZm9ybWF0
IGFuZCBtYXkgZWl0aGVyIGJlIGEKPiA+IHJhbmdlLCBlLmcuIEM8MmY4LTJmZj4KPiA+ICAgSXQg
aXMgcmVjb21tZW5kZWQgdG8gb25seSB1c2UgdGhpcyBvcHRpb24gZm9yIHRydXN0ZWQgVk1zIHVu
ZGVyCj4gPiAgIGFkbWluaXN0cmF0b3IncyBjb250cm9sLgo+ID4gICAtPWl0ZW0gQjxpb21lbT1b
ICJJT01FTV9TVEFSVCxOVU1fUEFHRVNbQEdGTl0iLAo+ID4gIklPTUVNX1NUQVJULE5VTV9QQUdF
U1tAR0ZOXSIsIC4uLl0+Cj4gPiArPWl0ZW0gQjxpb21lbT1bICJJT01FTV9TVEFSVCxOVU1fUEFH
RVNbQEdGTl0sQ0FDSEVBQklMSVRZIiwKPiA+ICJJT01FTV9TVEFSVCxOVU1fUEFHRVNbQEdGTl0s
Q0FDSEVBQklMSVRZIiwgLi4uXT4KPiAKPiBCZWxvdyB5b3Ugc3VnZ2VzdCB0aGUgY2FjaGVhYmls
aXR5IGlzIG9wdGlvbi4gSG93ZXZlciwgdGhlIGlzIG5vdCByZWZsZWN0ZWQKPiBoZXJlLiBJIHRo
aW5rIHlvdSB3YW50IHRvIHB1dCAnLENBQ0hFQUJJTElUWScgYmV0d2VlbiBbXSBhcyBpdCBpcyBk
b25lIGZvcgo+ICdAR0ZOJy4KCkdvb2QgcG9pbnQKCgo+ID4gICAgIEFsbG93IGF1dG8tdHJhbnNs
YXRlZCBkb21haW5zIHRvIGFjY2VzcyBzcGVjaWZpYyBoYXJkd2FyZSBJL08gbWVtb3J5Cj4gPiBw
YWdlcy4KPiA+ICAgQEAgLTEyMzMsNiArMTIzMyw4IEBAIEI8R0ZOPiBpcyBub3Qgc3BlY2lmaWVk
LCB0aGUgbWFwcGluZyB3aWxsIGJlCj4gPiBwZXJmb3JtZWQgdXNpbmcgQjxJT01FTV9TVEFSVD4K
PiA+ICAgYXMgYSBzdGFydCBpbiB0aGUgZ3Vlc3QncyBhZGRyZXNzIHNwYWNlLCB0aGVyZWZvcmUg
cGVyZm9ybWluZyBhIDE6MQo+ID4gbWFwcGluZwo+ID4gICBieSBkZWZhdWx0Lgo+ID4gICBBbGwg
b2YgdGhlc2UgdmFsdWVzIG11c3QgYmUgZ2l2ZW4gaW4gaGV4YWRlY2ltYWwgZm9ybWF0Lgo+ID4g
K0I8Q0FDSEVBQklMSVRZPiBjYW4gYmUgImRldm1lbSIgZm9yIGRldmljZSBtZW1vcnksIHRoZSBk
ZWZhdWx0IGlmIG5vdAo+ID4gK3NwZWNpZmllZCwgb3IgaXQgY2FuIGJlICJtZW1vcnkiIGZvciBu
b3JtYWwgbWVtb3J5Lgo+IAo+IEkgd2FzIHBsYW5uaW5nIHRvIGNvbW1lbnQgYWJvdXQgdGhlIG5h
bWluZyBhbmQgZG9jdW1lbnRhdGlvbi4gQnV0IEkgd2lsbCBkbyBpdAo+IGluIHBhdGNoICMxIHdo
ZXJlIEphbiBhbHJlYWR5IHN0YXJ0ZWQgYSBkaXNjdXNzaW9uIGFib3V0IGl0LgoKQWxsIHJpZ2h0
LiBJIGRvbid0IGhhdmUgZ29vZCBpZGVhcyBhYm91dCBuYW1pbmcuIEkgYW0gaGFwcHkgdG8gY2hh
bmdlLgoKCj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfcGFyc2UuYyBiL3Rvb2xzL3hsL3hs
X3BhcnNlLmMKPiA+IGluZGV4IDM1MmNkMjEuLjFkYTI2NzAgMTAwNjQ0Cj4gPiAtLS0gYS90b29s
cy94bC94bF9wYXJzZS5jCj4gPiArKysgYi90b29scy94bC94bF9wYXJzZS5jCj4gPiBAQCAtMTg4
Myw2ICsxODgzLDcgQEAgdm9pZCBwYXJzZV9jb25maWdfZGF0YShjb25zdCBjaGFyICpjb25maWdf
c291cmNlLAo+ID4gICAgICAgICAgIH0KPiA+ICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbnVt
X2lvbWVtOyBpKyspIHsKPiA+ICAgICAgICAgICAgICAgaW50IHVzZWQ7Cj4gPiArICAgICAgICAg
ICAgY2hhciBjYWNoZVs3XTsKPiA+ICAgICAgICAgICAgICAgICBidWYgPSB4bHVfY2ZnX2dldF9s
aXN0aXRlbSAoaW9tZW0sIGkpOwo+ID4gICAgICAgICAgICAgICBpZiAoIWJ1Zikgewo+ID4gQEAg
LTE4OTEsMTUgKzE4OTIsMjcgQEAgdm9pZCBwYXJzZV9jb25maWdfZGF0YShjb25zdCBjaGFyICpj
b25maWdfc291cmNlLAo+ID4gICAgICAgICAgICAgICAgICAgZXhpdCgxKTsKPiA+ICAgICAgICAg
ICAgICAgfQo+ID4gICAgICAgICAgICAgICBsaWJ4bF9pb21lbV9yYW5nZV9pbml0KCZiX2luZm8t
PmlvbWVtW2ldKTsKPiA+IC0gICAgICAgICAgICByZXQgPSBzc2NhbmYoYnVmLCAiJSIgU0NOeDY0
IiwlIiBTQ054NjQiJW5AJSIgU0NOeDY0IiVuIiwKPiA+ICsgICAgICAgICAgICByZXQgPSBzc2Nh
bmYoYnVmLCAiJSIgU0NOeDY0IiwlIiBTQ054NjQiJW5AJSIgU0NOeDY0IiVuLCU2cyVuIiwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZiX2luZm8tPmlvbWVtW2ldLnN0YXJ0LAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJmJfaW5mby0+aW9tZW1baV0ubnVtYmVyLCAmdXNl
ZCwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgJmJfaW5mby0+aW9tZW1baV0uZ2ZuLCAm
dXNlZCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICZiX2luZm8tPmlvbWVtW2ldLmdm
biwgJnVzZWQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGNhY2hlLCAmdXNlZCk7Cj4g
Cj4gSWYgSSByZWFkIGl0IGNvcnJlY3RseSwgeW91IHdpbGwgcmVxdWlyZSB0aGUgR0ZOIHRvIGJl
IHNwZWNpZmllZCBpbiBvcmRlciB0bwo+IGdldCB0aGUgImNhY2hlYWJpbGl0eSIuIEFtIEkgY29y
cmVjdD8KClllcywgSSB3YXMgbGF6eSA6LSkgIEknbGwgZml4IGl0LgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
