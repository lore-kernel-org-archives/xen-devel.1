Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0192C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:31:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D1C212F5
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0D1C212F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJeSx-0007Qi-J5; Thu, 25 Apr 2019 13:31:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJeSw-0007Qc-Ih
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:31:06 +0000
X-Inumbo-ID: 603ca92d-675e-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 603ca92d-675e-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 13:31:05 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 07:31:04 -0600
Message-Id: <5CC1B6930200007800229160@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 07:30:59 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Igor Druzhinin" <igor.druzhinin@citrix.com>
References: <1556019478-10835-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1556019478-10835-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/mtrr: recalculate P2M type for domains
 with iocaps
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425133059.cqDO-gApBjp1-ATHWpdELxQ5w0rkuuEwppj2nxNWpfg@z>

Pj4+IE9uIDIzLjA0LjE5IGF0IDEzOjM3LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBjaGFuZ2UgcmVmbGVjdHMgdGhlIGxvZ2ljIGluIGVwdGVfZ2V0X2VudHJ5X2Vt
dCgpIGFuZCBhbGxvd3MKPiBjaGFuZ2VzIGluIGd1ZXN0IE1UVFJzIHRvIGJlIHJlZmxlY3RlZCBp
biBFUFQgZm9yIGRvbWFpbnMgaGF2aW5nCj4gZGlyZWN0IGFjY2VzcyB0byBjZXJ0YWluIGhhcmR3
YXJlIG1lbW9yeSByZWdpb25zIGJ1dCB3aXRob3V0IElPTU1VCj4gY29udGV4dCBhc3NpZ25lZCAo
ZS5nLiBYZW5HVCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1
emhpbmluQGNpdHJpeC5jb20+CgpGdW5kYW1lbnRhbGx5IEknbSBoYXBweSB0byBnZXQgYm90aCBp
biBzeW5jLCBzbwpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
QnV0IEkgaGF2ZSBhIHF1ZXN0aW9uOgoKPiAgdm9pZCBtZW1vcnlfdHlwZV9jaGFuZ2VkKHN0cnVj
dCBkb21haW4gKmQpCj4gIHsKPiAtICAgIGlmICggaGFzX2lvbW11X3B0KGQpICYmIGQtPnZjcHUg
JiYgZC0+dmNwdVswXSApCj4gKyAgICBpZiAoIChoYXNfaW9tbXVfcHQoZCkgfHwgY2FjaGVfZmx1
c2hfcGVybWl0dGVkKGQpKSAmJiBkLT52Y3B1ICYmIGQtPnZjcHVbMF0gKQo+ICAgICAgewo+ICAg
ICAgICAgIHAybV9tZW1vcnlfdHlwZV9jaGFuZ2VkKGQpOwo+ICAgICAgICAgIGZsdXNoX2FsbChG
TFVTSF9DQUNIRSk7CgpXb3VsZG4ndCBjYWNoZV9mbHVzaF9wZXJtaXR0ZWQoKSBhbG9uZSBzdWZm
aWNlLCBib3RoIGhlcmUgYW5kCnRoZXJlPyBFdmVuIGlmIGFueW9uZSB3YXMgdG8gcGFzcy10aHJv
dWdoIGEgZGV2aWNlIHdpdGhvdXQgYW55Ck1NSU8gb3IgSS9PIHBvcnQgQkFSLCB0aGUgbWVtb3J5
IHR5cGUgKHdoaWNoIGlzIGEgQ1BVIHNpZGUKdGhpbmcgb25seSwgaS5lLiBkb2Vzbid0IGFmZmVj
dCBETUEgYnkgdGhlIGRldmljZSkgc2hvdWxkbid0Cm1hdHRlciBpbiB0aGF0IGNhc2UgKGxlYXZp
bmcgYXNpZGUgdGhlIGZhY3QgdGhhdCBhIEJBUi1sZXNzCmRldmljZSBpcyB1bmxpa2VseSB0byBi
ZSBETUEtY2FwYWJsZSwgdW5sZXNzIHRoZSBwcm9ncmFtbWluZwpvZiB0aGUgRE1BIG9wZXJhdGlv
bnMgd2FzIHRvIGhhcHBlbiB0aHJvdWdoIHZlbmRvciBzcGVjaWZpYwpjb25maWcgc3BhY2UgYWNj
ZXNzZXMpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
