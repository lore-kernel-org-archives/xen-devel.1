Return-Path: <SRS0=Vyxr=4T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C490C3F2D2
	for <xen-devel@archiver.kernel.org>; Mon,  2 Mar 2020 10:43:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EFD42187F
	for <xen-devel@archiver.kernel.org>; Mon,  2 Mar 2020 10:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EFD42187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8iXf-0002Ry-11; Mon, 02 Mar 2020 10:43:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8iXd-0002Rt-T3
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 10:43:17 +0000
X-Inumbo-ID: a0035470-5c72-11ea-aea3-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0035470-5c72-11ea-aea3-bc764e2007e4;
 Mon, 02 Mar 2020 10:43:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EED83B281;
 Mon,  2 Mar 2020 10:43:15 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-7-roger.pau@citrix.com>
 <616f1cd4-e660-97a5-b326-12ca001bfb7d@suse.com>
 <20200228165238.GF24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37448a41-57d0-9ae6-bd6a-f4546d83efb2@suse.com>
Date: Mon, 2 Mar 2020 11:43:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228165238.GF24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 6/7] xen/guest: prepare hypervisor ops to
 use alternative calls
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxNzo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyOCwgMjAyMCBhdCAwNToyOTozMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9oeXBlcnYuYwo+Pj4gQEAgLTE5OSw3ICsxOTksNyBAQCBzdGF0aWMgdm9pZCBfX2lu
aXQgZTgyMF9maXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCkKPj4+ICAgICAgICAgIHBhbmljKCJV
bmFibGUgdG8gcmVzZXJ2ZSBIeXBlci1WIGh5cGVyY2FsbCByYW5nZVxuIik7Cj4+PiAgfQo+Pj4g
IAo+Pj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzID0gewo+Pj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgX19pbml0ZGF0YSBvcHMgPSB7Cj4+Cj4+
IFRoaXMgbmVlZHMgdG8gYmUgX19pbml0Y29uc3RyZWwgaW4gb3JkZXIgdG8gYXZvaWQgdHJpZ2dl
cmluZwo+PiAocG9zc2libHkgb25seSBpbiB0aGUgZnV0dXJlKSBzZWN0aW9uIG1pc21hdGNoIHdh
cm5pbmdzIHdpdGgKPj4gYXQgbGVhc3Qgc29tZSBnY2MgdmVyc2lvbnMuIFdpdGggdGhpcyBhbmQg
dGhlIG90aGVyIGluc3RhbmNlCj4+IGFkanVzdGVkCj4gCj4gSSBjYW4gZG8gdGhhdCB3aGVuIHBv
c3RpbmcgYSBuZXcgdmVyc2lvbiwgdW5sZXNzIHlvdSB3YW50IHRvIHBpY2sgdGhpcwo+IGVhcmxp
ZXIgYW5kIGFkanVzdCBvbiBjb21taXQuCgpJcyB0aGlzIHRvIG1lYW4gdGhhdCB0aGlzIDJuZCB0
byBsYXN0IHBhdGNoIGluIHRoZSBzZXJpZXMgaXMKZnVsbHkgaW5kZXBlbmRlbnQgb2YgdGhlIGVh
cmxpZXIgZml2ZSAoYWxzbyBjb250ZXh0dWFsbHkpPwpUaGVuIG9mIGNvdXJzZSBJJ2QgYmUgZmlu
ZSB0byBtYWtlIHRoZSBhZGp1c3RtZW50cyBhbmQgY29tbWl0LgpQbGVhc2UgY29uZmlybSBpZiBz
by4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
