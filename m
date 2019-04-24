Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918B0C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:45:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 698E620878
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 698E620878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJK5B-0001K7-KH; Wed, 24 Apr 2019 15:45:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rs1d=S2=citrix.com=prvs=010ed0f85=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hJK5A-0001K2-9S
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 15:45:12 +0000
X-Inumbo-ID: f0b85ff9-66a7-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f0b85ff9-66a7-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 15:45:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,390,1549929600"; d="scan'208";a="89241361"
Date: Wed, 24 Apr 2019 17:45:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20190424154504.vzkkobxsesc3oval@Air-de-Roger>
References: <20190423130416.68935-1-roger.pau@citrix.com>
 <20190423130416.68935-2-roger.pau@citrix.com>
 <2359c97c-1125-cfd2-44c2-7e9ce7972558@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2359c97c-1125-cfd2-44c2-7e9ce7972558@oracle.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/pvh: correctly setup the PV EFI
 interface for dom0
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMTE6MzY6NDFBTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDQvMjMvMTkgOTowNCBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4g
VGhpcyBpbnZvbHZlcyBpbml0aWFsaXppbmcgdGhlIGJvb3QgcGFyYW1zIEVGSSByZWxhdGVkIGZp
ZWxkcyBhbmQgdGhlCj4gPiBlZmkgZ2xvYmFsIHZhcmlhYmxlLgo+ID4KPiA+IFdpdGhvdXQgdGhp
cyBmaXggYSBQVkggZG9tMCBkb2Vzbid0IGRldGVjdCB3aGVuIGJvb3RlZCBmcm9tIEVGSSwgYW5k
Cj4gPiB0aHVzIGRvZXNuJ3Qgc3VwcG9ydCBhY2Nlc3NpbmcgYW55IG9mIHRoZSBFRkkgcmVsYXRl
ZCBkYXRhLgo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBQR05ldCBEZXYgPHBnbmV0LmRldkBnbWFpbC5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPiAKPiBIbW0uLiBUaGlzIHNlZW1zIHRvIGJlIGJyZWFraW5nIHNhdmUvcmVzdG9yZSBm
b3IgbWUgKGZvciBkb21VKSwgYW5kIEkKPiBjYW4ndCBzZWUgYW55IG9idmlvdXMgcmVhc29ucy4K
PiAKPiBDYW4geW91IHRyeSBpdD8KClN1cmUsIHRoYW5rcyBmb3IgdGhlIGV4dHJhIHRlc3Rpbmch
IEkgaGF2ZSB0byBhZG1pdCBJIGhhdmVuJ3QgdGVzdGVkCnNhdmUvcmVzdG9yZSB3aXRoIHRoaXMg
cGF0Y2ggYXBwbGllZCwgaXQgZGlkbid0IGNvbWUgdG8gbWluZCBpdCBtaWdodAphZmZlY3QgdGhh
dCBmdW5jdGlvbmFsaXR5LgoKSSBhc3N1bWUgaXQncyBzYXZlL3Jlc3RvcmUgb2YgYSBQVkggZG9t
VSB0aGF0J3MgYnJva2VuIChIVk0gYW5kIFBWIGFyZQpmaW5lKT8KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
