Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14741C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:22:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E01FD20857
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E01FD20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDplz-00089v-1M; Tue, 09 Apr 2019 12:22:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDplx-00089R-8z
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:22:41 +0000
X-Inumbo-ID: 2aff83df-5ac2-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2aff83df-5ac2-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 12:22:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83100261"
Date: Tue, 9 Apr 2019 13:22:09 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: "Nuernberger, Stefan" <snu@amazon.de>
Message-ID: <20190409122209.GO1986@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-7-wei.liu2@citrix.com>
 <1552943654.6788.95.camel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1552943654.6788.95.camel@amazon.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH RFC 06/55] x86/mm: map_pages_to_xen should
 have one exit path
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409122209.-9c-ebeiErDmmMl9dKSwJGrd3lev-e2YuDn1vy7SoqA@z>

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDk6MTQ6MTRQTSArMDAwMCwgTnVlcm5iZXJnZXIsIFN0
ZWZhbiB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDItMDcgYXQgMTY6NDQgKzAwMDAsIFdlaSBMaXUg
d3JvdGU6Cj4gPiBXZSB3aWxsIHNvb24gcmV3cml0ZSB0aGUgZnVuY3Rpb24gdG8gaGFuZGxlIGR5
bmFtaWNhbGx5IG1hcHBpbmcgYW5kCj4gPiB1bm1hcHBpbmcgb2YgcGFnZSB0YWJsZXMuCj4gPiAK
PiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiDCoHhlbi9hcmNoL3g4Ni9tbS5jIHwg
MzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4gwqAxIGZpbGUgY2hhbmdl
ZCwgMjcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKPiA+IGluZGV4IDQxNDdhNzFj
NWQuLjNhYjIyMmM4ZWEgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ID4gKysr
IGIveGVuL2FyY2gveDg2L21tLmMKPiA+IEBAIC00ODg3LDkgKzQ4ODcsMTEgQEAgaW50IG1hcF9w
YWdlc190b194ZW4oCj4gPiDCoMKgwqDCoMKgdW5zaWduZWQgaW50IGZsYWdzKQo+ID4gwqB7Cj4g
PiDCoMKgwqDCoMKgYm9vbCBsb2NraW5nID0gc3lzdGVtX3N0YXRlID4gU1lTX1NUQVRFX2Jvb3Q7
Cj4gPiArwqDCoMKgwqBsM19wZ2VudHJ5X3QgKnBsM2UsIG9sM2U7Cj4gCj4gQWZ0ZXIgbGltaXRp
bmcgdGhlIHNjb3BlIG9mIG90aGVyIHZhcmlhYmxlcyBpbiB0aGUgcHJldmlvdXMgcGF0Y2hlcywK
PiB5b3Ugbm93IHdpZGVuIHRoZSBzY29wZSBmb3IgdGhpcyBvbmUuIElzIHRoaXMgc28geW91IGNh
biBoYW5kbGUgdW5tYXAKPiBpbiBhIGNvbW1vbiBleGl0L2Vycm9yIHBhdGggbGF0ZXI/CgpZZXMu
CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
