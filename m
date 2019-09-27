Return-Path: <SRS0=1d2Y=XW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A23C4360C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Sep 2019 12:54:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EEF520872
	for <xen-devel@archiver.kernel.org>; Fri, 27 Sep 2019 12:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EEF520872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDplS-00027A-Qe; Fri, 27 Sep 2019 12:54:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDplR-00026y-3D
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:54:25 +0000
X-Inumbo-ID: edde6856-e125-11e9-9678-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id edde6856-e125-11e9-9678-12813bfff9fa;
 Fri, 27 Sep 2019 12:54:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DF512ACA4;
 Fri, 27 Sep 2019 12:54:22 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>
References: <20190927114554.11513-1-paul.durrant@citrix.com>
 <20190927122814.rjd4mzj7fohtq47d@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8363211-3a85-4632-720f-ac93de2afad8@suse.com>
Date: Fri, 27 Sep 2019 14:54:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190927122814.rjd4mzj7fohtq47d@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] iommu: fix PVH dom0 settings
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAxNDoyOCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gRnJpLCBT
ZXAgMjcsIDIwMTkgYXQgMTI6NDU6NTRQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAt
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4+ICsrKyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2lvbW11LmMKPj4gQEAgLTE1NCwxMyArMTU0LDEzIEBAIGN1c3RvbV9wYXJh
bSgiZG9tMC1pb21tdSIsIHBhcnNlX2RvbTBfaW9tbXVfcGFyYW0pOwo+PiAgCj4+ICBzdGF0aWMg
dm9pZCBfX2h3ZG9tX2luaXQgY2hlY2tfaHdkb21fcmVxcyhzdHJ1Y3QgZG9tYWluICpkKQo+PiAg
ewo+PiAtICAgIGlmICggaW9tbXVfaHdkb21fbm9uZSB8fCAhcGFnaW5nX21vZGVfdHJhbnNsYXRl
KGQpICkKPj4gKyAgICBpZiAoIGlvbW11X2h3ZG9tX25vbmUgfHwgIWhhcF9lbmFibGVkKGQpICkK
PiAKPiBTaW5jZSBkb20wIFBWSCBjYW4gYWxzbyBiZSB1c2VkIHdpdGggc2hhZG93IHBhZ2luZyAo
bm90IHN1cmUgaG93Cj4gdXNlZnVsIHRoYXQgaXMgVEJIKSwgSSdtIG5vdCBzdXJlIGV4cGxpY2l0
bHkgY2hlY2tpbmcgZm9yIGhhcCBpcyBmaW5lLgo+IFdoYXQgYWJvdXQgdXNpbmcgaXNfaHZtX2Rv
bWFpbiBpbnN0ZWFkPwo+IAo+IFRoYXQgb3VnaHQgdG8gY292ZXIgYm90aCBzaGFkb3cgYW5kIGhh
cCwgYW5kIGEgY2xhc3NpYyBQViBkb20wIHdvbid0Cj4gYmUgYWZmZWN0ZWQgYnkgaXQgKHdoaWNo
IGlzIHRoZSBpbnRlbnRpb24pLgoKT2gsIGluZGVlZCAtIHdlIHNob3VsZG4ndCBwcmV2ZW50IHNo
YWRvdyBtb2RlIHVzZS4gVGhhdCdsbCBuZWVkIHRvCmJlIGFuIGluY3JlbWVudGFsIGNoYW5nZSB0
aG91Z2gsIGFzIEkndmUgYWxyZWFkeSBjb21taXR0ZWQgdGhlIG9uZQpoZXJlLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
