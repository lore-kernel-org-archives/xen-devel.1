Return-Path: <SRS0=n02L=YV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129CBCA9EC0
	for <xen-devel@archiver.kernel.org>; Mon, 28 Oct 2019 11:12:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA81C208C0
	for <xen-devel@archiver.kernel.org>; Mon, 28 Oct 2019 11:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA81C208C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP2wM-0003gV-Rc; Mon, 28 Oct 2019 11:12:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iP2wL-0003gQ-UN
 for xen-devel@lists.xen.org; Mon, 28 Oct 2019 11:12:01 +0000
X-Inumbo-ID: c223ffd0-f973-11e9-94f3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c223ffd0-f973-11e9-94f3-12813bfff9fa;
 Mon, 28 Oct 2019 11:11:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0BB9FABC4;
 Mon, 28 Oct 2019 11:11:58 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191028085603.32037-1-sergey.dyasli@citrix.com>
 <e55613e7-179d-ee5c-34a4-bc3e41997869@suse.com>
 <19a597f0-1694-02fb-2c01-3446407b35a9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28c68c6f-2812-eb48-5cac-c7a5b05dd3bd@suse.com>
Date: Mon, 28 Oct 2019 12:11:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <19a597f0-1694-02fb-2c01-3446407b35a9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for 4.13] x86/shim: don't reserve 640k - 1M
 region in E820
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMjAxOSAxMjowOCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiAyOC8xMC8yMDE5
IDA5OjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjguMTAuMjAxOSAwOTo1NiwgU2VyZ2V5
IER5YXNsaSB3cm90ZToKPj4+IENvbnZlcnRpbmcgYSBndWVzdCBmcm9tIFBWIHRvIFBWLWluLVBW
SCBtYWtlcyB0aGUgZ3Vlc3QgdG8gaGF2ZSAzODRrCj4+PiBsZXNzIG1lbW9yeSwgd2hpY2ggbWF5
IGNvbmZ1c2UgZ3Vlc3QncyBiYWxsb29uIGRyaXZlci4gVGhpcyBoYXBwZW5zCj4+PiBiZWNhdXNl
IFhlbiB1bmNvbmRpdGlvbmFsbHkgcmVzZXJ2ZXMgNjQwayAtIDFNIHJlZ2lvbiBpbiBFODIwIGRl
c3BpdGUKPj4+IHRoZSBmYWN0IHRoYXQgaXQncyByZWFsbHkgYSB1c2FibGUgUkFNIGluIFBWSCBi
b290IG1vZGUuCj4+Cj4+IFRoaXMgaXMgYSBQVkggcHJvcGVydHkgYWNjb3JkaW5nIHRvIHlvdXIg
ZGVzY3JpcHRpb24gYW5kIGFjY29yZGluZwo+PiB0byBteSB1bmRlcnN0YW5kaW5nLiBXaHkgd291
bGQgeW91IHRoZW4gLi4uCj4+Cj4+PiBGaXggdGhpcyBieSBza2lwcGluZyB0aGUgcmVnaW9uIHR5
cGUgY2hhbmdlIGZvciBwdi1zaGltIG1vZGUuCj4+Cj4+IC4uLiBhbHRlciBiZWhhdmlvciBmb3Ig
c2hpbSBtb2RlIG9ubHksIHJhdGhlciB0aGFuIHdoZW4gYm9vdGVkIGluCj4+IFBWSCBtb2RlIGlu
IGdlbmVyYWw/Cj4gCj4gVGhpcyBpcyBqdXN0IG1lIGJlaW5nIGNhdXRpb3VzLgo+IAo+IE15IG9y
aWdpbmFsIGVtYWlsIGRvZXMgaGF2ZSB0aGlzIHRleHQgYWZ0ZXIgLS0tCj4gIlRoZSBjb25kaXRp
b24gY2FuIGJlIHJlbGF4ZWQgdG8gYmUganVzdCAhcHZoX2Jvb3QgaWYgdGhlcmUgYXJlIG5vCj4g
cGxhbnMgdG8gc3VwcG9ydCBWR0EgTU1JTyAvIFJPTXMgZm9yIFBWSCBndWVzdHMuIgoKSSBkb3Vi
dCBlbXVsYXRlZCBvbmVzIGFyZSBpbnRlbmRlZCB0byBiZSBzdXBwb3J0ZWQsIGJ1dCBvZgpjb3Vy
c2UgYSBncmFwaGljcyBjYXJkIGNvdWxkIGJlIHBhc3NlZCB0aHJvdWdoLiBJaXJjIHBhc3N0aHJv
dWdoCmlzIGEgcGVuZGluZyB3b3JrIGl0ZW0gc3RpbGwgYW55d2F5IGZvciBQVkgsIHNvIGRlYWxp
bmcgd2l0aCB0aGUKY2FzZSByaWdodCBub3cgbWF5IG5vdCBldmVuIGJlIG5lY2Vzc2FyeS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
