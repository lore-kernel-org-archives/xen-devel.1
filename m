From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] x86: Use spec_ctrl_{enter,
 exit}_idle() in the S3/S5 path
Date: Wed, 18 Apr 2018 10:14:27 -0600
Message-ID: <5AD76EE302000078001BC773@prv1-mh.provo.novell.com>
References: <1524048235-19493-1-git-send-email-andrew.cooper3@citrix.com>
 <5AD7678A02000078001BC722@prv1-mh.provo.novell.com>
 <428287ee-8448-b06a-00a6-e5f2a3d57b31@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <428287ee-8448-b06a-00a6-e5f2a3d57b31@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA0LjE4IGF0IDE4OjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTgvMDQvMTggMTY6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxOC4w
NC4xOCBhdCAxMjo0MywgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gVGhp
cyBhdm9pZHMgb3BlbmNvZGluZyB0aGUgZnVuY3Rpb25hbGl0eSAoYW5kIG1pc3Npbmcgb25lIGJp
dCBvZiBpdCksIGFuZCBhbmQKPj4+IHNvbWUgY29tbWVudHMgZXhwbGFpbmluZyB3aGF0IGlzIGdv
aW5nIG9uLgo+PiBNaXNzaW5nIHdoaWNoIGJpdCBvZiBpdD8gVGhlIE1TUiB3cml0ZXMgYXJlbid0
IHN0cmljdGx5IG5lY2Vzc2FyeSBhZmFpY3QsIGFuZAo+PiBmdW5jdGlvbmFsbHkgY2xlYXJpbmcg
YnRpX2lzdF9pbmZvIGlzIGFsbCB0aGF0J3MgbmVlZGVkIGZvciB0aGUgZW50cnkgcGF0aCBvZgo+
PiBpbnRlcmVzdCwgd2hpbGUgY2xlYXJpbmcgdXNlX3NoYWRvd19zcGVjX2N0cmwgaXMgYWxsIHRo
YXQncyBuZWVkZWQgZm9yIHRoZQo+PiBleGl0LXRvLVhlbiBwYXRoLiBIZW5jZSBJJ20gZG9uJ3Qg
c2VlICh5ZXQpIHdoYXQgYnVnIGl0IGlzIHlvdSB0aGluayB0aGlzCj4+IGZpeGVzLgo+IAo+IEl0
IGlzIGV4cGVjdGVkIHRoYXQgd2UgZG9uJ3QgaGFuZCBvZmYgY29udHJvbCB0byB0aGUgZmlybXdh
cmUgaW4gY2FzZXMKPiBsaWtlIHRoaXMgd2l0aCB0aGUgbWl0aWdhdGlvbnMgaW4gcGxhY2UuICBI
ZXJlLCBpdCBkb2Vzbid0IGFjdHVhbGx5Cj4gbWF0dGVyIHRvbyBtdWNoLCBidXQgdGhlcmUgaXMg
bm8gcG9pbnQgaGF2aW5nIHRoZSBtaXRpZ2F0aW9ucyBpbiBlZmZlY3QKPiB3aGVuIHdlJ3JlIHRo
ZSBmaW5hbCBDUFUgYW5kIHRyeWluZyB0byBzaHV0IGRvd24uCgpXaXRoIGFuIGltcHJvdmVkIGRl
c2NyaXB0aW9uIHRoZSBwYXRjaCBjYW4gY2VydGFpbmx5IGhhdmUgbXkgUi1iOyB0aGUKY29kZSBj
aGFuZ2UgaXRzZWxmIGlzIGNsZWFybHkgZmluZSB3aXRoIG1lLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
