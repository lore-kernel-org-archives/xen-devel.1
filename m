From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 1/5] xen: introduce ptrdiff_t,
 fix uintptr_t
Date: Tue, 12 Feb 2019 09:03:48 -0700
Message-ID: <5C62EE640200007800216073@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1902111631220.347@sstabellini-ThinkPad-X260>
 <1549934011-17624-1-git-send-email-sstabellini@kernel.org>
 <5C62DF510200007800215FED@prv1-mh.provo.novell.com>
 <23650.58792.585302.814152@mariner.uk.xensource.com>
 <2a4ab597-7cc2-2668-34ac-ca708df88bb3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtaXN-00071e-4F
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 16:03:57 +0000
In-Reply-To: <2a4ab597-7cc2-2668-34ac-ca708df88bb3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAyLjE5IGF0IDE2OjMyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTIvMDIvMjAxOSAxNToyNiwgSWFuIEphY2tzb24gd3JvdGU6Cj4+Cj4+PiBCdXQg
aWYgd2UgcmVhbGx5IHdhbnQgdG8gaGF2ZSBwdHJkaWZmX3QsIHRoZW4gSSB0aGluayB3ZSBzaG91
bGQgZWl0aGVyCj4+PiBmb2xsb3cgdGhlIHVpbnRwdHJfdCBtb2RlbCBhbmQgdXNlIGF0dHJpYnV0
ZSgobW9kZSgpKSksIG9yIHdlIHNob3VsZAo+Pj4gbGV2ZXJhZ2UgdGhlIGNvbXBpbGVyJ3MgX19Q
VFJESUZGX1RZUEVfXyAoYW5kIHRoZW4gYWxzbwo+Pj4gX19VSU5UUFRSX1RZUEVfXyBmb3IgdWlu
dHB0cl90LCBhdCBsZWFzdCBpZiBhdmFpbGFibGUgLSBub3Qgc3VyZSB3aGF0Cj4+PiBpdHMgYXZh
aWxhYmlsaXR5IGRlcGVuZHMgb24sIGJ1dCBpdCdzIGNvbmRpdGlvbmFsIGluIGdjYydzCj4+PiBj
X3N0ZGRlZl9jcHBfYnVpbHRpbnMoKSkuCj4+IEl0IGlzIG5vdCB1bnVzdWFsIGZvciBwb3J0aW5n
IHNvbWV0aGluZyBsaWtlIFhlbiB0byBhIG5ldyBhcmNoaXRlY3R1cmUKPj4gdG8gaW52b2x2ZSB3
cml0aW5nIGEgc2hvcnQgaGVhZGVyIGZpbGUgd2l0aCB0aGVzZSBraW5kIG9mIHR5cGUKPj4gZGVm
aW5pdGlvbnMuICBJIGRvbid0IGtub3cgd2h5IHdlIGNvdWxkbid0IHRha2UgdGhhdCBhcHByb2Fj
aC4KPiAKPiBzdGRpbnQuaCBhbmQgaW50dHlwZXMuaCBhcmUgYSBmcmVlc3RhbmRpbmcgaGVhZGVy
IGZpbGVzLCBhbmQgYXJlCj4gaW50ZW5kZWQgZm9yIHVzZXMganVzdCBsaWtlIHRoaXMuCj4gCj4g
TGV0cyBzdG9wIHNlY29uZCBndWVzc2luZyBvdXIgYnVpbGQgZW52aXJvbm1lbnQsIGFuZCB1c2Ug
dGhlIHNvbHV0aW9uIHRvCj4gdGhlIHByb2JsZW0gZ2l2ZW4gdG8gdXMgYnkgdGhlIEMgc3BlY2lm
aWNhdGlvbi4KPiAKPiBBbmQgdG8gYmUgY3J5c3RhbCBjbGVhci4gIFRoaXMgbWVhbnMgaW5jbHVk
aW5nIDxzdGRpbnQuaD4gYW5kCj4gPGludHR5cGVzLmg+IGluIHhlbi90eXBlcy5oIGFuZCBkZWxl
dGluZyBhbGwgb2YgdGhlc2UgdHlwZWRlZnMKCldlbGwsIHRoaXMgd291bGQgY2VydGFpbmx5IGJl
IGEgdmlhYmxlIHJvdXRlIGlmCi0gdGhlc2UgaGVhZGVycyB3ZXJlIHRydWx5IGZyZWVzdGFuZGlu
ZyAocmF0aGVyIHRoYW4gY29taW5nIGluIHRoZWlyCiAgb3duIGluY2FybmF0aW9uIHdpdGggZXZl
cnkgZ2NjIHZlcnNpb24sIGFuZCBwZXJoYXBzIGFsc28gd2l0aAogIGFueSBvdGhlciBjb21waWxl
cikKLSB3ZXJlIGd1YXJhbnRlZWQgYnVnIGZyZWUgb24gZXZlcnkgZGlzdHJvIHdlIGNhcmUgYWJv
dXQgYnVpbGRpbmcgb24KCkFzIGFuIGFzaWRlLCBpbnR0eXBlcy5oIGRvZXMgbm90IHNlZW0gdG8g
YmUgcGFydCBvZiB0aGUgaGVhZGVycwpyZXF1aXJlZCB0byBiZSBwcm92aWRlZCBieSBhIGZyZWUg
c3RhbmRpbmcgY29tcGlsZXIgaW1wbGVtZW50YXRpb24uCllldCBJIHRoaW5rIG5vIGdvb2QgY2Fu
IGNvbWUgZnJvbSBvdXQgb2Ygc3luYyBpbnR0eXBlcy5oIGFuZApzdGRpbnQuaC4KCkkgYXNzdW1l
IHlvdSBkaWQgcmVhZCBjaGFwdGVyIDIgIkxhbmd1YWdlIFN0YW5kYXJkcyBTdXBwb3J0ZWQKYnkg
R0NDIiBvZiB0aGUgZ2NjIGRvY3VtZW50YXRpb24sIGp1c3QgdG8gc2VlIHRoZWlyIHN0YXRlbWVu
dCBvZgp3aGF0IHRoZXkgKG1lYW4gdG8pIHN1cHBvcnQgaW4gc3VjaCBhIGNhc2UgKGFuZCB3aGF0
IHRoZXkgZG9uJ3QpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
