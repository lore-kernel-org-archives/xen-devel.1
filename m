Return-Path: <SRS0=chTg=5F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9128C4332D
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2020 13:53:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82E7320722
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2020 13:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82E7320722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFI5Y-0004uy-8M; Fri, 20 Mar 2020 13:53:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFI5X-0004ur-BX
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 13:53:27 +0000
X-Inumbo-ID: 2c0490ea-6ab2-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c0490ea-6ab2-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 13:53:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 037C4B1EB;
 Fri, 20 Mar 2020 13:53:25 +0000 (UTC)
To: paul@xen.org, 'David Woodhouse' <dwmw2@infradead.org>
References: <759b48cc361af1136e3cf1658f3dcb1d2937db9c.camel@infradead.org>
 <20200319212150.2651419-1-dwmw2@infradead.org>
 <20200319212150.2651419-2-dwmw2@infradead.org>
 <004701d5febc$3632bfe0$a2983fa0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bc9fce8e-7499-0a1a-e9e2-e219d8f59546@suse.com>
Date: Fri, 20 Mar 2020 14:53:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <004701d5febc$3632bfe0$a2983fa0$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce
 PGC_state_uninitialised
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, hongyxia@amazon.com,
 xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAyMCAxNDozMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgRGF2aWQgV29vZGhvdXNlCj4+IFNlbnQ6IDE5
IE1hcmNoIDIwMjAgMjE6MjIKPj4KPj4gLS0tIGEveGVuL2FyY2gveDg2L21tLmMKPj4gKysrIGIv
eGVuL2FyY2gveDg2L21tLmMKPj4gQEAgLTQ5MSw3ICs0OTEsOCBAQCB2b2lkIHNoYXJlX3hlbl9w
YWdlX3dpdGhfZ3Vlc3Qoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgc3RydWN0IGRvbWFpbiAqZCwK
Pj4KPj4gICAgICBwYWdlX3NldF9vd25lcihwYWdlLCBkKTsKPj4gICAgICBzbXBfd21iKCk7IC8q
IGluc3RhbGwgdmFsaWQgZG9tYWluIHB0ciBiZWZvcmUgdXBkYXRpbmcgcmVmY250LiAqLwo+PiAt
ICAgIEFTU0VSVCgocGFnZS0+Y291bnRfaW5mbyAmIH5QR0NfeGVuX2hlYXApID09IDApOwo+PiAr
ICAgIEFTU0VSVCgocGFnZS0+Y291bnRfaW5mbyAmIH5QR0NfeGVuX2hlYXApID09IFBHQ19zdGF0
ZV9pbnVzZSB8fAo+PiArICAgICAgICAgICAocGFnZS0+Y291bnRfaW5mbyAmIH5QR0NfeGVuX2hl
YXApID09IFBHQ19zdGF0ZV91bmluaXRpYWxpc2VkKTsKPiAKPiBDb3VsZCB0aGUgcGFnZSBzdGF0
ZSBwZXJoYXBzIGJlIGJ1bXBlZCB0byBpbnVzZSBpbiB0aGlzIGNhc2U/IEl0Cj4gc2VlbXMgb2Rk
IHRvIGxlYXZlIHN0YXRlIHVuaW5pdGlhbGl6ZWQgeWV0IHN1Y2NlZWQgaW4gc2hhcmluZyB3aXRo
IGEgZ3Vlc3QuCgpUaGlzIHdvdWxkIGJlIHF1aXRlIG5pY2UgaW5kZWVkLCBpZiBvZiBjb3Vyc2Ug
aXQgZG9lc24ndCBjYXVzZQpuZXcgY29tcGxpY2F0aW9ucy4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
