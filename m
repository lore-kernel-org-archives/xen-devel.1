From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 3/9] xen/x86: Use mfn_to_gfn rather
 than mfn_to_gmfn
Date: Wed, 13 Mar 2019 15:13:04 +0000
Message-ID: <6aa084a0-0c1e-0d4a-2d66-3a23ea0d7022@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-4-julien.grall@arm.com>
 <5C8917A4020000780021E2EE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ZEN=RQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h45Z6-0004BO-HT
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 15:13:08 +0000
In-Reply-To: <5C8917A4020000780021E2EE@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMTMvMDMvMjAxOSAxNDo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTguMDIuMTkgYXQgMTI6MzUsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IG1mbl90
b19nZm4gYW5kIG1mbl90b19nbWZuIGFyZSBkb2luZyBleGFjdGx5IHRoZSBzYW1lIGV4Y2VwdCB0
aGUgZm9ybWVyCj4+IGlzIHVzaW5nIG1mbl90Lgo+Pgo+PiBGdXJ0aGVybW9yZSwgdGhlIG5hbWlu
ZyBvZiB0aGUgZm9ybWVyIGlzIG1vcmUgY29uc2lzdGVudCB3aXRoIHRoZQo+PiBjdXJyZW50IG5h
bWluZyBzY2hlbWUgKEdGTi9NRk4pLiBTbyB1c2UgcmVwbGFjZSBtZm5fdG9fZ21mbiB3aXRoCj4+
IG1mbl90b19nZm4gaW4geDg2IGNvZGUuCj4+Cj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAK
PiBGdW5kYW1lbnRhbGx5IEknbSBmaW5lIHdpdGggdGhpcyBjaGFuZ2UsIGJ1dCBiZWZvcmUgbWFr
aW5nIGl0cyB1c2UKPiBtb3JlIHdpZGUtc3ByZWFkLCB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8g
bWFrZSBtZm5fdG9fZ2ZuKCkKPiBmdWxseSB0eXBlLXNhZmUsIGkuZS4gaGF2ZSBpdCBhbHNvIHJl
dHVybiBnZm5fdD8gVGhlcmUgYXJlbid0IHRoYXQKPiBtYW55IHVzZXMgb2YgdGhlIGZ1bmN0aW9u
IGp1c3QgeWV0LCBhbmQgZG9pbmcgdGhlIGNvbnZlcnNpb24gbm93Cj4gd291bGQgc2F2ZSB1cyBm
cm9tIGhhdmluZyB0byB0b3VjaCBhbGwgcGxhY2VzIHlvdSBub3cgY2hhbmdlCj4geWV0IGFub3Ro
ZXIgdGltZS4KCkkgdmFndWVseSByZWNhbGwgc29tZSBwcm9ibGVtcyB3aGVuIHRyeWluZyB0byB1
c2UgdHlwZXNhZmUgR0ZOLiBNYXliZSBpdCBpcyAKYmVjYXVzZSBJIHdhcyB0cnlpbmcgdG8gY2xl
YW51cCB0aGUgY29kZSBhdCB0aGUgc2FtZSB0aW1lLgoKTGV0IG1lIGhhdmUgYW5vdGhlciB0cnku
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
