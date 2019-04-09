Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7BFC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:19:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 359CC20818
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 359CC20818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDmuT-0004O8-Cj; Tue, 09 Apr 2019 09:19:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDmuS-0004O2-NF
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:19:16 +0000
X-Inumbo-ID: 8acf538c-5aa8-11e9-a814-3f1d300cc5da
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8acf538c-5aa8-11e9-a814-3f1d300cc5da;
 Tue, 09 Apr 2019 09:19:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,328,1549929600"; d="scan'208";a="83088170"
Date: Tue, 9 Apr 2019 10:19:11 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <20190409091911.GJ1986@zion.uk.xensource.com>
References: <20190409091546.9606-1-andr2000@gmail.com>
 <20190409091832.GA2164@zion.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190409091832.GA2164@zion.uk.xensource.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] xen/cameraif: add ABI for para-virtual
 camera
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
Cc: jgross@suse.com, Wei Liu <wei.liu2@citrix.com>, konrad.wilk@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMTA6MTg6MzJBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEFwciAwOSwgMjAxOSBhdCAxMjoxNTo0NlBNICswMzAwLCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToKPiA+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVr
c2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiA+IAo+ID4gVGhpcyBpcyB0aGUgQUJJIGZv
ciB0aGUgdHdvIGhhbHZlcyBvZiBhIHBhcmEtdmlydHVhbGl6ZWQKPiA+IGNhbWVyYSBkcml2ZXIg
d2hpY2ggZXh0ZW5kcyBYZW4ncyByZWFjaCBtdWx0aW1lZGlhIGNhcGFiaWxpdGllcyBldmVuCj4g
PiBmdXJ0aGVyIGVuYWJsaW5nIGl0IGZvciB2aWRlbyBjb25mZXJlbmNpbmcsIEluLVZlaGljbGUg
SW5mb3RhaW5tZW50LAo+ID4gaGlnaCBkZWZpbml0aW9uIG1hcHMgZXRjLgo+ID4gCj4gPiBUaGUg
aW5pdGlhbCBnb2FsIGlzIHRvIHN1cHBvcnQgbW9zdCBuZWVkZWQgZnVuY3Rpb25hbGl0eSB3aXRo
IHRoZQo+ID4gZmluYWwgaWRlYSB0byBtYWtlIGl0IHBvc3NpYmxlIHRvIGV4dGVuZCB0aGUgcHJv
dG9jb2wgaWYgbmVlZCBiZToKPiA+IAo+ID4gMS4gUHJvdmlkZSBtZWFucyBmb3IgYmFzZSB2aXJ0
dWFsIGRldmljZSBjb25maWd1cmF0aW9uOgo+ID4gIC0gcGl4ZWwgZm9ybWF0cwo+ID4gIC0gcmVz
b2x1dGlvbnMKPiA+ICAtIGZyYW1lIHJhdGVzCj4gPiAyLiBTdXBwb3J0IGJhc2ljIGNhbWVyYSBj
b250cm9sczoKPiA+ICAtIGNvbnRyYXN0Cj4gPiAgLSBicmlnaHRuZXNzCj4gPiAgLSBodWUKPiA+
ICAtIHNhdHVyYXRpb24KPiA+IDMuIFN1cHBvcnQgc3RyZWFtaW5nIGNvbnRyb2wKPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPgo+IAo+IHY2IHdhcyBwdXNoZWQgeWVzdGVyZGF5LiBJcyB0aGVyZSBh
bnl0aGluZyBuZXcgaW4gdGhpcyB2ZXJzaW9uPwoKT2ggbXkgYmFkLiBUaGlzIGlzIGEgcGF0Y2gg
dG8gTGludXguIElnbm9yZSB0aGF0IHF1ZXN0aW9uLgoKV2VpLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
