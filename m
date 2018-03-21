From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 02/45] ARM: Implement vcpu_kick()
Date: Wed, 21 Mar 2018 01:40:42 -0600
Message-ID: <5AB21A8A02000078001B44EB@prv-mh.provo.novell.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-3-andre.przywara@linaro.org>
 <5AB0F1E502000078001B3DD8@prv-mh.provo.novell.com>
 <7a8c4872-8192-b05f-d0e4-35eee9e09d83@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3tj2=gl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyYMa-0005CB-19
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 07:40:48 +0000
In-Reply-To: <7a8c4872-8192-b05f-d0e4-35eee9e09d83@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAzLjE4IGF0IDA1OjEwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDAzLzIwLzIwMTggMTA6MzUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNS4w
My4xOCBhdCAyMTozMCwgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4gSWYg
d2UgY2hhbmdlIHNvbWV0aGluZyBpbiBhIHZDUFUgdGhhdCBhZmZlY3RzIGl0cyBydW5uYWJpbGl0
eSBvcgo+Pj4gb3RoZXJ3aXNlIG5lZWRzIHRoZSB2Q1BVJ3MgYXR0ZW50aW9uLCB3ZSBtaWdodCBu
ZWVkIHRvIHRlbGwgdGhlIHNjaGVkdWxlcgo+Pj4gYWJvdXQgaXQuCj4+PiBXZSBhcmUgdXNpbmcg
dGhpcyBpbiBvbmUgcGxhY2UgKHZJUlEgaW5qZWN0aW9uKSBhdCB0aGUgbW9tZW50LCBidXQgd2ls
bAo+Pj4gbmVlZCB0aGlzIGF0IG1vcmUgcGxhY2VzIHNvb24uCj4+PiBTbyBsZXQncyBmYWN0b3Ig
b3V0IHRoaXMgZnVuY3Rpb25hbGl0eSwgdXNpbmcgdGhlIGFscmVhZHkgZXhpc3RpbmcKPj4+IHZj
cHVfa2ljaygpIHByb3RvdHlwZSAodXNlZCBpbiB4ODYgb25seSBzbyBmYXIpLCB0byBtYWtlIHRo
aXMgYXZhaWxhYmxlCj4+PiB0byB0aGUgcmVzdCBvZiB0aGUgWGVuIGNvZGUuCj4+IAo+PiBIYXZp
bmcganVzdCBzZWVuIHRoaXMgYW1vbmcgdGhlIGNvbW1pdHMgaGF2aW5nIGdvbmUgaW4gcmVjZW50
bHkgLQo+PiB3YXMgaXQgY29uc2lkZXJlZCB0byBtYWtlIHRoaXMgYSBjb21tb24gZnVuY3Rpb24/
IFRoZQo+PiBpbXBsZW1lbnRhdGlvbnMgY3VycmVudGx5IGRpZmZlciwgYnV0IEknbSBub3Qgc3Vy
ZSBJIHNlZSB3aHkgdGhhdAo+PiBuZWVkcyB0byBiZS4gV2l0aCB4ODYncyB2Y3B1X2tpY2tfc29m
dGlycSgpIGhhbmRsZXIgZG9pbmcgbm90aGluZwo+PiBJIGNvdWxkIHNlZSB0aGUgQVJNIGltcGxl
bWVudGF0aW9uIGJlIHN1aXRhYmxlIGZvciB4ODYsIGp1c3QgbGlrZQo+PiBJIGNvdWxkIHNlZSB0
aGUgeDg2IGltcGxlbWVudGF0aW9uIGJlIHN1aXRhYmxlIGZvciBBUk0uCj4gSSBjb25zaWRlcmVk
IGl0IHdoZW4gcmV2aWV3aW5nIHRoZSBwYXRjaCBidXQgZGlzY2FyZCBpdCBJIHdhc24ndCAKPiBl
bnRpcmVseSBzdXJlIGlmIGl0IHdhcyBwb3NzaWJsZSB0byBtYWtlIGl0IGNvbW1vbiBhbmQgIEkg
d2FudGVkIHRoaXMgCj4gc2VyaWVzIHRvIG1vdmUgZm9yd2FyZCAoaXQgaXMgNTAgcGF0Y2hlcyBz
ZXJpZXMpIQo+IAo+IEkgd291bGQgYmUgaGFwcHkgdG8gY29uc2lkZXIgYW55IHBhdGNoIHRvIG1h
a2UgdGhlbSBjb21tb24uIE15IAo+IHByZWZlcmVuY2Ugd291bGQgdGVuZCB0byBnbyB0b3dhcmRz
IHRoZSBBcm0gc29sdXRpb24gYXMgaXQgaGFzIGEgCj4gc2xpZ2h0bHkgc21hbGxlciBvdmVyaGVh
ZCB0byBraWNrIGEgdkNQVS4gSW5kZWVkIHRoZSB4ODYgdmVyc2lvbiAKPiByZXF1aXJlcyB0byBy
YWlzZSBhIHNvZnRpcnEgYW5kIHRoZW4gc2VuZCBhbiBJUEkgdG8gdGhlIG90aGVyIENQVS4KClll
cywgdGhhdCdzIG15IHByZWZlcmVuY2UgdG9vLiBJJ2xsIHNlbmQgc29tZXRoaW5nIGFmdGVyIDQu
MTEgaGFzCnNldHRsZWQuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
