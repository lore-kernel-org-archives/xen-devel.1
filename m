Return-Path: <SRS0=jkfT=TI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741ABC04A6B
	for <xen-devel@archiver.kernel.org>; Wed,  8 May 2019 12:47:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CFF420989
	for <xen-devel@archiver.kernel.org>; Wed,  8 May 2019 12:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CFF420989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOLz0-0004HY-A7; Wed, 08 May 2019 12:47:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOLyy-0004HL-IL
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 12:47:36 +0000
X-Inumbo-ID: 7426ef9b-718f-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7426ef9b-718f-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 12:47:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 06:47:35 -0600
Message-Id: <5CD2CFE6020000780022CCC9@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 06:47:34 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
In-Reply-To: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 3/4] x86/IRQ: relax locking in
 irq_guest_eoi_timer_fn()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190508124734.Xd2yXHyJDs_SieiUkQhLV9au7IMTDvi2bQifl3_2yTU@z>

VGhpcyBpcyBhIHRpbWVyIGhhbmRsZXIsIHNvIGl0IGdldHMgZW50ZXJlZCB3aXRoIElSUXMgZW5h
YmxlZC4gVGhlcmVmb3JlCnRoZXJlJ3Mgbm8gbmVlZCB0byBzYXZlL3Jlc3RvcmUgdGhlIElSUSBt
YXNraW5nIGZsYWcuCgpBZGRpdGlvbmFsbHkgdGhlIGZpbmFsIHN3aXRjaCgpJ2VzIEFDS1RZUEVf
RU9JIGNhc2UgcmUtYWNxdWlyZXMgdGhlIGxvY2sKanVzdCBmb3IgaXQgdG8gYmUgZHJvcHBlZCBh
Z2FpbiByaWdodCBhd2F5LiBEbyBhd2F5IHdpdGggdGhpcy4KClNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYworKysg
Yi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTExMDYsOSArMTEwNiw4IEBAIHN0YXRpYyB2b2lkIGly
cV9ndWVzdF9lb2lfdGltZXJfZm4odm9pZAogICAgIHVuc2lnbmVkIGludCBpcnEgPSBkZXNjIC0g
aXJxX2Rlc2M7CiAgICAgaXJxX2d1ZXN0X2FjdGlvbl90ICphY3Rpb247CiAgICAgY3B1bWFza190
IGNwdV9lb2lfbWFwOwotICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKLSAgICBzcGluX2xvY2tf
aXJxc2F2ZSgmZGVzYy0+bG9jaywgZmxhZ3MpOworICAgIHNwaW5fbG9ja19pcnEoJmRlc2MtPmxv
Y2spOwogICAgIAogICAgIGlmICggIShkZXNjLT5zdGF0dXMgJiBJUlFfR1VFU1QpICkKICAgICAg
ICAgZ290byBvdXQ7CkBAIC0xMTQ1LDEyICsxMTQ0LDExIEBAIHN0YXRpYyB2b2lkIGlycV9ndWVz
dF9lb2lfdGltZXJfZm4odm9pZAogICAgICAgICBjcHVtYXNrX2NvcHkoJmNwdV9lb2lfbWFwLCBh
Y3Rpb24tPmNwdV9lb2lfbWFwKTsKICAgICAgICAgc3Bpbl91bmxvY2tfaXJxKCZkZXNjLT5sb2Nr
KTsKICAgICAgICAgb25fc2VsZWN0ZWRfY3B1cygmY3B1X2VvaV9tYXAsIHNldF9lb2lfcmVhZHks
IGRlc2MsIDApOwotICAgICAgICBzcGluX2xvY2tfaXJxKCZkZXNjLT5sb2NrKTsKLSAgICAgICAg
YnJlYWs7CisgICAgICAgIHJldHVybjsKICAgICB9CiAKICBvdXQ6Ci0gICAgc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmZGVzYy0+bG9jaywgZmxhZ3MpOworICAgIHNwaW5fdW5sb2NrX2lycSgmZGVz
Yy0+bG9jayk7CiB9CiAKIHN0YXRpYyB2b2lkIF9fZG9fSVJRX2d1ZXN0KGludCBpcnEpCgoKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
