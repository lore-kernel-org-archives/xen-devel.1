From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 04/18] xen/arm: While a domain is suspended
 put its watchdogs on pause
Date: Mon, 12 Nov 2018 08:23:04 -0700
Message-ID: <5BE99AD802000078001FB100@prv1-mh.provo.novell.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-5-git-send-email-mirela.simonovic@aggios.com>
 <5BE9684802000078001FADC0@prv1-mh.provo.novell.com>
 <CAKPH-NgJ=YFcdQtL4iN3RbFTLyiV7VgHWo1YVZw4qA5Sh5MtHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-NgJ=YFcdQtL4iN3RbFTLyiV7VgHWo1YVZw4qA5Sh5MtHw@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: mirela.simonovic@aggios.com
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, dm@aggios.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, saeed.nowshadi@xilinx.com, Xen Devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, stefano.stabellini@xilinx.com, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjExLjE4IGF0IDE2OjE3LCA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPiB3
cm90ZToKPiBIaSBKYW4sCj4gCj4gT24gTW9uLCBOb3YgMTIsIDIwMTggYXQgMTI6NDcgUE0gSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4KPj4gPj4+IE9uIDEyLjExLjE4
IGF0IDEyOjMwLCA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPiB3cm90ZToKPj4gPiAtLS0g
YS94ZW4vaW5jbHVkZS94ZW4vdGltZXIuaAo+PiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi90aW1l
ci5oCj4+ID4gQEAgLTE4LDYgKzE4LDkgQEAgc3RydWN0IHRpbWVyIHsKPj4gPiAgICAgIC8qIFN5
c3RlbSB0aW1lIGV4cGlyeSB2YWx1ZSAobmFub3NlY29uZHMgc2luY2UgYm9vdCkuICovCj4+ID4g
ICAgICBzX3RpbWVfdCBleHBpcmVzOwo+PiA+Cj4+ID4gKyAgICAvKiBTdXNwZW5kIHRpbWVzdGFt
cCB2YWx1ZSAobmFub3NlY29uZHMgc2luY2UgYm9vdCkuICovCj4+ID4gKyAgICBzX3RpbWVfdCBz
dXNwZW5kZWQ7Cj4+Cj4+IEkgY2FuJ3Qgc2VlIGhvdyB0aGlzIGJlY29tZXMgYSB1bml2ZXJzYWxs
eSB1c2VmdWwgZmllbGQsIHNvIEkKPj4gZG9uJ3QgdGhpbmsgaXQgYmVsb25ncyBoZXJlLiBGb3Ig
eW91ciBwdXJwb3NlIGRlcml2aW5nIGEgbmV3Cj4+IHN0cnVjdHVyZSBjb250YWluaW5nIHN0cnVj
dCB0aW1lciBhbmQgdGhpcyBvbmUgZmllbGQgc2hvdWxkCj4+IHdvcmsuCj4gCj4gRWFjaCAnZXhw
aXJlcycgdmFsdWUgbmVlZHMgdG8gYmUgY291cGxlZCB3aXRoICdzdXNwZW5kZWQnIHZhbHVlIHRv
IGJlCj4gYWJsZSB0byBkZWFsIHdpdGggd2F0Y2hkb2dzIHdoZW4gc3VzcGVuZGluZyBhIGRvbWFp
bi4gVGhpcyBpcyBzcGVjaWZpYwo+IHRvIGEgd2F0Y2hkb2cuCj4gSWYgd2UgYWRkIGEgZGVyaXZl
ZCBzdHJ1Y3R1cmUgdG8gY29udGFpbiB0aGlzIGZpZWxkIHdlIHN0aWxsIG5lZWQgdG8KPiBhc3Nv
Y2lhdGUgc3VjaCBhIHN0cnVjdHVyZSB3aXRoIGVhY2ggd2F0Y2hkb2cgb2YgYSBkb21haW4sIHdo
aWNoIGlzCj4gYWxzbyBkb21haW4gZ2VuZXJpYyBpbmZvIGFuZCByZXF1aXJlcyBhIGxvdCBtb3Jl
IChpbiBteSBvcGluaW9uCj4gdW5uZWNlc3NhcnkpIGNoYW5nZXMuIFBsZWFzZSBsZXQgbWUga25v
dyBpZiBJIG1pc2ludGVycHJldGVkIHlvdXIKPiBwcm9wb3NhbC4KCllvdSBhZGQgdGhlIGZpZWxk
IHRvIGFsbCB0aW1lciBpbnN0YW5jZXMsIHlldCB5b3UgbmVlZCBpdCBvbmx5IGZvcgp2ZXJ5IGZl
dy4gV2h5IG5vdCBoYXZlIGEgc3RydWN0IHdhdGNoZG9nX3RpbWVyLCBhbmQgdXNlIGl0CmZvciBz
dHJ1Y3QgZG9tYWluJ3Mgd2F0Y2hkb2dfdGltZXJbXT8gSSdtIGFmcmFpZCBJIGRvbid0IHNlZSB0
aGUKZGlmZmljdWx0aWVzIHlvdSBhcHBlYXIgdG8gc2VlLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
