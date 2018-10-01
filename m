From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Mon, 01 Oct 2018 05:25:56 -0600
Message-ID: <5BB2044402000078001ED2E9@prv1-mh.provo.novell.com>
References: <20180607130829.18811-1-olaf@aepfle.de>
 <20180626191113.2d8e6876.olaf@aepfle.de>
 <20180801181747.170405d8.olaf@aepfle.de>
 <20180913093913.328a523a.olaf@aepfle.de>
 <20180928155052.5d7f66db.olaf@aepfle.de>
 <23473.64592.699718.316856@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <23473.64592.699718.316856@mariner.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEwLjE4IGF0IDEyOjUyLCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gT2xhZiBIZXJpbmcgd3JpdGVzICgiUmU6IFtQQVRDSCB2OV0gbmV3IGNvbmZpZyBvcHRpb24g
dnRzY190b2xlcmFuY2Vfa2h6IHRvIAo+IGF2b2lkIFRTQyBlbXVsYXRpb24iKToKPj4gQW0gVGh1
LCAxMyBTZXAgMjAxOCAwOTozOToxMyArMDIwMAo+PiBzY2hyaWViIE9sYWYgSGVyaW5nIDxvbGFm
QGFlcGZsZS5kZT46Cj4+ID4gdGhpcyBwYXRjaCB3YXMgbm90IGFwcGxpZWQgeWV0LCBldmVuIGFm
dGVyIGEgZmV3ICJwaW5ncyIuCj4+IAo+PiBObyByZWFjdGlvbiBzaW5jZSBtb250aHMuCj4+IFNv
IHNjcmFwIHRoYXQgcGF0Y2gsIGp1c3QgaW4gY2FzZSBpdCBpcyBzdGlsbCBwYXJ0IG9mIHNvbWVv
bmVzIHRvLWNvbnNpZGVyIAo+IHF1ZXVlLgo+IAo+IEkgdGhpbmsgaXQgd291bGQgYmUgd29ydGgg
ZXhwbG9yaW5nIHdoZXRoZXIgdGhpcyBwYXRjaCBjb3VsZCBiZQo+IGFwcGxpZWQgd2l0aG91dCBh
biBleHBsaWNpdCBhY2sgZnJvbSBBbmRyZXcuCj4gCj4gSSBjb25mZXNzIEkgaWdub3JlZCBhbGwg
dGhlIHByZXZpb3VzIG1haWxzIGJlY2F1c2UgdGhleSBhbGwgc3RhcnRlZAo+ICAgIEFuZHJldywK
PiBvcgo+ICAgIEFuZHJldywgTGFycywKPiBzbyBJIGFzc3VtZWQgdGhhdCB5b3UgZGlkbid0IHdh
bnQgYXR0ZW50aW9uIGZyb20gb3RoZXIKPiBtYWludGFpbmVycy9jb21taXR0ZXJzLgo+IAo+IE5v
dyB0aGF0IEkgbG9vayBhdCB0aGUgdGhyZWFkIGl0IGlzIGRpZmZpY3VsdCBmb3IgbWUgdG8gc2Vl
IHRoZSB3b29kCj4gZm9yIHRoZSB0cmVlcyBidXQgSSBkb24ndCBzZWUgdW5hbnN3ZXJlZCBjb25j
ZXJucy4KClByb2JsZW0gaXMgLSBkaXNjdXNzaW9uIGFyb3VuZCB0aGlzIHdhcyAoaWlyYykgaGFw
cGVuaW5nIG5vdCBvbmx5IG9uCnRoZSBsaXN0LCBidXQgYWxzbyBvbiBpcmMgKGluY2x1ZGluZyBw
ZXJoYXBzIHByaXZhdGUgY2hhdHMpLiBJdCB3YXMgZm9yCnRoYXQgcmVhc29uIHRoYXQgSSBtYWRl
IG15IFItYiBjb25kaXRpb25hbCB1cG9uIEFuZHJldyBhdCBsZWFzdApnaXZpbmcgYW4gaW5mb3Jt
YWwgZ28tYWhlYWQgKG90aGVyd2lzZSwgdG9nZXRoZXIgd2l0aCBXZWkncyBSLWIsCnRoZSBwYXRj
aCBjb3VsZCBoYXZlIGdvbmUgaW4pLgoKQmVzaWRlcyB0aGUgcXVlc3Rpb24gb2YgY29ycmVjdG5l
c3MgZnJvbSB0aGUgcGVyc3BlY3RpdmUgb2YgZ3Vlc3RzCih3aGljaCBpbW8gaXMgbm90IGEgcHJv
YmxlbSBhcyB0aGUgZmVhdHVyZSBuZWVkcyB0byBiZSBhY3RpdmVseQplbmFibGVkLCBhbmQgSSB0
aGluayB3ZSBoYXZlIG5vIHJlYXNvbiB0byBrZWVwIGFkbWlucyBmcm9tCmJyZWFraW5nIHRoZWly
IGd1ZXN0cyBpZiB0aGV5IHJlYWxseSBtZWFuIHRvKSwgSSB0aGluayB0aGUgbWFpbiBjb25jZXJu
CndhcyB3aXRoIHRoZSB3YXkgbWlncmF0aW9uIG9mIHRoZSBuZXcgdmFsdWUgd2FzIGltcGxlbWVu
dGVkLiBCdXQgSQpyZWFsbHkgaGF2ZSB0byBkZWZlciB0byBBbmRyZXcgZm9yIHRoYXQsIGlycmVz
cGVjdGl2ZSBvZiBoaW0gbm90CmhhdmluZyByZXNwb25kZWQgKG9uIHRoZSBsaXN0KSB0byBwcmlv
ciBwaW5ncy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
