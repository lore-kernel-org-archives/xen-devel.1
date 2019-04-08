Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0ACC10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:03:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27FC42147A
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27FC42147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDUrY-0007lg-1M; Mon, 08 Apr 2019 14:03:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDUrX-0007lb-9i
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 14:03:03 +0000
X-Inumbo-ID: 04c6936e-5a07-11e9-9102-174291eb900b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04c6936e-5a07-11e9-9102-174291eb900b;
 Mon, 08 Apr 2019 14:03:00 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 08 Apr 2019 08:02:59 -0600
Message-Id: <5CAB548F020000780022563B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 08 Apr 2019 08:02:55 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
 <dd1d63dd-0eda-b66a-fa89-160220e65912@arm.com>
In-Reply-To: <dd1d63dd-0eda-b66a-fa89-160220e65912@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/3] memory: restrict
 XENMEM_remove_from_physmap to translated guests
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408140255.g8BcHWW2S5xthNkScw-PaCLcaEbg8cGApMRBaKgsyw0@z>

Pj4+IE9uIDA4LjA0LjE5IGF0IDEzOjU4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDMvNS8xOSAxOjI4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQEAgLTI5OCw3ICsyOTgs
NyBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fYWRkX3RvX3BoeXNtCj4+ICAgCj4+ICAg
LyoKPj4gICAgKiBVbm1hcHMgdGhlIHBhZ2UgYXBwZWFyaW5nIGF0IGEgcGFydGljdWxhciBHUEZO
IGZyb20gdGhlIHNwZWNpZmllZCBndWVzdCdzCj4+IC0gKiBwc2V1ZG9waHlzaWNhbCBhZGRyZXNz
IHNwYWNlLgo+PiArICogcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSAodHJhbnNsYXRlZCBndWVzdHMg
b25seSkuCj4gCj4gV2hpbGUgeW91IG1vZGlmeSB0aGUgY29tbWVudCwgY2FuIHlvdSByZXBsYWNl
IEdQRk4gd2l0aCBHRk4/CgpJIGRpZCBjb25zaWRlciB0aGlzIHdoZW4gd3JpdGluZyB0aGUgcGF0
Y2gsIGJ1dCB0aGVuIHRoaXMgd291bGQKYnJpbmcgaXQgb3V0IG9mIHN5bmMgd2l0aCB0aGUgc3Ry
dWN0dXJlIGZpZWxkIGFuZCBpdHMgYXNzb2NpYXRlZApjb21tZW50LiBQbHVzIHRoZSAiYWRkIiBz
aWRlIGNvbW1lbnQgd291bGQgdGhlbiB3YW50CmNoYW5naW5nIHRvby4gQW5kIHB1YmxpYy9tZW1v
cnkuaCBoYXMgcXVpdGUgYSBmZXcgbW9yZSB1c2VzCm9mIEdQRk4gLyBncGZuLgoKVG8gYmUgaG9u
ZXN0IEknZCBwcmVmZXIgdG8gbGVhdmUgdGhpcyBhcyBpcyByaWdodCBoZXJlLCBmb3IgaXQgdG8g
Z2V0CmNsZWFuZWQgdXAgaW4gb25lIGdvLgoKPiBPdGhlciB0aGFuIHRoYXQ6Cj4gCj4gUmV2aWV3
ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpUaGFua3MsIGJ1dCBh
cyBwZXIgYWJvdmUgSSdtIG5vdCBzdXJlIHdoZXRoZXIgdG8gYWN0dWFsbHkgYXBwbHkKaXQuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
