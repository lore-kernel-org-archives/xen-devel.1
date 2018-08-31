From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: Fix inconsistent callers of panic()
Date: Fri, 31 Aug 2018 08:43:34 +0200
Message-ID: <7e1164f8-68af-a08b-ff54-4d077562a2ce@suse.com>
References: <1535632297-29549-1-git-send-email-andrew.cooper3@citrix.com>
 <5B87FA3102000078001E38B7@prv1-mh.provo.novell.com>
 <e5ad89df-4408-259b-7a34-1c242c3fb931@citrix.com>
 <5B88E15002000078001E3BBD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B88E15002000078001E3BBD@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDgvMTggMDg6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMwLjA4LjE4IGF0
IDE5OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDMwLzA4LzE4
IDE1OjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDMwLjA4LjE4IGF0IDE0OjMxLCA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gVGhlIG9ic2VydmFudCBhbW9u
Z3N0IHlvdSBtaWdodCByZWFsaXNlIHRoYXQgdGhpcyByZXZlcnRzIHBhcnRzIG9mIGMvcwo+Pj4+
IDUxYWQ5MGFlYTIxYyAtIFdoYXQgY2FuIEkgc2F5PyAgU2V2ZXJhbCB5ZWFycyBvZiBoaW5kc2ln
aHQgaXMgdmVyeSB1c2VmdWwsIGFuZAo+Pj4+IGF0IHRoZSB0aW1lIEkgZGlkIGFzayB0aGUgbWFp
bnRhaW5lcnMgd2hpY2ggb3B0aW9uIHRoZXkgdGhvdWdodCB3b3VsZCBiZQo+Pj4+IGJldHRlci4u
Lgo+Pj4gLi4uIEkgdGhpbmsgYm90aCB0aGUgZWFybGllciBhbmQgdGhpcyBjaGFuZ2UgYXJlIGhl
YWRpbmcgaW4gdGhlCj4+PiB3cm9uZyBkaXJlY3Rpb246IEkgd291bGQgbXVjaCByYXRoZXIgc2Vl
IHRoZSBuZXdsaW5lIG9taXR0ZWQKPj4+IGV2ZXJ5d2hlcmUsIF9pbmNsdWRpbmdfIGluIHBhbmlj
KCkgaXRzZWxmOiBUaGlzIGNhdXNlcyBvbmUgbGluZQo+Pj4gbGVzcyB0byBzY3JvbGwgb2ZmIHRo
ZSBzY3JlZW4gaW4gY2FzZSB5b3UgZG9uJ3QgaGF2ZSBhIHNlcmlhbAo+Pj4gY29uc29sZS4KCkNh
bid0IHdlIGp1c3QgZHJvcCBwcmludGluZyB0aGUgZXh0cmEgXG4gaW4gcGFuaWMoKT8KCi0gICAg
cHJpbnRrKCIlc1xuIiwgYnVmKTsKKyAgICBwcmludGsoIiVzIiwgYnVmKTsKCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
