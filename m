Return-Path: <SRS0=IlRI=X5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F113C47404
	for <xen-devel@archiver.kernel.org>; Fri,  4 Oct 2019 04:47:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 184422133F
	for <xen-devel@archiver.kernel.org>; Fri,  4 Oct 2019 04:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 184422133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGFUc-000444-4g; Fri, 04 Oct 2019 04:47:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lyic=X5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iGFUb-00043z-Ht
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 04:47:01 +0000
X-Inumbo-ID: 0014a1b6-e662-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0014a1b6-e662-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 04:46:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BED87B071;
 Fri,  4 Oct 2019 04:46:58 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190930205618.29942-1-sstabellini@kernel.org>
 <53deb838-677a-5d4b-7b40-fcdb935751cc@gmail.com>
 <e5f4a172-3215-0128-bab4-cc0afedcce82@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <994271eb-25be-02cb-5279-a0381373b557@suse.com>
Date: Fri, 4 Oct 2019 06:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e5f4a172-3215-0128-bab4-cc0afedcce82@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: boot with device trees
 with "mmu-masters" and "iommus"
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMTkgMTk6MDIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiArSnVlcmdlbgo+IAo+IEhp
LAo+IAo+IE9uIDEwLzEvMTkgNDoxNiBQTSwgT2xla3NhbmRyIHdyb3RlOgo+Pgo+PiBPbiAzMC4w
OS4xOSAyMzo1NiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pgo+PiBIaSBTdGVmYW5vCj4+
Cj4+PiBTb21lIERldmljZSBUcmVlcyBtYXkgZXhwb3NlIGJvdGggbGVnYWN5IFNNTVUgYW5kIGdl
bmVyaWMgSU9NTVUgYmluZGluZ3MKPj4+IHRvZ2V0aGVyLiBIb3dldmVyLCB0aGUgU01NVSBkcml2
ZXIgaW4gWGVuIGlzIG9ubHkgc3VwcG9ydGluZyB0aGUgbGVnYWN5Cj4+PiBTTU1VIGJpbmRpbmdz
LCBsZWFkaW5nIHRvIGZhdGFsIGluaXRpYWxpemF0aW9uIGVycm9ycyBhdCBib290IHRpbWUuCj4+
Pgo+Pj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgYm9vdGluZyBwcm9ibGVtIGJ5IGFkZGluZyBhIGNo
ZWNrIHRvCj4+PiBpb21tdV9hZGRfZHRfZGV2aWNlOiBpZiB0aGUgWGVuIGRyaXZlciBkb2Vzbid0
IHN1cHBvcnQgdGhlIG5ldyBnZW5lcmljCj4+PiBiaW5kaW5ncywgYW5kIHRoZSBkZXZpY2UgaXMg
YmVoaW5kIGFuIElPTU1VLCBkbyBub3QgcmV0dXJuIGVycm9yLiBUaGUKPj4+IGZvbGxvd2luZyBp
b21tdV9hc3NpZ25fZHRfZGV2aWNlIHNob3VsZCBzdWNjZWVkLgo+Pj4KPj4+IFRoaXMgY2hlY2sg
d2lsbCBiZWNvbWUgc3VwZXJmbHVvdXMsIGhlbmNlIHJlbW92YWJsZSwgb25jZSB0aGUgWGVuIFNN
TVUKPj4+IGRyaXZlciBnZXRzIHN1cHBvcnQgZm9yIHRoZSBnZW5lcmljIElPTU1VIGJpbmRpbmdz
Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFi
ZWxsaW5pQHhpbGlueC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
