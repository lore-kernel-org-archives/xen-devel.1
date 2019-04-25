Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCB1C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 11:40:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52DB620811
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 11:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52DB620811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJck4-0005pF-9O; Thu, 25 Apr 2019 11:40:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJck2-0005pA-EM
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 11:40:38 +0000
X-Inumbo-ID: eff1c3dc-674e-11e9-8d11-af96831cc356
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eff1c3dc-674e-11e9-8d11-af96831cc356;
 Thu, 25 Apr 2019 11:40:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 05:40:33 -0600
Message-Id: <5CC19CAC0200007800229037@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 05:40:28 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <20190418015203.1636-1-dpsmith@apertussolutions.com>
 <1cf0e5e9-2109-9517-49d9-88c5251cf156@citrix.com>
In-Reply-To: <1cf0e5e9-2109-9517-49d9-88c5251cf156@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Fixing compilation for go
 1.11
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "Daniel P.Smith" <dpsmith.dev@gmail.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425114028.qrZFjkOtvcqyPuEiyJJHG5DqupAQCRkO5S8SqBaCwMs@z>

Pj4+IE9uIDE4LjA0LjE5IGF0IDE1OjExLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA0LzE4LzE5IDI6NTIgQU0sIERhbmllbCBQLiBTbWl0aCB3cm90ZToKPj4gVGhpcyBk
ZWFscyB3aXRoIHR3byBjYXN0aW5nIGlzc3VlcyBmb3IgY29tcGlsaW5nIHVuZGVyIGdvIDEuMTE6
Cj4+IC0gZXhwbGljaXRseSBjYXN0IHRvICpDLnhlbnRvb2xsb2dfbG9nZ2VyIGZvciBDdHgubG9n
Z2VyIHBvaW50ZXIKPj4gLSBhZGQgY2FzdCB0byB1bnNhZmUuUG9pbnRlciBmb3IgdGhlIEMgc3Ry
aW5nIGNwYXRoCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgUC4gU21pdGggPGRwc21pdGhA
YXBlcnR1c3NvbHV0aW9ucy5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdl
b3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiAKPiBCVFcsIGRvIHlvdSBrbm93IGlmIHRoaXMgd2ls
bCBjb21waWxlIGZvciBvbGRlciB2ZXJzaW9ucyBvZiBnbz8KPiAKPiBUaGlzIHNob3VsZCBiZSBj
b25zaWRlcmVkIGZvciBiYWNrcG9ydCBhcyB3ZWxsIChjYydpbmcgSmFuKS4KCkRpZCB5b3UgbWVh
biBJYW4sIHRoaXMgYmVpbmcgYSB0b29scyBwYXRjaD8KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
