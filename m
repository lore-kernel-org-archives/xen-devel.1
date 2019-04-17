Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015F8C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 12:20:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC15F21773
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 12:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC15F21773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGjXP-0008Uw-Gg; Wed, 17 Apr 2019 12:19:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f/qU=ST=citrix.com=prvs=0034167b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hGjXO-0008Ur-RX
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 12:19:38 +0000
X-Inumbo-ID: 1170f3b8-610b-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1170f3b8-610b-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 12:19:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,361,1549929600"; d="scan'208";a="83783353"
Date: Wed, 17 Apr 2019 13:19:35 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20190417121935.GY30543@zion.uk.xensource.com>
References: <20190417100840.13935-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190417100840.13935-1-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [OSSTEST PATCH] debianhvm tests: Re-permute guest
 architecture
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417121935.GneJLbzDnC3IZ2byV66zAiBTc_A7LFd6Slu7WUb5z6s@z>

T24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMTE6MDg6NDBBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRmlyc3RseSwgY2hhbmdlIHRoZSBzbW9rZSBmbGlnaHQgdG8gdXNlIGFtZDY0LCBub3Qg
aTM4Ni4KPiBTZWNvbmRseSwgbWFrZSB0aGUgb3RoZXIgZmxpZ2h0cyBoYXZlIGEgbWl4dHVyZSBv
ZiBpMzg2IGFuZCBhbWQ2NCwgbm90Cj4ganVzdCBhbWQ2NC4KPiAKPiBJdCB3YXMgYWx3YXlzIHdy
b25nIHRvIHRlc3Qgb25seSBvbmUgZ3Vlc3QgYXJjaGl0ZWN0dXJlIGluIHRoZSBtYWluCj4gZmxp
Z2h0cy4KPiAKPiBUaGUgY29udGV4dCBmb3IgY2hhbmdpbmcgdGhlIHNtb2tlIGZsaWdodCBpcyB0
aGF0IHRoZXJlIHNlZW1zIHRvIGJlIGEKPiBwcm9ibGVtIGFmZmVjdGluZyBEZWJpYW4gaTM4NiBn
dWVzdHMuICBUaGlzIGlzIHJhdGhlciBhIG51aXNhbmNlIGJ1dAo+IGl0IGlzIG5vdCBhIFhlbiBy
ZWdyZXNzaW9uIHNvIHdlIHByb2JhYmx5IHdhbnQgdG8gZG8gYW4gYW1kNjQgZ3Vlc3QKPiBpbnN0
ZWFkIHNvIHdlIGhhdmUgc29tZSBIVk0gdGVzdHMgaW4gdGhlIHNtb2tlIGZsaWdodHMuCj4gCj4g
Q2hlY2tlZCB3aXRoIHN0YW5kYWxvbmUtZ2VuZXJhdGUtZHVtcC1mbGlnaHQtcnVudmFycy4gIERp
ZmZlcmVuY2VzCj4gYXJlIGFzIGZvbGxvd3M6Cj4gCj4gMS4gR2VuZXJhbGx5LCB0byBjaGFuZ2Ug
dGhlIGd1ZXN0IGFyY2ggZnJvbSBhbWQ2NCB0byBpMzg2IGluOgo+IAo+ICAgdGVzdC1hbWQ2NC1h
bWQ2NC14bC1xZW11dC1kZWJpYW5odm0te2FtZDY0LGkzODZ9LXhzbQo+ICAgdGVzdC1hbWQ2NC1h
bWQ2NC14bC1xZW11dS1kZWJpYW5odm0te2FtZDY0LGkzODZ9LXhzbQo+ICAgdGVzdC1hbWQ2NC1p
Mzg2LXhsLXFlbXV0LWRlYmlhbmh2bS17YW1kNjQsaTM4Nn0teHNtCj4gICB0ZXN0LWFtZDY0LWkz
ODYteGwtcWVtdXUtZGViaWFuaHZtLXthbWQ2NCxpMzg2fS14c20KPiAKPiBUaGlzIG9jY3VycyBp
biBhbGwgdGhlIHVzdWFsIGZsaWdodHMuCj4gCj4gMi4gVG8gY2hhbmdlIHRoZSBndWVzdCBhcmNo
IGZyb20gaTM4NiB0byBhbWQ2NCBpbjoKPiAKPiAgIHhlbi11bnN0YWJsZS1zbW9rZSAgIHRlc3Qt
YW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWkzODYKPiAKPiBJbiBhbGwgY2FzZXMsIHRo
aXMgaW1wbGllcyBhIHZhcmlldHkgb2YgY2hhbmdlcyB0byBydW52YXJzLCBpbmNsdWRpbmcKPiB0
aGUgSVNPIHRvIGJlIHVzZWQsIHRoZSBpbnN0YWxsIHRpbWVvdXQsIGV0Yy4KPiAKPiBVc3VhbGx5
IEkgd291bGQgaW50cm9kdWNlIG5ldyBqb2JzIGZpcnN0LCBhbmQgdGhlbiwgYWZ0ZXIgYW4gb3Zl
cmxhcCwKPiByZW1vdmUgb2xkIG9uZXMuICBCdXQgdGhlIHJlZ3Jlc3Npb24sIGR1ZSB0byB0aGUg
aTM4NiBodm0gc3RyZXRjaAo+IHByb2JsZW0sIGlzIGFscmVhZHkgd2l0aCB1cy4KPiAKPiBJIGV4
cGVjdCB0aGlzIGNoYW5nZSB0byB1bmJsb2NrIHRoZSB4ZW4tdW5zdGFibGUtc21va2UgZmxpZ2h0
cyBieQo+IGRyb3BwaW5nIHRoZSBmYWlsaW5nIGpvYiBhbmQgcmVwbGFjaW5nIGl0IHdpdGggYSBw
YXNzaW5nIG9uZS4KPiAKPiBUaGUgb3RoZXIgZmxpZ2h0cyB3aWxsIG5vdyBzdGFydCB0byBmYWls
LCB0aG91Z2guICBJIHdpbGwgbmVlZCwKPiBzZXBhcmF0ZWx5LCB0byBkZXZlbG9wIGEgd29ya2Fy
b3VuZCBmb3IgdGhlIHN0cmV0Y2ggaTM4NiBodm0gZ3Vlc3QKPiBidWcuCj4gCj4gQ0M6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KPiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCkZX
SVc6CkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
