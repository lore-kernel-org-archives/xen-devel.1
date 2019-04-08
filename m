Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECEDC10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 16:10:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 961B120857
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 16:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 961B120857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDWqx-0005XR-4U; Mon, 08 Apr 2019 16:10:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng3J=SK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDWqw-0005XM-0J
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 16:10:34 +0000
X-Inumbo-ID: d5fccf00-5a18-11e9-9450-d36740be49e9
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d5fccf00-5a18-11e9-9450-d36740be49e9;
 Mon, 08 Apr 2019 16:10:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84A5115AB;
 Mon,  8 Apr 2019 09:10:32 -0700 (PDT)
Received: from [10.37.12.9] (unknown [10.37.12.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92E193F718;
 Mon,  8 Apr 2019 09:10:30 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
 <dd1d63dd-0eda-b66a-fa89-160220e65912@arm.com>
 <5CAB548F020000780022563B@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7a64cb69-7ba6-de63-67f2-840bab59c356@arm.com>
Date: Mon, 8 Apr 2019 17:10:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CAB548F020000780022563B@prv1-mh.provo.novell.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408161028.2plxRjI6kCJjp3hXvm4xXzn67m4H3Dt5CVA918ZbtEY@z>

SGkgSmFuLAoKT24gNC84LzE5IDM6MDIgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA4
LjA0LjE5IGF0IDEzOjU4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiAzLzUv
MTkgMToyOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBAQCAtMjk4LDcgKzI5OCw3IEBAIERF
RklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9hZGRfdG9fcGh5c20KPj4+ICAgIAo+Pj4gICAgLyoK
Pj4+ICAgICAqIFVubWFwcyB0aGUgcGFnZSBhcHBlYXJpbmcgYXQgYSBwYXJ0aWN1bGFyIEdQRk4g
ZnJvbSB0aGUgc3BlY2lmaWVkIGd1ZXN0J3MKPj4+IC0gKiBwc2V1ZG9waHlzaWNhbCBhZGRyZXNz
IHNwYWNlLgo+Pj4gKyAqIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgKHRyYW5zbGF0ZWQgZ3Vlc3Rz
IG9ubHkpLgo+Pgo+PiBXaGlsZSB5b3UgbW9kaWZ5IHRoZSBjb21tZW50LCBjYW4geW91IHJlcGxh
Y2UgR1BGTiB3aXRoIEdGTj8KPiAKPiBJIGRpZCBjb25zaWRlciB0aGlzIHdoZW4gd3JpdGluZyB0
aGUgcGF0Y2gsIGJ1dCB0aGVuIHRoaXMgd291bGQKPiBicmluZyBpdCBvdXQgb2Ygc3luYyB3aXRo
IHRoZSBzdHJ1Y3R1cmUgZmllbGQgYW5kIGl0cyBhc3NvY2lhdGVkCj4gY29tbWVudC4gUGx1cyB0
aGUgImFkZCIgc2lkZSBjb21tZW50IHdvdWxkIHRoZW4gd2FudAo+IGNoYW5naW5nIHRvby4gQW5k
IHB1YmxpYy9tZW1vcnkuaCBoYXMgcXVpdGUgYSBmZXcgbW9yZSB1c2VzCj4gb2YgR1BGTiAvIGdw
Zm4uCj4gCj4gVG8gYmUgaG9uZXN0IEknZCBwcmVmZXIgdG8gbGVhdmUgdGhpcyBhcyBpcyByaWdo
dCBoZXJlLCBmb3IgaXQgdG8gZ2V0Cj4gY2xlYW5lZCB1cCBpbiBvbmUgZ28uCgpJIGFtIGZpbmUg
d2l0aCB0aGF0LgoKPiAKPj4gT3RoZXIgdGhhbiB0aGF0Ogo+Pgo+PiBSZXZpZXdlZC1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiBUaGFua3MsIGJ1dCBhcyBwZXIg
YWJvdmUgSSdtIG5vdCBzdXJlIHdoZXRoZXIgdG8gYWN0dWFsbHkgYXBwbHkgPiBpdC4KClllcyBp
dCBhcHBsaWVzLCBmb3IgdGhlIGNvbW1vbiBjb2RlIChhbmQgaW5kaXJlY3RseSBBcm0pLgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
