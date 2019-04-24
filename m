Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BB3C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 19:15:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06FD205ED
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 19:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ny/8gWFV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B06FD205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJNMJ-0002rP-Kh; Wed, 24 Apr 2019 19:15:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mXGb=S2=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hJNMI-0002rK-Bm
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 19:15:06 +0000
X-Inumbo-ID: 43c0e0cf-66c5-11e9-92d7-bc764e045a96
Received: from mail4.protonmail.ch (unknown [185.70.40.27])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 43c0e0cf-66c5-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 19:15:05 +0000 (UTC)
Date: Wed, 24 Apr 2019 19:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1556133303;
 bh=i9tNg6lLgyw5mlzG+ogZ5dxeIQ5+nJTejeNt7VFpoWE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=ny/8gWFVv0jopX6J2GA1988lL2a2+XNaB1GXdpHZJftWGwvcGnckgF1QWOtIAL8y0
 m+WkbP130QnNYEkQWTXo7h3F2T5RI8O7yohxbLTew6T+EjCAfeMEfQYbZx1QGPc4FA
 LlwUE2dUXuowWik2bBAt5+oijaxrFAxZizPCFv+E=
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID:
 <BeOLBFHc9d0iP84LWMtxX_V4TWqo-I3xDCJInbiAhcuC0KCNm5FdXNRi95aGh06jEADpg5NIWOTTgFhFut0sve6dupfEYoqvW9fbJ6zF86Q=@protonmail.com>
In-Reply-To: <CABfawhkUZea1=YikfWNi=PAJi1dSVkJbzw7Kr7URksn2eASZVg@mail.gmail.com>
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
 <5c0480bb-24bc-81cf-066b-a66b2e83d51f@bitdefender.com>
 <jYLnqeXXkfLqocyaorTwgUHTTQ7AozmbsPb8X4HGvjuGF2shfDIkAw7G363xoRRWmSZShCUqzriK-bBF3S93QKQkXS_9wUFrlKbdjKr6tUM=@protonmail.com>
 <CABfawhmwxVTK4yq88R87JX78ZNiy5WnBjE_SGCSeUyQcBVMr1w@mail.gmail.com>
 <ddf62960-ba73-63dd-8957-7b0e17efe68c@bitdefender.com>
 <CABfawhkUZea1=YikfWNi=PAJi1dSVkJbzw7Kr7URksn2eASZVg@mail.gmail.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
Subject: Re: [Xen-devel] VMI: singlestep event not received
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424191500.RJFpmQaGqfngBvu3vL-vt7lOBn17FmkiGqtxfJsyAAw@z>

T24gV2VkbmVzZGF5IDI0IEFwcmlsIDIwMTkgMTc6MzgsIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMu
ay5sZW5neWVsQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIFdlZCwgQXByIDI0LCAyMDE5IGF0IDk6
MzQgQU0gUmF6dmFuIENvam9jYXJ1Cj4gcmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbSB3cm90ZToK
Pgo+ID4gT24gNC8yNC8xOSA2OjI1IFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPgo+ID4g
PiBPbiBNb24sIEFwciAyMiwgMjAxOSBhdCA2OjAwIFBNIE1hdGhpZXUgVGFycmFsCj4gPiA+IG1h
dGhpZXUudGFycmFsQHByb3Rvbm1haWwuY29tIHdyb3RlOgo+ID4gPgo+ID4gPiA+IE9uIE1vbmRh
eSAyMiBBcHJpbCAyMDE5IDExOjIyLCBSYXp2YW4gQ29qb2NhcnUgcmNvam9jYXJ1QGJpdGRlZmVu
ZGVyLmNvbSB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gT24gNC8yMi8xOSAxOjI2IEFNLCBNYXRo
aWV1IFRhcnJhbCB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoZSBwcm9ibGVtIGlzIHRo
YXQgUnRsVXNlclRocmVhZFN0YXJ0IGlzIHBhZ2VkLW91dCwgc28gaSdtIHRyeWluZyB0byByZWFj
aCBpdCB2aWEgc2luZ2xlc3RlcHBpbmcgYXMgYSBiYWNrdXAgc29sdXRpb24uCj4gPiA+ID4gPgo+
ID4gPiA+ID4gRldJVywgeW91IGNhbiBqdXN0IHVzZSB4Y19odm1faW5qZWN0X3RyYXAoKSB3aXRo
IGEgVFJBUF9wYWdlX2ZhdWx0Cj4gPiA+ID4gPiBwYXJhbWV0ZXIgdG8gY2F1c2UgdGhlIE9TIHRv
IGJyaW5nIGEgcGFnZWQgb3V0IHBhZ2UgYmFjayBpbnRvIG1haW4gbWVtb3J5Lgo+ID4gPiA+Cj4g
PiA+ID4gVGhlIHByb2JsZW0gaXMgdGhhdCBpJ20gZnVsbHkgYmFzZWQgb24gTGliVk1JLCB3aGlj
aCBkb2Vzbid0IHByb3ZpZGUgYW4gQVBJIGZvciBwYWdlIGluamVjdGlvbiB5ZXQuCj4gPiA+ID4g
SSB0aGluayBUYW1hcyB3YXMgd2FpdGluZyBmb3IgYSBmdWxsIHN1cHBvcnQgb2YgcGFnZWZhdWx0
IGluamVjdGlvbiBvbiBYZW4gYmVmb3JlIG9wZW5pbmcgYW4gQVBJLgo+ID4gPiA+IE1heWJlIHdl
IHNob3VsZCBvcGVuIGFuIGlzc3VlIHRvIHRyYWNrIHRoZSBwcm9ncmVzcyBhYm91dCBpdC4KPiA+
ID4gPiBUaGFua3MgYW55d2F5IGZvciB0aGUgc3VnZ2VzdGlvbiAhCj4gPiA+Cj4gPiA+IE5vdCBo
YXZpbmcgYSBMaWJWTUkgd3JhcHBlciBzaG91bGQgbm90IHByZXZlbnQgeW91IGZyb20gdXNpbmcg
YSBsaWJ4Ywo+ID4gPiBmdW5jdGlvbiBkaXJlY3RseS4gVGhlcmUgYXJlIG1hbnkgY29ybmVyLWNh
c2VzIHJlZ2FyZGluZyB3aGVuIGl0IGlzCj4gPiA+IHNhZmUgdG8gaW5qZWN0IGEgcGFnZWZhdWx0
IGludG8gdGhlIGd1ZXN0IHRvIGJyaW5nIGJhY2sgcGFnZXMgYW5kIHRoYXQKPiA+ID4gbG9naWMg
aXMgbm90IHRyaXZpYWwgZW5vdWdoIHRvIGJlIGltcGxlbWVudGVkIGluIExpYlZNSS4gSXQncyB3
YXkgdG9vCj4gPiA+IHNwZWNpZmljIHRvIHRoZSB1c2VjYXNlIHRvIGRlY2lkZSB3aGVuIGl0J3Mg
c2FmZSB0byBkbyB0aGF0LiBTbyBpbgo+ID4gPiB0aGlzIGNhc2UsIGlmIHlvdSBrbm93IHlvdSBh
cmUgaW4gcmluZzMgb2YgeW91ciB0YXJnZXQgcHJvY2VzcyB5b3UgY2FuCj4gPiA+IGp1c3QgY2Fs
bCB0aGUgbGlieGMgZnVuY3Rpb24gZGlyZWN0bHkuCj4gPgo+ID4gVGhhdCdzIHZlcnkgdmVyeSB0
cnVlLCBob3dldmVyIEkgdGhpbmsgd2Ugc2hvdWxkIGFzc3VtZSB0aGF0IGxpYnJhcmllcwo+ID4g
c3VjaCBhcyBsaWJ2bWkgYW5kIGxpYmJkdm1pIGFyZSB1c2VkIGJ5IGNsaWVudCBjb2RlIHNtYXJ0
IGVub3VnaCB0bwo+ID4gZmlndXJlIG91dCwgdXNpbmcgc2FpZCBsaWJyYXJpZXMsIGVub3VnaCB0
aGluZ3MgYWJvdXQgd2hhdCdzIGFwcHJvcHJpYXRlCj4gPiAob3Igbm90KSB0byBkbywgYW5kIGxl
dCB0aGVtIGRvIGl0IHJhdGhlciB0aGFuIHNlY29uZC1ndWVzcyB0aGVtLgo+ID4gSGVuY2UsIGlu
IGxpYmJkdm1pIEkndmUgd3JhcHBlZCB0aGF0LCBhbmQgYWRkZWQgYSBjb21tZW50IGJhc2ljYWxs
eQo+ID4gc2F5aW5nIHdoYXQgeW91J3JlIHNheWluZyBhYm92ZToKPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9iaXRkZWZlbmRlci9saWJiZHZtaS9ibG9iL21hc3Rlci9zcmMveGVuZHJpdmVyLmNwcCNM
NTQyCj4gPiBJZiB3ZSBlbmQgdXAgaGF2aW5nIHRoZSBjbGllbnQgY29kZSBjYWxsIGJhY2tlbmQt
c3BlY2lmaWMgY29kZSBkaXJlY3RseQo+ID4gd2UncmUgbm90LCBhZnRlciBhbGwsIHJlYWxseSBh
YnN0cmFjdGluZyBpdCB3aXRoIG91ciB3cmFwcGVyIGxpYnJhcmllcy4KPgo+IElmIHNvbWVvbmUg
YWRkcyB0aGF0IHdyYXBwZXIgdG8gTGliVk1JIEkgd291bGRuJ3QgdmV0byBpdCAtIGJ1dCBpdCdz
Cj4gYWxzbyBhIGZ1bmN0aW9uIHRoYXQgSSdtIDEwMCUgZXhwZWN0aW5nIHdpbGwgZ2VuZXJhdGUg
YSBsb3Qgb2YKPiBjb25mdXNpb24gYW5kIHdoaW5pbmcgYWJvdXQgaXQgbm90IHdvcmtpbmcgaW4g
YWxsIGNhc2VzLiBTbyBJIGNob3NlCj4gbm90IHRvIGFkZCBpdCBteXNlbGYgYmVjYXVzZSBvZiB0
aGF0LiDCr1wo44OEKS/CrwoKVGFtYXMsIGknbSB1c2luZyBQeXRob24gc28gaSBjYW4ndCBkaXJl
Y3RseSBjYWxsIGxpYnhjLgoKQWxzbywgYW5kIGFzIFJhenZhbiBzYWlkLCBJIHdvdWxkIGxpa2Ug
dG8gc3RpY2sgd2l0aCBhIGNvaGVyZW50IGFuZCBjbGVhcmx5IGRlZmluZWQgYWJzdHJhY3Rpb25z
IGxheWVycywgZmlyc3QgYmVjYXVzZSBpdCB3aWxsIGFsbG93IG1lIHRvIGJlIGh5cGVydmlzb3It
YWdub3N0aWMgaW4gdGhlIGZ1dHVyZSwgaWYgbmV3IExpYlZNSSBkcml2ZXJzIGFyZSBkZXZlbG9w
ZWQsIGFuZCB0aGVuIGp1c3QgZm9yIHRoZSBzYWNrIG9mIEFQSSBjb25zaXN0ZW5jeS4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
