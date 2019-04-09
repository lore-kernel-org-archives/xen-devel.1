Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F92EC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 10:25:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FD720880
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 10:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53FD720880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDnwd-0002Vj-Tm; Tue, 09 Apr 2019 10:25:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDjF=SL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDnwc-0002Tj-62
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 10:25:34 +0000
X-Inumbo-ID: ce32d6bc-5ab1-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ce32d6bc-5ab1-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 10:25:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E8B380D;
 Tue,  9 Apr 2019 03:25:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 010363F59C;
 Tue,  9 Apr 2019 03:25:30 -0700 (PDT)
To: Wei Liu <wei.liu2@citrix.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-2-julien.grall@arm.com>
 <20190403114127.GX14641@zion.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d870167b-45f4-d87e-43bc-8c91fc7eff1c@arm.com>
Date: Tue, 9 Apr 2019 11:25:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190403114127.GX14641@zion.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] xen/console: Properly buffer domU
 output when using CONSOLEIO_write
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409102529.BE879VJ1cQnjXkwY6eDL-U1FbS2R7xakZYipBKomhwM@z>

SGksCgpPbiAwMy8wNC8yMDE5IDEyOjQxLCBXZWkgTGl1IHdyb3RlOgo+IE9uIFR1ZSwgQXByIDAy
LCAyMDE5IGF0IDA1OjQyOjM1UE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gVGhlIG91
dHB1dCB3aWxsIGJlIGJ1ZmZlcmVkIGlmIHRoZSBidWZmZXIgcHJvdmlkZWQgYnkgdGhlIERvbVUg
ZG9lcyBub3QKPj4gY29udGFpbiBhIG5ld2xpbmUuIFRoaXMgY2FuIGFsc28gaGFwcGVuIGlmIGJ1
ZmZlciBwcm92aWRlZCBieSBEb21VIGlzCj4+IHNwbGl0IGluIG11bHRpcGxlIHBhcnQgKFhlbiBj
YW4gb25seSBwcm9jZXNzIDEyNyBjaGFyYWN0ZXJzIGF0IHRoZSB0aW1lKS4KPj4KPj4gQXMgWGVu
IHdpbGwgcmVtb3ZlIGFueSBub24tcHJpbnRhYmxlIGNoYXJhY3RlcnMsIHRoZSBvdXRwdXQgYnVm
ZmVyIG1heQo+PiBiZSBzbWFsbGVyIHRoYW4gdGhlIGJ1ZmZlciBwcm92aWRlZC4gSG93ZXZlciwg
WGVuIHdpbGwgYnVmZmVyIHVzaW5nIHRoZQo+PiBvcmlnaW5hbCBsZW5ndGguIFRoaXMgbWVhbnMg
dGhhdCB0aGUgTlVMIGNoYXJhY3RlciBhbmQgZ2FyYmFnZ2Ugd2lsbCBiZQo+PiBjb3BpZWQgaW4g
dGhlIGludGVybmFsIGJ1ZmZlci4KPj4KPj4gT25jZSB0aGUgbmV3bGluZSBpcyBmb3VuZCBvciB0
aGUgaW50ZXJuYWwgYnVmZmVyIGlzIGZ1bGwsIG9ubHkgcGFydCBvZgo+PiB0aGUgaW50ZXJuYWwg
YnVmZmVyIHdpbGwgZW5kIHVwIHRvIGJlIHByaW50ZWQuCj4+Cj4+IEFuIGVhc3kgd2F5IHRvIHJl
cHJvZHVjZSBpdCBpczoKPj4KPj4gSFlQRVJWSVNPUl9jb25zb2xlaW8oQ09OU09MRUlPX3dyaXRl
LCAiXDMzIiwgMSk7Cj4+IEhZUEVSVklTT1JfY29uc29sZWlvKENPTlNPTEVJT193cml0ZSwgImQi
LCAxKTsKPj4gSFlQRVJWSVNPUl9jb25zb2xlaW8oQ09OU09MRUlPX3dyaXRlLCAiXG4iLCAxKTsK
Pj4KPj4gSW4gdGhlIGN1cnJlbnQgY29kZSwgdGhlIGNoYXJhY3RlciAnZCcgd2lsbCBub3QgYmUg
cHJpbnRlZC4KPj4KPj4gVGhpcyBwcm9ibGVtIGNhbiBiZSBzb2x2ZWQgYnkgY29tcHV0aW5nIHRo
ZSBzaXplIG9mIHRoZSBvdXRwdXQgYnVmZmVyCj4+IChpLmUgdGhlIGJ1ZmZlciB3aXRob3V0IHRo
ZSBub24tcHJpbnRhYmxlIGNoYXJhY3RlcnMpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgoKSSBoYXZlIGNvbW1pdHRlZCB0aGlzIHBhdGNoLiBUaGUgcmVzdCBv
ZiB0aGUgc2VyaWVzIG5lZWQgdG8gYmUgcmVzcGluZWQuCgpDaGVlcnMsCgo+IAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
