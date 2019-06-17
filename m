Return-Path: <SRS0=yLx4=UQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB21EC31E50
	for <xen-devel@archiver.kernel.org>; Mon, 17 Jun 2019 13:55:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A90D32080C
	for <xen-devel@archiver.kernel.org>; Mon, 17 Jun 2019 13:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A90D32080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcs6J-0007LH-CK; Mon, 17 Jun 2019 13:55:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hcs6H-0007LC-Np
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 13:55:09 +0000
X-Inumbo-ID: 82dc6288-9107-11e9-bc97-9f1961932b53
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82dc6288-9107-11e9-bc97-9f1961932b53;
 Mon, 17 Jun 2019 13:55:06 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 07:55:05 -0600
Message-Id: <5D079BB50200007800238D2B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 07:55:01 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1560776079-9866-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1560776079-9866-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/svm: Fix svm_vmcb_dump() when used in
 current context
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
Cc: WeiLiu <wl@xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA2LjE5IGF0IDE0OjU0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVk1FeGl0IGRvZXNuJ3Qgc3dpdGNoIGFsbCBzdGF0ZS4gIFRoZSBGUy9HUy9UUy9MRFRS
L0dTQkFTRSBzZWdtZW50Cj4gaW5mb3JtYXRpb24sIGFuZCBTWVNDQUxML1NZU0VOVEVSIE1TUnMg
bWF5IHN0aWxsIGJlIGNhY2hlZCBpbiBoYXJkd2FyZSwgcmF0aGVyCj4gdGhhbiB1cC10by1kYXRl
IGluIHRoZSBWTUNCLgo+IAo+IEV4cG9ydCBzdm1fc3luY192bWNiKCkgdmlhIHN2bWRlYnVnLmgg
c28gc3ZtX3ZtY2JfZHVtcCgpIGNhbiB1c2UgaXQsIGFuZCBicmluZwo+IHRoZSBWTUNCIGludG8g
c3luYyBpbiBjdXJyZW50IGNvbnRleHQuCj4gCj4gQXMgYSBtaW5vciBvcHRpbWlzYXRpb24sIHN3
aXRjaCBzdm1fc3luY192bWNiKCkgdG8gdXNlIHN2bV92bXtsb2FkLHNhdmV9X3BhKCksCj4gYXMg
c3ZtLT52bWNiX3BhIGlzIGFsd2F5cyBpbiBjb3JyZWN0LCBhbmQgdGhpcyBhdm9pZHMgYSByZWR1
bmRhbnQgX19wYSgpCgpJcyB0aGUgImluIiBoZXJlIGEgbGVmdG92ZXIgZnJvbSBzb21lIGVhcmxp
ZXIsIGRpZmZlcmVudCB3b3JkaW5nPwoKPiB0cmFuc2xhdGlvbiBiZWhpbmQgdGhlIHNjZW5lcy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCk9ubHkg
YXMgYSByZW1hcms6IFRoaXMgcmVtb3ZlcyB0aGUgbGFzdCB1c2Ugb2Ygc3ZtX3ZtbG9hZCgpLCBi
dXQKcGVyaGFwcyBpdCBhbmQgc3ZtX3Ztc2F2ZSgpIHdvdWxkIGJldHRlciBiZSBkcm9wcGVkIHRv
Z2V0aGVyLApvbmNlIHRoZSBvbmUgcmVtYWluaW5nIHVzZSBvZiB0aGUgbGF0dGVyIGhhcyBhbHNv
IGRpc2FwcGVhcmVkCihhc3N1bWluZyB0aGF0J3MgZG9hYmxlKS4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
