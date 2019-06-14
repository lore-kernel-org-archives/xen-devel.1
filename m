Return-Path: <SRS0=aUBB=UN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EB1C31E4B
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 15:34:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE382175B
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 15:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADE382175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hboD4-0006KH-CT; Fri, 14 Jun 2019 15:33:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hboD2-0006KB-Kb
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 15:33:44 +0000
X-Inumbo-ID: ca4bc13c-8eb9-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ca4bc13c-8eb9-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 15:33:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 14 Jun 2019 09:33:42 -0600
Message-Id: <5D03BE5102000078002385FE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 14 Jun 2019 09:33:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 0/4] x86 MCE adjustments for AMD / general
 per-CPU accessor cleanup
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWZ0ZXIgcGF0Y2ggMSwgd2hpY2ggcmVhbGx5IGlzIHRoZSBvbmUgSSB3YXMgYWZ0ZXIgaGVyZSwg
SSBkaWQgcmVhbGl6ZQp0aGF0IHRoZSBudW1iZXIgb2YgdXNlcyBvZiBfX2dldF9jcHVfdmFyKCkg
aGFkIHNocnVuayBlbm91Z2gKdGhhdCBpdCBzZWVtZWQgd29ydGh3aGlsZSB0byB0YWtlIHRoZSB0
aW1lIGFuZCBjb252ZXJ0IHRoZQpyZW1haW5pbmcgdXNlcywgc3VjaCB0aGF0IHRoZSBjb25zdHJ1
Y3QgY291bGQgZmluYWxseSBiZSBkcm9wcGVkLgoKMTogeDg2L21jaGVjazogYWxsb3cgdmFyeWlu
ZyBiYW5rIGNvdW50cyBwZXIgQ1BVCjI6IHg4Ni9tY2hlY2s6IHJlcGxhY2UgcmVtYWluaW5nIHVz
ZXMgb2YgX19nZXRfY3B1X3ZhcigpCjM6IHg4NjogcmVwbGFjZSByZW1haW5pbmcgdXNlcyBvZiBf
X2dldF9jcHVfdmFyKCkKNDogZHJvcCBfX2dldF9jcHVfdmFyKCkgYW5kIF9fZ2V0X2NwdV9wdHIo
KQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
