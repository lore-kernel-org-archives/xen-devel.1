From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v14 4/9] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Fri, 05 Oct 2018 05:17:37 -0600
Message-ID: <5BB7485102000078001EEC83@prv1-mh.provo.novell.com>
References: <20181004104547.32316-1-paul.durrant@citrix.com>
 <20181004104547.32316-5-paul.durrant@citrix.com>
 <37e5e689-110e-6bc4-1a54-8401d58dc282@citrix.com>
 <456a887cbf714c2f84c2548168df1b97@AMSPEX02CL03.citrite.net>
 <5BB713B302000078001EEA3E@prv1-mh.provo.novell.com>
 <dc09b38c8b4946f6b2ba60a7e987e7e3@AMSPEX02CL03.citrite.net>
 <F5DD545D-610B-40C7-827C-4CEAA2DF5F04@citrix.com>
 <8B147463-7834-4525-AC10-36922338876F@citrix.com>
 <b6add5ff3b6647eaab63265dbaf923bd@AMSPEX02CL03.citrite.net>
 <28341D09-548F-460C-8B22-43CA61EA1308@citrix.com>
 <1b82387a547044979ec6eae55c271f81@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vier=mr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g8O72-0005UL-6b
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 11:17:40 +0000
In-Reply-To: <1b82387a547044979ec6eae55c271f81@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com, Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDEyOjM4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBHZW9yZ2UgRHVubGFwCj4+IFNlbnQ6IDA1IE9jdG9iZXIgMjAxOCAxMTozNQo+
PiAKPj4gPiBPbiBPY3QgNSwgMjAxOCwgYXQgMTE6MjcgQU0sIFBhdWwgRHVycmFudCA8UGF1bC5E
dXJyYW50QGNpdHJpeC5jb20+Cj4+IHdyb3RlOgo+PiA+IEJ1dCBmb3IgbWFwcGluZyB0b28/IEl0
IHNlZW1zIHVubmVjZXNzYXJ5IHRvIGNyYXNoIHRoZSBkb21haW4gaW4gdGhhdAo+PiBjYXNlLgo+
PiAKPj4gSVNUUiB0aGF0IHRoZSBkb21haW5fY3Jhc2goKSB3YXMgYWRkZWQgb25seSBhIGZldyB5
ZWFycyBhZ287IEnigJlkIGhhdmUgdG8KPj4gZ28gYmFjayBhbmQgc2VlIHRoZSByZWFzb25pbmcg
Zm9yIGl0IGJlaW5nIGFkZGVkIGluIHRoZSBmaXJzdCBwbGFjZS4gIEnigJlsbAo+PiBkbyB0aGF0
IE1vbmRheSBpZiBKYW4gZG9lc27igJl0IGJlYXQgbWUgdG8gaXQuCj4+IAo+IAo+IEkgd2FzIGFk
ZGVkIGJ5IHRoZSBmb2xsb3dpbmcgY29tbWl0Ogo+IAo+IGNvbW1pdCA4MzRjOTdiYWViYjM3NDNj
NTRiY2FlMjI4ZTk4NGFlMWI5NjkyZTZhCj4gQXV0aG9yOiBRdWFuIFh1IDxxdWFuLnh1QGludGVs
LmNvbT4KPiBEYXRlOiAgIFR1ZSBKdW4gMTQgMTU6MTA6NTcgMjAxNiArMDIwMAo+IAo+ICAgICBJ
T01NVTogaGFuZGxlIElPTU1VIG1hcHBpbmcgYW5kIHVubWFwcGluZyBmYWlsdXJlcwo+IAo+ICAg
ICBUcmVhdCBJT01NVSBtYXBwaW5nIGFuZCB1bm1hcHBpbmcgZmFpbHVyZXMgYXMgYSBmYXRhbCB0
byB0aGUgRG9tVQo+ICAgICBJZiBJT01NVSBtYXBwaW5nIGFuZCB1bm1hcHBpbmcgZmFpbGVkLCBj
cmFzaCB0aGUgRG9tVSBhbmQgcHJvcGFnYXRlCj4gICAgIHRoZSBlcnJvciB1cCB0byB0aGUgY2Fs
bCB0cmVlcy4KPiAKPiAgICAgTm8gc3BhbW1pbmcgb2YgdGhlIGxvZyBjYW4gb2NjdXIuIEZvciBE
b21VLCB3ZSBhdm9pZCBsb2dnaW5nIGFueQo+ICAgICBtZXNzYWdlIGZvciBhbHJlYWR5IGR5aW5n
IGRvbWFpbnMuIEZvciBEb20wLCB0aGF0J2xsIHN0aWxsIGJlIG1vcmUKPiAgICAgdmVyYm9zZSB0
aGFuIHdlJ2QgcmVhbGx5IGxpa2UsIGJ1dCBpdCBhdCBsZWFzdCB3b3VsZG4ndCBvdXRyaWdodAo+
ICAgICBmbG9vZCB0aGUgY29uc29sZS4KPiAKPiAgICAgU2lnbmVkLW9mZi1ieTogUXVhbiBYdSA8
cXVhbi54dUBpbnRlbC5jb20+Cj4gICAgIFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT4KPiAgICAgUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiAKPiBTbyB0aGUganVzdGlmaWNhdGlvbiBhcHBlYXJzIHRvIGJlIHRvIGF2b2lk
IGxvZyBzcGFtLgoKSWlyYyB0aGF0IHBhcnQgb2YgdGhlIGRlc2NyaXB0aW9uIG9ubHkgZXhpc3Rz
IGJlY2F1c2UgZWFybHkgdmVyc2lvbiBvZgp0aGF0IHBhdGNoIGRpZCBpbnRyb2R1Y2UgbG9nIHNw
YW0uCgpUaGUgcHJvYmxlbSBpaXJjIGlzIG1haW5seSBwcm9wZXIgZXJyb3IgaGFuZGxpbmcsIGlu
IHBhcnRpY3VsYXIgcHJvcGVyCnVud2luZGluZyBvZiBlYXJsaWVyIG1hcHBpbmdzIHRoYXQgbWF5
IGhhdmUgZ290IGluc3RhbGxlZApzdWNjZXNzZnVsbHkgaW4gdGhlIGNvbnRleHQgb2YgdGhlIHNh
bWUgaHlwZXJjYWxsIChvciB3aGF0ZXZlcikuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
