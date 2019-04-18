Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A781CC10F14
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 19:02:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BDFE214DA
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 19:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BDFE214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHCI9-0000Lj-Um; Thu, 18 Apr 2019 19:01:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z9nG=SU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hHCI8-0000La-Eg
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 19:01:48 +0000
X-Inumbo-ID: 6a1a9d7a-620c-11e9-9328-073540679faf
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6a1a9d7a-620c-11e9-9328-073540679faf;
 Thu, 18 Apr 2019 19:01:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB506A78;
 Thu, 18 Apr 2019 12:01:46 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC4D43F5AF;
 Thu, 18 Apr 2019 12:01:45 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-8-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171327100.1370@sstabellini-ThinkPad-X260>
 <970bfa4e-192e-967a-b211-16dee9cb7ed8@arm.com>
 <alpine.DEB.2.10.1904181104360.1370@sstabellini-ThinkPad-X260>
 <66c0b06a-bd34-9044-0aa4-35eee52c3d98@arm.com>
 <alpine.DEB.2.10.1904181148300.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5414f6ea-b776-3dfa-682a-d6b63bf2374f@arm.com>
Date: Thu, 18 Apr 2019 20:01:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904181148300.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 07/12] xen/arm: cpuerrata: Match register
 size with value size in check_workaround_*
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418190144.hRpaxUQ3J22CvTdAcpQgrU0emcfztu_Qnx4pKuj87Pg@z>

CgpPbiAxOC8wNC8yMDE5IDE5OjUyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gVGh1
LCAxOCBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxOC8wNC8yMDE5IDE5OjIz
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBXZWQsIDE3IEFwciAyMDE5LCBKdWxp
ZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gT24gNC8xNy8xOSA5OjI4IFBNLCBTdGVmYW5vIFN0YWJlbGxp
bmkgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwgMjcgTWFyIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gSWYgaXQgaXMgY29uc2lkZXJlZCBjb21wbGlhbnQsIHRoZW4gaXQgZG9lcyBub3QgbWFrZSBz
ZW5zZS4KPiAKPiBZZXMsIEkgdGhpbmsgdGhpcyBpcyBub3QgY29tcGxpYW50IHRvby4gQWxzbywg
ZnJvbSB3aGF0IEkgaGF2ZSBiZWVuCj4gdG9sZCwgdGhpcyBleGFtcGxlIGlzIGZhbW91cyBmb3Ig
YmVpbmcgb25lIG9mIHRoZSBtb3N0IGV4dHJlbWUgZXhhbXBsZXMKPiBvZiBNSVNSQS1DIG5vbi1j
b21wbGlhbmNlLiBJIHRoaW5rIHRoZSBjb21wbGlhbnQgdmVyc2lvbiB3b3VsZCBiZToKPiAKPiBi
b29sIGlzX25vbnplcm8oaW50IGIpCj4gewo+ICAgICAgaWYgKGIgIT0gMCkKPiAgICAgICAgcmV0
dXJuIHRydWU7Cj4gICAgICBlbHNlCj4gICAgICAgIHJldHVybiBmYWxzZTsKPiB9Cj4gCj4gVGhp
cyBpcyBhbHNvIGNvbXBsaWFudDoKPiAKPiBib29sIGlzX25vbnplcm8oaW50IGIpCj4gewo+ICAg
ICAgcmV0dXJuIChiICE9IDApOwo+IH0KPiAKCkkgd2lsbCB1c2UgISFiIGhlcmUgYW5kIGluIHRo
ZSBuZXh0IHBhdGNoLiBCdXQgSSBzdGlsbCBkb3VidCB5b3Ugd2lsbCBiZSBhYmxlIHRvIAplbmZv
cmNlIGl0IGluIFhlbi4gaWYgKCBuICkgaXMgcXVpdGUgYSBjb21tb24gcGF0dGVybi4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
