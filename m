From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 08/13] x86: Collect policies together into
 groups
Date: Thu, 05 Jul 2018 02:54:37 -0600
Message-ID: <5B3DDCCD02000078001D15FC@prv1-mh.provo.novell.com>
References: <1530651326-5320-1-git-send-email-andrew.cooper3@citrix.com>
 <1530651326-5320-9-git-send-email-andrew.cooper3@citrix.com>
 <5B3C91D602000078001D0EEC@prv1-mh.provo.novell.com>
 <c05f8017-f371-c121-ca0a-b7fedcb5507e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c05f8017-f371-c121-ca0a-b7fedcb5507e@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA3LjE4IGF0IDE5OjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDQvMDcvMTggMTA6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwMy4w
Ny4xOCBhdCAyMjo1NSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gVGhp
cyBpcyBtYWlubHkgcHJlcCB3b3JrIGZvciB0aGUgZm9sbG93aW5nIHBhdGNoLCBidXQgdGhpcyBz
cGVjaWZpYwo+Pj4gYWJzdHJhY3Rpb24gaXMgYWxzbyBzcGVjaWZpY2FsbHkgdXNlZnVsIGZvciB0
aGUgZnV0dXJlIGF1ZGl0aW5nIGxvZ2ljLgo+Pj4KPj4+IE5vdCBhbGwgb2YgbXNyX3ZjcHVfcG9s
aWN5IHdpbGwgYmUgaW50ZXJlc3RpbmcgZnJvbSBhIGRvbWFpbiBidWlsZGluZwo+Pj4gcGVyc3Bl
Y3RpdmUsIGJ1dCBzb21lIHNvb24tdG8tYXBwZWFyIGZpZWxkcyB3aWxsIGJlIChTR1ggTGF1bmNo
IEhhc2gKPj4+IHNwZWNpZmljYWxseSkuICBUaGUgZXhhY3Qgc3BsaXQgb2YgTVNScyBiZXR3ZWVu
IGRvbWFpbiBhbmQgdmNwdSBwb2xpY2llcyBpcwo+Pj4gaW50ZXJuYWwgdG8gWGVuIGFuZCBsaWFi
bGUgdG8gY2hhbmdlIG1vdmluZyBmb3J3YXJkcywgc28gdHJlYXQgdGhlIHR3bwo+Pj4gc3RydWN0
dXJlcyBjb25zaXN0ZW50bHkgZnJvbSB0aGUgc3RhcnQgdG8gYXZvaWQgcHJvYmxlbXMgaW4gdGhl
IGZ1dHVyZS4KPj4gSSBob3BlIHRoZSB1dGlsaXR5IG9mIHRoaXMgZ3JvdXBpbmcgd2lsbCBiZWNv
bWUgZXZpZGVudCBpbiBsYXRlcgo+PiBwYXRjaGVzLgo+IAo+IFByb2JhYmx5IG1vcmVzbyBpbiB0
aGUgZm9sbG93dXAgc2VyaWVzIHdpdGggdGhlIGF1ZGl0aW5nL3N1YnNldCBsb2dpYywKPiBidXQg
cGF0Y2ggMTMgZG9lcyBwcm92aWRlIHRoZSBmaXJzdCBhc3BlY3QuCgpEb2VzIGl0PyBJdCdzIGEg
ZmFpbnQgaGludCBhdCBiZXN0LCBhcyBsb25nIGFzIHg4Nl9wb2xpY2llc19hcmVfY29tcGF0aWJs
ZSgpCmlzIGFsbCBlbXB0eS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
