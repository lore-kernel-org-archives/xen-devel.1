Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E881C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:25:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06172183F
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06172183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGs3N-00069t-Em; Wed, 17 Apr 2019 21:25:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGs3M-00069m-1x
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 21:25:12 +0000
X-Inumbo-ID: 4797aef6-6157-11e9-804f-3f9f0c5e0a43
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4797aef6-6157-11e9-804f-3f9f0c5e0a43;
 Wed, 17 Apr 2019 21:25:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A1E515AB;
 Wed, 17 Apr 2019 14:25:10 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1B6F3F59C;
 Wed, 17 Apr 2019 14:25:08 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <JBeulich@suse.com>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <5C766799020000780021AA28@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1904171359470.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <28e234b7-7678-6064-37fb-7518756a3c12@arm.com>
Date: Wed, 17 Apr 2019 22:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904171359470.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417212506.isg4jhxg9cNEDqliqm4K_2wJ5gHwWNLlrSZAyaEvdIM@z>

SGksCgpPbiA0LzE3LzE5IDEwOjEyIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
V2VkLCAyNyBGZWIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI3LjAyLjE5IGF0
IDAwOjA3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5j
bHVkZS9wdWJsaWMvZG9tY3RsLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwu
aAo+Pj4gQEAgLTU3MSwxMiArNTcxLDE0IEBAIHN0cnVjdCB4ZW5fZG9tY3RsX2JpbmRfcHRfaXJx
IHsKPj4+ICAgKi8KPj4+ICAgI2RlZmluZSBEUENJX0FERF9NQVBQSU5HICAgICAgICAgMQo+Pj4g
ICAjZGVmaW5lIERQQ0lfUkVNT1ZFX01BUFBJTkcgICAgICAwCj4+PiArI2RlZmluZSBDQUNIRUFC
SUxJVFlfREVWTUVNICAgICAgMCAvKiBkZXZpY2UgbWVtb3J5LCB0aGUgZGVmYXVsdCAqLwo+Pj4g
KyNkZWZpbmUgQ0FDSEVBQklMSVRZX01FTU9SWSAgICAgIDEgLyogbm9ybWFsIG1lbW9yeSAqLwo+
Pj4gICBzdHJ1Y3QgeGVuX2RvbWN0bF9tZW1vcnlfbWFwcGluZyB7Cj4+PiAgICAgICB1aW50NjRf
YWxpZ25lZF90IGZpcnN0X2dmbjsgLyogZmlyc3QgcGFnZSAoaHZtIGd1ZXN0IHBoeXMgcGFnZSkg
aW4gcmFuZ2UgKi8KPj4+ICAgICAgIHVpbnQ2NF9hbGlnbmVkX3QgZmlyc3RfbWZuOyAvKiBmaXJz
dCBwYWdlIChtYWNoaW5lIHBhZ2UpIGluIHJhbmdlICovCj4+PiAgICAgICB1aW50NjRfYWxpZ25l
ZF90IG5yX21mbnM7ICAgLyogbnVtYmVyIG9mIHBhZ2VzIGluIHJhbmdlICg+MCkgKi8KPj4+ICAg
ICAgIHVpbnQzMl90IGFkZF9tYXBwaW5nOyAgICAgICAvKiBhZGQgb3IgcmVtb3ZlIG1hcHBpbmcg
Ki8KPj4+IC0gICAgdWludDMyX3QgcGFkZGluZzsgICAgICAgICAgIC8qIHBhZGRpbmcgZm9yIDY0
LWJpdCBhbGlnbmVkIHN0cnVjdHVyZSAqLwo+Pj4gKyAgICB1aW50MzJfdCBjYWNoZV9wb2xpY3k7
ICAgICAgLyogY2FjaGVhYmlsaXR5IG9mIHRoZSBtZW1vcnkgbWFwcGluZyAqLwo+Pj4gICB9Owo+
Pgo+PiBJIGRvbid0IHRoaW5rIERFVk1FTSBhbmQgTUVNT1JZIGFyZSBhbnl3aGVyZSBuZWFyIGRl
c2NyaXB0aXZlCj4+IGVub3VnaCwgbm9yIC0gaWYgd2Ugd2FudCBzdWNoIGNvbnRyb2wgYW55d2F5
IC0gZmxleGlibGUgZW5vdWdoLiBJCj4+IHRoaW5rIHdoYXQgeW91IHdhbnQgaXMgdG8gYWN0dWFs
bHkgc3BlY2lmeSBjYWNoYWJpbGl0eSwgYWxsb3dpbmcgb24KPj4geDg2IHRvIGUuZy4gbWFwIGZy
YW1lIGJ1ZmZlcnMgb3IgYWxpa2UgV0MuIFRoZSBhdHRyaWJ1dGUgdGhlbgo+PiB3b3VsZCAob2J2
aW91c2x5IGFuZCBuZWNlc3NhcmlseSkgYmUgYXJjaGl0ZWN0dXJlIHNwZWNpZmljLgo+IAo+IFll
cywgSSBhZ3JlZSB3aXRoIHdoYXQgeW91IHdyb3RlLCBhbmQgYWxzbyB3aXRoIHdoYXQgSnVsaWVu
IHdyb3RlLiBOb3cKPiB0aGUgcXVlc3Rpb24gaXMgaG93IGRvIHlvdSBib3RoIHRoaW5rIHRoaXMg
c2hvdWxkIGxvb2sgbGlrZSBpbiBtb3JlCj4gZGV0YWlsczoKPiAKPiAtIGFyZSB5b3UgT0sgd2l0
aCB1c2luZyBtZW1vcnlfcG9saWN5IGluc3RlYWQgb2YgY2FjaGVfcG9saWN5IGxpa2UKPiAgICBK
dWxpZW4ncyBzdWdnZXN0ZWQgYXMgbmFtZSBmb3IgdGhlIGZpZWxkPwo+IC0gYXJlIHlvdSBPSyB3
aXRoIHVzaW5nICNkZWZpbmVzIGZvciB0aGUgdmFsdWVzPwo+IC0gc2hvdWxkIHRoZSAjZGVmaW5l
cyBmb3IgYm90aCB4ODYgYW5kIEFybSBiZSBkZWZpbmVkIGhlcmUgb3IgaW4gb3RoZXIKPiAgICBo
ZWFkZXJzPwo+IC0gd2hhdCB2YWx1ZXMgd291bGQgeW91IGxpa2UgdG8gc2VlIGZvciB4ODY/Cj4g
Cj4gRm9yIEFybSwgdGhlIG9uZXMgSSBjYXJlIGFib3V0IGFyZToKPiAKPiAtIHAybV9tbWlvX2Rp
cmVjdF9kZXYKPiAtIHAybV9tbWlvX2RpcmVjdF9jCgpGaXJzdCBzdGVwIGZpcnN0LiBXaGF0IGFy
ZSB0aGUgcmVhc29uIHRvIGhhdmUgcDJtX21taW9fZGlyZWN0X2M/IElzIGl0IApvbmx5IGZvciBt
ZW1vcnkgc2hhcmluZyBiZXR3ZWVuIERvbVUgYW5kIERvbTA/CgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
