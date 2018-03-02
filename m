From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: update_runstate_area and Linux KPTI
Date: Fri, 2 Mar 2018 16:23:30 +0000
Message-ID: <d94813c3-7861-ed1d-1266-7909cedcf5e9@citrix.com>
References: <3a77a293-1a29-42ed-8fc0-a74bda213b92@arm.com>
 <9fa77816-a25c-c19b-cc26-e0d28cc2e160@citrix.com>
 <5A99877F02000078001ADF59@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=prhv=fy=citrix.com=prvs=592350325=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ernTf-0006hy-RM
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 16:24:11 +0000
In-Reply-To: <5A99877F02000078001ADF59@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, BorisOstrovsky <boris.ostrovsky@oracle.com>, osstest service owner <osstest-admin@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDMvMTggMTY6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjAzLjE4IGF0
IDE3OjA0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IFRoZSBwcm9wZXIg
d2F5IHRvIGRvIHRoaXMgaXMgaW5kZWVkIGJ5IGEgbm9taW5hdGVkIChndWVzdCkgcGh5c2ljYWwK
Pj4gYWRkcmVzcywgYXQgd2hpY2ggcG9pbnQgWGVuIGNhbiBtYWtlIGFsbC9hbnkgdXBkYXRlcyBh
dCB0aW1lcyBvZiBpdHMKPj4gY2hvb3NpbmcsIGFuZCB0aGUgZ3Vlc3RzIHBhZ2V0YWJsZS9wZXJt
aXNzaW9ucyBzdGF0ZSBhdCBhbiBpbnN0YW50YW5lb3VzCj4+IG1vbWVudCBkb24ndCBtYXR0ZXIu
Cj4+Cj4+IElmIHlvdSd2ZSBnb3QgdGltZSB0byBkbyB0aGlzLCB0aGVuIHBsZWFzZSBkby4gIEl0
IHdpbGwgYmUgYSBkZWZpbml0ZQo+PiBpbXByb3ZlbWVudC4KPiBKdXN0IHRvIGJlIGF2b2lkIHVu
bmVjZXNzYXJ5IGVmZm9ydCBpbiB0aGUgd3JvbmcgZGlyZWN0aW9uOiBJIGRvbid0Cj4gdGhpbmsg
eW91IGNhbiBhbHRlciB0aGUgY3VycmVudCBpbnRlcmZhY2UuIFlvdSdkIGhhdmUgdG8gYWRkIGEg
bmV3Cj4gb25lLCBhbmQgd2UgY291bGQgdGhlbiBkZXByZWNhdGUgKGJ1dCBuZXZlciBhYmFuZG9u
KSB0aGUgY3VycmVudAo+IG9uZS4KCk5vIC0gd2Ugc2FkbHkgY2FuJ3QgcmVtb3ZlIHRoZSBjdXJy
ZW50IGludGVyZmFjZSAoYXQgbGVhc3QgZm9yIGEgbG9uZwp3aGlsZSksIGJ1dCB3ZSBjYW4gaW1t
ZWRpYXRlbHkgZGVwcmVjYXRlIGl0IHdoZW4gYSBiZXR0ZXIgYWx0ZXJuYXRpdmUgaXMKYXZhaWxh
YmxlLgoKT1RPSCwgSSB0aGluayBpdCB3b3VsZCBiZSBhIHZlcnkgZ29vZCBpZGVhIHRvIGhhdmUg
YSBLY29uZmlnIG9wdGlvbiBzbwp3ZSBjYW4gc2VsZWN0aXZlbHkgZXhjaXNlIGxlZ2FjeSBpbnRl
cmZhY2VzLsKgIEkgZXhwZWN0IHRoaXMgd2lsbCBiZSBvZgpwYXJ0aWN1bGFyIGludGVyZXN0IHRv
IGVtYmVkZGVkL2Jlc3Bva2UgY29uZmlndXJhdGlvbnMuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
