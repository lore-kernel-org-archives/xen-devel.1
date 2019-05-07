Return-Path: <SRS0=TnSW=TH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D3EC004C9
	for <xen-devel@archiver.kernel.org>; Tue,  7 May 2019 07:41:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04E1A20989
	for <xen-devel@archiver.kernel.org>; Tue,  7 May 2019 07:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04E1A20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNuif-0004Zd-SZ; Tue, 07 May 2019 07:40:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNuif-0004ZX-2l
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 07:40:57 +0000
X-Inumbo-ID: 6e141c74-709b-11e9-a602-ffa1e724009d
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e141c74-709b-11e9-a602-ffa1e724009d;
 Tue, 07 May 2019 07:40:49 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 01:40:47 -0600
Message-Id: <5CD1367C020000780022C597@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 01:40:44 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
 <1556916614-21512-3-git-send-email-sstabellini@kernel.org>
 <5CCFF915020000780022C158@prv1-mh.provo.novell.com>
 <4d68ea2c-ee87-6ae4-41d5-502bf475bdb4@arm.com>
In-Reply-To: <4d68ea2c-ee87-6ae4-41d5-502bf475bdb4@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/3] xen/arm: fix mask calculation in
 init_pdx
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190507074044.2jGFXcFOJUAPZ5rOGU-9f7f-j2SIF4SLi_UjKQ0c24g@z>

Pj4+IE9uIDA2LjA1LjE5IGF0IDE3OjI2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDUvNi8xOSAxMDowNiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAzLjA1LjE5
IGF0IDIyOjUwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vc2V0dXAuYwo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPj4+IEBAIC00
ODEsMTAgKzQ4MSwxNSBAQCBzdGF0aWMgcGFkZHJfdCBfX2luaXQgbmV4dF9tb2R1bGUocGFkZHJf
dCBzLCBwYWRkcl90ICplbmQpCj4+PiAgIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3BkeCh2b2lk
KQo+Pj4gICB7Cj4+PiAgICAgICBwYWRkcl90IGJhbmtfc3RhcnQsIGJhbmtfc2l6ZSwgYmFua19l
bmQ7Cj4+PiAtCj4+PiAtICAgIHU2NCBtYXNrID0gcGR4X2luaXRfbWFzayhib290aW5mby5tZW0u
YmFua1swXS5zdGFydCk7Cj4+PiArICAgIHU2NCBtYXNrOwo+Pj4gICAgICAgaW50IGJhbms7Cj4+
PiAgIAo+Pj4gKyAgICAvKgo+Pj4gKyAgICAgKiBXZSBhbHdheXMgbWFwIHRoZSBmaXJzdCAxPDxN
QVhfT1JERVIgb2YgUkFNLCBoZW5jZSwgdGhleSBhcmUgbGVmdAo+PiAKPj4gIi4uLiBwYWdlcyBv
ZiBSQU0uIiA/Cj4+IAo+Pj4gKyAgICAgKiB1bmNvbXByZXNzZWQuCj4+PiArICAgICAqLwo+Pj4g
KyAgICBtYXNrID0gcGR4X2luaXRfbWFzaygxVUxMIDw8IChNQVhfT1JERVIgKyBQQUdFX1NISUZU
KSk7Cj4+IAo+PiBQQUdFX1NJWkUgPDwgTUFYX09SREVSPwo+IAo+IEhtbW0sIEkgYW0gbm90IGVu
dGlyZWx5IGNvbnZpbmNlIHRoaXMgd2lsbCBnaXZlIHRoZSBjb3JyZWN0IHZhbHVlIAo+IGJlY2F1
c2UgUEFHRV9TSVpFIGlzIGRlZmluZWQgYXMgKF9BQygxLCBMKSA8PCBQQUdFX1NISUZULgoKT2gs
IGluZGVlZCwgZm9yIGFuIGFic3RyYWN0IDMyLWJpdCBhcmNoIHRoaXMgd291bGQgZGUtZ2VuZXJh
dGUsIGR1ZQp0byBNQVhfT1JERVIgYmVpbmcgMjAuIE5ldmVydGhlbGVzcyBJIHRoaW5rIHRoZSBl
eHByZXNzaW9uIHVzZWQKaW52aXRlcyBmb3IgImNsZWFuaW5nIHVwIiAobWFraW5nIHRoZSBzYW1l
IG1pc3Rha2UgSSd2ZSBtYWRlKSwgYW5kCnNpbmNlIHRoaXMgaXMgaW4gQXJtLXNwZWNpZmljIGNv
ZGUgKHdoZXJlIE1BWF9PUkRFUiBpcyAxOCkgSSB0aGluayBpdAp3b3VsZCBzdGlsbCBiZSBiZXR0
ZXIgdG8gdXNlIHRoZSBzdWdnZXN0ZWQgYWx0ZXJuYXRpdmUuCgo+PiBJIHdvbmRlciB3aGV0aGVy
IHBkeF9pbml0X21hc2soKSBpdHNlbGYgd291bGRuJ3QgYmV0dGVyIGFwcGx5IHRoaXMKPj4gKGxv
d2VyKSBjYXAKPiAKPiBEbyB5b3UgbWVhbiBhbHdheXMgcmV0dXJuaW5nIChQQUdFX1NJWkUgPDwg
TUFYX09SREVSKSBvciBjYXBwaW5nIHRoZSAKPiBpbml0IG1hc2s/Cj4gCj4gTm90ZSB0aGF0IHRo
ZSBsYXRlciB3aWxsIG5vdCBwcm9kdWNlIHRoZSBzYW1lIGJlaGF2aW9yIGFzIHRoaXMgcGF0Y2gu
CgpTaW5jZSBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4gd2l0aCAiY2Fw
cGluZyB0aGUKaW5pdCBtYXNrIiwgSSdtIGFsc28gdW5jZXJ0YWluIHdoYXQgYWx0ZXJuYXRpdmUg
YmVoYXZpb3IgeW91J3JlCnRoaW5raW5nIG9mLiBXaGF0IEknbSBzdWdnZXN0aW5nIGlzCgp1NjQg
X19pbml0IHBkeF9pbml0X21hc2sodTY0IGJhc2VfYWRkcikKewogICAgcmV0dXJuIGZpbGxfbWFz
ayhtYXgoYmFzZV9hZGRyLCAodWludDY0X3QpUEFHRV9TSVpFIDw8IE1BWF9PUkRFUikgLSAxKTsK
fQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
