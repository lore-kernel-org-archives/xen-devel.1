Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19A8C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 20:43:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F73420693
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 20:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3L2g1IJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F73420693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGUuu-00012q-VW; Tue, 16 Apr 2019 20:42:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGUut-00012l-PN
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 20:42:55 +0000
X-Inumbo-ID: 357a5c37-6088-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 357a5c37-6088-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 20:42:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E63120693;
 Tue, 16 Apr 2019 20:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555447373;
 bh=6WyUK3AugUy19/kUiilKKL8k8vL6XdLBOhpz+DWpv6M=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=k3L2g1IJwAKShRm+PdToKwpO66B7h6ckGhDHE3gqQ7d8Ym9ec6lW7TVqLzXnvQ0rO
 AyG+FVGYxEI/RfEgB9wNO6aREyH2lZvAdEq/eHMMgaxLfrUm8/SKUsfN4357d7PBg5
 iBOOEKfuhpg+U8AZCS76fDp3aHjirRdKQ143VMTs=
Date: Tue, 16 Apr 2019 13:42:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190402164238.1815-4-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904161336500.1370@sstabellini-ThinkPad-X260>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/4] xen/public: Document
 HYPERCALL_console_io()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416204252.8Kq8i2myuwI6aFU8pMWsToo2AZjGR9bM6HhDT2CPPxM@z>

T24gVHVlLCAyIEFwciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQ3VycmVudGx5LCBPUyBk
ZXZlbG9wcGVycyB3aWxsIGhhdmUgdG8gbG9vayBhdCBYZW4gY29kZSBpbiBvcmRlciB0byBrbm93
Cj4gdGhlIHBhcmFtZXRlcnMgb2YgYW4gaHlwZXJjYWxsIGFuZCBob3cgaXQgaXMgbWVhbnQgdG8g
d29yay4KPiAKPiBUaGlzIGlzIG5vdCBhIHRyaXZpYWwgdGFzayBhcyB5b3UgbWF5IG5lZWQgdG8g
aGF2ZSBhIGRlZXAgdW5kZXJzdGFuZGluZwo+IG9mIFhlbiBpbnRlcm5hbC4KPiAKPiBUaGlzIHBh
dGNoIGF0dGVtcHRzIHRvIGRvY3VtZW50IHRoZSBiZWhhdmlvciBvZiBIWVBFUkNBTExfY29uc29s
ZV9pbygpIHRvCj4gaGVscCBPUyBkZXZlbG9wZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkkgbG92ZSB0aGlzLCB0aGFuayB5b3UhCgoK
PiAtLS0KPiAKPiBUaGlzIGlzIGEgZmlyc3QgYXR0ZW1wdCB0byBhZGRyZXNzIHRoZSBsYWNrIG9u
IGRvY3VtZW50YXRpb24gZm9yCj4gaHlwZXJjYWxscy4gV2UgbWF5IHdhbnQgdG8gZGVjaWRlIGEg
Zm9ybWF0IHRvIHVzZSBpbiBldmVyeSBoeXBlcmNhbGwgc28KPiBpdCBjYW4gYmUgcmVhZGFibGUg
Zm9yIHRoZSBPUyBkZXZlbG9wZXIgYW5kIGVhc2lseSBjb25zdW1tZWQgYnkKPiBkb2N1bWVudGF0
aW9uIHRvb2xzLgo+IC0tLQo+ICB4ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmggfCAyMSArKysrKysr
KysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oIGIveGVu
L2luY2x1ZGUvcHVibGljL3hlbi5oCj4gaW5kZXggY2NkZmZjMGFkMS4uN2MxMTljNjc4MiAxMDA2
NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKPiArKysgYi94ZW4vaW5jbHVkZS9w
dWJsaWMveGVuLmgKPiBAQCAtOTcsNiArOTcsNyBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4
ZW5fdWxvbmdfdCk7Cj4gICNkZWZpbmUgX19IWVBFUlZJU09SX3NldF90aW1lcl9vcCAgICAgICAg
IDE1Cj4gICNkZWZpbmUgX19IWVBFUlZJU09SX2V2ZW50X2NoYW5uZWxfb3BfY29tcGF0IDE2IC8q
IGNvbXBhdCBzaW5jZSAweDAwMDMwMjAyICovCj4gICNkZWZpbmUgX19IWVBFUlZJU09SX3hlbl92
ZXJzaW9uICAgICAgICAgIDE3Cj4gKy8qIEhZUEVSVklTT1JfY29uc29sZV9pbyhpbnQgY21kLCBp
bnQgY291bnQsIFhFTl9HVUVTVF9IQU5ETEUoY2hhcikgYnVmZmVyKTsgKi8KCkkgYWdyZWUgd2l0
aCBKYW46IEkgd291bGRuJ3QgcHV0IHRoaXMgY29tbWVudCBoZXJlLiBNYXliZSBkb3duIGJlbG93
CndpdGggdGhlIG90aGVyIGNvbW1lbnQuIFRoZSByZWFzb24gaXMgdGhhdCBJIHRoaW5rIGl0IHdv
dWxkIGJlIGJlc3Qgbm90CnRvIGJyZWFrIHRoZSBzaW1wbGUgbGlzdCBvZiBoeXBlcmNhbGwgbnVt
YmVycy4KCgo+ICAjZGVmaW5lIF9fSFlQRVJWSVNPUl9jb25zb2xlX2lvICAgICAgICAgICAxOAo+
ICAjZGVmaW5lIF9fSFlQRVJWSVNPUl9waHlzZGV2X29wX2NvbXBhdCAgICAxOSAvKiBjb21wYXQg
c2luY2UgMHgwMDAzMDIwMiAqLwo+ICAjZGVmaW5lIF9fSFlQRVJWSVNPUl9ncmFudF90YWJsZV9v
cCAgICAgICAyMAo+IEBAIC00ODYsNyArNDg3LDI1IEBAIERFRklORV9YRU5fR1VFU1RfSEFORExF
KG1tdWV4dF9vcF90KTsKPiAgLyogYCB9ICovCj4gIAo+ICAvKgo+IC0gKiBDb21tYW5kcyB0byBI
WVBFUlZJU09SX2NvbnNvbGVfaW8oKS4KPiArICogQ29tbWFuZHMgdG8gSFlQRVJWSVNPUl9jb25z
b2xlX2lvKCkKPiArICoKPiArICogQGNtZDogQ29tbWFuZCAoc2VlIGJlbG93KQo+ICsgKiBAY291
bnQ6IFNpemUgb2YgdGhlIGJ1ZmZlciB0byByZWFkL3dyaXRlCj4gKyAqIEBidWZmZXI6IFBvaW50
ZXIgaW4gdGhlIGd1ZXN0IG1lbW9yeQo+ICsgKgo+ICsgKiBMaXN0IG9mIGNvbW1hbmRzOgo+ICsg
Kgo+ICsgKiAgKiBDT05TT0xFSU9fd3JpdGU6IFdyaXRlIHRoZSBidWZmZXIgb24gWGVuIGNvbnNv
bGUuCj4gKyAqICAgICAgRm9yIHRoZSBoYXJkd2FyZSBkb21haW4sIGFsbCB0aGUgY2hhcmFjdGVy
cyBpbiB0aGUgYnVmZmVyIHdpbGwKPiArICogICAgICBiZSB3cml0dGVuLiBDaGFyYWN0ZXJzIHdp
bGwgYmUgcHJpbnRlZCB0byBkaXJlY3RseSB0byB0aGUKPiArICogICAgICBjb25zb2xlLgo+ICsg
KiAgICAgIEZvciBhbGwgdGhlIG90aGVyIGRvbWFpbnMsIG9ubHkgdGhlIHByaW50YWJsZSBjaGFy
YWN0ZXJzIHdpbGwgYmUKPiArICogICAgICB3cml0dGVuLiBDaGFyYWN0ZXJzIG1heSBiZSBidWZm
ZXJlZCB1bnRpbCBhIG5ld2xpbmUgKGkuZSAnXG4nKSBpcwo+ICsgKiAgICAgIGZvdW5kLgo+ICsg
KiAgICAgIFJldHVybiAwIG9uIHN1Y2Nlc3MsIG90aGVyd2lzZSByZXR1cm4gYW4gZXJyb3IgY29k
ZS4KPiArICogICogQ09OU09MRV9yZWFkOiBBdHRlbXB0cyB0byByZWFkIHVwIEBjb3VudCBjaGFy
YWN0ZXJzIGZyb20gWGVuIGNvbnNvbGUuCj4gKyAqICAgICAgUmV0dXJuIHRoZSBudW1iZXIgb2Yg
Y2hhcmFjdGVyIHJlYWQgb24gc3VjY2Vzcywgb3RoZXJ3aXNlIHJldHVybgo+ICsgKiAgICAgIGFu
IGVycm9yIGNvZGUuCgpUaGlzIGlzIGdyZWF0ISBNeSBvbmx5IHN1Z2dlc3Rpb24gZm9yIGltcHJv
dmVtZW50IHdvdWxkIGJlIHRvIHVzZSBhCnNwZWNpYWwgYW5ub3RhdGlvbiBmb3IgdGhlIHJldHVy
biB2YWx1ZS4gSSB0aGluayBpdCB3b3VsZCBtYWtlIGl0IGVhc2llcgp0byBzcG90LiBNYXliZSBz
b21ldGhpbmcgbGlrZSBAcmV0dXJuOgoKICogQ09OU09MRUlPX3dyaXRlOiBXcml0ZSB0aGUgYnVm
ZmVyIG9uIFhlbiBjb25zb2xlLgogICAgIEZvciB0aGUgaGFyZHdhcmUgZG9tYWluLCBhbGwgdGhl
IGNoYXJhY3RlcnMgaW4gdGhlIGJ1ZmZlciB3aWxsCiAgICAgYmUgd3JpdHRlbi4gQ2hhcmFjdGVy
cyB3aWxsIGJlIHByaW50ZWQgdG8gZGlyZWN0bHkgdG8gdGhlCiAgICAgY29uc29sZS4KICAgICBG
b3IgYWxsIHRoZSBvdGhlciBkb21haW5zLCBvbmx5IHRoZSBwcmludGFibGUgY2hhcmFjdGVycyB3
aWxsIGJlCiAgICAgd3JpdHRlbi4gQ2hhcmFjdGVycyBtYXkgYmUgYnVmZmVyZWQgdW50aWwgYSBu
ZXdsaW5lIChpLmUgJ1xuJykgaXMKICAgICBmb3VuZC4KICAgICBAcmV0dXJuOiAwIG9uIHN1Y2Nl
c3MsIG90aGVyd2lzZSByZXR1cm4gYW4gZXJyb3IgY29kZS4KICogQ09OU09MRV9yZWFkOiBBdHRl
bXB0cyB0byByZWFkIHVwIEBjb3VudCBjaGFyYWN0ZXJzIGZyb20gWGVuIGNvbnNvbGUuCiAgICAg
QHJldHVybjogdGhlIG51bWJlciBvZiBjaGFyYWN0ZXIgcmVhZCBvbiBzdWNjZXNzLCBvdGhlcndp
c2UgcmV0dXJuCiAgICAgICAgICAgICAgYW4gZXJyb3IgY29kZS4KCgo+ICAjZGVmaW5lIENPTlNP
TEVJT193cml0ZSAgICAgICAgIDAKPiAgI2RlZmluZSBDT05TT0xFSU9fcmVhZCAgICAgICAgICAx
Cj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
