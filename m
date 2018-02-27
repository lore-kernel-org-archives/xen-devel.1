From: Julien Grall <julien.grall@arm.com>
Subject: rwlock and per-cpu rwlock recursive?
Date: Tue, 27 Feb 2018 19:18:44 +0000
Message-ID: <3a7d3b6a-623a-0ddb-d42b-aa68fca1fe92@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=r2zm=fv=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eqkm1-0000Wo-0N
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 19:18:49 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiBBcm0sIHdlIG1hZGUgdGhlICh3cm9uZz8pIGFzc3VtcHRpb24gdGhhdCB0aGUgcnds
b2NrIHdhcyByZWN1cnNpdmUuIApXZSBoYXZlIGEgY291cGxlIG9mIHBsYWNlcyB3aGVyZSB0aGUg
cmVhZCBsb2NrIGNhbiBiZSBuZXN0ZWQgKG1vc3RseSB0aGUgCm1lbWFjY2VzcyBjb2RlKS4KCkkg
Zm91bmQgb3V0IHRvZGF5IHRoYXQgaXQgY2FuIGFjdHVhbGx5IGRlYWRsb2NrIGluIHRoZSBmb2xs
b3dpbmcgY2FzZToKCTEpIENQVSBBIC0+IEFzayBmb3IgdGhlIHJlYWQgbG9jawoJCT0+IFN1Y2Nl
ZWQKCTIpIENQVSBCIC0+IEFzayBmb3IgdGhlIHdyaXRlIGxvY2sKCQk9PiBBbHJlYWR5IHRha2Vu
IGJ5IENQVSBBIHNvIGdvIHRvIHRoZSBzbG93cGF0aAoJCT0+IFRha2UgdGhlIGludGVybmFsIGxv
Y2sgKGxvY2stPmxvY2spCgkJPT4gV2FpdCB1bnRpbCB0aGUgbG9jayBpcyByZWxlYXNlZC4KCTMp
IENQVSBBIC0+IEFzayBmb3IgdGhlIHJlYWQgbG9jayByZWN1cnNpdmVseQoJCT0+IEEgd3JpdGVy
IGlzIHdhaXRpbmcgc28gZ28gdG8gdGhlIHNsb3dwYXRoCgkJPT4gVHJ5IHRvIHRha2UgdGhlIGlu
dGVybmFsIGxvY2sgKGxvY2stPmxvY2spCgkJCT0+IEJsb2NraW5nIGJlY2F1c2UgQ1BVIEIgYWxy
ZWFkeSBoYXMgaXQKClNvIHdlIGVuZCB1cCBpbiBhIGRlYWRsb2NrIGNhc2UuIENhbiBzb21lb25l
IGNvbmZpcm0gd2hldGhlciB3aGV0aGVyIApyd2xvY2sgd2FzIG1lYW50IHRvIGJlIHJlY3Vyc2l2
ZT8KClNpbWlsYXJseSwgSSB3YXMgdGhpbmtpbmcgdG8gbW92ZSB0aGUgcDJtIGNvZGUgdG8gdGhl
IHBlci1jcHUgcndsb2NrIGFzIAp4ODYgZG9lcy4gRnJvbSB3aGF0IEkgZ2F0aGVyZWQgYnkgcmVh
ZGluZyB0aGUgeDg2IGNvZGUsIHRoaXMgbG9jayBjb3VsZCAKYmUgdGFrZW4gcmVjdXJzaXZlbHku
IEFtIEkgcmlnaHQ/CgpMYXN0bHksIHRoZSB4ODYgcDJtIGNvZGUgc2VlbWVkIHRvIHVzZSByd2xv
Y2sgYmVmb3JlIGhhbmQuIEhvdyBkaWQgdGhlIApwMm0gY29kZSB3YXMgaGFuZGxpbmcgcmVjdXJz
aXZlIGxvY2tpbmc/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
