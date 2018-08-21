From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/pae: use 64 bit atomic xchg
 function in native_ptep_get_and_clear
Date: Tue, 21 Aug 2018 09:57:36 -0600
Message-ID: <5B7C367002000078001E0987__46301.4504559853$1534866997$gmane$org@prv1-mh.provo.novell.com>
References: <20180821153755.30462-1-jgross@suse.com>
 <20180821153755.30462-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs92O-0007pW-PF
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 15:57:44 +0000
In-Reply-To: <20180821153755.30462-3-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: the arch/x86 maintainers <x86@kernel.org>, linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA4LjE4IGF0IDE3OjM3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBVc2lu
ZyBvbmx5IDMyLWJpdCB3cml0ZXMgZm9yIHRoZSBwdGUgd2lsbCByZXN1bHQgaW4gYW4gaW50ZXJt
ZWRpYXRlCj4gTDFURiB2dWxuZXJhYmxlIFBURS4gV2hlbiBydW5uaW5nIGFzIGEgWGVuIFBWIGd1
ZXN0IHRoaXMgd2lsbCBhdCBvbmNlCj4gc3dpdGNoIHRoZSBndWVzdCB0byBzaGFkb3cgbW9kZSBy
ZXN1bHRpbmcgaW4gYSBsb3NzIG9mIHBlcmZvcm1hbmNlLgo+IAo+IFVzZSBhcmNoX2F0b21pYzY0
X3hjaGcoKSBpbnN0ZWFkIHdoaWNoIHdpbGwgcGVyZm9ybSB0aGUgcmVxdWVzdGVkCj4gb3BlcmF0
aW9uIGF0b21pY2FsbHkgd2l0aCBhbGwgNjQgYml0cy4KPiAKPiBTb21lIHBlcmZvcm1hbmNlIGNv
bnNpZGVyYXRpb25zIGFjY29yZGluZyB0bzoKPiAKPiBodHRwczovL3NvZnR3YXJlLmludGVsLmNv
bS9zaXRlcy9kZWZhdWx0L2ZpbGVzL21hbmFnZWQvYWQvZGMvSW50ZWwtWGVvbi1TY2FsIAo+IGFi
bGUtUHJvY2Vzc29yLXRocm91Z2hwdXQtbGF0ZW5jeS5wZGYKPiAKPiBUaGUgbWFpbiBudW1iZXIg
c2hvdWxkIGJlIHRoZSBsYXRlbmN5LCBhcyB0aGVyZSBpcyBubyB0aWdodCBsb29wIGFyb3VuZAo+
IG5hdGl2ZV9wdGVwX2dldF9hbmRfY2xlYXIoKS4KPiAKPiAibG9jayBjbXB4Y2hnOGIiIGhhcyBh
IGxhdGVuY3kgb2YgMjAgY3ljbGVzLCB3aGlsZSAibG9jayB4Y2hnIiAod2l0aCBhCj4gbWVtb3J5
IG9wZXJhbmQpIGlzbid0IG1lbnRpb25lZCBpbiB0aGF0IGRvY3VtZW50LiAibG9jayB4YWRkIiAo
d2l0aCB4YWRkCj4gaGF2aW5nIDMgY3ljbGVzIGxlc3MgbGF0ZW5jeSB0aGFuIHhjaGcpIGhhcyBh
IGxhdGVuY3kgb2YgMTEsIHNvIHdlIGNhbgo+IGFzc3VtZSBhIGxhdGVuY3kgb2YgMTQgZm9yICJs
b2NrIHhjaGciLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGgg
b25lIGZ1cnRoZXIgcmVtYXJrOgoKPiBAQCAtMTUwLDEwICsxNTIsNyBAQCBzdGF0aWMgaW5saW5l
IHB0ZV90IG5hdGl2ZV9wdGVwX2dldF9hbmRfY2xlYXIocHRlX3QgKnB0ZXApCj4gIHsKPiAgCXB0
ZV90IHJlczsKPiAgCj4gLQkvKiB4Y2hnIGFjdHMgYXMgYSBiYXJyaWVyIGJlZm9yZSB0aGUgc2V0
dGluZyBvZiB0aGUgaGlnaCBiaXRzICovCj4gLQlyZXMucHRlX2xvdyA9IHhjaGcoJnB0ZXAtPnB0
ZV9sb3csIDApOwo+IC0JcmVzLnB0ZV9oaWdoID0gcHRlcC0+cHRlX2hpZ2g7Cj4gLQlwdGVwLT5w
dGVfaGlnaCA9IDA7Cj4gKwlyZXMucHRlID0gKHB0ZXZhbF90KWFyY2hfYXRvbWljNjRfeGNoZygo
YXRvbWljNjRfdCAqKXB0ZXAsIDApOwoKSXMgdGhlIGNhc3Qgb24gdGhlIHJldHVybiB2YWx1ZSBy
ZWFsbHkgbmVlZGVkIGhlcmU/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
