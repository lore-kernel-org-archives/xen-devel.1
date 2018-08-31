From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: Fix inconsistent callers of panic()
Date: Fri, 31 Aug 2018 01:04:33 -0600
Message-ID: <5B88E88102000078001E3BEF@prv1-mh.provo.novell.com>
References: <1535632297-29549-1-git-send-email-andrew.cooper3@citrix.com>
 <5B87FA3102000078001E38B7@prv1-mh.provo.novell.com>
 <e5ad89df-4408-259b-7a34-1c242c3fb931@citrix.com>
 <5B88E15002000078001E3BBD@prv1-mh.provo.novell.com>
 <7e1164f8-68af-a08b-ff54-4d077562a2ce@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7e1164f8-68af-a08b-ff54-4d077562a2ce@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA4LjE4IGF0IDA4OjQzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAz
MS8wOC8xOCAwODozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDMwLjA4LjE4IGF0IDE5
OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBPbiAzMC8wOC8xOCAx
NTowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMzAuMDguMTggYXQgMTQ6MzEsIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+Pj4gVGhlIG9ic2VydmFudCBhbW9u
Z3N0IHlvdSBtaWdodCByZWFsaXNlIHRoYXQgdGhpcyByZXZlcnRzIHBhcnRzIG9mIGMvcwo+Pj4+
PiA1MWFkOTBhZWEyMWMgLSBXaGF0IGNhbiBJIHNheT8gIFNldmVyYWwgeWVhcnMgb2YgaGluZHNp
Z2h0IGlzIHZlcnkgdXNlZnVsLCBhbmQKPj4+Pj4gYXQgdGhlIHRpbWUgSSBkaWQgYXNrIHRoZSBt
YWludGFpbmVycyB3aGljaCBvcHRpb24gdGhleSB0aG91Z2h0IHdvdWxkIGJlCj4+Pj4+IGJldHRl
ci4uLgo+Pj4+IC4uLiBJIHRoaW5rIGJvdGggdGhlIGVhcmxpZXIgYW5kIHRoaXMgY2hhbmdlIGFy
ZSBoZWFkaW5nIGluIHRoZQo+Pj4+IHdyb25nIGRpcmVjdGlvbjogSSB3b3VsZCBtdWNoIHJhdGhl
ciBzZWUgdGhlIG5ld2xpbmUgb21pdHRlZAo+Pj4+IGV2ZXJ5d2hlcmUsIF9pbmNsdWRpbmdfIGlu
IHBhbmljKCkgaXRzZWxmOiBUaGlzIGNhdXNlcyBvbmUgbGluZQo+Pj4+IGxlc3MgdG8gc2Nyb2xs
IG9mZiB0aGUgc2NyZWVuIGluIGNhc2UgeW91IGRvbid0IGhhdmUgYSBzZXJpYWwKPj4+PiBjb25z
b2xlLgo+IAo+IENhbid0IHdlIGp1c3QgZHJvcCBwcmludGluZyB0aGUgZXh0cmEgXG4gaW4gcGFu
aWMoKT8KPiAKPiAtICAgIHByaW50aygiJXNcbiIsIGJ1Zik7Cj4gKyAgICBwcmludGsoIiVzIiwg
YnVmKTsKClRoYXQncyB3aGF0IEknbSBzdWdnZXN0aW5nLCB5ZXMsIHBsdXMgKGlmIHRoZXJlIGFy
ZSBhbnkpIGRyb3BwaW5nCnRyYWlsaW5nIG5ld2xpbmVzIGluIHBhbmljKCkgaW52b2NhdGlvbnMu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
