Return-Path: <SRS0=ShNj=ZT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69281C432C0
	for <xen-devel@archiver.kernel.org>; Wed, 27 Nov 2019 09:25:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 417A82070B
	for <xen-devel@archiver.kernel.org>; Wed, 27 Nov 2019 09:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 417A82070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZtZP-0007dc-DF; Wed, 27 Nov 2019 09:25:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZtZO-0007dG-AN
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 09:25:10 +0000
X-Inumbo-ID: ce3a8fc8-10f7-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce3a8fc8-10f7-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 09:25:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97313AE61;
 Wed, 27 Nov 2019 09:25:08 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20191126171747.3185988-1-george.dunlap@citrix.com>
 <20191126171747.3185988-2-george.dunlap@citrix.com>
 <3d32b122-e301-1d63-7767-f599547274d2@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <230ff6db-0cf8-b10e-b1b2-4cac12e2b01d@suse.com>
Date: Wed, 27 Nov 2019 10:25:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3d32b122-e301-1d63-7767-f599547274d2@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAwNTozMiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyNi4xMS4xOSAx
ODoxNywgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGwuaAo+
PiArKysgYi90b29scy9saWJ4bC9saWJ4bC5oCj4+IEBAIC0zNjQsOCArMzY0LDggQEAKPj4gICAg
Ki8KPj4gICAjZGVmaW5lIExJQlhMX0hBVkVfQlVJTERJTkZPX0dSQU5UX0xJTUlUUyAxCj4+ICAg
Cj4+IC0jZGVmaW5lIExJQlhMX01BWF9HUkFOVF9GUkFNRVNfREVGQVVMVCAzMgo+PiAtI2RlZmlu
ZSBMSUJYTF9NQVhfTUFQVFJBQ0tfRlJBTUVTX0RFRkFVTFQgMTAyNAo+PiArI2RlZmluZSBMSUJY
TF9NQVhfR1JBTlRfRlJBTUVTX0RFRkFVTFQgMAo+PiArI2RlZmluZSBMSUJYTF9NQVhfTUFQVFJB
Q0tfRlJBTUVTX0RFRkFVTFQgMAo+IAo+IEknZCByYXRoZXIgdXNlIC0xIGZvciB0aGUgIm5vdCBz
cGVjaWZpZWQiIHZhbHVlLiBUaGlzIGFsbG93cyB0byBzZXQgZS5nLgo+IHRoZSBtYXB0cmFjayBm
cmFtZXMgdG8gMCBmb3Igbm9uLWRyaXZlciBkb21haW5zLgoKWWVzLiBCdXQgaXQgaW4gdHVybiB3
b3VsZG4ndCBhbGxvdyB0YWtpbmcgMCB0byBtZWFuICJkZWZhdWx0IiBpbiB0aGUKaHlwZXJ2aXNv
ci4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
