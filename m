Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C0FC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:35:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6861720818
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6861720818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEFFw-0002gB-3d; Wed, 10 Apr 2019 15:35:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PZ5s=SM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hEFFu-0002g5-Sa
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:35:18 +0000
X-Inumbo-ID: 3e33e9af-5ba6-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3e33e9af-5ba6-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 15:35:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9984B374;
 Wed, 10 Apr 2019 08:35:17 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 877573F59C;
 Wed, 10 Apr 2019 08:35:16 -0700 (PDT)
To: Thierry Reding <thierry.reding@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
 <20190410142408.22848-22-ian.jackson@eu.citrix.com>
 <20190410152749.GA1460@ulmo>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fd1db931-034d-3de5-439a-d78be62a9517@arm.com>
Date: Wed, 10 Apr 2019 16:35:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190410152749.GA1460@ulmo>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 21/62] ts-kernel-build: disable
 host1x, which doesn't build
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410153514.xLpGD5e9XfBpLMr42GOTwVV557c5ZxiYjdbLSUstfCs@z>

SGksCgpPbiAxMC8wNC8yMDE5IDE2OjI3LCBUaGllcnJ5IFJlZGluZyB3cm90ZToKPiBPbiBXZWQs
IEFwciAxMCwgMjAxOSBhdCAwMzoyMzoyN1BNICswMTAwLCBJYW4gSmFja3NvbiB3cm90ZToKPj4g
RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4KPj4gRW1waXJpY2FsbHksIG9u
IHN0cmV0Y2ggYXJtaGY6Cj4+Cj4+ICAgIGRyaXZlcnMvZ3B1L2hvc3QxeC9jZG1hLmM6IEluIGZ1
bmN0aW9uIGBob3N0MXhfcHVzaGJ1ZmZlcl9pbml0JzoKPj4gICAgZHJpdmVycy9ncHUvaG9zdDF4
L2NkbWEuYzo5NDo0ODogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMyBvZiBgZG1hX2FsbG9jX3dj
JyBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBv
aW50ZXItdHlwZXNdCj4+ICAgICAgIHBiLT5tYXBwZWQgPSBkbWFfYWxsb2Nfd2MoaG9zdDF4LT5k
ZXYsIHNpemUsICZwYi0+cGh5cywKPj4gCQkJCQkJICBeCj4+IGV0Yy4KPiAKPiBUaGlzIHdhcyBm
aXhlZCBpbiB2NC4xOCBieSB0aGlzIGNvbW1pdDoKPiAKPiAJY29tbWl0IDJmOGE2ZGE4NjZlZmY3
NDZhOWY4Yzc3NDU3OTBmMzc2NWJhZWI1ODkKPiAJQXV0aG9yOiBFbWlsIEdvb2RlIDxlbWlsLmZz
d0Bnb29kZS5pbz4KPiAJRGF0ZTogICBXZWQgTWF5IDE2IDEyOjIyOjA0IDIwMTggKzAyMDAKPiAK
PiAJICAgIGdwdTogaG9zdDF4OiBGaXggY29tcGlsZXIgZXJyb3JzIGJ5IGNvbnZlcnRpbmcgdG8g
ZG1hX2FkZHJfdAo+IAo+IAkgICAgVGhlIGNvbXBpbGVyIGlzIGNvbXBsYWluaW5nIHdpdGggdGhl
IGZvbGxvd2luZyBlcnJvcnM6Cj4gCj4gCSAgICBkcml2ZXJzL2dwdS9ob3N0MXgvY2RtYS5jOjk0
OjQ4OiBlcnJvcjoKPiAJICAgICAgICAgICAgcGFzc2luZyBhcmd1bWVudCAzIG9mIOKAmGRtYV9h
bGxvY193Y+KAmSBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUKPiAJICAgICAgICAgICAg
Wy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCj4gCj4gCSAgICBkcml2ZXJzL2dw
dS9ob3N0MXgvY2RtYS5jOjExMzo0ODogZXJyb3I6Cj4gCSAgICAgICAgICAgIHBhc3NpbmcgYXJn
dW1lbnQgMyBvZiDigJhkbWFfYWxsb2Nfd2PigJkgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0
eXBlCj4gCSAgICAgICAgICAgIFstV2Vycm9yPWluY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+
IAo+IAkgICAgVGhlIGV4cGVjdGVkIHBvaW50ZXIgdHlwZSBvZiB0aGUgdGhpcmQgYXJndW1lbnQg
dG8gZG1hX2FsbG9jX3djKCkgaXMKPiAJICAgIGRtYV9hZGRyX3QgYnV0IHBoeXNfYWRkcl90IGlz
IHBhc3NlZC4KPiAKPiAJICAgIENoYW5nZSB0aGUgcGh5cyBtZW1iZXIgb2Ygc3RydWN0IHB1c2hf
YnVmZmVyIHRvIGJlIGRtYV9hZGRyX3Qgc28gdGhhdCB3ZQo+IAkgICAgcGFzcyB0aGUgY29ycmVj
dCB0eXBlIHRvIGRtYV9hbGxvY193YygpLgo+IAkgICAgQWxzbyBjaGVjayBwYi0+bWFwcGVkIGZv
ciBub24tTlVMTCBpbiB0aGUgZGVzdHJveSBmdW5jdGlvbiBhcyB0aGF0IGlzIHRoZQo+IAkgICAg
cmlnaHQgd2F5IG9mIGNoZWNraW5nIGlmIGRtYV9hbGxvY193YygpIHdhcyBzdWNjZXNzZnVsLgo+
IAo+IAkgICAgU2lnbmVkLW9mZi1ieTogRW1pbCBHb29kZSA8ZW1pbC5mc3dAZ29vZGUuaW8+Cj4g
CSAgICBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+
IAo+IEl0IHNob3VsZCBiZSBmYWlybHkgZWFzeSB0byBiYWNrcG9ydCB0aGlzIHRvIG9sZGVyIHJl
bGVhc2VzLCB0aG91Z2ggSSdtCj4gbm90IHN1cmUgZXhhY3RseSB3aGF0IG1hZGUgdGhpcyB0cmln
Z2VyLiBUaGlzIHdhc24ndCBjYXVzaW5nIGFueSBidWlsZAo+IGVycm9ycyBmb3IgYSB2ZXJ5IGxv
bmcgdGltZSwgc2luY2UgdGhpcyB0eXBlIG1pc21hdGNoIGhhcyBleGlzdGVkIGV2ZXIKPiBzaW5j
ZSB0aGUgZHJpdmVyIHdhcyBtZXJnZWQgYWxsIHRoZSB3YXkgYmFjayBpbiB2My4xMC4KCkxpa2Vs
eSBuby1vbmUgZXZlciB0cmllZCB0byBidWlsZCB0aGlzIG1vZHVsZSB3aXRoIENPTkZJR19YRU49
eS4gWGVuIHJlcXVpcmVzIApkbWFfYWRkcl90IHRvIGJlIDY0LWJpdCByZWdhcmRsZXNzIHRoZSBw
YWdlLXRhYmxlcyBmb3JtYXQgc2VsZWN0ZWQgKGUuZyBzaG9ydCB2cyAKTFBBRSkuCgpBRkFJSywg
dGhpcyBpcyB0aGUgb25seSBjYXNlIG9uIEFybTMyIHdoZXJlIHBoeXNfYWRkcl90IGFuZCBkbWFf
YWRkcl90IHdvdWxkIAptaXNtYXRjaGVkLgoKSWFuIGFyZSB3ZSB1c2luZyBhIGRpZmZlcmVudCBj
b25maWcgYmV0d2VlbiBKZXNzaWUgYW5kIFN0cmV0Y2g/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
