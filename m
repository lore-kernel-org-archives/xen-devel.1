Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4187C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9971020850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9971020850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEB3-0008HL-6h; Wed, 10 Apr 2019 14:26:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAc-00078x-Gk
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:46 +0000
X-Inumbo-ID: 866c19b0-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 866c19b0-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227745"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:52 +0100
Message-ID: <20190410142408.22848-47-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 46/62] Debian: set
 partman-lvm/device_remove_lvm_span
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142352.dK2jCIZYXT-2IMP6KUnv9k3wKzAmbg2NtI5dt0Xcgts@z>

V2ViIHNlYXJjaGluZ1sxXSBzdWdnZXN0cyB0aGF0IHRoaXMgc3VwcHJlc3NlcyB0aGlzIGVycm9y
OgoKICAhISBFUlJPUjogVW5hYmxlIHRvIGF1dG9tYXRpY2FsbHkgcmVtb3ZlIExWTSBkYXRhCiAg
QmVjYXVzZSB0aGUgdm9sdW1lIGdyb3VwKHMpIG9uIHRoZSBzZWxlY3RlZCBkZXZpY2UgYWxzbyBj
b25zaXN0IG9mCiAgcGh5c2ljYWwgdm9sdW1lcyBvbiBvdGhlciBkZXZpY2VzLCBpdCBpcyBub3Qg
Y29uc2lkZXJlZCBzYWZlIHRvCiAgcmVtb3ZlIGl0cyBMVk0gZGF0YSBhdXRvbWF0aWNhbGx5LiBJ
ZiB5b3Ugd2lzaCB0byB1c2UgdGhpcyBkZXZpY2UKICBmb3IgcGFydGl0aW9uaW5nLCBwbGVhc2Ug
cmVtb3ZlIGl0cyBMVk0gZGF0YSBmaXJzdC4KClsxXSBlZyBodHRwczovL3NlcnZlcmZhdWx0LmNv
bS9xdWVzdGlvbnMvNTcxMzYzL3VuYWJsZS10by1hdXRvbWF0aWNhbGx5LXJlbW92ZS1sdm0tZGF0
YQoKSXQgZG9lc24ndCwgdGhvdWdoLiAgSSBhbSBvbmx5IGV4cGVyaWVuY2luZyBpdCBub3cgYmVj
YXVzZSB0aGUgYWQtaG9jCmRpc2stZXJhc2luZyAoMjVlcmFzZS1vdGhlci1kaXNrcykgaXMgYnJv
a2VuIGZvciBvdGhlciByZWFzb25zLiAgQnV0CmxldCdzIGhhdmUgaXQgYW55d2F5IGFzIGl0IHNv
dW5kcyBsaWtlIGEgdGhpbmcgd2UgbWlnaHQgd2FudC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvRGViaWFuLnBtIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0
L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IDlkZWMzMjFmLi4wNzNiNzc2YyAx
MDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAg
LTkwNyw2ICs5MDcsNyBAQCBkLWkgcGFydG1hbi1wYXJ0aXRpb25pbmcvY29uZmlybV93cml0ZV9u
ZXdfbGFiZWwgYm9vbGVhbiB0cnVlCiBkLWkgcGFydG1hbi9jaG9vc2VfcGFydGl0aW9uIHNlbGVj
dCBmaW5pc2gKIGQtaSBwYXJ0bWFuL2NvbmZpcm0gYm9vbGVhbiB0cnVlCiBkLWkgcGFydG1hbi1s
dm0vY29uZmlybSBib29sZWFuIHRydWUKK2QtaSBwYXJ0bWFuLWx2bS9kZXZpY2VfcmVtb3ZlX2x2
bV9zcGFuIGJvb2xlYW4gdHJ1ZQogCiBkLWkgcGFydG1hbi9jb25maXJtX25vb3ZlcndyaXRlIHRy
dWUKIGQtaSBwYXJ0bWFuLWx2bS9jb25maXJtX25vb3ZlcndyaXRlIHRydWUKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
