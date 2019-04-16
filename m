Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2E4C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 07:18:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E93CA2073F
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 07:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E93CA2073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGILb-0000AS-Px; Tue, 16 Apr 2019 07:17:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nHU3=SS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hGILa-0000AN-0N
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 07:17:38 +0000
X-Inumbo-ID: b525d247-6017-11e9-92d7-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b525d247-6017-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 07:17:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 80457ACD0;
 Tue, 16 Apr 2019 07:17:34 +0000 (UTC)
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
References: <20190415211141.GA1732@embeddedor>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0169c220-8a56-f1cb-1922-d17ea56b1427@suse.com>
Date: Tue, 16 Apr 2019 09:17:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190415211141.GA1732@embeddedor>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH net-next] xen-netfront: mark expected switch
 fall-through
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDQvMjAxOSAyMzoxMSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiBJbiBwcmVw
YXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCBtYXJrIHN3aXRjaAo+
IGNhc2VzIHdoZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdoLgo+IAo+IFRoaXMg
cGF0Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+IAo+IGRyaXZlcnMvbmV0L3hlbi1u
ZXRmcm9udC5jOiBJbiBmdW5jdGlvbiDigJhuZXRiYWNrX2NoYW5nZWTigJk6Cj4gZHJpdmVycy9u
ZXQveGVuLW5ldGZyb250LmM6MjAzODo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFs
bCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiAgICBpZiAoZGV2LT5zdGF0ZSA9
PSBYZW5idXNTdGF0ZUNsb3NlZCkKPiAgICAgICBeCj4gZHJpdmVycy9uZXQveGVuLW5ldGZyb250
LmM6MjA0MToyOiBub3RlOiBoZXJlCj4gICBjYXNlIFhlbmJ1c1N0YXRlQ2xvc2luZzoKPiAgIF5+
fn4KPiAKPiBXYXJuaW5nIGxldmVsIDMgd2FzIHVzZWQ6IC1XaW1wbGljaXQtZmFsbHRocm91Z2g9
Mwo+IAo+IE5vdGljZSB0aGF0LCBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIGNvZGUgY29t
bWVudCBpcyBtb2RpZmllZAo+IGluIGFjY29yZGFuY2Ugd2l0aCB3aGF0IEdDQyBpcyBleHBlY3Rp
bmcgdG8gZmluZC4KPiAKPiBUaGlzIHBhdGNoIGlzIHBhcnQgb2YgdGhlIG9uZ29pbmcgZWZmb3J0
cyB0byBlbmFibGUKPiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+CgpSZXZpZXdlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
