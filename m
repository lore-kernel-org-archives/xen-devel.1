From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH V6 0/4] Fix VGA logdirty related display freezes
 with altp2m
Date: Wed, 14 Nov 2018 22:39:58 +0200
Message-ID: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mavx=nz=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gN1xN-0008V5-Id
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 20:40:13 +0000
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4C7A13074B71
 for <xen-devel@lists.xenproject.org>; Wed, 14 Nov 2018 22:40:10 +0200 (EET)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3D7AE300F716
 for <xen-devel@lists.xenproject.org>; Wed, 14 Nov 2018 22:40:10 +0200 (EET)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzZXJpZXMgYWltcyB0byBwcmV2ZW50IHRoZSBkaXNwbGF5IGZyb20gZnJlZXppbmcgd2hl
bgplbmFibGluZyBhbHRwMm0gYW5kIHN3aXRjaGluZyB0byBhIG5ldyB2aWV3IChhbmQgYXNzb3J0
ZWQgcHJvYmxlbXMKd2hlbiByZXNpemluZyB0aGUgZGlzcGxheSkuIFNpbmNlIHRoZSBsYXN0IHZl
cnNpb24gb2YgdGhlIHNlcmllcywKd2hhdCB3YXMgcHJldmlvdXNseSB0aGUgc2Vjb25kICBwYXRj
aCBoYXMgYmVlbiBzcGxpdCBpbgp0d28gcGF0Y2hlcy4KClRoZSBmaXJzdCBwYXRjaCBwcm9wYWdh
dGVzIGVwdC5hZCBjaGFuZ2VzIHRvIGFsbCBhY3RpdmUgYWx0cDJtcywKdGhlIHNlY29uZCBvbmUg
aW50cm9kdWNlcyBwMm1fe2luaXQsZnJlZX1fbG9nZGlydHkoKSwgdGhlIHRoaXJkCmFsbG9jYXRl
cyAgYSBuZXcgbG9nZGlydHkgcmFuZ2VzZXQgZm9yIGVhY2ggbmV3IGFsdHAybSwgYW5kIHRoZQpm
b3VydGggcHJvcGFnYXRlcyAodW5kZXIgbG9jaykgY2hhbmdlcyB0byBhbGwgcDJtcy4KCltQQVRD
SCBWNiAxLzRdIHg4Ni9hbHRwMm06IHByb3BhZ2F0ZSBlcHQuYWQgY2hhbmdlcyB0byBhbGwgYWN0
aXZlIGFsdHAybXMKW1BBVENIIFY2IDIvNF0geDg2L21tOiBpbnRyb2R1Y2UgcDJtX3tpbml0LGZy
ZWV9X2xvZ2RpcnR5KCkKW1BBVENIIFY2IDMvNF0geDg2L21tOiBhbGxvY2F0ZSBsb2dkaXJ0eV9y
YW5nZXMgZm9yIGFsdHAybXMKW1BBVENIIFY2IDQvNF0geDg2L2FsdHAybTogZml4IGRpc3BsYXkg
ZnJvemVuIHdoZW4gc3dpdGNoaW5nIHRvIGEgbmV3IHZpZXcgZWFybHkKCkluIHRoZSBwcmV2aW91
cyBzZXJpZXMgdGhlIHBvc3NpYmlsaXR5IG9mIGFsbG9jYXRpbmcgYWx0cDJtcyBvbgpkZW1hbmQg
aGFzIGJlZW4gZGlzY3Vzc2VkLiBJZiB0aGF0J3MgYSByZXF1aXJlbWVudCBmb3IgdGhlIHNlcmll
cwp3ZSBjYW4gY2VydGFpbmx5IGNvbnRpbnVlIHRoZSBjb252ZXJzYXRpb24uIE90aGVyd2lzZSwg
c2luY2UKdGhlIHByb2JsZW0gZml4ZWQgaGVyZSBpcyBjb21wbGV0ZWx5IGJsb2NraW5nIGFsdHAy
bSB1c2FnZSwKSSBob3BlIHdlIGNhbiBmaXggdGhpcyB1cmdlbnQgbWF0dGVyLCBhZnRlciB3aGlj
aCB3ZSdsbCBoYXBwaWx5CmNvbnRyaWJ1dGUgY29kZSB0byBzd2l0Y2ggdG8gb24tZGVtYW5kIGFs
dHAybSBhbGxvY2F0aW9uLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
