Return-Path: <SRS0=31Bo=UK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA84C43218
	for <xen-devel@archiver.kernel.org>; Tue, 11 Jun 2019 10:20:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B95BB205F4
	for <xen-devel@archiver.kernel.org>; Tue, 11 Jun 2019 10:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B95BB205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hadsz-0003kE-1U; Tue, 11 Jun 2019 10:20:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hadsx-0003k7-DZ
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 10:20:11 +0000
X-Inumbo-ID: 7d34232c-8c32-11e9-b075-fb2a4a85b36d
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d34232c-8c32-11e9-b075-fb2a4a85b36d;
 Tue, 11 Jun 2019 10:20:09 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 04:20:08 -0600
Message-Id: <5CFF80500200007800236EFA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 04:20:00 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "xen-devel" <xen-devel@lists.xenproject.org>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B84F8020000780021F248@prv1-mh.provo.novell.com>
 <3ac4dbdd-24fb-a5e8-5848-93cfe4374a49@citrix.com>
In-Reply-To: <3ac4dbdd-24fb-a5e8-5848-93cfe4374a49@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 30/50] x86emul: support AVX512{F,
 _VBMI2} compress/expand insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA2LjE5IGF0IDE2OjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMDo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ICsjaWYgX19H
TlVDX18gPiA3IC8qIGNhbid0IGNoZWNrIGZvciBfX0FWWDUxMlZCTUkyX18gaGVyZSAqLwo+IAo+
IFdoeSBub3Q/CgpCZWNhdXNlIHRoYXQgd291bGQgcmVxdWlyZSBwYXNzaW5nIC1tYXZ4NTEydmJt
aTIgKG9yIGVuYWJsaW5nIHRoZQpmZWF0dXJlIHZpYSAjcHJhZ21hKSB3aGljaCBpbiB0dXJuIHdv
dWxkIG5lZWQgZ2F0aW5nIG9uIGNvbXBpbGVyCnZlcnNpb24sIG9yIGVsc2UgdGhlIGhhcm5lc3Mg
Y291bGRuJ3QgYmUgYnVpbHQgd2l0aCBnY2M3IGF0IGFsbCBhbnltb3JlLgoKPj4gLS0tIGEveGVu
L3Rvb2xzL2dlbi1jcHVpZC5weQo+PiArKysgYi94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5Cj4+IEBA
IC0yNjYsMTAgKzI2NiwxMCBAQCBkZWYgY3J1bmNoX251bWJlcnMoc3RhdGUpOgo+PiAgICAgICAg
ICAgICAgICAgICAgQVZYNTEyQlcsIEFWWDUxMlZMLCBBVlg1MTJfNFZOTklXLCBBVlg1MTJfNEZN
QVBTLAo+PiAgICAgICAgICAgICAgICAgICAgQVZYNTEyX1ZQT1BDTlREUV0sCj4+ICAKPj4gLSAg
ICAgICAgIyBBVlg1MTIgZXh0ZW5zaW9ucyBhY3Rpbmcgc29sZWx5IG9uIHZlY3RvcnMgb2YgYnl0
ZXMvd29yZHMgYXJlIG1hZGUKPj4gKyAgICAgICAgIyBBVlg1MTIgZXh0ZW5zaW9ucyBhY3Rpbmcg
KHNvbGVseSkgb24gdmVjdG9ycyBvZiBieXRlcy93b3JkcyBhcmUgbWFkZQoKQmVjYXVzZSBWQk1J
MiBkb2Vzbid0IGFjdCBfc29sZWx5XyBvbiB2ZWN0b3JzIG9mIGJ5dGVzL3dvcmRzLgpUaGVyZSBh
cmUgYWxzbyBzaGlmdCBpbnNucyBhY3Rpbmcgb24gdmVjdG9ycyBvZiBkd29yZHMvcXdvcmRzLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
