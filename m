Return-Path: <SRS0=yLx4=UQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3DEC31E5B
	for <xen-devel@archiver.kernel.org>; Mon, 17 Jun 2019 14:30:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86F852084D
	for <xen-devel@archiver.kernel.org>; Mon, 17 Jun 2019 14:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86F852084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcseJ-0002Bf-Dp; Mon, 17 Jun 2019 14:30:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qf//=UQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hcseI-0002Ba-1x
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 14:30:18 +0000
X-Inumbo-ID: 6cee631f-910c-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6cee631f-910c-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 14:30:16 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sdmCW2PDisJL/ApfvhAgnt56uXfQi/ktnoVxewU7POhkVFyxcjCZVsH4VVEYRfVZPafqYyDluM
 Qz+olhCh6f3gFICYdpYw8KDToCgvBEpSs42ZqjS+SjQ36ygiJljiHDgODGeS2en0hp4qP9G3Aq
 00VsjwidB2MSicyREle6/FkW1MnqSSqXoRKKmF3hm8DnJ1Ayfw8vHRsMkNh3RQTGqh0QrTWH23
 e+Ih0HEzEhybD2XoWxnPPjEf4mqotQGQG1WeYuDJm+gekj1JXxNBa76UX/mBqoMND0Lm4Yk6Th
 IAI=
X-SBRS: 2.7
X-MesageID: 1826171
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1826171"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23815.41938.129853.679771@mariner.uk.xensource.com>
Date: Mon, 17 Jun 2019 15:29:38 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5D079E660200007800238D4A@prv1-mh.provo.novell.com>
References: <osstest-137064-mainreport@xen.org>
 <23793.763.56062.488960@mariner.uk.xensource.com>
 <5D079E660200007800238D4A@prv1-mh.provo.novell.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.6-testing test] 137064: regressions - FAIL
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTM3MDY0OiBy
ZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBGdW5kYW1lbnRhbGx5IEkgZG9uJ3QgY2FyZSBvdmVybHkg
bXVjaCBhYm91dCB0aGlzIG9sZCB0cmVlLCBidXQKPiBJIGNhbid0IGZpZ3VyZSBob3cgeW91IGNh
bWUgdG8gdGhlICJtb3N0bHkgbmV3IHRlc3RzIGluIFhURiIKPiBjb25jbHVzaW9uLiBJbiBmYWN0
IC4uLgoKSG1tbS4gIEkgdGhpbmsgeW91IGFyZSByaWdodCBhbmQgSSBtaXNyZWFkIHRoZSByZXBv
cnQuCgo+IC4uLiB0aGVzZSBhcmUgYWxsIFhURiByZWxhdGVkIG9uZXMsIGFuZCBsZWFrLWNoZWNr
IGZhaWx1cmVzIGltbyBhcmVuJ3QKPiBsaWFibGUgdG8gYmUgcmVsYXRlZCB0byAibmV3IiBYVEYg
dGVzdHMuIE90b2ggSSB0aGluayBsZWFrLWNoZWNrIGZhaWx1cmVzCj4gYXJlIHN1ZmZpY2llbnRs
eSAiZmluZSIgdG8gaWdub3JlLCBhbmQgaGVuY2UgYXJlbid0IGFuIGFyZ3VtZW50IGFnYWluc3QK
PiBhIGZvcmNlIHB1c2guCgpJSVJDIHRoZSBsZWFrLWNoZWNrIGZhaWx1cmVzIHdlcmUgZHVlIHRv
IHRoZSBob3N0IGNyYXNoaW5nIGR1cmluZyB0aGUKWFRGIHRlc3RzLiAgRm9yIGV4YW1wbGUsCiAg
aHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNzg0Ny90
ZXN0LXh0Zi1hbWQ2NC1hbWQ2NC0xL2luZm8uaHRtbApzaG93cwogIHNzaDogY29ubmVjdCB0byBo
b3N0IDE3Mi4xNi4xNDQuMzcgcG9ydCAyMjogTm8gcm91dGUgdG8gaG9zdAoKTG9va2luZyBhdCB0
aGUgbG9ncywgdGhpcyBzZWVtcyB0byBiZSBkdWUgdG8gdGhlIFhTQS0yNzkgdGVzdC4KCkp1biAx
NyAwMToxNjowMC45NzQ0OTUgKGQ5NikgWFNBLTI3OSBQb0MKLi4uCkp1biAxNyAwMToxNjowMS4y
MDI1NDUgKFhFTikgWGVuIGNhbGwgdHJhY2U6Ckp1biAxNyAwMToxNjowMS4yMDI1NDUgKFhFTikg
ICAgWzxmZmZmODJkMDgwMTZhMGM2Pl0gZmx1c2hfYXJlYV9sb2NhbCsweDZmLzB4Mjg4Ckp1biAx
NyAwMToxNjowMS4yMTQ1MzMgKFhFTikgICAgWzxmZmZmODJkMDgwMThjYjE0Pl0gZmx1c2hfYXJl
YV9tYXNrKzB4OWUvMHgxMzUKSnVuIDE3IDAxOjE2OjAxLjIxNDUzMyAoWEVOKSAgICBbPGZmZmY4
MmQwODAxODY2YTE+XSBfX2RvX3VwZGF0ZV92YV9tYXBwaW5nKzB4NTE4LzB4NzI3Ckp1biAxNyAw
MToxNjowMS4yMjY3MjMgKFhFTikgICAgWzxmZmZmODJkMDgwMTg2OGRmPl0gZG9fdXBkYXRlX3Zh
X21hcHBpbmcrMHgyZi8weDYyCkp1biAxNyAwMToxNjowMS4yMjY4MDUgKFhFTikgICAgWzxmZmZm
ODJkMDgwMjQ3MDA1Pl0gbHN0YXJfZW50ZXIrMHgxYTUvMHgxZmYKLi4uCkp1biAxNyAwMToxNjow
MS4yMzg1NDUgKFhFTikgUGFuaWMgb24gQ1BVIDM6Ckp1biAxNyAwMToxNjowMS4yMzg1NDUgKFhF
TikgR0VORVJBTCBQUk9URUNUSU9OIEZBVUxUCkp1biAxNyAwMToxNjowMS4yNTA1MzYgKFhFTikg
W2Vycm9yX2NvZGU9MDAwMF0KCj4gSSdtIGZhciBtb3JlIHdvcnJpZWQgYWJvdXQgYWxsIHRoZXNl
IGd1ZXN0IGluc3RhbGwgZmFpbHVyZXMgLSBpdCBjYW4ndAo+IHJlYWxseSBoZWxwIHRvIGlnbm9y
ZSB0aGVtIGJ5IHdheSBvZiBkb2luZyBhIGZvcmNlIHB1c2guIFdpdGhvdXQKPiBoYXZpbmcgbG9v
a2VkLCBxdWl0ZSBsaWtlbHkgdGhleSdyZSAoYWxtb3N0KSBhbGwgdGhlIHNhbWUgaHZtbG9hZGVy
Cj4gaXNzdWUgYXMgZGlhZ25vc2VkIG9uIHRoZSA0LjcgYnJhbmNoLiBJZiBzbywgd2FpdGluZyBm
b3IgdGhlIHRlc3RzCj4gdG8gYWN0dWFsbHkgc3VjY2VlZCB3b3VsZCBzZWVtIGJldHRlciB0byBt
ZS4KCkkgdGhpbmsgeW91IGFyZSByaWdodCBhYm91dCB0aG9zZS4KCj4gVG8gZ2l2ZSBvc3N0ZXN0
IHNvbWUgcmVsaWVmLCB3b3VsZCBpdCBiZSBwb3NzaWJsZSB0byB0ZW1wb3JhcmlseQo+IGRpc2Fi
bGUgdGVzdGluZyBvZiB0aGUgb2xkZXIgdHJlZXMgKHdoaWNoIHdlIGtub3cgd29uJ3Qgc3VjY2Vl
ZCk/Cj4gVGhleSBjb3VsZCBiZSBpbmNyZW1lbnRhbGx5IHJlLWVuYWJsZWQgZnJvbSBvbGRlc3Qg
b253YXJkcyBvbmNlCj4gd2Uga25vdyB0aGUgLXByZXYgYnVpbGQgaXNzdWVzIGhhdmUgYmVlbiBh
ZGRyZXNzZWQgaW4gdGhlCj4gcmVzcGVjdGl2ZSBOLTEgdHJlZS4KClRoaXMgaXMgYSBnb29kIGlk
ZWEgYW5kIEkgc2hvdWxkIGhhdmUgZG9uZSBpdCBlYXJsaWVyLgoKSSBoYXZlIG5vdyBkaXNhYmxl
ZCA0LjggYW5kIDQuOSBpbmNsdXNpdmUuICBJIGhhdmUgbGVmdCA0LjcgcnVubmluZwooZm9yIHdo
aWNoIEFJVUkgeW91IGhhdmUgcHVzaGVkIGEgcHJvcG9zZWQgZml4KSBhbmQgYWxzbyA0LjYgKGJl
Y2F1c2UKSSB0aGluayBzdXJlbHkgd2Ugd2FudCB0byB0cnkgdG8gbWFrZSwgYW5kIHRlc3QsIGEg
Zml4IGZvciB0aGUgWFNBLTI3OQpjcmFzaCwgc2hvd24gYWJvdmUpLgoKSWFuLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
