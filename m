Return-Path: <SRS0=8o9x=4J=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5494CC35656
	for <xen-devel@archiver.kernel.org>; Fri, 21 Feb 2020 15:09:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BAB3206EF
	for <xen-devel@archiver.kernel.org>; Fri, 21 Feb 2020 15:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BAB3206EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59vF-0006hV-W0; Fri, 21 Feb 2020 15:08:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j59vE-0006hN-QA
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 15:08:56 +0000
X-Inumbo-ID: 13815f0b-54bc-11ea-8695-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13815f0b-54bc-11ea-8695-12813bfff9fa;
 Fri, 21 Feb 2020 15:08:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B7A7B228;
 Fri, 21 Feb 2020 15:08:55 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com>
 <20200221115017.tuo2i5db5mhd5yyt@debian>
 <2326943257e6f04bc9a858ef5667295651395c85.camel@amazon.com>
 <c373d061-4a1d-502b-98a3-d40ffa11ba47@suse.com>
 <20200221143608.jexjistjxuijqkme@debian>
 <7c4d3a86-091d-c3db-8bfd-1b2a14b1639f@suse.com>
 <20200221145824.bj5ohma6mvbsgshd@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da9e4331-fe8f-3ccc-3756-452fd17fa214@suse.com>
Date: Fri, 21 Feb 2020 16:08:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221145824.bj5ohma6mvbsgshd@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Xia,
 Hongyan" <hongyxia@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxNTo1OCwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEZlYiAyMSwgMjAy
MCBhdCAwMzo1NToyOFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjEuMDIuMjAy
MCAxNTozNiwgV2VpIExpdSB3cm90ZToKPj4+IE9uIEZyaSwgRmViIDIxLCAyMDIwIGF0IDAyOjMx
OjA4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIxLjAyLjIwMjAgMTM6NTIs
IFhpYSwgSG9uZ3lhbiB3cm90ZToKPj4+Pj4gT24gRnJpLCAyMDIwLTAyLTIxIGF0IDExOjUwICsw
MDAwLCBXZWkgTGl1IHdyb3RlOgo+Pj4+Pj4gT24gVGh1LCBGZWIgMDYsIDIwMjAgYXQgMDY6NTg6
MjNQTSArMDAwMCwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4+Pj4+Pj4gKyAgICBpZiAoIGhhc2htZm4g
IT0gbWZuICYmICF2Y2FjaGUtPnJlZmNudFtpZHhdICkKPj4+Pj4+PiArICAgICAgICBfX2NsZWFy
X2JpdChpZHgsIHZjYWNoZS0+aW51c2UpOwo+Pj4+Pj4KPj4+Pj4+IEFsc28sIHBsZWFzZSBmbHVz
aCB0aGUgbGluZWFyIGFkZHJlc3MgaGVyZSBhbmQgdGhlIG90aGVyIF9fY2xlYXJfYml0Cj4+Pj4+
PiBsb2NhdGlvbi4KPj4+Pj4KPj4+Pj4gSSBmbHVzaCB3aGVuIGEgbmV3IGVudHJ5IGlzIHRha2lu
ZyBhIHNsb3QuIFllYWgsIGl0J3MgcHJvYmFibHkgYmV0dGVyCj4+Pj4+IHRvIGZsdXNoIGVhcmxp
ZXIgd2hlbmV2ZXIgYSBzbG90IGlzIG5vIGxvbmdlciBpbiB1c2UuCj4+Pj4KPj4+PiBRdWVzdGlv
biBpcyB3aGV0aGVyIHN1Y2ggaW5kaXZpZHVhbCBmbHVzaGVzIGFyZW4ndCBhY3R1YWxseQo+Pj4+
IG1vcmUgb3ZlcmhlYWQgdGhhbiBhIHNpbmdsZSBmbHVzaCBjb3ZlcmluZyBhbGwgcHJldmlvdXNs
eQo+Pj4+IHRvcm4gZG93biBlbnRyaWVzLCBkb25lIGF0IHN1aXRhYmxlIHBvaW50cyAoc2VlIHRo
ZSBwcmVzZW50Cj4+Pj4gaW1wbGVtZW50YXRpb24pLgo+Pj4KPj4+IEkgYXNrZWQgdG8gZmx1c2gg
YmVjYXVzZSBJIHdhcyBwYXJhbm9pZCBhYm91dCBsZWF2aW5nIHN0YWxlIGVudHJ5IGFmdGVyCj4+
PiB0aGUgc2xvdCBpcyByZWNsYWltZWQuIEkgdGhpbmsgdGhlIGFkZHJlc3Mgd2lsbCBiZSBmbHVz
aGVkIHdoZW4gYSBuZXcKPj4+IGVudHJ5IGlzIGluc2VydGVkLgo+Pj4KPj4+IFNvIHRoZSBxdWVz
dGlvbiB3b3VsZCBiZSB3aGV0aGVyIHdlIGNhcmUgYWJvdXQgbGVhdmluZyBhIHN0YWxlIGVudHJ5
IGluCj4+PiBwbGFjZSB1bnRpbCBhIG5ldyBvbmUgaXMgaW5zZXJ0ZWQuCj4+Cj4+IFdlbGwsIHdl
IGFwcGFyZW50bHkgZG9uJ3QgaGF2ZSBhbiBpc3N1ZSB3aXRoIHN1Y2ggdG9kYXksIHNvCj4+IHVu
bGVzcyBleHBsaWNpdGx5IHN0YXRlZCB0byB0aGUgY29udHJhcnkgSSB0aGluayBhbnkgcmVwbGFj
ZW1lbnQKPj4gaW1wbGVtZW50YXRpb24gY2FuIGFuZCBzaG91bGQgbWFrZSB0aGUgc2FtZSBhc3N1
bXB0aW9ucyAvCj4+IGd1YXJhbnRlZXMuCj4gCj4gSW4gdGhhdCBjYXNlLCBIb25neWFuJ3MgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBzaG91bGQgYmUgZmluZS4gRmx1c2hpbmcKPiBpcyBkZWZlcnJl
ZCB0byB0aGUgbGFzdCBwb3NzaWJsZSBtb21lbnQgLS0gcmlnaHQgYmVmb3JlIG5leHQgdXNlLgoK
V2VsbCwgaW4gYSB3YXkuIFRoYXQncyBzdGlsbCBub3Qgd2hhdCB0aGUgY3VycmVudCBpbXBsZW1l
bnRhdGlvbgpkb2VzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
