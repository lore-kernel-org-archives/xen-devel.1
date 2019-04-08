From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/3] memory: restrict
 XENMEM_remove_from_physmap to translated guests
Date: Mon, 08 Apr 2019 08:02:55 -0600
Message-ID: <5CAB548F020000780022563B@prv1-mh.provo.novell.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
 <dd1d63dd-0eda-b66a-fa89-160220e65912@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDUrX-0007lb-9i
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 14:03:03 +0000
In-Reply-To: <dd1d63dd-0eda-b66a-fa89-160220e65912@arm.com>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA0LjE5IGF0IDEzOjU4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDMvNS8xOSAxOjI4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQEAgLTI5OCw3ICsyOTgs
NyBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fYWRkX3RvX3BoeXNtCj4+ICAgCj4+ICAg
LyoKPj4gICAgKiBVbm1hcHMgdGhlIHBhZ2UgYXBwZWFyaW5nIGF0IGEgcGFydGljdWxhciBHUEZO
IGZyb20gdGhlIHNwZWNpZmllZCBndWVzdCdzCj4+IC0gKiBwc2V1ZG9waHlzaWNhbCBhZGRyZXNz
IHNwYWNlLgo+PiArICogcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSAodHJhbnNsYXRlZCBndWVzdHMg
b25seSkuCj4gCj4gV2hpbGUgeW91IG1vZGlmeSB0aGUgY29tbWVudCwgY2FuIHlvdSByZXBsYWNl
IEdQRk4gd2l0aCBHRk4/CgpJIGRpZCBjb25zaWRlciB0aGlzIHdoZW4gd3JpdGluZyB0aGUgcGF0
Y2gsIGJ1dCB0aGVuIHRoaXMgd291bGQKYnJpbmcgaXQgb3V0IG9mIHN5bmMgd2l0aCB0aGUgc3Ry
dWN0dXJlIGZpZWxkIGFuZCBpdHMgYXNzb2NpYXRlZApjb21tZW50LiBQbHVzIHRoZSAiYWRkIiBz
aWRlIGNvbW1lbnQgd291bGQgdGhlbiB3YW50CmNoYW5naW5nIHRvby4gQW5kIHB1YmxpYy9tZW1v
cnkuaCBoYXMgcXVpdGUgYSBmZXcgbW9yZSB1c2VzCm9mIEdQRk4gLyBncGZuLgoKVG8gYmUgaG9u
ZXN0IEknZCBwcmVmZXIgdG8gbGVhdmUgdGhpcyBhcyBpcyByaWdodCBoZXJlLCBmb3IgaXQgdG8g
Z2V0CmNsZWFuZWQgdXAgaW4gb25lIGdvLgoKPiBPdGhlciB0aGFuIHRoYXQ6Cj4gCj4gUmV2aWV3
ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpUaGFua3MsIGJ1dCBh
cyBwZXIgYWJvdmUgSSdtIG5vdCBzdXJlIHdoZXRoZXIgdG8gYWN0dWFsbHkgYXBwbHkKaXQuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
