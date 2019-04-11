Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5445C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 15:58:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDBEC2133D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 15:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDBEC2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEc5E-0006jk-8Y; Thu, 11 Apr 2019 15:57:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xe+J=SN=citrix.com=prvs=9977b2ae1=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hEc5C-0006je-Qh
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 15:57:46 +0000
X-Inumbo-ID: 8baad228-5c72-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8baad228-5c72-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 15:57:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,337,1549929600"; d="scan'208";a="83352694"
Date: Thu, 11 Apr 2019 16:56:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190411155602.GL1435@perard.uk.xensource.com>
References: <20190410103338.5456-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190410103338.5456-1-olaf@aepfle.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH v1] libxl: fix migration of PV and PVH domUs
 with and without qemu
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411155602.PiSWyinI-SQb81tTAW7VIZjL7OjHsJj5wDOgB3-xY_A@z>

T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgMTI6MzM6MzhQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gSWYgYSBkb21VIGhhcyBhIHFlbXUteGVuIGluc3RhbmNlIGF0dGFjaGVkLCBpdCBpcyBy
ZXF1aXJlZCB0byBjYWxsIHFlbXVzCj4gInhlbi1zYXZlLWRldmljZXMtc3RhdGUiIG1ldGhvZC4g
V2l0aG91dCBpdCwgdGhlIHJlY2VpdmluZyBzaWRlIG9mIGEgUFYgb3IKPiBQVkggbWlncmF0aW9u
IG1heSBiZSB1bmFibGUgdG8gbG9jayB0aGUgaW1hZ2U6Cj4gCj4geGVuIGJlOiBxZGlzay01MTcx
MjogeGVuIGJlOiBxZGlzay01MTcxMjogZXJyb3I6IEZhaWxlZCB0byBnZXQgIndyaXRlIiBsb2Nr
Cj4gZXJyb3I6IEZhaWxlZCB0byBnZXQgIndyaXRlIiBsb2NrCj4geGVuIGJlOiBxZGlzay01MTcx
MjogeGVuIGJlOiBxZGlzay01MTcxMjogaW5pdGlhbGlzZSgpIGZhaWxlZAo+IGluaXRpYWxpc2Uo
KSBmYWlsZWQKCkkgaGF2ZW4ndCBtYW5hZ2VkIHRvIHJlcHJvZHVjZSB0aGlzLCBidXQgdGhpcyBi
dWcgd2lsbCBnbyBhd2F5IHdpdGgKUUVNVSA0LjAuIFRoZSBiYWNrZW5kIGluIFFFTVUgNC4wIHdp
bGwgbm90IGxvY2sgdGhlIGRpc2sgaW1hZ2UgYW55bW9yZS4KCk1heWJlIHdlIGNvdWxkIHNpbXBs
eSBhcHBseSBhIHBhdGNoIHRvIG91ciBxZW11LXhlbiB0cmVlcyB3aGljaCBhdm9pZAp0aGUgbG9j
ayBvbiBkaXNrIGltYWdlcyBmb3IgdGhlIHB2IGRpc2tzPyBUaGF0IHdvdWxkIGF2b2lkIGEgY29u
dm9sdXRlZApwYXRjaCB0byBsaWJ4bC4KClRoZSBsb2NrIGFwcGVhcmVkIGluIFFFTVUgMi4xMCAo
cWVtdS14ZW4tNC4xMCksIGFuZCB3b24ndCBleGlzdCBmb3IgcHYKZ3Vlc3Qgd2l0aCBRRU1VIDQu
MCAocWVtdS14ZW4tNC4xMykuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
