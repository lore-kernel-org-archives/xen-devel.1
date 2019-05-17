Return-Path: <SRS0=3Sku=TR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE76C04AB4
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 10:39:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 072CF2087B
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 10:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 072CF2087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRaGr-0004JR-6c; Fri, 17 May 2019 10:39:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRaGq-0004JM-KG
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:39:24 +0000
X-Inumbo-ID: 08c205ce-7890-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 08c205ce-7890-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 10:39:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:39:22 -0600
Message-Id: <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:39:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v3 00/15] x86: IRQ management adjustments
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
Message-ID: <20190517103923.v67-aOXMoA630z2HNh-I5Kz6g_IfJZXuhKPx58eA4Y8@z>

Rmlyc3QgYW5kIGZvcmVtb3N0IHRoaXMgc2VyaWVzIGlzIHRyeWluZyB0byBkZWFsIHdpdGggQ1BV
IG9mZmxpbmluZwppc3N1ZXMsIHdoaWNoIGhhdmUgYmVjb21lIG1vcmUgcHJvbWluZW50IHdpdGgg
dGhlIHJlY2VudGx5CmFkZGVkIFNNVCBlbmFibGUvZGlzYWJsZSBvcGVyYXRpb24gaW4geGVuLWhw
dG9vbC4gTGF0ZXIgcGF0Y2hlcwppbiB0aGUgc2VyaWVzIHRoZW4gY2Fycnkgb3V0IG1vcmUgb3Ig
bGVzcyB1bnJlbGF0ZWQgY2hhbmdlcwooaG9wZWZ1bGx5IGltcHJvdmVtZW50cykgbm90aWNlZCB3
aGlsZSBsb29raW5nIGF0IHZhcmlvdXMgcGllY2VzCm9mIGludm9sdmVkIGNvZGUuCgowMTogZGVh
bCB3aXRoIG1vdmUtaW4tcHJvZ3Jlc3Mgc3RhdGUgaW4gZml4dXBfaXJxcygpCjAyOiBkZWFsIHdp
dGggbW92ZSBjbGVhbnVwIGNvdW50IHN0YXRlIGluIGZpeHVwX2lycXMoKQowMzogaW1wcm92ZSBk
dW1wX2lycXMoKQowNDogZGVzYy0+YWZmaW5pdHkgc2hvdWxkIHN0cmljdGx5IHJlcHJlc2VudCB0
aGUgcmVxdWVzdGVkIHZhbHVlCjA1OiBjb25zb2xpZGF0ZSB1c2Ugb2YgLT5hcmNoLmNwdV9tYXNr
CjA2OiBmaXggbG9ja2luZyBhcm91bmQgdmVjdG9yIG1hbmFnZW1lbnQKMDc6IHRhcmdldCBvbmxp
bmUgQ1BVcyB3aGVuIGJpbmRpbmcgZ3Vlc3QgSVJRCjA4OiBjb3JyZWN0L3RpZ2h0ZW4gdmVjdG9y
IGNoZWNrIGluIF9jbGVhcl9pcnFfdmVjdG9yKCkKMDk6IG1ha2UgZml4dXBfaXJxcygpIHNraXAg
dW5jb25uZWN0ZWQgaW50ZXJuYWxseSB1c2VkIGludGVycnVwdHMKMTA6IGRyb3AgcmVkdW5kYW50
IGNwdW1hc2tfZW1wdHkoKSBmcm9tIG1vdmVfbWFza2VkX2lycSgpCjExOiBzaW1wbGlmeSBhbmQg
cmVuYW1lIHBpcnFfYWNrdHlwZSgpCjEyOiBhZGQgZXhwbGljdCB0cmFjaW5nLWVuYWJsZWQgY2hl
Y2sgdG8gdHJhY2VfaXJxX21hc2soKQoxMzogdGlnaHRlbiB2ZWN0b3IgY2hlY2tzCjE0OiBlbGlt
aW5hdGUgc29tZSBvbi1zdGFjayBjcHVtYXNrX3QgaW5zdGFuY2VzCjE1OiBtb3ZlIHssX31jbGVh
cl9pcnFfdmVjdG9yKCkKCkluIHByaW5jaXBsZSBwYXRjaGVzIDEsIDIsIDQtNywgYW5kIG1heWJl
IDkgYXJlIGJhY2twb3J0aW5nIGNhbmRpZGF0ZXMuClRoZWlyIGludHJ1c2l2ZSBuYXR1cmUgbWFr
ZXMgd2FudGluZyB0byBkbyBzbyBxdWVzdGlvbmFibGUsIHRob3VnaC4KClRoaXMgKGluIHBhcnRp
Y3VsYXIgcGF0Y2ggMTQpIGRlcGVuZHMgb24gIltQQVRDSCAwLzRdIHg4NjogRU9JCnRpbWVyIGNv
cnJlY3Rpb25zIC8gaW1wcm92ZW1lbnRzIi4gRm9yIHYzIHNwZWNpZmljIGluZm9ybWF0aW9uCnBs
ZWFzZSBzZWUgdGhlIGluZGl2aWR1YWwgcGF0Y2hlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
