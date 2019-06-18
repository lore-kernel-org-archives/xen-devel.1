Return-Path: <SRS0=FpMx=UR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4757AC31E51
	for <xen-devel@archiver.kernel.org>; Tue, 18 Jun 2019 13:53:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B862084B
	for <xen-devel@archiver.kernel.org>; Tue, 18 Jun 2019 13:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B862084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdEXw-0008Sk-N6; Tue, 18 Jun 2019 13:53:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdEXv-0008Sb-1J
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 13:53:11 +0000
X-Inumbo-ID: 67764775-91d0-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 67764775-91d0-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 13:53:09 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 07:53:08 -0600
Message-Id: <5D08ECBF02000078002394C6@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 07:53:03 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH for-4.11 0/2] XSA-295 backport adjustments
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WFNNIHdhcyBicm9rZW4gKHBhdGNoIDEpIGFuZCB0aGUgcmVtb3ZhbCBvZiBhcmNoX2V2dGNobl9p
bmplY3QoKSB3YXMKb25seSBwYXJ0aWFsbHkgZG9uZSAocGF0Y2ggMikuCgoxOiBYU006IGFkanVz
dCBLY29uZmlnIG5hbWVzCjI6IHg4NjogZHJvcCBhcmNoX2V2dGNobl9pbmplY3QoKQoKSSdtIG5v
dCBnb2luZyB0byB3YWl0IGZvciBhbnkgYWNrczsgaW4gY2FzZSBvZiBpc3N1ZXMgZnVydGhlciBp
bmNyZW1lbnRhbApmaXh1cHMgd2lsbCBuZWVkIHRvIGRvLgoKVGhlc2UgYWRqdXN0bWVudHMgd2ls
bCBhbHNvIGJlIG5lZWRlZCBvbiBvbGRlciBicmFuY2hlcywgYnV0IEknZCBmaXJzdApsaWtlIHRv
IHNlZSBob3cgNC4xMSBnb2VzIChub3QgdGhlIGxlYXN0IHRvIGdldCA0LjExLjIgb3V0IHRoZSBk
b29yCl9maW5hbGx5XykuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
