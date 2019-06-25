Return-Path: <SRS0=P3Gq=UY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E27C48BD5
	for <xen-devel@archiver.kernel.org>; Tue, 25 Jun 2019 15:51:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32439208E3
	for <xen-devel@archiver.kernel.org>; Tue, 25 Jun 2019 15:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32439208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfnj1-0000eZ-Po; Tue, 25 Jun 2019 15:51:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hfnj0-0000eL-PX
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 15:51:14 +0000
X-Inumbo-ID: 0f05c780-9761-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0f05c780-9761-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 15:51:13 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 25 Jun 2019 09:51:12 -0600
Message-Id: <5D1242E9020000780023B0A1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 25 Jun 2019 09:51:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190625144350.6176-1-andrew.cooper3@citrix.com>
 <20190625144350.6176-4-andrew.cooper3@citrix.com>
In-Reply-To: <20190625144350.6176-4-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/3] page-alloc: Clamp get_free_buddy() to
 online nodes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI1LjA2LjE5IGF0IDE2OjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gZC0+bm9kZV9hZmZpbml0eSBkZWZhdWx0cyB0byBOT0RFX01BU0tfQUxMIHdoaWNoIGhh
cyBiaXRzIHNldCBvdXRzaWRlIG9mCj4gbm9kZV9vbmxpbmVfbWFwLiAgVGhpcyBpbiB0dXJuIGNh
dXNlcyB0aGUgbG9vcCBpbiBnZXRfZnJlZV9idWRkeSgpIHRvIHdhc3RlCj4gZWZmb3J0IGl0ZXJh
dGluZyBvdmVyIG9mZmxpbmUgbm9kZXMuCj4gCj4gQWx3YXlzIGNsYW1wIGQtPm5vZGVfYWZmaW5p
dHkgdG8gbm9kZV9vbmxpbmVfbWFwIHdoZW4gaW4gdXNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpkZXNwaXRlIC4uLgoKPiAtLS0gYS94ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuYwo+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gQEAgLTgx
MSwxMSArODExLDE1IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfZnJlZV9idWRkeSh1
bnNpZ25lZCBpbnQgem9uZV9sbywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCj4gIHsKPiAgICAgIG5vZGVpZF90IGZpcnN0
LCBub2RlID0gTUVNRl9nZXRfbm9kZShtZW1mbGFncyksIHJlcV9ub2RlID0gbm9kZTsKPiAtICAg
IG5vZGVtYXNrX3Qgbm9kZW1hc2sgPSBkID8gZC0+bm9kZV9hZmZpbml0eSA6IG5vZGVfb25saW5l
X21hcDsKPiArICAgIG5vZGVtYXNrX3Qgbm9kZW1hc2s7Cj4gICAgICB1bnNpZ25lZCBpbnQgaiwg
em9uZSwgbm9kZW1hc2tfcmV0cnkgPSAwOwo+ICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7Cj4g
ICAgICBib29sIHVzZV91bnNjcnViYmVkID0gKG1lbWZsYWdzICYgTUVNRl9ub19zY3J1Yik7Cj4g
IAo+ICsgICAgLyogQ2xhbXAgbm9kZW1hc2sgdG8gbm9kZV9vbmxpbmVfbWFwIGFuZCBvcHRpb25h
bGx5IGQtPm5vZGVfYWZmaW5pdHkuICovCj4gKyAgICBub2Rlc19hbmQoJm5vZGVtYXNrLCAmbm9k
ZV9vbmxpbmVfbWFwLAo+ICsgICAgICAgICAgICAgIGQgPyAmZC0+bm9kZV9hZmZpbml0eSA6ICZu
b2RlX29ubGluZV9tYXApOwoKLi4uIGZpbmRpbmcgaXQgYSBsaXR0bGUgb2RkIChpbmVmZmljaWVu
dCkgdG8gQU5EIG5vZGVfb25saW5lX21hcCB3aXRoIGl0c2VsZi4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
