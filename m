From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 03/17] x86: turn is_pv_{, 32bit_}{domain,
 vcpu} into inline functions
Date: Fri, 12 Oct 2018 07:46:13 -0600
Message-ID: <5BC0A5A502000078001F1040@prv1-mh.provo.novell.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <48b3c6476789e4026b8be7864ffa42fed41ce1cd.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tlq1=my=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gAxlj-0001Za-D1
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 13:46:19 +0000
In-Reply-To: <48b3c6476789e4026b8be7864ffa42fed41ce1cd.1538667753.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEwLjE4IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2No
ZWQuaAo+IEBAIC04NzcsOCArODc3LDI1IEBAIHZvaWQgd2F0Y2hkb2dfZG9tYWluX2Rlc3Ryb3ko
c3RydWN0IGRvbWFpbiAqZCk7Cj4gIAo+ICAjZGVmaW5lIFZNX0FTU0lTVChkLCB0KSAodGVzdF9i
aXQoVk1BU1NUX1RZUEVfICMjIHQsICYoZCktPnZtX2Fzc2lzdCkpCj4gIAo+IC0jZGVmaW5lIGlz
X3B2X2RvbWFpbihkKSAoKGQpLT5ndWVzdF90eXBlID09IGd1ZXN0X3R5cGVfcHYpCj4gLSNkZWZp
bmUgaXNfcHZfdmNwdSh2KSAgIChpc19wdl9kb21haW4oKHYpLT5kb21haW4pKQo+ICtzdGF0aWMg
aW5saW5lIGJvb2wgaXNfcHZfZG9tYWluKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCj4gK3sKPiAr
ICAgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19QVikgPyBkLT5ndWVzdF90eXBlID09IGd1ZXN0
X3R5cGVfcHYgOiBmYWxzZTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSBib29sIGlzX3B2X3Zj
cHUoY29uc3Qgc3RydWN0IHZjcHUgKnYpCj4gK3sKPiArICAgIHJldHVybiBpc19wdl9kb21haW4o
di0+ZG9tYWluKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSBib29sIGlzX3B2XzMyYml0X2Rv
bWFpbihjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+ICt7Cj4gKyAgICByZXR1cm4gaXNfcHZfZG9t
YWluKGQpICYmIGQtPmFyY2guaXNfMzJiaXRfcHY7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUg
Ym9vbCBpc19wdl8zMmJpdF92Y3B1KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+ICt7Cj4gKyAgICBy
ZXR1cm4gaXNfcHZfMzJiaXRfZG9tYWluKHYtPmRvbWFpbik7Cj4gK30KCkFmYWljdCB0aGlzIGJy
ZWFrcyB0aGUgQXJtIGJ1aWxkLCBpLmUuIEkgdGhpbmsgeW91IG5lZWQgZS5nLgojaWZkZWYgQ09O
RklHX0NPTVBBVCBhcm91bmQgdGhlIGxhc3QgdHdvLiAoSSBjYW4gc2VlIHdoeSwKYmVpbmcgaW5s
aW5lIGZ1bmN0aW9ucyBub3csIHRoZXkgY2FuJ3QgcmVtYWluIGluIHRoZSBhcmNoLXNwZWNpZmlj
CmhlYWRlci4pIFdpdGggdGhpcwpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
