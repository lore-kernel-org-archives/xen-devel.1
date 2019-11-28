Return-Path: <SRS0=Vqkq=ZU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E3CC432C0
	for <xen-devel@archiver.kernel.org>; Thu, 28 Nov 2019 13:38:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 343F22176D
	for <xen-devel@archiver.kernel.org>; Thu, 28 Nov 2019 13:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 343F22176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaJzZ-0000Qg-BR; Thu, 28 Nov 2019 13:37:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaJzY-0000QU-DI
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 13:37:56 +0000
X-Inumbo-ID: 413864fe-11e4-11ea-a3d2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 413864fe-11e4-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 13:37:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EFB12B169;
 Thu, 28 Nov 2019 13:37:42 +0000 (UTC)
To: Lars Kurth <lars.kurth@xenproject.org>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <97e3adf75cf71ba39e702d4cab23236ada8d5a6c.1569525222.git.lars.kurth@citrix.com>
 <alpine.DEB.2.21.1911271608510.27669@sstabellini-ThinkPad-T480s>
 <909826df-25c1-6d7c-75d9-470365d2ecf6@suse.com>
 <2200B0A8-0EDE-4843-A5D3-A84F2D01333D@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6ec3d6f-4d00-5d44-a63e-88757f40eaa8@suse.com>
Date: Thu, 28 Nov 2019 14:37:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <2200B0A8-0EDE-4843-A5D3-A84F2D01333D@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/6] Add Code Review Guide
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxNDowNiwgTGFycyBLdXJ0aCB3cm90ZToKPiBJIGNhbiBjZXJ0YWlubHkg
YWRkIHNvbWV0aGluZyBvbiB0aGUgdGltaW5nICwgYWxvbmcgdGhlIGxpbmVzIG9mCj4gKiBGb3Ig
Y29tcGxleCBzZXJpZXMsIGNvbnNpZGVyIHRoZSB0aW1lIGl0IHRha2VzIHRvIGRvIHJldmlld3Mg
KG1heWJlIHdpdGggYSBndWlkZSBvZiBMT0MgcGVyIGhvdXIpIGFuZCBnaXZlIHJldmlld2VycyBl
bm91Z2ggdGltZSB0bwo+ICogRm9yIHNlcmllcyB3aXRoIGRlc2lnbiBpc3N1ZXMgb3IgbGFyZ2Ug
cXVlc3Rpb25zLCB0cnkgYW5kIGhpZ2hsaWdodCB0aGUga2V5IG9wZW4gaXNzdWVzIGluIGNvdmVy
IGxldHRlcnMgY2xlYXJseSBhbmQgc29saWNpdCBmZWVkYmFjayBmcm9tIGtleSBtYWludGFpbmVy
cyB3aG8gY2FuIGNvbW1lbnQgb24gdGhlIG9wZW4gaXNzdWUuIFRoZSBpZGVhIGlzIHRvIHNhdmUg
Ym90aCB0aGUgY29udHJpYnV0b3IgYW5kIHRoZSByZXZpZXdlcnMgdGltZSBieSBmb2N1c3Npbmcg
b24gd2hhdCBuZWVkcyB0byBiZSByZXNvbHZlZCAKPiAqIERvbuKAmXQgcmVwb3N0IGEgc2VyaWVz
LCB1bmxlc3MgYWxsIHJldmlldyBjb21tZW50cyBhcmUgYWRkcmVzc2VkCj4gb3IgdGhlIHJldmll
d2VycyBhc2tlZCB5b3UgdG8gZG8gc28uIFRoZSBwcm9ibGVtIHdpdGggdGhpcyBpcyB0aGF0Cj4g
dGhpcyBpcyBzb21ld2hhdCBpbiBjb25mbGljdCB3aXRoIHRoZSAibGV0J3MgZm9jdXMgb24gdGhl
IGNvcmUKPiBpc3N1ZXMgYW5kIG5vdCBnZXQgZGlzdHJhY3RlZCBieSBkZXRhaWxzIGVhcmx5IG9u
IGluIGEgcmV2aWV3IGN5Y2xlIi4KPiBJbiBvdGhlciB3b3JkcywgdGhpcyBjYW4gb25seSB3b3Jr
LCBpZiByZXZpZXdlcnMgZm9jdXMgb24gbWFqb3IKPiBpc3N1ZXMgaW4gZWFybHkgcmV2aWV3cyBv
bmx5IGFuZCBkbyBub3QgZm9jdXMgb24gc3R5bGUsIGNvZGluZwo+IHN0YW5kYXJkcywgZXRjLgoK
QnV0IHRoaXMgZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UgZWl0aGVyLCBiZWNhdXNlIHRoZW4gZnVs
bCByZS1yZXZpZXdzCm5lZWQgdG8gaGFwcGVuIGFueXdheSBvbiBsYXRlciB2ZXJzaW9ucywgdG8g
YWxzbyBkZWFsIHdpdGggdGhlIG1pbm9yCmlzc3Vlcy4gRm9yIFJGQyBraW5kIG9mIHNlcmllcyBv
bWl0dGluZyBzdHlsZSBhbmQgYWxpa2UgZmVlZGJhY2sKY2VydGFpbmx5IG1ha2VzIHNlbnNlLCBi
dXQgYXMgc29vbiBhcyBhIHBhdGNoIGlzIG5vbi1SRkMsIGl0IHNob3VsZApiZSBjb25zaWRlcmVk
IGdvb2QgdG8gZ28gaW4gYnkgdGhlIHN1Ym1pdHRlci4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
