Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A55C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:26:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 197B120880
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 197B120880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDotQ-00009L-JI; Tue, 09 Apr 2019 11:26:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDjF=SL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDotP-00009E-F3
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:26:19 +0000
X-Inumbo-ID: 4b07c65a-5aba-11e9-a00b-c36e97961a95
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4b07c65a-5aba-11e9-a00b-c36e97961a95;
 Tue, 09 Apr 2019 11:26:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D10A7A78;
 Tue,  9 Apr 2019 04:26:17 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 552023F59C;
 Tue,  9 Apr 2019 04:26:16 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
 <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
Date: Tue, 9 Apr 2019 12:26:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
Content-Language: en-US
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409112614.HLczdEqgroaiR0PhrubVUetehw-kxDht58ycN-FPUR0@z>

SGkgSmFuLAoKT24gMDMvMDQvMjAxOSAxNDowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MDIuMDQuMTkgYXQgMTg6NDIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IC0tLSBh
L3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMveGVu
LmgKPj4gQEAgLTk3LDYgKzk3LDcgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX3Vsb25n
X3QpOwo+PiAgICNkZWZpbmUgX19IWVBFUlZJU09SX3NldF90aW1lcl9vcCAgICAgICAgIDE1Cj4+
ICAgI2RlZmluZSBfX0hZUEVSVklTT1JfZXZlbnRfY2hhbm5lbF9vcF9jb21wYXQgMTYgLyogY29t
cGF0IHNpbmNlIDB4MDAwMzAyMDIgKi8KPj4gICAjZGVmaW5lIF9fSFlQRVJWSVNPUl94ZW5fdmVy
c2lvbiAgICAgICAgICAxNwo+PiArLyogSFlQRVJWSVNPUl9jb25zb2xlX2lvKGludCBjbWQsIGlu
dCBjb3VudCwgWEVOX0dVRVNUX0hBTkRMRShjaGFyKSBidWZmZXIpOyAqLwo+PiAgICNkZWZpbmUg
X19IWVBFUlZJU09SX2NvbnNvbGVfaW8gICAgICAgICAgIDE4Cj4gCj4gSSBwcmV0dHkgc3Ryb25n
bHkgb2JqZWN0IHRvIHRoaXMgY29tbWVudCBnb2luZyB3aGVyZSB5b3UgcHV0IGl0Lgo+IEknZCBi
ZSBmaW5lIGlmIHlvdSBwdXQgaXQgLi4uCj4gCj4+IEBAIC00ODYsNyArNDg3LDI1IEBAIERFRklO
RV9YRU5fR1VFU1RfSEFORExFKG1tdWV4dF9vcF90KTsKPj4gICAvKiBgIH0gKi8KPj4gICAKPj4g
ICAvKgo+PiAtICogQ29tbWFuZHMgdG8gSFlQRVJWSVNPUl9jb25zb2xlX2lvKCkuCj4+ICsgKiBD
b21tYW5kcyB0byBIWVBFUlZJU09SX2NvbnNvbGVfaW8oKQo+IAo+IC4uLiBpbnRvIGhlcmUsIGp1
c3QgbGlrZSBkb25lIGZvciBIWVBFUlZJU09SX21tdWV4dF9vcCgpIGFuZAo+IEhZUEVSVklTT1Jf
dXBkYXRlX3ZhX21hcHBpbmcqKCkgaW1tZWRpYXRlbHkgYWJvdmUuIFRoaXMKPiB3b3VsZCB0aGVu
IGFsc28gaGVscCAuLi4KPiAKPj4gKyAqIEBjbWQ6IENvbW1hbmQgKHNlZSBiZWxvdykKPj4gKyAq
IEBjb3VudDogU2l6ZSBvZiB0aGUgYnVmZmVyIHRvIHJlYWQvd3JpdGUKPj4gKyAqIEBidWZmZXI6
IFBvaW50ZXIgaW4gdGhlIGd1ZXN0IG1lbW9yeQo+IAo+IC4uLiBhc3NvY2lhdGluZyB0aGVzZSBu
YW1lcy4KCk9rLgoKPiAKPiBBbHNvIHBsZWFzZSBub3RlIHRoZSBxdW90YXRpb24gdXNlZCBieSB0
aGUgbWVudGlvbmVkCj4gZXhpc3RpbmcgZG9jIGNvbW1lbnRzLCBhcyB3ZWxsIGFzIGEgZmV3IG90
aGVyIGZvcm1hbCBhc3BlY3RzCj4gKGxpa2UgdGhlbSBhbHNvIG1ha2luZyBjbGVhciB3aGF0IHRo
ZSByZXR1cm4gdHlwZSBpcykuIEkgdGhpbmsKPiB0aGF0J3MgYSBtb2RlbCB1c2VkIGVsc2V3aGVy
ZSBhcyB3ZWxsLCBzbyBJIHRoaW5rIHlvdSBzaG91bGQKPiBmb2xsb3cgaXQgaGVyZS4KCkkgaGF2
ZW4ndCByZXBsaWNhdGVkIHRoZSBgIGJlY2F1c2UgSSBoYXZlIG5vIGlkZWEgd2hhdCB0aGV5IGFy
ZSB1c2VkIGZvci4gSSAKd291bGQgYXBwcmVjaWF0ZSBpZiB5b3UgcHJvdmlkZSBwb2ludGVyIGhv
dyB0byB1c2UgdGhlbS4KCj4gCj4gVGhlIG90aGVyIHRoaW5nIGlzOiBBcyBtZW50aW9uZWQgZWxz
ZXdoZXJlLCBJIGRvbid0IHRoaW5rIHRoZQo+IGZpcnN0IHR3byBwYXJhbWV0ZXJzIHNob3VsZCBi
ZSBwbGFpbiBpbnQuIEknbSBub3QgaGFwcHkgdG8gc2VlCj4gdGhpcyBwcm9saWZlcmF0ZSBpbnRv
IGRvY3VtZW50YXRpb24gYXMgd2VsbCwgaS5lLiBJJ2QgcHJlZmVyIGlmCj4gdGhpcyB3YXMgY29y
cmVjdGVkIGJlZm9yZSBhZGRpbmcgZG9jdW1lbnRhdGlvbi4gV291bGQgeW91Cj4gYmUgd2lsbGlu
ZyB0byBkbyB0aGlzLCBvciBzaG91bGQgSSBhZGQgaXQgdG8gbXkgdG9kbyBsaXN0PwoKV2hpbGUg
c3dpdGNoaW5nIGZyb20gY21kIGZyb20gc2lnbmVkIHRvIHVuc2lnbmVkIHNob3VsZCBiZSBvay4g
VGhpcyB3b3VsZCAKaW50cm9kdWNlIGEgZGlmZmVyZW50IGJlaGF2aW9yIG9mIGZvciBjb3VudC4K
CkFyZSB3ZSBoYXBweSB3aXRoIHRoYXQsIG9yIHNoYWxsIHdlIGFkZCBhIGNoZWNrICgoaW50KWNv
dW50KSA+IDA/CgpJbiBhbnkgY2FzZSwgSSBhbSBoYXBweSB0byBoYXZlIGEgbG9vayBhdCBpdC4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
