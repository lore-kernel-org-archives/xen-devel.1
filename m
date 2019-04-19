From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 01/12] xen: clang: Support correctly
 cross-compile
Date: Fri, 19 Apr 2019 11:47:59 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904191145530.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-2-julien.grall@arm.com>
 <5C9C9A22020000780022265A@prv1-mh.provo.novell.com>
 <25c9291b-51dc-e45c-2fc7-b6d6c89f05b8@arm.com>
 <5C9DEFFA0200007800222BF1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4FrJ=SV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHYYM-0005Zu-TT
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 18:48:03 +0000
In-Reply-To: <5C9DEFFA0200007800222BF1@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyOSBNYXIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDI5LjAzLjE5
IGF0IDEwOjQxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+ID4gT24gMjgvMDMvMjAx
OSAwOTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+Pj4gT24gMjcuMDMuMTkgYXQgMTk6NDUs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4gPj4+IENsYW5nIHVzZXMgIi10YXJnZXQi
IG9wdGlvbiBmb3IgY3Jvc3MtY29tcGlsYXRpb24uCj4gPj4gCj4gPj4+IC0tLSBhL2NvbmZpZy9T
dGRHTlUubWsKPiA+Pj4gKysrIGIvY29uZmlnL1N0ZEdOVS5tawo+ID4+PiBAQCAtMSw4ICsxLDEz
IEBACj4gPj4+ICAgQVMgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlhcwo+ID4+PiAgIExEICAg
ICAgICAgPSAkKENST1NTX0NPTVBJTEUpbGQKPiA+Pj4gICBpZmVxICgkKGNsYW5nKSx5KQo+ID4+
PiAtQ0MgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSljbGFuZwo+ID4+PiAtQ1hYICAgICAgICA9
ICQoQ1JPU1NfQ09NUElMRSljbGFuZysrCj4gPj4+ICtpZm5lcSAoJChDUk9TU19DT01QSUxFKSwp
Cj4gPj4+ICtDQyAgICAgICAgID0gY2xhbmcgLXRhcmdldCAkKENST1NTX0NPTVBJTEU6LT0pCj4g
Pj4+ICtDWFggICAgICAgID0gY2xhbmcrKyAtdGFyZ2V0ICQoQ1JPU1NfQ09NUElMRTotPSkKPiA+
PiAKPiA+PiBJcyBkcm9wcGluZyBkYXNoZXMgZnJvbSB0aGUgdmFyaWFibGUgdW5pZm9ybWx5IGNv
cnJlY3Q/IElmIHNvLAo+ID4+IGNvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSBpbiB0aGUgY29tbWl0
IG1lc3NhZ2Ugd2h5IHRoYXQgaXM/Cj4gPiBUaGUgdGFyZ2V0IG9wdGlvbiByZXF1aXJlcyB0aGUg
Zm9sbG93aW5nIGZvcm1hdDoKPiA+IAo+ID4gPGFyY2g+PHN1Yj4tPHZlbmRvcj4tPHN5cz4tPGFi
aT4KPiA+IAo+ID4gSW4gb3RoZXIgcGxhY2VzLCB3ZSBuZWVkIHRoZSB0cmFpbGluZyBkYXNoIGFz
IEdOVSB0b29scyBhcmUgdXNpbmcgdGhlIHNhbWUgCj4gPiBmb3JtYXQgYXMgYWJvdmUgd2l0aCBh
IGRhc2ggdG8gc2VwYXJhdGUgdGhlIHRvb2wgbmFtZS4KPiAKPiBPaCwgSSdtIHNvcnJ5IC0gSSBr
ZWVwIGZvcmdldHRpbmcgdGhhdCB0aGUgc3Vic3RpdHV0aW9uIGZvcm0geW91Cj4gdXNlIG9ubHkg
ZmlkZGxlcyB3aXRoIHRyYWlsaW5nIGRhc2hlcy4gT2YgY291cnNlIEkgd29uJ3QgaW5zaXN0LCBi
dXQKPiBJJ2QgcHJlZmVyIHRoZSBtb3JlIG9idmlvdXMgJChwYXRzdWJzdCAlLSwlLCQoQ1JPU1Nf
Q09NUElMRSkpCj4gdG8gYmUgdXNlZCBpbnN0ZWFkLCBkZXNwaXRlIHJlYWxpemluZyB0aGF0IGl0
J3MgbWVhbmluZ2Z1bGx5IGxvbmdlci4KCkVpdGhlciB3YXkgdG8gZG8gdmFyaWFibGUgbWFuaXB1
bGF0aW9uIGlzIE9LLCBidXQgaXQgd291bGQgYmUgZ29vZCB0bwphZGQgSnVsaWVuJ3MgZXhwbGFu
YXRpb24gb2YgdGhlIC10YXJnZXQgZXhwZWN0ZWQgZm9ybWF0IGluIHRoZSBjb21taXQKbWVzc2Fn
ZS4gSSBkb24ndCBoYXZlIGFueSBvdGhlciBjb21tZW50cyBvbiB0aGlzIHBhdGNoLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
