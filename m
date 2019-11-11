Return-Path: <SRS0=qr0R=ZD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06658C43331
	for <xen-devel@archiver.kernel.org>; Mon, 11 Nov 2019 14:33:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D08B6214E0
	for <xen-devel@archiver.kernel.org>; Mon, 11 Nov 2019 14:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D08B6214E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUAkL-00028M-Ax; Mon, 11 Nov 2019 14:32:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUAkK-00028B-Bs
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 14:32:48 +0000
X-Inumbo-ID: 2177e600-0490-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2177e600-0490-11ea-984a-bc764e2007e4;
 Mon, 11 Nov 2019 14:32:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DA89DACD8;
 Mon, 11 Nov 2019 14:32:46 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <d66b1da4-8096-9b77-1ca6-d6b9954b113c@suse.com>
Message-ID: <a5986837-01eb-7bf8-bf42-4d3084d6a1f5@suse.com>
Date: Mon, 11 Nov 2019 15:32:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d66b1da4-8096-9b77-1ca6-d6b9954b113c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/2] x86/Xen/32: simplify xen_iret_crit_fixup's
 ring check
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
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBjYW4gYmUgaGFkIHdpdGggdHdvIGluc3RlYWQgb2Ygc2l4IGluc25zLCBieSBqdXN0IGNo
ZWNraW5nIHRoZSBoaWdoCkNTLlJQTCBiaXQuCgpBbHNvIGFkanVzdCB0aGUgY29tbWVudCAtIHRo
ZXJlIHdvdWxkIGJlIG5vICNHUCBpbiB0aGUgbWVudGlvbmVkIGNhc2VzLAphcyB0aGVyZSdzIG5v
IHNlZ21lbnQgbGltaXQgdmlvbGF0aW9uIG9yIGFsaWtlLiBJbnN0ZWFkIHRoZXJlJ2QgYmUgI1BG
LApidXQgdGhhdCBvbmUgcmVwb3J0cyB0aGUgdGFyZ2V0IEVJUCBvZiBzYWlkIGJyYW5jaCwgbm90
IHRoZSBhZGRyZXNzIG9mCnRoZSBicmFuY2ggaW5zbiBpdHNlbGYuCgpTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpBbiBhbHRlcm5hdGl2ZSB3b3VsZCBi
ZSB0byBrZWVwIHVzaW5nIFNFR01FTlRfUlBMX01BU0ssIGJ1dCBmb2xsb3cgaXQKd2l0aCAianBl
Ii4KCi0tLSBhL2FyY2gveDg2L3hlbi94ZW4tYXNtXzMyLlMKKysrIGIvYXJjaC94ODYveGVuL3hl
bi1hc21fMzIuUwpAQCAtMTUzLDIyICsxNTMsMTUgQEAgaHlwZXJfaXJldDoKICAqIGl0J3Mgc3Rp
bGwgb24gc3RhY2spLCB3ZSBuZWVkIHRvIHJlc3RvcmUgaXRzIHZhbHVlIGhlcmUuCiAgKi8KIEVO
VFJZKHhlbl9pcmV0X2NyaXRfZml4dXApCi0JcHVzaGwgJWVjeAogCS8qCiAJICogUGFyYW5vaWE6
IE1ha2Ugc3VyZSB3ZSdyZSByZWFsbHkgY29taW5nIGZyb20ga2VybmVsIHNwYWNlLgogCSAqIE9u
ZSBjb3VsZCBpbWFnaW5lIGEgY2FzZSB3aGVyZSB1c2Vyc3BhY2UganVtcHMgaW50byB0aGUKIAkg
KiBjcml0aWNhbCByYW5nZSBhZGRyZXNzLCBidXQganVzdCBiZWZvcmUgdGhlIENQVSBkZWxpdmVy
cyBhCi0JICogR1AsIGl0IGRlY2lkZXMgdG8gZGVsaXZlciBhbiBpbnRlcnJ1cHQgaW5zdGVhZC4g
IFVubGlrZWx5PwotCSAqIERlZmluaXRlbHkuICBFYXN5IHRvIGF2b2lkPyAgWWVzLiAgVGhlIElu
dGVsIGRvY3VtZW50cwotCSAqIGV4cGxpY2l0bHkgc2F5IHRoYXQgdGhlIHJlcG9ydGVkIEVJUCBm
b3IgYSBiYWQganVtcCBpcyB0aGUKLQkgKiBqdW1wIGluc3RydWN0aW9uIGl0c2VsZiwgbm90IHRo
ZSBkZXN0aW5hdGlvbiwgYnV0IHNvbWUKLQkgKiB2aXJ0dWFsIGVudmlyb25tZW50cyBnZXQgdGhp
cyB3cm9uZy4KKwkgKiBQRiwgaXQgZGVjaWRlcyB0byBkZWxpdmVyIGFuIGludGVycnVwdCBpbnN0
ZWFkLiAgVW5saWtlbHk/CisJICogRGVmaW5pdGVseS4gIEVhc3kgdG8gYXZvaWQ/ICBZZXMuCiAJ
ICovCi0JbW92bCAzKjQoJWVzcCksICVlY3gJCS8qIG5lc3RlZCBDUyAqLwotCWFuZGwgJFNFR01F
TlRfUlBMX01BU0ssICVlY3gKLQljbXBsICRVU0VSX1JQTCwgJWVjeAotCXBvcGwgJWVjeAotCWpl
IDJmCisJdGVzdGIgJDIsIDIqNCglZXNwKQkJLyogbmVzdGVkIENTICovCisJam56IDJmCiAKIAkv
KgogCSAqIElmIGVpcCBpcyBiZWZvcmUgaXJldF9yZXN0b3JlX2VuZCB0aGVuIHN0YWNrCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
