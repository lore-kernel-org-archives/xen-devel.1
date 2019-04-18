Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AF3C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 13:22:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A99F217D7
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 13:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A99F217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH6zE-0002OL-M0; Thu, 18 Apr 2019 13:21:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH6zD-0002OB-5Q
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 13:21:55 +0000
X-Inumbo-ID: ed4cca0b-61dc-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ed4cca0b-61dc-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 13:21:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83888485"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23736.31208.463641.725834@mariner.uk.xensource.com>
Date: Thu, 18 Apr 2019 14:21:44 +0100
To: Wei Liu <wei.liu2@citrix.com>
In-Reply-To: <20190418123159.GD30543@zion.uk.xensource.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] Xen project CI systems and committer workflow
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Committers <committers@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418132144.c50l75P43V4aEFA0JsuV0S9XXuecVDObafaCV3tFB_Y@z>

VGhpcyBhbGwgc291bmRzIGdvb2QuCgpXZWkgTGl1IHdyaXRlcyAoIlhlbiBwcm9qZWN0IENJIHN5
c3RlbXMgYW5kIGNvbW1pdHRlciB3b3JrZmxvdyIpOgo+ICMjIEdhcHMKPiAKPiBUaGUgY29tcG9u
ZW50IC8gc3lzdGVtIHdoaWNoIG1lcmdlcyB0cmVlcyBhbmQgZHJpdmVzIENJIHN5c3RlbXMgaXMg
bWlzc2luZy4KPiAKPiBQYXRjaGV3IGFuZCBQYXRjaHdvcmsgZG9uJ3QgZG8gYWxsIHRoZSB0aGlu
Z3Mgd2UgY2FyZSBhYm91dCB5ZXQuCgpXZSBuZWVkIHRvIGRlY2lkZSBob3cgdGhlIHBsdW1iaW5n
IHNob3VsZCBiZSBhcnJhbmdlZC4KCj4gIyMgQ29uY2VybnMKPiAKPiBGb3IgaW5kaXZpZHVhbCBj
b21taXR0ZXJzLCB0dXJuYXJvdW5kIHRpbWUgbWF5IGJlY29tZSBsb25nZXIgc2luY2UKPiB5b3Ug
bmVlZCB0byB3YWl0IGZvciBvdGhlciB0cmVlcyB0byBiZSBwcm9jZXNzZWQuCgpUaGlzIHdpbGwg
cHJvYmFibHkgYmUgd29ydGggaXQuCgpBIHByb2JsZW0gd2UgaWRlbnRpZmllZCBpbiBJUkwgZGlz
Y3Vzc2lvbiBpcyB0aGF0IGN1cnJlbnRseSB3ZSByZWx5CnJhdGhlciB0b28gbXVjaCBvbiBvc3N0
ZXN0IHJldGVzdGluZyB0aGUgc2FtZSB0cmVlLCBiZWNhdXNlIG9mCmhlaXNlbmJ1Z3MuICBXaXRo
IHRoZSBuZXcgc2NoZW1lIGl0IHdvdWxkIHNwZW5kIG1vcmUgb2YgaXRzIHRpbWUKdGVzdGluZyB0
aGluZ3Mgd2hpY2ggd291bGQgbmV2ZXIgYmUgcmV0ZXN0ZWQuICBTbyBJIHRoaW5rIGluIHlvdXIK
YGdhcHMnIHdlIG5lZWQgdGhpczoKCiAgb3NzdGVzdCBmYWNpbGl0eSB0byBhdXRvbWF0aWNhbGx5
IHJldHJ5IGZhaWxpbmcgdGVzdHMKCihUaGlzIGZlZWxzIGxpa2UgYWRtaXR0aW5nIGRlZmVhdCBi
dXQgSSBoYXZlIG9jY2FzaW9uYWxseSBoYWQgYQpjYW1wYWlnbiBvZiB0cnlpbmcgdG8gc3F1YXNo
IGhlaXNlbmJ1Z3MgYW5kIGl0IGlzICpyZWFsbHkgaGFyZCB3b3JrKi4KSSBkb3VidCB3ZSBjYW4g
Z2V0IHJpZCBvZiB0aGVtIGNvbXBsZXRlbHkuKQoKPiBHaXRsYWIgQ0kgZG9lc24ndCBoYXZlIGEg
c2VsZiBwdXNoZ2F0ZS4gSWYgaXQgaXMgYnJva2VuIGJ5IGFjY2lkZW50IE9zc3Rlc3QKPiB3aWxs
IGJlIGJsb2NrZWQuCgpDb3VsZCB3ZSBwbGFuIHNvbWUga2luZCBvZiBwcm9jZWR1cmFsIG9yIHJv
Ym90aWMgd29ya2Fyb3VuZCA/CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
