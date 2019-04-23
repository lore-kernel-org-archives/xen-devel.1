Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4EAC10F03
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 17:32:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86F10206BA
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 17:32:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9J3gpe8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86F10206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIzHP-0007mS-Jk; Tue, 23 Apr 2019 17:32:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DWbD=SZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hIzHO-0007mL-Od
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 17:32:26 +0000
X-Inumbo-ID: c259fb68-65ed-11e9-90a3-df7465823742
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c259fb68-65ed-11e9-90a3-df7465823742;
 Tue, 23 Apr 2019 17:32:25 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4C48206BA;
 Tue, 23 Apr 2019 17:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556040745;
 bh=E/y2ZjsfsgO+xmCmpAicrJuZGgmiz9ivCGNdrvikYV8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=P9J3gpe8sfWbPRESDlWvEC9/fzvWn9E8t7C78I271m2TqczDWOZlX5pJi3JadREgn
 voqsUJJEYXVMpOaksrgjJ153CtwjM2yURlk7cs2UP04P+N8I0dAcfY/xHG8WdhazGX
 kQeRBFuQmWCc4WG6rcgRAsXUldcJ7pKFU1uOFOIs=
Date: Tue, 23 Apr 2019 10:32:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <811a9368-c6c6-a4ae-1101-f4aac16adc7b@arm.com>
Message-ID: <alpine.DEB.2.10.1904231028540.24598@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-5-git-send-email-sstabellini@kernel.org>
 <96e6defa-5c7b-81e2-a85e-f02884f339fb@arm.com>
 <alpine.DEB.2.10.1904221531470.1370@sstabellini-ThinkPad-X260>
 <811a9368-c6c6-a4ae-1101-f4aac16adc7b@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 5/6] xen/arm: map reserved-memory regions as
 normal memory in dom0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423173224.n1mY6kfKBgXtEzQAv6ZYBwv7ofCuMggMKr1_mvomf3E@z>

T24gVHVlLCAyMyBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gNC8yMi8xOSAxMTo0MiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
VHVlLCAyNiBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gSSBhbSBub3Qgc3VyZSBh
Ym91dCB0aGUgc3VnZ2VzdGlvbiBvZiByZS11c2luZyB0aGUgbGliZmR0IGNvbmNlcHQgb2YKPiA+
ICJtZW1fcnN2Iiwgd2hpY2ggaXMgbWVhbnQgdG8gYmUgZm9yIHRoZSBvbGQgL21lbXJlc2VydmUv
LiBUb2RheSwgbGliZmR0Cj4gPiAoYXQgbGVhc3Qgb3VyIHZlcnNpb24gb2YgaXQpIGlzIG5vdCBh
YmxlIHRvIHBhcnNlIHRoZSBuZXcKPiA+IHJlc2VydmVkLW1lbW9yeSBiaW5kaW5ncy4gSSBkb24n
dCB0aGluayBpdCBpcyBhIGdvb2QgaWRlYSB0byBtb2RpZnkKPiA+IGxpYmZkdCBmb3IgdGhhdC4g
QWxzbywgdGhlIHdheSB3ZSB3YW50IHRvIGhhbmRsZSB0aGUgb2xkIG1lbXJlc2VydmUKPiA+IHJl
Z2lvbnMgaXMgcXVpdGUgZGlmZmVyZW50IGZyb20gdGhlIHdheSB3ZSB3YW50IHRvIGhhbmRsZQo+
ID4gcmVzZXJ2ZWQtbWVtb3J5LCByaWdodD8gSSBjYW5ub3Qgc2VlIGEgd2F5IHRvIGltcHJvdmUg
dGhpcyBjb2RlIHVzaW5nCj4gPiBtZW1fcnN2IGF0IHRoZSBtb21lbnQuCj4gCj4gSSBkaWRuJ3Qg
bWVhbiB0byBleHRlbmQgbWVtX3JzdiBpbiBsaWJmZHQgYnV0IGV4dGVuZCBjb25zaWRlcl9tb2R1
bGVzIGFuZAo+IGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyB0byBkZWFsIHdpdGggL3Jlc2VydmVkLW1l
bW9yeS4gT3RoZXJ3aXNlIHlvdQo+IG1heSBtaXNzIHNvbWUgY2FzZXMgKGZvciBpbnN0YW5jZSB5
b3UgbGVmdCBvdXQgZGlzY2FyZF9pbml0aWFsX21vZHVsZXMpLgo+IAo+IEJ5IGV4dGVuZGluZyB0
aG9zZSB0d28gZnVuY3Rpb25zIHlvdSBkb24ndCBoYXZlIHRvIHRlYWNoIGV2ZXJ5b25lIGhvdyB0
byBza2lwCj4gL3Jlc2VydmVkLW1lbW9yeS4KCkkgdGhpbmsgSSBnZXQgeW91ciBwb2ludCBub3cu
IEFsdGhvdWdoIEkgZG9uJ3QgdGhpbmsgaXQgc2hvdWxkIGJlCmNvcnJlY3QgZm9yIGEgYm9vdGxv
YWRlciB0byB1c2UgYSByZXNlcnZlZC1tZW1vcnkgYXJlYSB0byBzdG9yZSBhIGJvb3QKbW9kdWxl
LCBJIHdvdWxkbid0IGJlIHN1cHJpc2VkIGlmIHRoYXQgaGFwcGVucywgc28gaXQgaXMgYmV0dGVy
IHRvIGJlCnByZXBhcmVkIGFuZCBleHRlbmQgZHRfdW5yZXNlcnZlZF9yZWdpb25zLiBJJ2xsIGRv
IHRoYXQuCgpIb3dldmVyLCB3ZSB3b3VsZCBzdGlsbCBuZWVkIHNvbWV0aGluZyBsaWtlIGNoZWNr
X3Jlc2VydmVkX21lbW9yeSwKYmVjYXVzZSB3ZSBkb24ndCB3YW50IHNldHVwX3hlbmhlYXBfbWFw
cGluZ3MgdG8gYmUgY2FsbGVkIG9uIHRoZQpyZXNlcnZlZC1tZW1vcnkgYXJlYSAob3IgYSBtZW1v
cnkgcmVnaW9uIGluY2x1ZGluZyB0aGUgcmVzZXJ2ZWQgbWVtb3J5CmFyZWEpIGluIHNldHVwX21t
LiBJIGRvbid0IHRoaW5rIHdlIGNhbiBnZXQgYXdheSB3aXRob3V0IGl0LCBidXQgSSBjYW4Kc2lt
cGxpZnkgaXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
