Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B380C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 17:30:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9AC22084D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 17:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9AC22084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEdWf-0006fH-RT; Thu, 11 Apr 2019 17:30:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SOEG=SN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hEdWe-0006fC-IY
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 17:30:12 +0000
X-Inumbo-ID: 75039b62-5c7f-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 75039b62-5c7f-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 17:30:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54649374;
 Thu, 11 Apr 2019 10:29:40 -0700 (PDT)
Received: from [10.37.12.69] (unknown [10.37.12.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B78B3F59C;
 Thu, 11 Apr 2019 10:29:39 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <23727.28813.996320.920228@mariner.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5e7611e1-a068-0cbb-1814-95ed527dc464@arm.com>
Date: Thu, 11 Apr 2019 18:29:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23727.28813.996320.920228@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] arndales, armhf osstest capacity
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
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411172938.CfiBK7VcyUTtsa1UtzqUOiBWbtjNCsILHukHgkc3uCk@z>

SGkgSWFuLAoKT24gNC8xMS8xOSA1OjUxIFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPiBJbiAiW09T
U1RFU1QgUEFUQ0ggMDAvNjJdIFVwZGF0ZSB0byBEZWJpYW4gc3RhYmxlIChzdHJldGNoKSIgSSB3
cm90ZToKPiAKPj4gICAqIEkgZXhwZXJpZW5jZWQgZGlmZmljdWx0aWVzIHdpdGggdGhlIDQgQXJu
ZGFsZSBkZXZib2FyZHM6IGhpZ2gKPj4gICAgIHByb2JhYmlsaXR5IGd1ZXN0IHN0YXJ0IGZhaWx1
cmVzLiAgRm9yIG5vdyBJIGhhdmUgbWFya2VkIHRob3NlCj4+ICAgICBub2RlcyBhcyB1bnN1aXRh
YmxlIGZvciB1c2Ugd2l0aCBzdHJldGNoLCB3aGljaCB3aWxsLCBlZmZlY3RpdmVseSwKPj4gICAg
IHRha2UgdGhlbSBvdXQgb2Ygc2VydmljZSAtIGFuZCBsZWF2ZSB1cyB3aXRoIGEgbGFjayBvZiBh
cm1oZgo+PiAgICAgY2FwYWNpdHkuICBJdCBpcyBwb3NzaWJsZSB0aGF0IHRoaXMgcHJvYmxlbSBp
cyBkdWUgdG8gdGhlCj4+ICAgICBpZnVwZG93bi1ob3RwbHVnIGlzc3VlLCBub3cgYWRkcmVzc2Vk
LCBzbyBJIHBsYW4gdG8gcmV0ZXN0Lgo+IAo+IEkgZm9yY2VkIHB1c2hlZCB0aGlzIHNlcmllcyBl
YXJsaWVyLiAgU28gdGhlIGFybmRhbGVzIGFyZSBub3cgb3V0IG9mCj4gc2VydmljZSBhbmQgc29v
biB3ZSB3aWxsIGhhdmUgdG8gZG8gc29tZXRoaW5nIGFib3V0IHRoZSBwcm9ibGVtcyB3aXRoCj4g
YXJtaGYgY2FwYWNpdHkuCj4gCj4gSSByZXJhbiB0aGUgdGVzdHMgd2l0aCBhIHZlcnNpb24gb2Yg
b3NzdGVzdCBib2RnZWQgdG8gbGV0IGl0IHJ1biBvbgo+IGhvc3RzIG5vdCBmbGFnZ2VkIGFzIHVz
ZWFibGUgd2l0aCBzdHJldGNoLCBhbmQ6Cj4gCj4gICAgZmxpZ2h0IDEzNDYzMSBvc3N0ZXN0IHBs
YXkgW2NvbW1pc3Npb24tYXJuZGFsZV0KPiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9q
ZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM0NjMxLwo+IAo+ICAgIEZhaWx1cmVzIDotLyBidXQgbm8g
cmVncmVzc2lvbnMuCj4gCj4gICAgVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLAo+ICAgIGlu
Y2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+ICAgICB0ZXN0LWFybWhmLWFy
bWhmLWV4YW1pbmUgICAgICA1IGhvc3QtaW5zdGFsbCAgICAgICAgICBicm9rZW4gYmFzZWxpbmUg
dW50ZXN0ZWQKPiAKPiBUaGUgYXJuZGFsZXMgd2VyZSB1bnJlbGlhYmxlIGJlZm9yZS4gIEJ1dCB0
aGlzIG9uZSBzZWVtcyBvZGQuICBJdAo+IGRvZXNuJ3Qgc2VlbSB0byBmaW5kIGl0cyBzdG9yYWdl
LgoKSXQgbG9va3MgbGlrZSB0byBtZSBhIG5ldHdvcmsgaXNzdWUuIFUtYm9vdCBpcyB0cnlpbmcg
dG8gY29udGludW91c2x5IApsb2FkIHRoZSBpbml0cmQgdmlhIHRmdHAgYmVjYXVzZSBnb3QgYSB0
aW1lb3V0IGZyb20sIEkgZ3Vlc3MsIHRoZSBVU0IgCmRyaXZlciBpbiBVLWJvb3QuCgpXZSBoYXZl
IGJlZW4gdXNpbmcgYSBwcmV0dHkgb2xkIFUtYm9vdCBvbiB0aGUgYXJuZGFsZS4gSSBhbSB3b25k
ZXJpbmcgCndoZXRoZXIgaXQgd291bGQgYmUgd29ydGggaGF2aW5nIGEgdHJ5IHRvIHVwZ3JhZGUg
dS1ib290IGFuZCBzZWUgaWYgaXQgCm1ha2VzIG1vcmUgcmVsaWFibGUuCgpNeSBvbmx5IHdvcnJ5
IGlzIEkgYW0gbm90IHN1cmUgaWYgSSBjYW4gZG8gdGhlIHVwZ3JhZGUgc2FmZWx5IHJlbW90ZWx5
LiAKSSB3b3VsZCBwcm9iYWJseSBuZWVkIHRvIGZpbmQgYSBib2FyZCBpbiBDYW1icmlkZ2UgZm9y
IHRyeWluZyBvdXQgdGhlIApmaXJtd2FyZSBmaXJzdC4KCj4gCj4gICAgIHRlc3QtYXJtaGYtYXJt
aGYtbGlidmlydCAgICAgMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICAgZmFpbCBiYXNlbGluZSB1
bnRlc3RlZAo+ICAgICB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgIDEyIGd1ZXN0LXN0YXJ0
ICAgICAgICAgICAgIGZhaWwgYmFzZWxpbmUgdW50ZXN0ZWQKPiAgICAgdGVzdC1hcm1oZi1hcm1o
Zi14bC1tdWx0aXZjcHUgMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICBmYWlsIGJhc2VsaW5lIHVu
dGVzdGVkCj4gICAgIHRlc3QtYXJtaGYtYXJtaGYteGwtY3JlZGl0MiAgMTIgZ3Vlc3Qtc3RhcnQg
ICAgICAgICAgICAgZmFpbCBiYXNlbGluZSB1bnRlc3RlZAo+ICAgICB0ZXN0LWFybWhmLWFybWhm
LXhsLWNyZWRpdDEgIDEyIGd1ZXN0LXN0YXJ0ICAgICAgICAgICAgIGZhaWwgYmFzZWxpbmUgdW50
ZXN0ZWQKPiAgICAgdGVzdC1hcm1oZi1hcm1oZi14bC1ydGRzICAgICAxMiBndWVzdC1zdGFydCAg
ICAgICAgICAgICBmYWlsIGJhc2VsaW5lIHVudGVzdGVkCj4gICAgIHRlc3QtYXJtaGYtYXJtaGYt
eGwtYXJuZGFsZSAgMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICAgZmFpbCBiYXNlbGluZSB1bnRl
c3RlZAo+IAo+IFRoaXMgaXMgdGhlIHJlYWwgcHJvYmxlbS4gIE9ubHkgMiBvZiB0aGUgdGVzdHMg
YWN0dWFsbHkgZ290IGZ1cnRoZXIKPiB0aGFuIHRoaXMuICBJdCB3b3JrcyBmaW5lIHdpdGggdGhl
IGN1YmlldHJ1Y2tzLgo+IAoKVGhlIGNvbW1vbiBwcm9ibGVtIHNlZW1zIHRvIGJlIHRoZSBuZXR3
b3JrLiBTb21lIG9mIHRoZSBsb2dzIGV2ZW4gaGF2ZToKClsgICAxNi45MTQ0MjddIElQdjY6IGV0
aDA6IElQdjYgZHVwbGljYXRlIGFkZHJlc3MgCmZlODA6OmE0NDY6MTNmZjpmZTc3OmU4MmYgZGV0
ZWN0ZWQhCgo+IEp1bGllbiBhbmQgU3RlZmFubywgd291bGQgeW91IGJlIGFibGUgdG8gbG9vayBh
dCB0aGlzIGFuZCBhZHZpc2UgPwoKV2UgaGF2ZW4ndCByZWFsbHkgdXBkYXRlZCB0aGUgTGludXgg
YnJhbmNoIHVzZWQgZm9yIHF1aXRlIGEgd2hpbGUuIFdlIAphcmUgdXNpbmcgYSBwcmV0dHkgb2xk
IHZlcnNpb24gb2YgNC4xNCAoLjE5IGFuZCB0aGUgY3VycmVudCBpcyAuMTExKS4gSXQgCmlzIHBv
c3NpYmxlIHRoYXQgYSBidWcgd2FzIGZpeGVkIGluIG5ld2VyIHJlbGVhc2Ugb2YgNC4xNC4KCj4g
T24gdGhlIHBsdXMgc2lkZSwgdGhlIHR3byBUaHVuZGVyWCBtYWNoaW5lcyBhcmUgbm93IGluIHNl
cnZpY2UuCgpZb3Vob3UhIEp1c3QgaW4gdGltZSBmb3IgdGhlIDJuZCBhbm5pdmVyc2FyeSBvZiB0
aGVpciBwdXJjaGFzZSA6KS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
