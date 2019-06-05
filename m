Return-Path: <SRS0=O62z=UE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50737C28CC5
	for <xen-devel@archiver.kernel.org>; Wed,  5 Jun 2019 13:02:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC2920684
	for <xen-devel@archiver.kernel.org>; Wed,  5 Jun 2019 13:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC2920684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYVYk-0004xh-1G; Wed, 05 Jun 2019 13:02:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYVYi-0004xY-LQ
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 13:02:28 +0000
X-Inumbo-ID: 2a6bbe10-8792-11e9-9b44-277ac3180a88
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a6bbe10-8792-11e9-9b44-277ac3180a88;
 Wed, 05 Jun 2019 13:02:26 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 07:02:25 -0600
Message-Id: <5CF7BD5F0200007800235875@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 07:02:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1559677885-10731-1-git-send-email-andrew.cooper3@citrix.com>
 <1559677885-10731-3-git-send-email-andrew.cooper3@citrix.com>
 <5CF790890200007800235696@prv1-mh.provo.novell.com>
 <82bd675c-c7f8-5ead-f328-bca96bc3976f@citrix.com>
In-Reply-To: <82bd675c-c7f8-5ead-f328-bca96bc3976f@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2] tools/fuzz: Add a cpu-policy fuzzing
 harness
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA2LjE5IGF0IDEzOjMxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMDYvMjAxOSAxMDo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA0
LjA2LjE5IGF0IDIxOjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBU
aGVyZSBpcyBub3cgZW5vdWdoIGNvbXBsZXhpdHkgdGhhdCBhIGZ1enppbmcgaGFybmVzcyBpcyBh
IGdvb2QgaWRlYSwgYW5kCj4+PiBlbm91Z2ggc3VwcG9ydGluZyBsb2dpYyB0byBpbXBsZW1lbnQg
b25lIHdoaWNoIEFGTCBzZWVtcyBoYXBweSB3aXRoLgo+Pj4KPj4+IFRha2UgdGhlIGV4aXN0aW5n
IHJlY2FsY3VsYXRlX3N5bnRoKCkgaGVscGVyIGFuZCBleHBvcnQgaXQgYXMKPj4+IHg4Nl9jcHVp
ZF9wb2xpY3lfcmVjYWxjX3N5bnRoKCksIGFzIGl0IGlzIG5lZWRlZCBieSB0aGUgZnV6emluZyBo
YXJuZXNzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4+PiAtLS0KPj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+Cj4+PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPj4+IENDOiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+IENDOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXku
ZHlhc2xpQGNpdHJpeC5jb20+Cj4+PiAtLS0KPj4+ICB0b29scy9mdXp6L2NwdS1wb2xpY3kvLmdp
dGlnbm9yZSAgICAgICAgICB8ICAgMSArCj4+PiAgdG9vbHMvZnV6ei9jcHUtcG9saWN5L01ha2Vm
aWxlICAgICAgICAgICAgfCAgMjggKysrKysKPj4+ICB0b29scy9mdXp6L2NwdS1wb2xpY3kvYWZs
LXBvbGljeS1mdXp6ZXIuYyB8IDE4NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4g
RG9lcyB0aGlzIHdhbnQgdG8gYmUgYWNjb21wYW5pZWQgYnkgYSAuL01BSU5UQUlORVJTIHVwZGF0
ZQo+PiB0byB0aGUgWDg2IHNlY3Rpb24/Cj4gCj4gT29wcyB5ZXMsIGFuZCBzaW1pbGFybHkgZm9y
IHRvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvCj4gCj4gRG8geW91IG1pbmQgaWYgSSBmb2xkIHRoYXQg
Y2hhbmdlIGluIGFzIHdlbGw/CgpGZWVsIGZyZWUuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
