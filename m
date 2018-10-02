From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 10/12] IOMMU: introduce IOMMU_MIXED
 config option
Date: Tue, 02 Oct 2018 04:42:44 -0600
Message-ID: <5BB34BA402000078001EDAF1@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB345DD02000078001EDA5A@prv1-mh.provo.novell.com>
 <cd8f6501-75d8-4c97-8559-77ac5b834fc6@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0jmz=mo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g7I8h-0003Vt-0E
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 10:42:51 +0000
In-Reply-To: <cd8f6501-75d8-4c97-8559-77ac5b834fc6@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjEwLjE4IGF0IDEyOjM4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDAyLzEwLzIwMTggMTE6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBUk0gaXMgaW50ZW5k
ZWQgdG8gZ2FpbiBzdXBwb3J0IGZvciBoZXRlcm9nZW5lb3VzIElPTU1VcyBvbiBhIHNpbmdsZQo+
PiBzeXN0ZW0uIFRoaXMgbm90IG9ubHkgZGlzYWxsb3dzIGJvb3QgdGltZSByZXBsYWNlbWVudCBv
ZiByZXNwZWN0aXZlCj4+IGluZGlyZWN0IGNhbGxzIChoYW5kbGluZyBvZiB3aGljaCBpcyB0aGUg
bWFpbiBnb2FsIG9mIHRoZSBpbnRyb2R1Y3Rpb24KPj4gaGVyZSksIGJ1dCBtb3JlIGdlbmVyYWxs
eSBkaXNhbGxvd3MgY2FsbHMgdXNpbmcgdGhlIGlvbW11X29wcygpIHJldHVybgo+PiB2YWx1ZSBk
aXJlY3RseSAtIGFsbCBzdWNoIGNhbGxzIG5lZWQgdG8gaGF2ZSBtZWFucyAoY29tbW9ubHkgYSBk
b21haW4KPj4gcG9pbnRlcikgdG8ga25vdyB0aGUgdGFyZ2V0ZWQgSU9NTVUuCj4+IAo+PiBEaXNh
bGxvdyBhbGwgaG9va3MgbGFja2luZyBzdWNoIGNvbnRleHQgZm9yIHRoZSB0aW1lIGJlaW5nLCB3
aGljaCBpbgo+PiBlZmZlY3QgaXMgc29tZSBkZWFkIGNvZGUgZWxpbWluYXRpb24gZm9yIEFSTS4g
T25jZSBleHRlbmRlZCBzdWl0YWJseSwKPj4gaW5kaXZpZHVhbCBvZiB0aGVzZSBob29rcyBjYW4g
YmUgbW92ZWQgb3V0IG9mIHRoZWlyIGd1YXJkcyBhZ2FpbiBpbiB0aGUKPj4gZnV0dXJlLgo+IAo+
IFdoaWxlIGluIHRoZW9yeSBpdCBpcyBwb3NzaWJsZSB0byBoYXZlIHBsYXRmb3JtIHdpdGggaGV0
ZXJlbmVvdXMgSU9NTVVzLiAKPiAgIEkgZG9uJ3Qgc2VlIHN1Y2ggc3VjaCBzdXBwb3J0IGNvbWlu
ZyBpbiBYZW4gZm9yIHRoZSBmb3Jlc2VlYWJsZSAKPiBmdXR1cmUuIE5vdGUgdGhhdCBldmVuIExp
bnV4IGRvZXMgbm90IHN1cHBvcnQgc3VjaCBjYXNlLgo+IAo+IFRoaXMgcGF0Y2ggaXMgZ29pbmcg
dG8gbWFrZSBtb3JlIGNvbXBsaWNhdGUgdG8gdW5zaGFyZSBwYWdlLXRhYmxlcyBhcyAKPiBub3cg
d2Ugd291bGQgbmVlZCB0byBjYXJlIG9mIG1peGVkIGNhc2UuIFNvIEkgd291bGQgcmF0aGVyIG5v
dCBzZXQgCj4gSU9NTVVfTUlYRUQgb24gQXJtIHVudGlsIHdlIGhhdmUgYSB1c2UgY2FzZSBmb3Ig
aXQuCgpJbnRlcmVzdGluZy4gSSBlc3NlbmNlIHRoaXMgaXMgdGhlIGV4YWN0IG9wcG9zaXRlIG9m
IHdoYXQgeW91J3ZlCnRvbGQgbWUgd2hlbiBJIGlucXVpcmVkIGFib3V0IGluZGlyZWN0IGNhbGwg
cGF0Y2hpbmcgb2YgdGhlIElPTU1VCmNvZGUuIFRoZSBzb2xlIHB1cnBvc2Ugb2YgdGhpcyBuZXcg
b3B0aW9uIGlzIHRvIGhhdmUgYSBrZXkgb2ZmIG9mCndoaWNoIEkgY2FuIHRlbGwgd2hldGhlciB0
byB1c2UgcGF0Y2hhYmxlIGluZGlyZWN0IGNhbGxzIG9yIHBsYWluCm9uZXMuCgpJJ20gYWxzbyBu
b3QgZm9sbG93aW5nIGhvdyB0aGlzIGNoYW5nZSB3b3VsZCBjb21wbGljYXRlIGFueXRoaW5nCmZv
ciB5b3UuIFRoZXJlJ3MgZWZmZWN0aXZlbHkgbm8gY2hhbmdlIGZvciBBUk0sIGV4Y2VwdCBmb3Ig
c29tZQpkZWFkIGNvZGUgbm90IGdldHRpbmcgYnVpbHQgYW55bW9yZS4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
