Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3321DC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:08:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B02020675
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B02020675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGo2O-00085N-SU; Wed, 17 Apr 2019 17:07:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGo2O-00085I-9j
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 17:07:56 +0000
X-Inumbo-ID: 57198aa9-6133-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 57198aa9-6133-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 17:07:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B6C480D;
 Wed, 17 Apr 2019 10:07:54 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 716DA3F557;
 Wed, 17 Apr 2019 10:07:53 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-2-julien.grall@arm.com>
 <alpine.DEB.2.10.1904151453080.29275@sstabellini-ThinkPad-X260>
 <b92d3ffc-0dd9-ddfb-cee0-664f61ee2ff9@arm.com>
 <alpine.DEB.2.10.1904151522330.29275@sstabellini-ThinkPad-X260>
 <c3e5008c-7dd2-61b5-bec1-287b310a471c@arm.com>
Message-ID: <02478ff8-d1e2-abe1-74a5-ca72ab87f154@arm.com>
Date: Wed, 17 Apr 2019 18:07:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c3e5008c-7dd2-61b5-bec1-287b310a471c@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next 1/9] xen/arm: Use mfn_to_pdx
 instead of pfn_to_pdx when possible
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <JBeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417170751.xRGOlHxAac53wKu4Ox_HjR3aYq3VKLn5RSP9knKrshI@z>

KCsgQW5kcmV3IGFuZCBKYW4pCgpPbiAxNS8wNC8yMDE5IDIzOjQyLCBKdWxpZW4gR3JhbGwgd3Jv
dGU6Cj4gSGksCj4gCj4gT24gNC8xNS8xOSAxMToyNSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOgo+PiBPbiBNb24sIDE1IEFwciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSwK
Pj4+Cj4+PiBPbiA0LzE1LzE5IDEwOjU1IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+
Pj4gT24gTW9uLCAxOCBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+PiBtZm5fdG9f
cGR4IGFkZHMgbW9yZSBzYWZldHkgdGhhbiBwZm5fdG9fcGR4LiBSZXBsYWNlIGFsbCBidXQgb24g
cGxhY2UgaW4KPj4+Pj4gdGhlIEFybSBjb2RlIHRvIHVzZSB0aGUgZm9ybWVyLgo+Pj4+Cj4+Pj4g
VGhpcyBpcyBnb29kIGJ1dCBtYXliZSB3ZSBjYW4gZ28gZXZlbiBmdXJ0aGVyLgo+Pj4+Cj4+Pj4g
WW91IHNob3VsZCBhbHNvIGJlIGFibGUgdG8gcmVwbGFjZSBvbmUgY2FsbCBzaXRlIG9mIHBmbl90
b19wZHggaW4KPj4+PiBtZm5fdmFsaWQgYW5kIHRoZSBvbmUgaW4gbWFkZHJfdG9fdmlydC4gU29t
ZXRoaW5nIGxpa2UgdGhpczoKPj4+Pgo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS1hcm0vbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+Pj4+IGluZGV4IGVhZmEy
NmYuLmIzNDU1ZWEgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4+
Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4+Pj4gQEAgLTIwOSw3ICsyMDksNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAqaW9yZW1hcF93YyhwYWRkcl90IHN0YXJ0LAo+
Pj4+IHNpemVfdCBsZW4pCj4+Pj4gwqDCoCAvKiBYWFggLS0gYWNjb3VudCBmb3IgYmFzZSAqLwo+
Pj4+IMKgwqAgI2RlZmluZSBtZm5fdmFsaWQobWZuKcKgwqDCoMKgwqDCoMKgICh7Cj4+Pj4gXAo+
Pj4+IMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIF9fbV9mX24gPSBtZm5feChtZm4pOwo+Pj4+
IFwKPj4+PiAtwqDCoMKgIGxpa2VseShwZm5fdG9fcGR4KF9fbV9mX24pID49IGZyYW1ldGFibGVf
YmFzZV9wZHggJiYKPj4+PiBfX21mbl92YWxpZChfX21fZl9uKSk7IFwKPj4+PiArwqDCoMKgIGxp
a2VseShtZm5fdG9fcGR4KG1mbikgPj0gZnJhbWV0YWJsZV9iYXNlX3BkeCAmJiBfX21mbl92YWxp
ZChfX21fZl9uKSk7Cj4+Pj4gXAo+Pj4KPj4+IFRoaXMgaXMgcXVpdGUgdW5kZXNpcmFibGUsIHlv
dSB3aWxsIGVuZCB1cCB0byBldmFsdWF0ZSBtZm4gdHdpY2UgaGVyZS4KCkkgaGF2ZSBiZWVuIGxv
b2tpbmcgYXQgbWFraW5nIF9fbWZuX3ZhbGlkKC4uLikgdHlwZXNhZmUuIFdoaWxlIGl0IGNvbXBp
bGVzCm9uIEFybSwgSSBoYXZlIGEgYnVpbGQgZXJyb3Igb24geDg2OgoKSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIC9ob21lL2p1bGllbmcvd29ya3MveGVuL3hlbi9pbmNsdWRlL2FzbS94ODZfNjQvcGFn
ZS5oOjQ3OjAsCiAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9qdWxpZW5nL3dvcmtzL3hlbi94
ZW4vaW5jbHVkZS9hc20vcGFnZS5oOjIzLAogICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvanVs
aWVuZy93b3Jrcy94ZW4veGVuL2luY2x1ZGUvYXNtL2N1cnJlbnQuaDoxMiwKICAgICAgICAgICAg
ICAgICBmcm9tIC9ob21lL2p1bGllbmcvd29ya3MveGVuL3hlbi9pbmNsdWRlL2FzbS9zbXAuaDox
MCwKICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL2p1bGllbmcvd29ya3MveGVuL3hlbi9pbmNs
dWRlL3hlbi9zbXAuaDo0LAogICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvanVsaWVuZy93b3Jr
cy94ZW4veGVuL2luY2x1ZGUveGVuL3BlcmZjLmg6NywKICAgICAgICAgICAgICAgICBmcm9tIHg4
Nl82NC9hc20tb2Zmc2V0cy5jOjg6Ci9ob21lL2p1bGllbmcvd29ya3MveGVuL3hlbi9pbmNsdWRl
L3hlbi9wZHguaDoyNDoxODogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmG1mbl904oCZCiBi
b29sIF9fbWZuX3ZhbGlkKG1mbl90IG1mbik7CiAgICAgICAgICAgICAgICAgIF5+fn5+CkluIGZp
bGUgaW5jbHVkZWQgZnJvbSAvaG9tZS9qdWxpZW5nL3dvcmtzL3hlbi94ZW4vaW5jbHVkZS94ZW4v
Y29uZmlnLmg6MTM6MCwKICAgICAgICAgICAgICAgICBmcm9tIDxjb21tYW5kLWxpbmU+OjA6Ci9o
b21lL2p1bGllbmcvd29ya3MveGVuL3hlbi9pbmNsdWRlL2FzbS9tbS5oOiBJbiBmdW5jdGlvbiDi
gJhnZXRfcGFnZV9mcm9tX21mbuKAmToKL2hvbWUvanVsaWVuZy93b3Jrcy94ZW4veGVuL2luY2x1
ZGUvYXNtL3BhZ2UuaDoyNjI6Mjk6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5j
dGlvbiDigJhfX21mbl92YWxpZOKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJh
dGlvbl0KICNkZWZpbmUgbWZuX3ZhbGlkKG1mbikgICAgICBfX21mbl92YWxpZChtZm4pCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXgovaG9tZS9qdWxpZW5nL3dvcmtzL3hlbi94ZW4vaW5j
bHVkZS94ZW4vY29tcGlsZXIuaDoxMTo0Mzogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDi
gJh1bmxpa2VseeKAmQogI2RlZmluZSB1bmxpa2VseSh4KSAgIF9fYnVpbHRpbl9leHBlY3QoISEo
eCksMCkKCldlIGdldCBhd2F5IG9uIEFybSBiZWNhdXNlIG1mbl92YWxpZCBpcyBpbXBsZW1lbnRl
ZCBpbiBtbS5oLiBPbiB4ODYgaXQgaXMgaW1wbGVtZW50ZWQKaW4gcGFnZS5oLiBJIGFtIHF1aXRl
IGltcHJlc3NlZCB3ZSBuZXZlciBoYWQgYnVpbGQgZmFpbHVyZSBpbiBjb21tb24gY29kZSB1bnRp
bCBub3cuLi4KCkFueXdheSwgaXQgaXMgbm90IHRoZSBmaXJzdCB0aW1lIEkgc2VlIGJ1aWxkIGVy
cm9yIHdoZW4gdHJ5aW5nIHRvIG1ha2UgdGhlIGNvZGUgdXNpbmcKdHlwZXNhZmUgZ2ZuL21mbi4g
VGhlIGhlYWRlcnMgZGVwZW5kZW5jeSBhcmUgcXVpdGUgbWVzc3kgaW4gZ2VuZXJhbC4KCkFuZHJl
dywgSmFuIGRvIHlvdSBoYXZlIGEgc3VnZ2VzdGlvbiBob3cgdG8gcHJvY2VzcyBvbiB0aGUgeDg2
IHNpZGU/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
