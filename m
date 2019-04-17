Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECDFC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 10:59:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 237C92177B
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 10:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 237C92177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGiHy-0001AL-FI; Wed, 17 Apr 2019 10:59:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wIUc=ST=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hGiHx-0001A8-Dq
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 10:59:37 +0000
X-Inumbo-ID: e173bcc0-60ff-11e9-bc6f-efb340561e66
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e173bcc0-60ff-11e9-bc6f-efb340561e66;
 Wed, 17 Apr 2019 10:59:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27AC4AE04;
 Wed, 17 Apr 2019 10:59:32 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20190417100840.13935-1-ian.jackson@eu.citrix.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b0db5408-1537-d09f-db96-188b384f56ea@suse.com>
Date: Wed, 17 Apr 2019 12:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190417100840.13935-1-ian.jackson@eu.citrix.com>
Content-Language: de-DE
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417105930.bOlSCemjZcEOvuEoDPwSaGAw-w1phHZ41YhMyoMHfNU@z>

T24gMTcvMDQvMjAxOSAxMjowOCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gRmlyc3RseSwgY2hhbmdl
IHRoZSBzbW9rZSBmbGlnaHQgdG8gdXNlIGFtZDY0LCBub3QgaTM4Ni4KPiBTZWNvbmRseSwgbWFr
ZSB0aGUgb3RoZXIgZmxpZ2h0cyBoYXZlIGEgbWl4dHVyZSBvZiBpMzg2IGFuZCBhbWQ2NCwgbm90
Cj4ganVzdCBhbWQ2NC4KPiAKPiBJdCB3YXMgYWx3YXlzIHdyb25nIHRvIHRlc3Qgb25seSBvbmUg
Z3Vlc3QgYXJjaGl0ZWN0dXJlIGluIHRoZSBtYWluCj4gZmxpZ2h0cy4KPiAKPiBUaGUgY29udGV4
dCBmb3IgY2hhbmdpbmcgdGhlIHNtb2tlIGZsaWdodCBpcyB0aGF0IHRoZXJlIHNlZW1zIHRvIGJl
IGEKPiBwcm9ibGVtIGFmZmVjdGluZyBEZWJpYW4gaTM4NiBndWVzdHMuICBUaGlzIGlzIHJhdGhl
ciBhIG51aXNhbmNlIGJ1dAo+IGl0IGlzIG5vdCBhIFhlbiByZWdyZXNzaW9uIHNvIHdlIHByb2Jh
Ymx5IHdhbnQgdG8gZG8gYW4gYW1kNjQgZ3Vlc3QKPiBpbnN0ZWFkIHNvIHdlIGhhdmUgc29tZSBI
Vk0gdGVzdHMgaW4gdGhlIHNtb2tlIGZsaWdodHMuCj4gCj4gQ2hlY2tlZCB3aXRoIHN0YW5kYWxv
bmUtZ2VuZXJhdGUtZHVtcC1mbGlnaHQtcnVudmFycy4gIERpZmZlcmVuY2VzCj4gYXJlIGFzIGZv
bGxvd3M6Cj4gCj4gMS4gR2VuZXJhbGx5LCB0byBjaGFuZ2UgdGhlIGd1ZXN0IGFyY2ggZnJvbSBh
bWQ2NCB0byBpMzg2IGluOgo+IAo+ICAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1kZWJpYW5o
dm0te2FtZDY0LGkzODZ9LXhzbQo+ICAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5o
dm0te2FtZDY0LGkzODZ9LXhzbQo+ICAgdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV0LWRlYmlhbmh2
bS17YW1kNjQsaTM4Nn0teHNtCj4gICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtZGViaWFuaHZt
LXthbWQ2NCxpMzg2fS14c20KPiAKPiBUaGlzIG9jY3VycyBpbiBhbGwgdGhlIHVzdWFsIGZsaWdo
dHMuCj4gCj4gMi4gVG8gY2hhbmdlIHRoZSBndWVzdCBhcmNoIGZyb20gaTM4NiB0byBhbWQ2NCBp
bjoKPiAKPiAgIHhlbi11bnN0YWJsZS1zbW9rZSAgIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUt
ZGViaWFuaHZtLWkzODYKPiAKPiBJbiBhbGwgY2FzZXMsIHRoaXMgaW1wbGllcyBhIHZhcmlldHkg
b2YgY2hhbmdlcyB0byBydW52YXJzLCBpbmNsdWRpbmcKPiB0aGUgSVNPIHRvIGJlIHVzZWQsIHRo
ZSBpbnN0YWxsIHRpbWVvdXQsIGV0Yy4KPiAKPiBVc3VhbGx5IEkgd291bGQgaW50cm9kdWNlIG5l
dyBqb2JzIGZpcnN0LCBhbmQgdGhlbiwgYWZ0ZXIgYW4gb3ZlcmxhcCwKPiByZW1vdmUgb2xkIG9u
ZXMuICBCdXQgdGhlIHJlZ3Jlc3Npb24sIGR1ZSB0byB0aGUgaTM4NiBodm0gc3RyZXRjaAo+IHBy
b2JsZW0sIGlzIGFscmVhZHkgd2l0aCB1cy4KPiAKPiBJIGV4cGVjdCB0aGlzIGNoYW5nZSB0byB1
bmJsb2NrIHRoZSB4ZW4tdW5zdGFibGUtc21va2UgZmxpZ2h0cyBieQo+IGRyb3BwaW5nIHRoZSBm
YWlsaW5nIGpvYiBhbmQgcmVwbGFjaW5nIGl0IHdpdGggYSBwYXNzaW5nIG9uZS4KPiAKPiBUaGUg
b3RoZXIgZmxpZ2h0cyB3aWxsIG5vdyBzdGFydCB0byBmYWlsLCB0aG91Z2guICBJIHdpbGwgbmVl
ZCwKPiBzZXBhcmF0ZWx5LCB0byBkZXZlbG9wIGEgd29ya2Fyb3VuZCBmb3IgdGhlIHN0cmV0Y2gg
aTM4NiBodm0gZ3Vlc3QKPiBidWcuCj4gCj4gQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBDQzogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
