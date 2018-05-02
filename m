From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 0/4] block/xen_disk: legacy code removal and
 cleanup
Date: Wed, 2 May 2018 16:03:09 +0000
Message-ID: <683868567d3f4ed5a0f5eae7c0d2d4a3__45375.6040813916$1525276923$gmane$org@AMSPEX02CL03.citrite.net>
References: <1525089699-13411-1-git-send-email-paul.durrant@citrix.com>
 <20180502155816.GD14376@perard>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ua+m=hv=citrix.com=prvs=6538527dc=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fDuDo-000512-H4
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 16:03:12 +0000
In-Reply-To: <20180502155816.GD14376@perard>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAwMiBNYXkgMjAxOCAxNjo1OAo+
IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgcWVtdS0KPiBk
ZXZlbEBub25nbnUub3JnOyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyBLZXZpbiBXb2xmCj4gPGt3b2xmQHJlZGhhdC5jb20+OyBNYXggUmVpdHogPG1yZWl0ekBy
ZWRoYXQuY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC80XSBibG9jay94ZW5fZGlzazogbGVn
YWN5IGNvZGUgcmVtb3ZhbCBhbmQgY2xlYW51cAo+IAo+IE9uIE1vbiwgQXByIDMwLCAyMDE4IGF0
IDAxOjAxOjM1UE0gKzAxMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+IFRoZSBncmFudCBjb3B5
IG9wZXJhdGlvbiB3YXMgYWRkZWQgdG8gbGlieGVuZ250dGFiIGluIFhlbiA0LjguMCAocmVsZWFz
ZWQKPiA+IG5lYXJseSAxOCBtb250aHMgYWdvKSBidXQgdGhlIHhlbl9kaXNrIFBWIGJhY2tlbmQg
UUVNVSBpcyBzdGlsbCBjYXJyeWluZwo+ID4gYSBzaWduaWZpY2FudCBhbW91bnQgb2YgY29kZSBw
dXJlbHkgdG8gcmVtYWluIGNvbXBhdGlibGUgd2l0aCBvbGRlcgo+ID4gdmVyc2lvbnMgb2YgWGVu
Lgo+ID4KPiA+IEFzIGNhbiBiZSBpbmZlcnJlZCBmcm9tIHRoZSBkaWZmIHN0YXRzIGJlbG93LCBy
ZW1vdmluZyB0aGlzIHN1cHBvcnQgZm9yCj4gPiBvbGRlciB2ZXJzaW9ucyBvZiBYZW4gZnJvbSBR
RU1VIHJlZHVjZXMgdGhlIHNpemUgb2YgdGhlIHhlbl9kaXNrIHNvdXJjZQo+IGJ5Cj4gPiBtb3Jl
IHRoYW4gMzUwIGxpbmVzICh+MjUlKS4gVGhlIG1ham9yaXR5IG9mIHRoaXMgaXMgZG9uZSBpbiBw
YXRjaGVzICMxCj4gPiBhbmQgIzIuIEZ1cnRoZXIgc2ltcGxpZmljYXRpb25zIGFyZSBtYWRlIGlu
IHBhdGNoICMzIGFuZCB0aGVuIHNvbWUKPiBjb3NtZXRpYwo+ID4gd29yayBpcyBkb25lIGluIHBh
dGNoICM0Lgo+IAo+IEZJWSwgSSBkb24ndCBsaWtlIHRoaXMgcGF0Y2ggc2VyaWVzLiBXZSd2ZSBi
ZWVuIGNoZWNraW5nIHRoYXQgUUVNVQo+IGJ1aWxkcyBhZ2FpbnN0IG9sZGVyIHZlcnNpb24uIEkn
dmUgY2hlY2sgdGhhdCBpdCBidWlsZHMgYWdhaW5zdCA0LjUgYW5kCj4gbmV3ZXIuCj4gCgpPaywg
SSBjYW4gZ3JhbnQgY29weSBlbXVsYXRpb24gaW4gUUVNVSB0aGVuIHNob3VsZCBpdCBub3QgZXhp
c3QgZm9yIHRoZSBwYXJ0aWN1bGFyIFhlbi9PUyBjb21iby4KCj4gQWxzbyB0aGUgZmFjdCB0aGF0
IEZyZWVCU0QgZG9lc24ndCBoYXZlIHN1cHBvcnQgZm9yIGdyYW50IGNvcHkgcHJvYmFibHkKPiBt
ZWFuIHRoYXQgaXQgaXMgdG9vIHNvb24gdG8gcmVtb3ZlIHRoZSBjb21wYXRpYmlsaXR5IGNvZGUg
ZnJvbSBxZW11Lgo+IAoKT24gYW5vdGhlciB0aHJlYWQgSSdkIGFscmVhZHkgYWdyZWVkIHRvIGVt
dWxhdGUgZ3JhbnQgY29weSBpbiBsaWJ4ZW5nbnR0YWIgZm9yIHRob3NlIE9TIHdoZXJlIGl0IGlz
IG5vdCBzdXBwb3J0ZWQsIGJ1dCBpZiB5b3UgcHJlZmVyIGl0IHRvIGJlIGluIFFFTVUgSSdsbCBw
dXQgaXQgdGhlcmUuCgogIFBhdWwKCj4gUmVnYXJkcywKPiAKPiAtLQo+IEFudGhvbnkgUEVSQVJE
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
