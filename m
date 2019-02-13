From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Wed, 13 Feb 2019 04:13:15 -0700
Message-ID: <5C63FBCB0200007800216430@prv1-mh.provo.novell.com>
References: <a49643ec-6bbe-04be-1ae2-b1d731da92cf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a49643ec-6bbe-04be-1ae2-b1d731da92cf@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Daniel P.Smith" <dpsmith.dev@gmail.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, robin.randhawa@arm.com, Jun Nakajima <jun.nakajima@intel.com>, Daniel Smith <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>, Christopher Clark <christopher.w.clark@gmail.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, committers@xenproject.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAyLjE5IGF0IDAzOjM0LCA8ZHBzbWl0aC5kZXZAZ21haWwuY29tPiB3cm90ZToK
PiBUaGUgaW5pdGlhbCBmb2N1cyB3aWxsIGJlIHRvIGV4cGxvcmUgYW5kIGRvY3VtZW50IHRoZSBy
YW5nZSBvZiBwb3NzaWJsZQo+IHVzZSBjYXNlcyB0aGF0IGFyZSBvZiBpbnRlcmVzdCB0byB0aGUg
WGVuIGNvbW11bml0eS4gVGhpcyB3aWxsIGJlIHRoZQo+IGlucHV0IHRvIGEgZGVzaWduIGRvY3Vt
ZW50IHRoYXQgaXMgY3JhZnRlZCBpbiBjb25qdW5jdGlvbiB3aXRoIHRoZSBYZW4KPiBtYWludGFp
bmVycywgdG8gaWRlbnRpZnkgcG9zc2libGUgYXBwcm9hY2hlcyB0byBleHRlbmQgdGhlIGV4aXN0
aW5nCj4gS2NvbmZpZyBpbmZyYXN0cnVjdHVyZSB0byBwcm9kdWNlIHRhaWxvcmVkIGluc3RhbmNl
cyBvZiBYZW4uCgpJbiBFWFBFUlQgbW9kZSwgdGFpbG9yaW5nIGlzIGFscmVhZHkgcG9zc2libGUg
dG8gYSBjZXJ0YWluIGRlZ3JlZSwKYW5kIHBlcnNvbmFsbHkgSSBkb24ndCBzZWUgd2h5IHRoaXMg
Y291bGRuJ3QgYmVjb21lIG1vcmUgZmluZQpncmFpbmVkLiBFWFBFUlQgbW9kZSwgaG93ZXZlciwg
aXMgYmVpbmcgZGlzbGlrZWQgaW4gZ2VuZXJhbCwgZmlyc3QKYW5kIGZvcmVtb3N0IGR1ZSB0byBo
b3cgb25lIG5lZWRzIHRvIGVuYWJsZSBpdCAoYW5kIGtlZXAgaXQKZW5hYmxlZCkuCgpUbyBtb3Zl
IGF3YXkgZnJvbSBhIG1vZGVsIHdoZXJlIG9ubHkgYSB2ZXJ5IGxpbWl0ZWQgc2V0IG9mCmNvbmZp
Z3VyYXRpb25zIGlzIHNlY3VyaXR5IHN1cHBvcnRlZCwgdGhlIG9yaWdpbmFsIHF1ZXN0aW9uIHdv
dWxkCm5lZWQgdG8gYmUgYWRkcmVzc2VkOiBIb3cgY291bGQgc3VjaCBhIHZhcmlldHkgcmVtYWlu
Cm1hbmFnZWFibGUgYm90aCBpbiB0ZXJtcyBvZiB0ZXN0aW5nIGFuZCBpbiB0ZXJtcyBvZiB0aGUg
aGFuZGxpbmcKb2YgYnVnIHJlcG9ydHM/IHJhbmRjb25maWcgYnVpbGQgdGVzdGluZyBpcyBhIHNt
YWxsIHBpZWNlIGhlcmUsIGJ1dApzaW5jZSBpdCBlbnN1cmVzIHN1Y2Nlc3NmdWwgYnVpbGRzIG9u
bHksIGl0IGRvZXNuJ3QgZ28gcXVpdGUgZmFyCmVub3VnaC4gUGx1cywgb2YgY291cnNlLCB0aGUg
bW9yZSB2YXJpYXRpb25zIGFyZSBwb3NzaWJsZSwgdGhlCmxvbmdlciBpdCB3b3VsZCB0YWtlIGZv
ciBldmVuIGp1c3QgYSBidWlsZCBpc3N1ZSB0byBiZSBub3RpY2VkLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
