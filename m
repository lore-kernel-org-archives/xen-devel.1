Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75DFC282CE
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 09:27:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E29320880
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 09:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E29320880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDQYO-0007NN-BO; Mon, 08 Apr 2019 09:27:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDQYN-0007NI-6I
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 09:26:59 +0000
X-Inumbo-ID: 72ebf0d6-59e0-11e9-a4b0-8f431a2b61fa
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72ebf0d6-59e0-11e9-a4b0-8f431a2b61fa;
 Mon, 08 Apr 2019 09:26:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 08 Apr 2019 03:26:54 -0600
Message-Id: <5CAB13DA02000078002253F7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 08 Apr 2019 03:26:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>,
 "FionaLi-oc" <fionali-oc@zhaoxin.com>
References: <1554691246-7249-1-git-send-email-fionali-oc@zhaoxin.com>
 <31983788-e4e4-5526-04a1-660c00930d0d@suse.com>
In-Reply-To: <31983788-e4e4-5526-04a1-660c00930d0d@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] cpupool: fix ASSERT( c != old_pool )
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, cobechen@zhaoxin.com,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408092650.fEU49qNgMp8Pu8now9WGQ3MZC4mXgOxFkj0BUgR6hEM@z>

Pj4+IE9uIDA4LjA0LjE5IGF0IDA3OjA5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
OC8wNC8yMDE5IDA0OjQwLCBGaW9uYUxpLW9jIHdyb3RlOgo+PiBBc3NpZ25pbmcgY3B1IHRvIGNw
dXBvb2wgbmVlZG4ndCB0byBzd2l0Y2ggY3B1IHNjaGVkdWxlciB3aGVuCj4+IHN5c3RlbSBzdGF0
ZSBpcyByZXN1bWUsIG90aGVyd2lzZSBpdCB3aWxsIGNhdXNlIEFTU0VSVCBpbgo+PiBzY2hlZHVs
ZV9jcHVfc3dpdGNoKCkuCj4gCj4gSSBkb24ndCB0aGluayB0aGlzIHBhdGNoIGlzIG5lZWRlZCBv
biBjdXJyZW50IHN0YWdpbmcgdHJlZS4gQ29tbWl0Cj4gNjg3MGVhOWQxZmFkNmZiZTI3IGNoYW5n
ZWQgcmVzdW1lIGhhbmRsaW5nIGxlYWRpbmcgdG8KPiBjcHVwb29sX2Fzc2lnbl9jcHVfbG9ja2Vk
KCkgYmVpbmcgbm8gbG9uZ2VyIGNhbGxlZCB3aGVuIHJlc3VtaW5nLgoKQnV0IGlzIGl0IHNvbWV0
aGluZyB3b3J0aHdoaWxlIHRvIHB1dCBvbnRvIHN0YWJsZSB0cmVlcyAod2l0aCB0aGUKb25lIG1p
c3NpbmcgYmxhbmsgYWRkZWQpPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
