Return-Path: <SRS0=4VTz=W5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315D6C3A59E
	for <xen-devel@archiver.kernel.org>; Mon,  2 Sep 2019 14:10:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 074A42173E
	for <xen-devel@archiver.kernel.org>; Mon,  2 Sep 2019 14:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 074A42173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4n2T-0002dP-7q; Mon, 02 Sep 2019 14:10:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4n2S-0002dK-7k
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 14:10:36 +0000
X-Inumbo-ID: 6e1103d4-cd8b-11e9-aea3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e1103d4-cd8b-11e9-aea3-12813bfff9fa;
 Mon, 02 Sep 2019 14:10:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C37A8ABE7;
 Mon,  2 Sep 2019 14:10:33 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <012a0e6de52d8a0ad50b0b784362cf509768990e.camel@infradead.org>
 <20190821163542.172063-1-dwmw2@infradead.org>
 <20190821163542.172063-4-dwmw2@infradead.org>
 <babca242-db4b-ca59-a1c0-bc1948f9c5b0@suse.com>
 <05a88a2bb876b3a165746b91774dc6ee05d86b03.camel@infradead.org>
 <daf8f6f2-aab5-6a4a-e6e4-c10082a70ad4@suse.com>
 <afe1e398b12579c48c6732b5efbcbc90db46ad22.camel@infradead.org>
 <e7d32e0e-62fa-df10-c27d-36bd482e7a88@suse.com>
 <ecd28e008684e723bf9680419acba3b377206c94.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c654326d-f875-8227-b4d7-bf9399c0bdfb@suse.com>
Date: Mon, 2 Sep 2019 16:10:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ecd28e008684e723bf9680419acba3b377206c94.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/5] x86/boot: Copy 16-bit boot variables
 back up to Xen image
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxNTo1MiwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIE1vbiwgMjAx
OS0wOS0wMiBhdCAxNTo0NyArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAyLjA5LjIw
MTkgMTQ6NTEsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4+IE9uIE1vbiwgMjAxOS0wOS0wMiBh
dCAwOTo0NCArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gUmlnaHQsIGp1c3Qgb25lIHBh
aXIgc2hvdWxkIHN1cnZpdmUuIEFuZCBzZWVpbmcgaG93IHRoaW5ncyB3b3JrIGJlZm9yZQo+Pj4+
IHRoaXMgc2VyaWVzIEkgdGhpbmsgaXQgaW5kZWVkIHNob3VsZCBiZSBsaW5rZXIgc2NyaXB0IHN5
bWJvbHMgb25seS4KPj4+PiBBbmQgdGhlbiB0aGUgQUxJR04oKSBhaGVhZCBvZiB0aGUgInN0YXJ0
IiBvbmVzIHNob3VsZCBzdGF5LCBidXQgdGhlcmUncwo+Pj4+IG5vIG5lZWQgZm9yIG9uZSBvbiB0
aGUgImVuZCIgb25lcyAoYWdhaW4gYXMgaXMgY3VycmVudGx5IHRoZSBjYXNlKS4KPj4+Cj4+PiBJ
ZiB3ZSBkb24ndCBhbGlnbiB0aGUgZW5kIHN5bWJvbCB0aGVuIHdlIG5lZWQgdG8gZ28gYmFjayB0
byByb3VuZGluZyB1cAo+Pj4gdGhlIGxlbmd0aCB3aXRoICgoYm9vdF90cmFtcG9saW5lX2VuZCAt
IGJvb3RfdHJhbXBvbGluZV9zdGFydCkgKyAzKSAvIDQKPj4+IGFnYWluIHRob3VnaCwgcmlnaHQ/
Cj4+Cj4+IFdhaXQgLSB3ZSd2ZSBiZWVuIHRhbGtpbmcgYWJvdXQgdGhlICpfcmVsIHNlY3Rpb25z
IC8gdGFibGVzIGhlcmUsCj4+IGhhdmVuJ3Qgd2U/IEFsbCBlbnRyaWVzIG9mIHRoZXNlIHRhYmxl
cyBvdWdodCB0byBiZSBvZiBlcXVhbCBzaXplLAo+PiBhbmQgaGVuY2UgYWxpZ25tZW50IG9mIGEg
dGFibGUncyAiZW5kIiBsYWJlbCBhdXRvbWF0aWNhbGx5IG1hdGNoZXMKPj4gdGhlIHNpemUgb2Yg
dGhlIHRhYmxlIGVudHJpZXMuCj4gCj4gVGhlIHNwZWNpZmljIG9uZSB3ZSB3ZXJlIHRha2luZyBh
Ym91dCBqdXN0IHRoZW4gd2FzCj4gYm9vdGRhdGFfe3N0YXJ0LGVuZH0gd2hpY2ggaXMgdGhlIGRh
dGEgaXRzZWxmIHRvIGJlIGNvcGllZCB1cC9kb3duLCBub3QKPiB0aGUgcmVsb2NhdGlvbnMuCgpP
aCwgSSdtIHNvcnJ5IHRoZW4gZm9yIG1peGluZyB0aGluZ3MgdXAuCgo+IFRoZSBfcmVsIHNlY3Rp
b25zIGluZGVlZCBuZWVkIG5vIGFsaWdubWVudCBhdCB0aGUgZW5kLCBhcyB5b3Ugc2F5LgoKUmln
aHQ7IGFuZCBJIGFncmVlIHRoZSBub24tKl9yZWwgb25lIHdhbnRzIGl0cyAiZW5kIiBsYWJlbCBh
bGlnbmVkLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
