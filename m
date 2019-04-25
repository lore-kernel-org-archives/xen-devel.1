Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EA5C282E3
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:55:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4779A20678
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4779A20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJdcz-0001oz-7R; Thu, 25 Apr 2019 12:37:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJdcx-0001ot-TL
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:37:23 +0000
X-Inumbo-ID: df1aa379-6756-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id df1aa379-6756-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 12:37:22 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 06:37:21 -0600
Message-Id: <5CC1A9FD02000078002290A8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 06:37:17 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <ian.jackson@citrix.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
 <5b7cd86e-e664-d5f1-9262-f7671dc3395a@citrix.com>
 <23736.33638.713410.602994@mariner.uk.xensource.com>
In-Reply-To: <23736.33638.713410.602994@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] Xen project CI systems and committer workflow
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, committers@xenproject.org,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425123717.ga1Hx9jaBZ5Jus7QLI3M3Ug-XYv2RRjf96mDXHwXMaY@z>

Pj4+IE9uIDE4LjA0LjE5IGF0IDE2OjAyLCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gQW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogWGVuIHByb2plY3QgQ0kgc3lzdGVtcyBhbmQg
Y29tbWl0dGVyIHdvcmtmbG93Iik6Cj4+IFdoaWxlIGV2ZXJ5dGhpbmcgcHJlc2VudGVkIGhlcmUg
aXMgZmluZSB0byBkbyBhcyBhIG1hdHRlciBvZiBwb2xpY3ksIHRoZQo+PiBjb21taXR0ZXJzIHN0
aWxsIG5lZWQgdG8gcmV0YWluIHRoZSBhYmlsaXR5IHRvIGFjdHVhbGx5IHB1c2ggZGlyZWN0bHkg
dG8KPj4gdGhlIHN0YWdpbmcgYnJhbmNoZXMgb24geGVuLmdpdAo+IAo+IFdoeSA/Cj4gCj4gSW4g
cGFydGljdWxhciwgdGhpcyBzZWVtcyB0byBwcmVzdXBwb3NlIHRoYXQgdGhlc2UgInN0YWdpbmci
IGJyYW5jaGVzCj4gY29udGludWUgdG8gZXhpc3QuCj4gCj4gT25lIG9mIG91ciBzdHJhbmdlIHBy
YWN0aWNlcyBpcyB0aGF0IHdlIHB1c2ggdGhpbmdzIHRvIGEgbm9uLXJld2luZGluZwo+IGJyYW5j
aCBiZWZvcmUgdGhleSBoYXZlIGJlZW4gdGVzdGVkLiAgTm93LCBPSywgd2UgaGF2ZSBiZWVuIGRv
aW5nIHRoYXQKPiBmb3Igb3ZlciBhIGRlY2FkZSAtIHNpbmNlIGJlZm9yZSBwZW9wbGUgcmVhbGx5
IGludmVudGVkIHRoZSBtb2Rlcm4KPiBjb25jZXB0IG9mICJDSSIgLSBidXQgdGhhdCBkb2Vzbid0
IG1ha2UgaXQgc2Vuc2libGUuCgpOb3cgdGhlIHF1ZXN0aW9uIG9mIGNvdXJzZSBpcyAtIHdoeSBk
byB5b3UgY29uc2lkZXIgdGhpcyBwcmFjdGljZQoic3RyYW5nZSI/IEFuZCB3aGF0IGRvIHlvdSBt
ZWFuIGJ5ICJiZWZvcmUgdGhleSBoYXZlIGJlZW4KdGVzdGVkIj8gQW55IHN1Ym1pdHRlciBzaG91
bGQgaGF2ZSB0ZXN0ZWQgdGhlaXIgcGF0Y2hlcy4gWWVzLCBub3QKZXZlcnlvbmUgdGVzdHMgYWxs
IHBvc3NpYmxlIChiYXNpYykgY29uZmlndXJhdGlvbnMsIGJ1dCB3ZSBzcG90CnN1Y2ggaXNzdWVz
IGluIHJldmlldyBtb3JlIG9mdGVuIHRoYW4gdGhleSBzbGlwIHRocm91Z2gsIEkgdGhpbmsuCkFu
ZCBJIGRvbid0IGV4cGVjdCBDSSB3aWxsIGNvbWUgYW55d2hlcmUgbmVhciB0ZXN0aW5nIGFsbApf
cG9zc2libGVfIGNvbmZpZ3VyYXRpb25zLCBpLmUuIHRoZSByaXNrIG9mIHN1YnRsZSBicmVha2Fn
ZSB3b24ndApnZXQgZWxpbWluYXRlZCBhbHRvZ2V0aGVyIGFueXdheS4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
