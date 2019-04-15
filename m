Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAE8C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:43:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7CCA20684
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7CCA20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG1sr-0001wO-2x; Mon, 15 Apr 2019 13:42:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K9O8=SR=citrix.com=prvs=0011d4d25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hG1sq-0001wJ-3b
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:42:52 +0000
X-Inumbo-ID: 5c69f72b-5f84-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5c69f72b-5f84-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 13:42:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,353,1549929600"; d="scan'208";a="83579375"
Date: Mon, 15 Apr 2019 14:42:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20190415134247.GC1354@perard.uk.xensource.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-23-anthony.perard@citrix.com>
 <eed1a0b8-5c18-93a9-11f3-5ef8db05f5f4@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eed1a0b8-5c18-93a9-11f3-5ef8db05f5f4@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 22/31]
 OvmfPkg/XenPlatformPei: Rework memory detection
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415134247.C976IjMCADdtZyurrF3hp52gLnk0-PLtKmXF6JHKrr4@z>

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgMDE6MTU6NDhQTSArMDIwMCwgTGFzemxvIEVyc2VrIHdy
b3RlOgo+IE9uIDA0LzA5LzE5IDEzOjA4LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IFJld29y
ayBYZW5QdWJsaXNoUmFtUmVnaW9ucyBmb3IgUFZILCBoYW5kbGUgdGhlIFJlc2VydmUgdHlwZSBh
bmQgZXhwbGFpbgo+ID4gYWJvdXQgdGhlIEFDUEkgdHlwZS4gTVRSUiBzZXR0aW5ncyBhcmVuJ3Qg
bW9kaWZpZWQgYW55bW9yZSwgb24gSFZNLCBpdCdzCj4gPiBhbHJlYWR5IGRvbmUgYnkgaHZtbG9h
ZGVyLCBvbiBQVkggaXQgaXMgc3VwcG9zZWQgdG8gaGF2ZSBzYW5lIGRlZmF1bHQuCj4gPiAtLS0K
PiA+IE5vdGVzOgo+ID4gICAgIEFib3V0IE1UUlIsIHNob3VsZCB3ZSByZWRvIHRoZSBzZXR0aW5n
IGluIE9WTUY/IEV2ZW4gaWYgaW4gYm90aCBjYXNlIG9mCj4gPiAgICAgUFZIIGFuZCBIVk0sIHNv
bWV0aGluZyB3b3VsZCBoYXZlIHNldHVwIHRoZSBkZWZhdWx0IHR5cGUgdG8gd3JpdGUgYmFjawo+
ID4gICAgIGFuZCBoYW5kbGUgYSBmZXcgb3RoZXIgcmFuZ2VzIGxpa2UgUENJIGhvbGUsIGh2bWxv
YWRlciBmb3IgSFZNIG9yIGFuZAo+ID4gICAgIGxpYnhjIEkgdGhpbmsgZm9yIFBWSC4KPiAKPiBU
aGlzIHBhdGNoIGlzICpleGFjdGx5KiB0aGUga2luZCBvZiBjaGFuZ2UgdGhhdCBJIHdhbnQgdG8g
a2VlcCBhcyBmYXIgYXMKPiBwb3NzaWJsZSBhd2F5IGZyb20gY29kZSB0aGF0IHJ1bnMgKGV2ZW4g
aWYgaW4gcGFydCkgb24gUUVNVS4gRXZlcnkgdGltZQo+IEkgbmVlZCB0byB0b3VjaCBPdm1mUGtn
L1BsYXRmb3JtUGVpL01lbURldGVjdC5jLCBhbmQgaW4gcGFydGljdWxhciBnbwo+IG5lYXIgdGhl
IE1UUlIgc2V0dXAgb3IgdGhlIHBoeXNpY2FsIG1lbW9yeSBsYXlvdXQgKHJlc291cmNlIGRlc2Ny
aXB0b3IKPiBIT0JzLCBDUFUgYWRkcmVzcyB3aWR0aCwgZXRjKSwgSSBzdGFydCBjb252dWxzaW5n
LgoKU29ycnkgdG8gaGF2ZSBjYXVzZSB5b3UgZmVhci4gSSB3YXNuJ3Qgc3VnZ2VzdGluZyB0byBt
YWtlIGNoYW5nZXMgdG8KY29kZSB0aGF0IGNhbiBydW4gb24gc29tZXRoaW5nIGVsc2UgdGhhbiBY
ZW4uIFRoYXQgbm90ZXMgd2FzIHJlYWxseQphYm91dCBjb2RlIHRoYXQgb25seSBydW4gb24gWGVu
LCBiZWNhdXNlIHRoZSBwYXRjaCByZW1vdmVzIG9uZSB0aGluZwp0aGF0IE9WTUYgZG8gb24gWGVu
LCBhIE10cnJTZXRNZW1vcnlBdHRyaWJ1dGUoKS4gQWxzbywgSSdsbCBuZWVkIHRvIGhhdmUKWGVu
LWZvbGtzIHRvIGFuc3dlciB0aGUgcXVlc3Rpb24uCgo+IElmLCB1bmRlciAiT3ZtZlBrZy9QbGF0
Zm9ybVBlaS8iLCB5b3UgY291bGQgbGltaXQgeW91ciBjaGFuZ2VzIHRvCj4gIlhlbi5jIiwgSSdk
IGJlIE9LIHdpdGggdGhhdC4gT3RoZXJ3aXNlLCBwbGVhc2UgZG9uJ3QgZ28gbmVhciB0aGF0IGNv
ZGUuCgpDaGFuZ2VzIHdvdWxkIGJlIGxpbWl0ZWQgdG8gWGVuUGxhdGZvcm1QZWksIEkgd291bGRu
J3QgbmVlZCB0byBjaGFuZ2UKdGhlIGNvZGUgdGhhdCBydW5zIG9uIFFFTVUuCgo+IEFnYWluLCB0
aGlzIGlzICp0aGUqIGtpbmQgb2YgY2hhbmdlIHdoeSB3ZSBoYXZlIHRoZSBwbGF0Zm9ybSBzcGxp
dCAvCj4gZHVwbGljYXRpb24uCgpJJ20gZ2xhZCBpdCdzIHVzZWZ1bCB0byBoYXZlIGEgc2VwYXJh
dGVkIFhlblBsYXRmb3JtUGVpIG1vZHVsZS4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
