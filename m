Return-Path: <SRS0=/voU=TU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C24C04AAF
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 08:12:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80EF920656
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 08:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80EF920656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSdPV-0004uF-GG; Mon, 20 May 2019 08:12:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hSdPT-0004tv-Sy
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 08:12:39 +0000
X-Inumbo-ID: 082742f4-7ad7-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 082742f4-7ad7-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 08:12:38 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 20 May 2019 02:12:38 -0600
Message-Id: <5CE261730200007800230797@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 20 May 2019 02:12:35 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558120638-3610-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1558120638-3610-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/boot: Print the build-id along with the
 changeset information
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190520081235.iUhch4n8zX1UWHhSIgJfaAVjTQOPqkCN7AplqiAbuvE@z>

Pj4+IE9uIDE3LjA1LjE5IGF0IDIxOjE3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRHVyaW5nIGluaXRjYWxscyBpcyBvaywgYnV0IGlzIGEgcmF0aGVyIHJhbmRvbSBwbGFj
ZSB0byBmaW5kIHRoZSBidWlsZC1pZDoKPiAKPiAgIChYRU4pIFBhcmtlZCAyIENQVXMKPiAgIChY
RU4pIGJ1aWxkLWlkOiA3ZmYwNWY3OGViYzgxNDEwMDBiOWZlZWU0MzcwYTQwOGJkOTM1ZGVjCj4g
ICAoWEVOKSBSdW5uaW5nIHN0dWIgcmVjb3Zlcnkgc2VsZnRlc3RzLi4uCj4gCj4gTG9naWNhbGx5
LCBpdCBpcyB2ZXJzaW9uIGluZm9ybWF0aW9uLCBzbyBwcmludCB3aXRoIHRoZSBjaGFuZ2VzZXQg
aW5mb3JtYXRpb24KPiBpbiBjb25zb2xlX2luaXRfcHJlaXJxKCk6Cj4gCj4gICAoWEVOKSBYZW4g
dmVyc2lvbiA0LjEzLXVuc3RhYmxlIChhbmRyZXdjb29wQGFuZHJlY29vcCkgKGdjYyAoRGViaWFu
IDQuOS4yLTEwK2RlYjh1MikgNC45LjIpIGRlYnVnPXkgIEZyaSBBcHIgMTIgMTg6MjQ6NTIgQlNU
IDIwMTkKPiAgIChYRU4pIExhdGVzdCBDaGFuZ2VTZXQ6IEZyaSBBcHIgNSAxNDozOTo0MiAyMDE5
IGdpdDpmYzZjN2FlLWRpcnR5Cj4gICAoWEVOKSBidWlsZC1pZDogN2ZmMDVmNzhlYmM4MTQxMDAw
YjlmZWVlNDM3MGE0MDhiZDkzNWRlYwo+ICAgKFhFTikgUFZIIHN0YXJ0IGluZm86IChwYSAwMDAw
ZmZjMCkKPiAKPiBOb3RoaW5nIGhhcyBldmVyIGNhcmVkIGFib3V0IHhlbl9idWlsZF9pbml0KCkn
cyByZXR1cm4gdmFsdWUsIHNvIGNvbnZlcnQgaXQgdG8KPiB2b2lkIHJhdGhlciB0aGFuIGluY2x1
ZGUgZXJybm8uaCBpbnRvIHRoZSAhQlVJTERfSUQgY2FzZSBvZiB2ZXJzaW9uLmgKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
