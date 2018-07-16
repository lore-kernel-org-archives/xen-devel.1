From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/8] x86: (command line option to) avoid use
 of secondary hyper-threads
Date: Mon, 16 Jul 2018 06:53:43 -0600
Message-ID: <5B4C955702000078001D467C@prv1-mh.provo.novell.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F3C702000078001D316D@prv1-mh.provo.novell.com>
 <55886b2f-e5bb-c2c5-b6e5-a5d0c898b876@citrix.com>
 <5B485F0E02000078001D3ABE@prv1-mh.provo.novell.com>
 <4043e550-20d0-11b8-07b7-8274afc96957@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6083=ka=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ff30e-0003mH-As
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 12:53:48 +0000
In-Reply-To: <4043e550-20d0-11b8-07b7-8274afc96957@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA3LjE4IGF0IDE0OjM3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDcvMTggMDk6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMi4w
Ny4xOCBhdCAxNzo0NSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MTEvMDcvMTggMTM6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IC0tLSBhL2RvY3MvbWlzYy94
ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duCj4+Pj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5k
LWxpbmUubWFya2Rvd24KPj4+PiBAQCAtMTA0MCw2ICsxMDQwLDEzIEBAIGlkZW50aWNhbCB0byB0
aGUgYm9vdCBDUFUgd2lsbCBiZSBwYXJrZWQKPj4+PiAgIyMjIGhwZXRicm9hZGNhc3QgKHg4NikK
Pj4+PiAgPiBgPSA8Ym9vbGVhbj5gCj4+Pj4gIAo+Pj4+ICsjIyMgaHQgKHg4NikKPj4+IEknZCBz
dWdnZXN0IHNtdCByYXRoZXIgdGhhbiBodCBoZXJlLiAgU01UIGlzIHRoZSB0ZWNobmljYWwgdGVy
bSwgd2hpbGUKPj4+IEhUIGlzIEludGVsJ3MgbWFya2V0aW5nIG5hbWUuCj4+IEhtbSwgbWFueSBC
SU9TZXMgKGlmIHRoZSBoYXZlIHN1Y2ggYW4gb3B0aW9uKSB0YWxrIGFib3V0IEhULCB3aGljaAo+
PiB0byBtZSBtYWtlcyAiaHQiIGEgY2xvc2VyIG1hdGNoLiBIb3cgYWJvdXQgd2UgYWxsb3cgYm90
aD8KPiAKPiBUaGF0J3MgYmVjYXVzZSBhIEJJT1MgaXMgY3VzdG9tIHRvIHRoZSBoYXJkd2FyZSBp
dCBydW5zIG9uLgo+IAo+IEhhdmUgeW91IHRyaWVkIHNldHRpbmcgdXAgYW4gYWxpYXMgYmVmb3Jl
PyAoZ2l2ZW4gdGhlIHNwZWNpZmljCj4gZGVmaWNpZW5jeSBvZiB0aGUgKl9wYXJhbSgpIGluZnJh
c3RydWN0dXJlIGluIHRoaXMgYXJlYSkgIEknbSBkb24ndAo+IHRoaW5rIGFuIGFsaWFzIGlzIHdv
cnRoIHRoZSBlZmZvcnQuCgpUaGlzIHJlYWRzIGFzIGlmIHlvdSB3ZXJlIGV4cGVjdGluZyBwcm9i
bGVtcy4gSW5zdGVhZCBvZgoKK2ludDhfdCBfX3JlYWRfbW9zdGx5IG9wdF9odCA9IC0xOworYm9v
bGVhbl9wYXJhbSgiaHQiLCBvcHRfaHQpOwoKd2hhdCB3ZSdkIGhhdmUgaXMgc2ltcGx5CgoraW50
OF90IF9fcmVhZF9tb3N0bHkgb3B0X2h0ID0gLTE7Citib29sZWFuX3BhcmFtKCJodCIsIG9wdF9o
dCk7Citib29sZWFuX3BhcmFtKCJzbXQiLCBvcHRfaHQpOwoKKGFuZCB3aGV0aGVyIHdlIHVzZSBv
cHRfaHQgb3Igb3B0X3NtdCBkb2Vzbid0IG1hdHRlciBtdWNoCnRvIG1lKS4gSSBkb24ndCBzZWUg
YW55IHNvdXJjZSBvZiBwb3NzaWJsZSBpc3N1ZXMgd2l0aCB0aGlzLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
