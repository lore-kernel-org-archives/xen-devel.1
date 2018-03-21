From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 02/45] ARM: Implement vcpu_kick()
Date: Wed, 21 Mar 2018 04:10:53 +0000
Message-ID: <7a8c4872-8192-b05f-d0e4-35eee9e09d83@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-3-andre.przywara@linaro.org>
 <5AB0F1E502000078001B3DD8@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kbl4=gl=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eyV5Z-0004MW-Tx
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 04:11:01 +0000
In-Reply-To: <5AB0F1E502000078001B3DD8@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@linaro.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMDMvMjAvMjAxOCAxMDozNSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
T24gMTUuMDMuMTggYXQgMjE6MzAsIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPiB3cm90ZToK
Pj4gSWYgd2UgY2hhbmdlIHNvbWV0aGluZyBpbiBhIHZDUFUgdGhhdCBhZmZlY3RzIGl0cyBydW5u
YWJpbGl0eSBvcgo+PiBvdGhlcndpc2UgbmVlZHMgdGhlIHZDUFUncyBhdHRlbnRpb24sIHdlIG1p
Z2h0IG5lZWQgdG8gdGVsbCB0aGUgc2NoZWR1bGVyCj4+IGFib3V0IGl0Lgo+PiBXZSBhcmUgdXNp
bmcgdGhpcyBpbiBvbmUgcGxhY2UgKHZJUlEgaW5qZWN0aW9uKSBhdCB0aGUgbW9tZW50LCBidXQg
d2lsbAo+PiBuZWVkIHRoaXMgYXQgbW9yZSBwbGFjZXMgc29vbi4KPj4gU28gbGV0J3MgZmFjdG9y
IG91dCB0aGlzIGZ1bmN0aW9uYWxpdHksIHVzaW5nIHRoZSBhbHJlYWR5IGV4aXN0aW5nCj4+IHZj
cHVfa2ljaygpIHByb3RvdHlwZSAodXNlZCBpbiB4ODYgb25seSBzbyBmYXIpLCB0byBtYWtlIHRo
aXMgYXZhaWxhYmxlCj4+IHRvIHRoZSByZXN0IG9mIHRoZSBYZW4gY29kZS4KPiAKPiBIYXZpbmcg
anVzdCBzZWVuIHRoaXMgYW1vbmcgdGhlIGNvbW1pdHMgaGF2aW5nIGdvbmUgaW4gcmVjZW50bHkg
LQo+IHdhcyBpdCBjb25zaWRlcmVkIHRvIG1ha2UgdGhpcyBhIGNvbW1vbiBmdW5jdGlvbj8gVGhl
Cj4gaW1wbGVtZW50YXRpb25zIGN1cnJlbnRseSBkaWZmZXIsIGJ1dCBJJ20gbm90IHN1cmUgSSBz
ZWUgd2h5IHRoYXQKPiBuZWVkcyB0byBiZS4gV2l0aCB4ODYncyB2Y3B1X2tpY2tfc29mdGlycSgp
IGhhbmRsZXIgZG9pbmcgbm90aGluZwo+IEkgY291bGQgc2VlIHRoZSBBUk0gaW1wbGVtZW50YXRp
b24gYmUgc3VpdGFibGUgZm9yIHg4NiwganVzdCBsaWtlCj4gSSBjb3VsZCBzZWUgdGhlIHg4NiBp
bXBsZW1lbnRhdGlvbiBiZSBzdWl0YWJsZSBmb3IgQVJNLgpJIGNvbnNpZGVyZWQgaXQgd2hlbiBy
ZXZpZXdpbmcgdGhlIHBhdGNoIGJ1dCBkaXNjYXJkIGl0IEkgd2Fzbid0IAplbnRpcmVseSBzdXJl
IGlmIGl0IHdhcyBwb3NzaWJsZSB0byBtYWtlIGl0IGNvbW1vbiBhbmQgIEkgd2FudGVkIHRoaXMg
CnNlcmllcyB0byBtb3ZlIGZvcndhcmQgKGl0IGlzIDUwIHBhdGNoZXMgc2VyaWVzKSEKCkkgd291
bGQgYmUgaGFwcHkgdG8gY29uc2lkZXIgYW55IHBhdGNoIHRvIG1ha2UgdGhlbSBjb21tb24uIE15
IApwcmVmZXJlbmNlIHdvdWxkIHRlbmQgdG8gZ28gdG93YXJkcyB0aGUgQXJtIHNvbHV0aW9uIGFz
IGl0IGhhcyBhIApzbGlnaHRseSBzbWFsbGVyIG92ZXJoZWFkIHRvIGtpY2sgYSB2Q1BVLiBJbmRl
ZWQgdGhlIHg4NiB2ZXJzaW9uIApyZXF1aXJlcyB0byByYWlzZSBhIHNvZnRpcnEgYW5kIHRoZW4g
c2VuZCBhbiBJUEkgdG8gdGhlIG90aGVyIENQVS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
