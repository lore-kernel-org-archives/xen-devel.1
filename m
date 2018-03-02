From: Juergen Gross <jgross@suse.com>
Subject: Re: update_runstate_area and Linux KPTI
Date: Fri, 2 Mar 2018 18:05:04 +0100
Message-ID: <cf3eb248-2aa0-2a6b-2385-52e497961fd2@suse.com>
References: <3a77a293-1a29-42ed-8fc0-a74bda213b92@arm.com>
 <9fa77816-a25c-c19b-cc26-e0d28cc2e160@citrix.com>
 <5A99877F02000078001ADF59@prv-mh.provo.novell.com>
 <95014a77-b690-997c-7430-ba8fa8e546eb@arm.com>
 <5A998F0502000078001AE011@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wrb9=fy=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ero7I-00041B-Jf
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 17:05:08 +0000
In-Reply-To: <5A998F0502000078001AE011@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, BorisOstrovsky <boris.ostrovsky@oracle.com>, osstest service owner <osstest-admin@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDMvMTggMTc6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjAzLjE4IGF0
IDE3OjI1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiAwMi8wMy8xOCAxNjox
OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwMi4wMy4xOCBhdCAxNzowNCwgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+IFRoZSBwcm9wZXIgd2F5IHRvIGRvIHRo
aXMgaXMgaW5kZWVkIGJ5IGEgbm9taW5hdGVkIChndWVzdCkgcGh5c2ljYWwKPj4+PiBhZGRyZXNz
LCBhdCB3aGljaCBwb2ludCBYZW4gY2FuIG1ha2UgYWxsL2FueSB1cGRhdGVzIGF0IHRpbWVzIG9m
IGl0cwo+Pj4+IGNob29zaW5nLCBhbmQgdGhlIGd1ZXN0cyBwYWdldGFibGUvcGVybWlzc2lvbnMg
c3RhdGUgYXQgYW4gaW5zdGFudGFuZW91cwo+Pj4+IG1vbWVudCBkb24ndCBtYXR0ZXIuCj4+Pj4K
Pj4+PiBJZiB5b3UndmUgZ290IHRpbWUgdG8gZG8gdGhpcywgdGhlbiBwbGVhc2UgZG8uICBJdCB3
aWxsIGJlIGEgZGVmaW5pdGUKPj4+PiBpbXByb3ZlbWVudC4KPj4+Cj4+PiBKdXN0IHRvIGJlIGF2
b2lkIHVubmVjZXNzYXJ5IGVmZm9ydCBpbiB0aGUgd3JvbmcgZGlyZWN0aW9uOiBJIGRvbid0Cj4+
PiB0aGluayB5b3UgY2FuIGFsdGVyIHRoZSBjdXJyZW50IGludGVyZmFjZS4gWW91J2QgaGF2ZSB0
byBhZGQgYSBuZXcKPj4+IG9uZSwgYW5kIHdlIGNvdWxkIHRoZW4gZGVwcmVjYXRlIChidXQgbmV2
ZXIgYWJhbmRvbikgdGhlIGN1cnJlbnQKPj4+IG9uZS4KPj4KPj4gSSB3YXMgb25seSBwbGFubmlu
ZyB0byBzdG9yZSB0aGUgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyByYXRoZXIgdGhhbiB0aGUgCj4+
IHZpcnR1YWwgYWRkcmVzcyBhcyB3ZSBkbyB0b2RheS4gSXMgdGhhdCBjb25zaWRlcmVkIGFzIGFu
IGFsdGVyYXRpb24gb2YgCj4+IHRoZSBjdXJyZW50IGludGVyZmFjZT8KPiAKPiBZZXMsIGl0IGlz
LCBhcyBhbiBleGlzdGluZyBQViBrZXJuZWwgY291bGQgZGVsaWJlcmF0ZWx5IGFsdGVyIHRoZQo+
IG1hcHBpbmdzIHVuZGVybHlpbmcgdGhlIGxpbmVhciBhZGRyZXNzIGl0IGhhcyBoYW5kZWQgdXMu
CgpMaW51eCBwdm9wcyBrZXJuZWwgaXNuJ3QgZG9pbmcgdGhpcy4gTWluaS1PUyBuZWl0aGVyLiBJ
IGd1ZXNzIGtlcm5lbC14ZW4Kd291bGQgYmUgb2theSB3aXRoIHRoaXMsIHRvby4gQW5kIEkgYmV0
IEJTRCBpcyBhbHNvIGZpbmUuCgpTZXJpb3VzbHk6IGFueSBrZXJuZWwgcGxheWluZyBzdWNoIHRy
aWNrcyBpcyBhc2tpbmcgZm9yIHByb2JsZW1zLgoKV2Ugc2hvdWxkbid0IHN1cHBvcnQgb3BlcmF0
aW9uIG1vZGVzIHdoaWNoIG1ha2Ugbm8gc2Vuc2UganVzdCBmb3IgdGhlCnNha2Ugb2YgY29tcGF0
aWJpbGl0eSwgSU1PLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
