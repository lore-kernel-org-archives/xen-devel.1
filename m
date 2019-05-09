From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Altp2m use with PML can deadlock Xen
Date: Thu, 9 May 2019 07:38:56 -0600
Message-ID: <CABfawhkp2rODvh1j6AvEEEgc=EheM53sVprRiZWrhHcQ8Ve_+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pukc=TJ=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hOjGq-0005Ht-Qw
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 13:39:36 +0000
Received: by mail-wr1-x429.google.com with SMTP id l2so3102144wrb.9
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2019 06:39:35 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLApJJ20gaW52ZXN0aWdhdGluZyBhbiBpc3N1ZSB3aXRoIGFsdHAybSB0aGF0IGNhbiBl
YXNpbHkgYmUgcmVwcm9kdWNlZAphbmQgbGVhZHMgdG8gYSBoeXBlcnZpc29yIGRlYWRsb2NrIHdo
ZW4gUE1MIGlzIGF2YWlsYWJsZSBpbiBoYXJkd2FyZS4KSSBoYXZlbid0IGJlZW4gYWJsZSB0byB0
cmFjZSBkb3duIHdoZXJlIHRoZSBhY3R1YWwgZGVhZGxvY2sgb2NjdXJzLgoKVGhlIHByb2JsZW0g
c2VlbSB0byBzdGVtIGZyb20gaHZtL3ZteC92bWNzLmM6dm14X3ZjcHVfZmx1c2hfcG1sX2J1ZmZl
cgp0aGF0IGNhbGxzIHAybV9jaGFuZ2VfdHlwZV9vbmUgb24gYWxsIGdmbnMgdGhhdCB3ZXJlIHJl
Y29yZGVkIHRoZSBQTUwKYnVmZmVyLiBUaGUgcHJvYmxlbSBvY2N1cnMgd2hlbiB0aGUgUE1MIGJ1
ZmZlciBmdWxsIHZtZXhpdCBoYXBwZW5zCndoaWxlIHRoZSBhY3RpdmUgcDJtIGlzIGFuIGFsdHAy
bS4gU3dpdGNoaW5nICBwMm1fY2hhbmdlX3R5cGVfb25lIHRvCndvcmsgd2l0aCB0aGUgYWx0cDJt
IGluc3RlYWQgb2YgdGhlIGhvc3RwMm0gaG93ZXZlciByZXN1bHRzIGluIEVQVAptaXNjb25maWd1
cmF0aW9uIGNyYXNoZXMuCgpBZGRpbmcgdG8gdGhlIGlzc3VlIGlzIHRoYXQgaXQgc2VlbSB0byBv
bmx5IG9jY3VyIHdoZW4gdGhlIGFsdHAybSBoYXMKcmVtYXBwZWQgR0ZOcy4gU2luY2UgUE1MIHJl
Y29yZHMgZW50cmllcyBiYXNlZCBvbiBHRk4gbGVhZHMgbWUgdG8KcXVlc3Rpb24gd2hldGhlciBp
dCBpcyBzYWZlIGF0IGFsbCB0byB1c2UgUE1MIHdoZW4gYWx0cDJtIGlzIHVzZWQgd2l0aApHRk4g
cmVtYXBwaW5nLiBIb3dldmVyLCBBRkFJQ1QgdGhlIEdGTnMgaW4gdGhlIFBNTCBidWZmZXIgYXJl
IG5vdCB0aGUKcmVtYXBwZWQgR0ZOcyBhbmQgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGl0IHNo
b3VsZCBiZSBzYWZlIGFzIGxvbmcKYXMgdGhlIEdGTnMgYmVpbmcgdHJhY2tlZCBieSBQTUwgYXJl
IG5ldmVyIHRoZSByZW1hcHBlZCBHRk5zLgoKQm9vdGluZyBYZW4gd2l0aCBlcHQ9cG1sPTAgcmVz
b2x2ZXMgdGhlIGlzc3VlLgoKSWYgYW55b25lIGhhcyBhbnkgaW5zaWdodCBpbnRvIHdoYXQgbWln
aHQgYmUgaGFwcGVuaW5nLCBwbGVhc2UgbGV0IG1lIGtub3cuCgpUaGFua3MsClRhbWFzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
