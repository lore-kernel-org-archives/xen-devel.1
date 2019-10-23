Return-Path: <SRS0=in/6=YQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4F5CA9EB6
	for <xen-devel@archiver.kernel.org>; Wed, 23 Oct 2019 13:43:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08EA120663
	for <xen-devel@archiver.kernel.org>; Wed, 23 Oct 2019 13:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08EA120663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGua-0002UM-2q; Wed, 23 Oct 2019 13:42:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNGuZ-0002UC-70
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:42:51 +0000
X-Inumbo-ID: 0121075a-f59b-11e9-947e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0121075a-f59b-11e9-947e-12813bfff9fa;
 Wed, 23 Oct 2019 13:42:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A8A05BACF;
 Wed, 23 Oct 2019 13:42:49 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-7-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f02c101f-fa75-7323-de2e-691924a2a1bb@suse.com>
Date: Wed, 23 Oct 2019 15:42:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023130013.32382-7-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 06/11] libxl:
 Remove/deprecate libxl_get_required_*_memory from the API
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTU6MDAsIElhbiBKYWNrc29uIHdyb3RlOgo+IFRoZXNlIGFyZSBub3cgcmVk
dW5kYW50IGJlY2F1c2Ugc2hhZG93X21lbWtiIGFuZCBpb21tdV9tZW1rYiBhcmUgbm93Cj4gZGVm
YXVsdGVkIGF1dG9tYXRpY2FsbHkgYnkgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5IGFuZAo+IGxp
YnhsX2RvbWFpbl9jcmVhdGUgZXRjLiAgQ2FsbGVycyBzaG91bGQgbm90IG5vdyBjYWxsIHRoZXNl
OyBpbnN0ZWFkLAo+IHRoZXkgc2hvdWxkIGp1c3QgbGV0IGxpYnhsIHRha2UgY2FyZSBvZiBpdC4K
PiAKPiBsaWJ4bF9nZXRfcmVxdWlyZWRfc2hhZG93X21lbW9yeSB3YXMgaW50cm9kdWNlZCBpbiBm
ODlmNTU1ODI3YTYKPiAgICAicmVtb3ZlIGxhdGUgKG9uLWRlbWFuZCkgY29uc3RydWN0aW9uIG9m
IElPTU1VIHBhZ2UgdGFibGVzIgo+IFdlIGNhbiBmcmVlbHkgcmVtb3ZlIGl0IGJlY2F1c2UgaXQg
d2FzIG5ldmVyIGluIGFueSByZWxlYXNlLgo+IAo+IGxpYnhsX2dldF9yZXF1aXJlZF9zaGFkb3df
bWVtb3J5IGhhcyBiZWVuIGluIGxpYnhsIGFwcHJveGltYXRlbHkKPiBmb3JldmVyLiAgSXQgc2hv
dWxkIHByb2JhYmx5IG5vdCBoYXZlIHN1cnZpdmVkIHRoZSBjcmVhdGlvbiBvZgo+IGxpYnhsX2Rv
bWFpbl9jcmVhdGUsIGJ1dCBpdCBzZWVtcyB0aGUgQVBJIGF3a3dhcmRuZXNzZXMgd2Ugc2VlIGlu
Cj4gcmVjZW50IGNvbW1pdHMgcHJldmVudGVkIHRoaXMuICBTbyB3ZSBoYXZlIHRvIGtlZXAgaXQu
ICBJdCByZW1haW5zCj4gZnVuY3Rpb25hbCBidXQgd2UgY2FuIGRlcHJlY2F0ZSBpdC4gIEhvcGVm
dWxseSB3ZSBjYW4gZ2V0IHJpZCBvZiBpdAo+IGNvbXBsZXRlbHkgYmVmb3JlIHdlIGZpbmQgdGhl
IG5lZWQgdG8gY2hhbmdlIHRoZSBjYWxjdWxhdGlvbiB0byB1c2UKPiBhZGRpdGlvbmFsIGluZm9y
bWF0aW9uIHdoaWNoIGl0cyBhcmd1bWVudHMgZG8gbm90IGN1cnJlbnRseSBzdXBwbHkuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4g
QWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKUmVs
ZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
