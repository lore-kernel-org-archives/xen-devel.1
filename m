From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v11 1/9] xen: use __UINTPTR_TYPE__ for
 uintptr_t
Date: Wed, 6 Mar 2019 13:16:04 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1903061315100.17248@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-1-git-send-email-sstabellini@kernel.org>
 <5C7F7B26020000780021BF3A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+lMa=RJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1h1dtW-0006Tj-9m
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 21:16:06 +0000
In-Reply-To: <5C7F7B26020000780021BF3A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, george.dunlap@citrix.com, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCA2IE1hciAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDUuMDMuMTkg
YXQgMjM6MzgsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IFVzZSBfX1VJTlRQ
VFJfVFlQRV9fIHRvIGRlZmluZSB1aW50cHRyX3QuIEEgbGF0ZXIgcGF0Y2ggd2lsbCBtYWtlIHVz
ZSBvZgo+ID4gX19QVFJESUZGX1RZUEVfXyB0byBkZWZpbmUgcHRyZGlmZl90Lgo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4g
PiBSZXZpZXdlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4g
Cj4gQXMgYmVmb3JlIC0gSSBvYmplY3QgdG8gdGhpcyBjaGFuZ2Ugd2l0aG91dCB0aGUgZGVzY3Jp
cHRpb24gc3VwcGx5aW5nCj4gYm90aCBhIHJlYXNvbiAod2hpY2ggd291bGQgYmV0dGVyIGFsc28g
ZXhwbGFpbiB3aHkgdGhlIGN1cnJlbnQgd2F5Cj4gb2YgZGVmaW5pbmcgdWludHB0cl90IGlzIGRl
dHJpbWVudGFsKSBhbmQgYSBkaXNjdXNzaW9uIHdoeSBpdCBpcyBva2F5IGZvcgo+IHVzIHRvIHVz
ZSBfX1VJTlRQVFJfVFlQRV9fLCBkZXNwaXRlIChhdCBsZWFzdCkgZ2NjIG1ha2luZyB0aGlzCj4g
YXZhaWxhYmxlIG9ubHkgdW5kZXIgY2VydGFpbiBjb25kaXRpb25zIChpLmUuIGl0IHdvdWxkIG5l
ZWQgdG8gYmUKPiBjb25maXJtZWQgdGhhdCB3aGF0ZXZlciB0aGUgY29uZGl0aW9ucyB0aGV5J3Jl
IGFsd2F5cyBtZXQgZm9yIHVzKS4KCklzIHRoZSBmb2xsb3dpbmcgZ29vZCBlbm91Z2g6CgpVc2Ug
X19VSU5UUFRSX1RZUEVfXyB0byBkZWZpbmUgdWludHB0cl90IGZvciBjb25zaXN0ZW5jeSB3aXRo
IHB0cmRpZmZfdC4KX19VSU5UUFRSX1RZUEVfXyBpcyBzYWZlIHRvIHVzZSBhcyBpdCBpcyBhIGNv
bW1vbiBwcmVkZWZpbmVkIG1hY3JvIG9mCkdOVSBDOyBpdCBpcyBkZWZpbmVkIHRvIHRoZSBjb3Jy
ZWN0IHVuZGVybHlpbmcgdHlwZSBhcyBwZXIgR0NDCmRvY3VtZW50YXRpb25bMV0uCgpbMV0gaHR0
cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2NwcC9Db21tb24tUHJlZGVmaW5lZC1NYWNyb3Mu
aHRtbAoKQWxzbywgaXQgaXMgbm90IGEgZ29vZCBpZGVhIHRvIHVzZSBfX21vZGVfXyhfX3BvaW50
ZXJfXykgdG8gZGVmaW5lCnVpbnRwdHJfdCwgYmVjYXVzZSBpdCByZWxpZXMgb24gYW4gb2JzY3Vy
ZWx5IGRlZmluZWQgR0NDIGZlYXR1cmUgd2hvc2UKc2VtYW50aWNzIG1pZ2h0IGJlIHRha2VuIHRv
IGltcGx5IHRoYXQgdGhlIHRoaW5ncyBhcmUgcmVhbGx5IHBvaW50ZXJzLgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
