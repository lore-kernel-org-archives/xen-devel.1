Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB46C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 15:56:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 859A621473
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 15:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 859A621473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDWck-0003Sr-Dj; Mon, 08 Apr 2019 15:55:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDWcj-0003Sm-Cf
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 15:55:53 +0000
X-Inumbo-ID: c8f39ca6-5a16-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c8f39ca6-5a16-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 15:55:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 08 Apr 2019 09:55:51 -0600
Message-Id: <5CAB6F0302000078002257C1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 08 Apr 2019 09:55:47 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-14-wei.liu2@citrix.com>
In-Reply-To: <20190207164456.9260-14-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC 13/55] x86/mm: rewrite virt_to_xen_l3e
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408155547.LmhbV7G-7kToNpNKtsNW43FTr-uVOVBPFxsOwf6yB5k@z>

Pj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QEAgLTQ3NjksNDUgKzQ3NjksNzAgQEAgdm9pZCBmcmVlX3hlbl9wYWdldGFibGVfbmV3KG1mbl90
IG1mbikKPiAgCj4gIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0sobWFwX3BnZGlyX2xvY2spOwo+ICAK
PiArLyoKPiArICogR2l2ZW4gYSB2aXJ0dWFsIGFkZHJlc3MsIHJldHVybiBhIHBvaW50ZXIgdG8g
eGVuJ3MgTDMgZW50cnkuIENhbGxlcgo+ICsgKiBuZWVkcyB0byB1bm1hcCB0aGUgcG9pbnRlci4K
PiArICovCj4gIHN0YXRpYyBsM19wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wzZSh1bnNpZ25lZCBs
b25nIHYpCj4gIHsKPiAgICAgIGw0X3BnZW50cnlfdCAqcGw0ZTsKPiArICAgIGwzX3BnZW50cnlf
dCAqcGwzZSA9IE5VTEw7Cj4gIAo+ICAgICAgcGw0ZSA9ICZpZGxlX3BnX3RhYmxlW2w0X3RhYmxl
X29mZnNldCh2KV07Cj4gICAgICBpZiAoICEobDRlX2dldF9mbGFncygqcGw0ZSkgJiBfUEFHRV9Q
UkVTRU5UKSApCj4gICAgICB7Cj4gICAgICAgICAgYm9vbCBsb2NraW5nID0gc3lzdGVtX3N0YXRl
ID4gU1lTX1NUQVRFX2Jvb3Q7Cj4gLSAgICAgICAgbDNfcGdlbnRyeV90ICpsM3QgPSBhbGxvY194
ZW5fcGFnZXRhYmxlKCk7Cj4gKyAgICAgICAgbDNfcGdlbnRyeV90ICpsM3Q7Cj4gKyAgICAgICAg
bWZuX3QgbWZuOwo+ICsKPiArICAgICAgICBtZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygp
Owo+ICsgICAgICAgIGlmICggbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pICkKPiArICAgICAgICAg
ICAgZ290byBvdXQ7CgpBbnkgcmVhc29uIG5vdCB0byB1c2UgInJldHVybiBOVUxMIiBoZXJlLCBh
dm9pZGluZyB0aGUgZ290bwphbmQgbGFiZWwgYWx0b2dldGhlciBpbiB0aXMgZnVuY3Rpb24/Cgo+
ICBzdGF0aWMgbDJfcGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9sMmUodW5zaWduZWQgbG9uZyB2KQo+
ICB7Cj4gICAgICBsM19wZ2VudHJ5X3QgKnBsM2U7Cj4gKyAgICBsMl9wZ2VudHJ5X3QgKnBsMmUg
PSBOVUxMOwo+ICAKPiAgICAgIHBsM2UgPSB2aXJ0X3RvX3hlbl9sM2Uodik7Cj4gICAgICBpZiAo
ICFwbDNlICkKPiAtICAgICAgICByZXR1cm4gTlVMTDsKPiArICAgICAgICBnb3RvIG91dDsKCldo
eSBub3Qga2VlcCB0aGlzIG9uZSB0aGUgd2F5IGl0IGlzPwoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
