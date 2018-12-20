From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 13/25] argo: implement the register op
Date: Thu, 20 Dec 2018 01:51:06 -0700
Message-ID: <5C1B57FA0200007800207EBD@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-14-git-send-email-christopher.w.clark@gmail.com>
 <20181212164721.hag6gc3akcm2gvhd@mac>
 <CACMJ4GZRAck4oYtXJpV3c_tGer0n+EUuWjXCtcjLbySOs0W78w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gZu2w-0003a6-Jb
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 08:51:10 +0000
In-Reply-To: <CACMJ4GZRAck4oYtXJpV3c_tGer0n+EUuWjXCtcjLbySOs0W78w@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDA2OjQxLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IE9uIFdlZCwgRGVjIDEyLCAyMDE4IGF0IDg6NDggQU0gUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+Pgo+PiBPbiBGcmksIE5vdiAzMCwgMjAx
OCBhdCAwNTozMjo1MlBNIC0wODAwLCBDaHJpc3RvcGhlciBDbGFyayB3cm90ZToKPj4gPiArc3Rh
dGljIGlubGluZSB1aW50MTZfdAo+PiA+ICthcmdvX2hhc2hfZm4oY29uc3Qgc3RydWN0IGFyZ29f
cmluZ19pZCAqaWQpCj4+Cj4+IE5vIG5lZWQgZm9yIHRoZSBhcmdvXyBwcmVmaXggZm9yIHN0YXRp
YyBmdW5jdGlvbnMsIHRoaXMgaXMgYWxyZWFkeSBhbgo+PiBhcmdvIHNwZWNpZmljIGZpbGUuCj4g
Cj4gQWx0aG91Z2ggdGhlIGNvbXBpbGVyIGNvdWxkIGxpdmUgd2l0aG91dCB0aGUgcHJlZml4LCBJ
J20gZmluZGluZyBpdCBoZWxwZnVsIHRvCj4gdmVyeSBlYXNpbHkgZGV0ZXJtaW5lIHRoYXQgZnVu
Y3Rpb25zIGJlaW5nIHVzZWQgYXJlIG5vdCBkZWZpbmVkIGVsc2V3aGVyZQo+IHdpdGhpbiBYZW47
IHNvIEkndmUgbGVmdCB0aGUgcHJlZml4IGFzIGlzIGZvciB2ZXJzaW9uIHR3byBvZiB0aGlzIHNl
cmllcy4KCkJ1dCB5b3UgcmVhbGl6ZSB0aGF0IHRoaXMgbmVlZGxlc3NseSBpbmNyZWFzZXMgdGhl
IHN0cmluZyB0YWJsZQpzaXplIGFzIHdlbGwgYXMgdGhlIHZvbHVtZSBvZiBvdXRwdXQgZ29pbmcg
b3ZlciB0aGUgKG5vcm1hbGx5CmxvdyBiYW5kd2lkdGgpIHNlcmlhbCBsaW5lIGluIGNhc2Ugb2Yg
YW4gaXN1c2U/Cgo+PiA+ICsvKgo+PiA+ICsgKiBNZXNzYWdlcyBvbiB0aGUgcmluZyBhcmUgcGFk
ZGVkIHRvIDEyOCBiaXRzCj4+ID4gKyAqIExlbiBoZXJlIHJlZmVycyB0byB0aGUgZXhhY3QgbGVu
Z3RoIG9mIHRoZSBkYXRhIG5vdCBpbmNsdWRpbmcgdGhlCj4+ID4gKyAqIDEyOCBiaXQgaGVhZGVy
LiBUaGUgbWVzc2FnZSB1c2VzCj4+ID4gKyAqICgobGVuICsgMHhmKSAmIH4weGYpICsgc2l6ZW9m
KGFyZ29fcmluZ19tZXNzYWdlX2hlYWRlcikgYnl0ZXMuCj4+ID4gKyAqIFVzaW5nIHR5cGVvZihh
KSBtYWtlIGNsZWFyIHRoYXQgdGhpcyBkb2VzIG5vdCB0cnVuY2F0ZSBhbnkgaGlnaC1vcmRlciBi
aXRzLgo+PiA+ICsgKi8KPj4gPiArI2RlZmluZSBBUkdPX1JPVU5EVVAoYSkgKCgoYSkgKyAweGYp
ICYgfih0eXBlb2YoYSkpMHhmKQo+Pgo+PiBXaHkgbm90IGp1c3QgdXNlIFJPVU5EVVA/Cj4+Cj4+
IEFuZCBpbiBhbnkgY2FzZSB0aGlzIHNob3VsZG4ndCBiZSBvbiB0aGUgcHVibGljIGhlYWRlciBJ
TU8sIHNpbmNlIGl0J3MKPj4gbm90IHBhcnQgb2YgdGhlIGludGVyZmFjZSBBRkFJQ1QuCj4gCj4g
V2VsbCwgaW4gdmVyc2lvbiB0d28gaXQncyBub3c6IFhFTl9BUkdPX1JPVU5EVVAgOi0pCj4gYmVj
YXVzZSBpdCBkb2VzIG5lZWQgdG8gYmUgaW4gdGhlIHB1YmxpYyBoZWFkZXIgYmVjYXVzZSBpdCdz
IHVzZWQgd2l0aGluIHRoZQo+IExpbnV4IGRldmljZSBkcml2ZXIsIGFuZCBpdGVtcyBpbiB0aGF0
IHB1YmxpYyBYZW4gaGVhZGVyIG5lZWQgdGhlICd4ZW4nIHByZWZpeAo+IChzbyB0aGV5IG5vdyBk
bykuICBXaXRoaW4gdGhlIExpbnV4IGNvZGUsIGl0J3MgdXNlZCB0byBjaG9vc2UgYSBzZW5zaWJs
ZSByaW5nCj4gc2l6ZSwgYW5kIGFsc28gdXNlZCB3aGVuIG1hbmlwdWxhdGluZyB0aGUgcnhfcHRy
IG9uIHRoZSBndWVzdCBzaWRlLgoKSXQncyBhdCBsZWFzdCBxdWVzdGlvbmFibGUgdG8gcHV0IGNv
bnN0cnVjdHMgaW50byB0aGUgcHVibGljIGhlYWRlcgp0aGF0IHRoZSBoZWFkZXIgaXRzZWxmIGRv
ZXNuJ3QgdXNlLCBhbmQgdGhlIG5hbWluZyBvZiB3aGljaCBtYXkKbm90IGJlIHdoYXQgY29uc3Vt
ZXJzIHdvdWxkIHByZWZlci4gSSBjYW4gc2VlIHRoZSAic2luZ2xlCmNlbnRyYWwgcGxhY2UiIHBv
aW50IHRob3VnaC4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
