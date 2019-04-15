Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5375C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 15:32:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9200E2075B
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 15:32:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="jkitNvCK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9200E2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG3b3-0002s6-8F; Mon, 15 Apr 2019 15:32:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t1d2=SR=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hG3b2-0002s1-3s
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 15:32:36 +0000
X-Inumbo-ID: b12c8f3d-5f93-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b12c8f3d-5f93-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 15:32:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1555342354; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=w6EGdQUiuxS3nxTIoke7Wqnc5YTnmIY6N9H9BdESBFM=;
 b=jkitNvCK1M1zLY3TsRzDtGMpWM+cT6/vfQ6Tj5EXA8BhACj1IpujByRGh6R1qwly2CIrtg8A
 vUxvVfJ3NYEhlwl72eLIZ6L/T7iaOZTNIxOlCk8pZzIJfoYiQWF/M/DXYeH095sBoMFdTj+x
 ECOElNX6xa3A8/fpgxyMPONjeM4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mxa.mailgun.org with ESMTP id 5cb4a3f4.7f2e05a5b570-smtp-out-n03;
 Mon, 15 Apr 2019 15:32:04 -0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id y13so22578797wrd.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 08:32:04 -0700 (PDT)
X-Gm-Message-State: APjAAAUGG+XBhR1olaARQWKMRV13o+BJyKlpLCGeW2wHtzoCibzbvP94
 U/HQUYoDbM+9NQuFC21VWHC5nCnl5z+4Vx0UOLI=
X-Google-Smtp-Source: APXvYqwIz7l1TOH/EpkMHhLgCtkru7HOY9NXucWbY2zY/J4wfLIHkVAH9bsGR0IZJmKVvA7v01Y0wo3/IZTE/1IS7Cw=
X-Received: by 2002:adf:f70e:: with SMTP id r14mr48020084wrp.37.1555342318522; 
 Mon, 15 Apr 2019 08:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
In-Reply-To: <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 15 Apr 2019 09:31:21 -0600
X-Gmail-Original-Message-ID: <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
Message-ID:
 <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415153121.oxyXuhjsS0sCrMqWTDqcYD7Yqs1zx_7sOA5TleHa1eE@z>

T24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgOToyMSBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8xMi8xOSA4OjQ3IFBNLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4gPiBQYXRjaCAwNTAyZTBhZGFlMiAieDg2OiBjb3JyZWN0IGluc3RhbmNl
cyBvZiBQR0NfYWxsb2NhdGVkIGNsZWFyaW5nIiBpbnRyb2R1Y2VkCj4gPiBncmFiYmluZyBleHRy
YSByZWZlcmVuY2VzIGZvciBwYWdlcyB0aGF0IGRyb3AgcmVmZXJlbmNlcyB0aWVkIHRvIFBHQ19h
bGxvY2F0ZWQuCj4gPiBIb3dldmVyLCB0aGUgd2F5IHRoZXNlIGV4dHJhIHJlZmVyZW5jZXMgd2Vy
ZSBncmFiYmVkIHdlcmUgaW5jb3JyZWN0LCByZXN1bHRpbmcKPiA+IGluIGJvdGggc2hhcmVfcGFn
ZXMgYW5kIHVuc2hhcmVfcGFnZXMgZmFpbGluZy4KPgo+IFdoeT8gIElzIGNkIG5vdCB0aGUgb3du
ZXIgb2YgdGhlIHBhZ2U/CgpJdCdzIG5vdCwgZG9tX2NvdyBpcy4KCj4gPiBAQCAtMTAwMiw3ICs5
OTQsMTAgQEAgc3RhdGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qg
c2dmbiwgc2hyX2hhbmRsZV90IHNoLAo+ID4gICAgICAvKiBGcmVlIHRoZSBjbGllbnQgcGFnZSAq
Lwo+ID4gICAgICBpZih0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICZjcGFnZS0+
Y291bnRfaW5mbykpCj4gPiAgICAgICAgICBwdXRfcGFnZShjcGFnZSk7Cj4gPiAtICAgIHB1dF9w
YWdlKGNwYWdlKTsKPiA+ICsKPiA+ICsgICAgQVNTRVJUKHB1dF9jb3VudCk7Cj4gPiArICAgIHdo
aWxlICggcHV0X2NvdW50LS0gKQo+ID4gKyAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUoY3BhZ2Up
Owo+Cj4gSSBkb24ndCB0aGluayB0aGlzIGlzIGluIHRoZSBzcGlyaXQgb2YgdGhlIGZpeCBpbiAw
NTAyZTBhZGFlMjsgdGhlIGlkZWEKPiB0aGVyZSBzZWVtcyB0byBoYXZlIGJlZW4gdG8gbWFrZSBz
dXJlIHRoYXQgY3BhZ2UgYmVsb25ncyB0byB0aGUgcmlnaHQKPiBkb21haW4sIGFuZCB0aGF0IHRo
ZSBvd25lcnNoaXAgZG9lc24ndCBjaGFuZ2UuICBJZiBzdWNoIGEgcmFjZSAvIG1pc3Rha2UKPiB3
ZXJlIHBvc3NpYmxlIGJlZm9yZSB0aGF0IGNoYW5nZSwgc3VjaCBhIHJhY2UgLyBtaXN0YWtlIHdv
dWxkIGJlCj4gcG9zc2libGUgYWZ0ZXIgdGhpcyBjaGFuZ2UsIHdvdWxkbid0IGl0PwoKSSBkb24n
dCBoYXZlIGFuIGFuc3dlciB0byB5b3VyIHF1ZXN0aW9uLiBBRkFJVSB0aGlzIGlzIGp1c3QgdG8g
ZW5zdXJlCnRoYXQgdGhlIHBhZ2UgaXNuJ3QgZHJvcHBlZCBiZWZvcmUgdGVzdF9hbmRfY2xlYXJf
Yml0IGlzIHVzZWQgb24gdGhlCnBhZ2UuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
