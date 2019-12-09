Return-Path: <SRS0=SZmv=Z7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B1EC43603
	for <xen-devel@archiver.kernel.org>; Mon,  9 Dec 2019 11:52:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEEBE2077B
	for <xen-devel@archiver.kernel.org>; Mon,  9 Dec 2019 11:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEEBE2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHar-0001bq-3e; Mon, 09 Dec 2019 11:52:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieHap-0001bk-Jh
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 11:52:47 +0000
X-Inumbo-ID: 6a808f64-1a7a-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a808f64-1a7a-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 11:52:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1E517B15F;
 Mon,  9 Dec 2019 11:52:17 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-4-pdurrant@amazon.com>
 <20191209114137.GT980@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5777c17b-9028-2525-1322-6c05f1ce3aab@suse.com>
Date: Mon, 9 Dec 2019 12:52:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209114137.GT980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] xen/interface: don't discard pending
 work in FRONT/BACK_RING_ATTACH
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMTkgMTI6NDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVGh1LCBEZWMg
MDUsIDIwMTkgYXQgMDI6MDE6MjJQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBDdXJy
ZW50bHkgdGhlc2UgbWFjcm9zIHdpbGwgc2tpcCBvdmVyIGFueSByZXF1ZXN0cy9yZXNwb25zZXMg
dGhhdCBhcmUKPj4gYWRkZWQgdG8gdGhlIHNoYXJlZCByaW5nIHdoaWxzdCBpdCBpcyBkZXRhY2hl
ZC4gVGhpcywgaW4gZ2VuZXJhbCwgaXMgbm90Cj4+IGEgZGVzaXJhYmxlIHNlbWFudGljIHNpbmNl
IG1vc3QgZnJvbnRlbmQgaW1wbGVtZW50YXRpb25zIHdpbGwgZXZlbnR1YWxseQo+PiBibG9jayB3
YWl0aW5nIGZvciBhIHJlc3BvbnNlIHdoaWNoIHdvdWxkIGVpdGhlciBuZXZlciBhcHBlYXIgb3Ig
bmV2ZXIgYmUKPj4gcHJvY2Vzc2VkLgo+Pgo+PiBOT1RFOiBUaGVzZSBtYWNyb3MgYXJlIGN1cnJl
bnRseSB1bnVzZWQuIEJBQ0tfUklOR19BVFRBQ0goKSwgaG93ZXZlciwgd2lsbAo+PiAgICAgICAg
YmUgdXNlZCBpbiBhIHN1YnNlcXVlbnQgcGF0Y2guCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiBUaG9zZSBoZWFkZXJzIGNvbWUgZnJv
bSBYZW4sIGFuZCBzaG91bGQgYmUgbW9kaWZpZWQgaW4gWGVuIGZpcnN0IGFuZAo+IHRoZW4gaW1w
b3J0ZWQgaW50byBMaW51eCBJTU8uCgpJbiB0aGVvcnksIHllcy4gQnV0IHRoZSBYZW4gdmFyaWFu
dCBkb2Vzbid0IGNvbnRhaW4gdGhlIEFUVEFDSCBtYWNyb3MuCgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
