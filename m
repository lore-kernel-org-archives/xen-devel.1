From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Thu, 07 Jun 2018 08:44:41 -0600
Message-ID: <5B1944D902000078001C9279@prv1-mh.provo.novell.com>
References: <20180607130829.18811-1-olaf@aepfle.de>
 <5B1933AE02000078001C91DA@prv1-mh.provo.novell.com>
 <20180607154743.0c8a808e.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180607154743.0c8a808e.olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA2LjE4IGF0IDE1OjQ3LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IEFtIFRo
dSwgMDcgSnVuIDIwMTggMDc6MzE6MjYgLTA2MDAKPiBzY2hyaWViICJKYW4gQmV1bGljaCIgPEpC
ZXVsaWNoQHN1c2UuY29tPjoKPiAKPj4gSG1tLCBJIGZpbmQgdGhpcyBkZXNjcmlwdGlvbiBjb25j
ZXJuaW5nLiBJcyB0aGUgZmllbGQgcmVsaWFibHkgemVybyB3aGVuCj4+IGNvbWluZyBmcm9tIG9s
ZGVyIFhlbiwgb3IgaXMgaXQgbm90Pwo+IAo+IEl0IGRlcGVuZHMgb24gaG93IG9sZC4KPiBJZiB0
aGUgb3RoZXIgc2VuZGluZyBzaWRlIGhhcyB3cml0ZV90c2NfaW5mbyBmcm9tIDQuNissIHRoZW4g
X3JlczEgaXMgemVyby4KPiBJZiBpdCBpcyBvbGRlciwgdGhlIFhDX1NBVkVfSURfVFNDX0lORk8g
aXMgZXZlbnR1YWxseSBub3QgaGFuZGxlZCBhbnltb3JlLgo+IEF0IGxlYXN0IEkgY291bGQgbm90
IGZpbmQgdGhlIHJlbGV2YW50IGNvZGUsIGV2ZW4gaW4gc3RhZ2luZy00LjYuCj4gQnV0IHRoZW4s
IGl0IGlzIHVubGlrZWx5IHRoYXQgbWlncmF0aW9uIGZyb20gNC41IHRvIDQuNiBkaWQgbm90IHdv
cmsuCj4gCj4gQWxzbywgaW4gZ2VuZXJhbCB0aGUgaW5wdXQgY29tZXMgZnJvbSAicmVtb3RlIi4g
U28gaXQgaXMgdW50cnVzdGVkLgoKQnV0IGlzbid0IHRoaXMgZXhhY3RseSB0aGUgY29uY2VybiBB
bmRyZXcgaGFkIHZvaWNlZD8gSWYgc28sIHdlJ3JlIG5vdAphbnkgY2xvc2VyIHRvIHRoaXMgaGF2
aW5nIGEgY2hhbmNlIHRvIGdvIGluLiBUaGUgcmUtdXNlIG9mIHRoZSBmaWVsZCBpcwphY2NlcHRh
YmxlIG9ubHkgaWYgYWxsIGV4aXN0aW5nIHNlbmRlcnMgcmVsaWFibHkgZmlsbCB6ZXJvIGluIHRo
ZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
