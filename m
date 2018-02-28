From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] build: remove shim related targets
Date: Wed, 28 Feb 2018 09:27:31 -0700
Message-ID: <5A96E68302000078001ACF47@prv-mh.provo.novell.com>
References: <20180221122218.37777-1-roger.pau@citrix.com>
 <5A969A6D02000078001ACA01@prv-mh.provo.novell.com>
 <20180228114722.pe3qegstcejubini@MacBook-Pro-de-Roger.local>
 <5A96AEA202000078001ACB31@prv-mh.provo.novell.com>
 <20180228130254.pisdymntg33pscm2@MacBook-Pro-de-Roger.local>
 <5A96BBD302000078001ACCA7@prv-mh.provo.novell.com>
 <20180228150236.ndh7x4d4vryuqc6j@MacBook-Pro-de-Roger.local>
 <5A96D91402000078001ACE66@prv-mh.provo.novell.com>
 <20180228154700.ujw24yrkuctrmn7o@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ets7=fw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1er4Zw-0007hE-Rx
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 16:27:40 +0000
In-Reply-To: <20180228154700.ujw24yrkuctrmn7o@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAyLjE4IGF0IDE2OjQ3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgRmViIDI4LCAyMDE4IGF0IDA4OjMwOjEyQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjguMDIuMTggYXQgMTY6MDIsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gQnV0IHRoYXQgcmFpc2VzIHRoZSBxdWVzdGlvbiwgaWYgcHJlZml4PS91c3Iv
bG9jYWwgdGhpcyB3aWxsIGJlY29tZToKPj4gPiAKPj4gPiAvdXNyL2xvY2FsL2xpYi91c3IvbG9j
YWwvbGliL3hlbi8uLi4KPj4gCj4+IC91c3IvbG9jYWwvbGliL2RlYnVnL3Vzci9sb2NhbC9saWIv
eGVuLy4uLgo+PiAKPj4gPiBTaG91bGQgdGhpcyBpbnN0ZWFkIGJlOgo+PiA+IAo+PiA+IC91c3Iv
bG9jYWwvbGliL3Vzci9saWIveGVuLy4uLgo+PiAKPj4gL3Vzci9sb2NhbC9saWIvZGVidWcvdXNy
L2xpYi94ZW4vLi4uCj4gCj4gUmlnaHQuCj4gCj4+ID4gSSBkb24ndCB0aGluayBzbywgYnV0IHdh
bnQgdG8gYmUgc3VyZS4KPj4gCj4+IE5laXRoZXIsIEkgd291bGQgc2F5ICh3aXRob3V0IGtub3dp
bmcgd2hldGhlciB0aGVyZSBhcmUgYW55Cj4+IGNvbnZlbnRpb25zIGZvciAke3ByZWZpeH0vbGli
L2RlYnVnKSAtIHdoYXQgaGFzIHRoZSBmdWxsIHBhdGggZ290IHRvCj4+IGRvIGluIHRoZSBtaWRk
bGUgaW4gdGhlcmU/IFRoZSBtb3JlIHdoZW4gaXQncyAvaG9tZS8uLi4gb3IKPj4gc29tZXRoaW5n
IGV2ZW4gbW9yZSBvYnNjdXJlPwo+IAo+IEkgd291bGQgZXhwZWN0IGRlYnVnZ2VycyBsaWtlIGdk
YiB0byBzZWFyY2ggL3Vzci9saWIvZGVidWcgYW5kCj4gL3Vzci9sb2NhbC9saWIvZGVidWcgaW4g
b3JkZXIgdG8gZmluZCB0aGUgZGVidWcgc3ltYm9scyBvZiBhIGJpbmFyeSwKPiBzbyB0aGF0IHdo
YXQncyBpbnNpZGUgdGhlIGRlYnVnLyBkaXJlY3RvcnkgbmVlZHMgdG8gaGF2ZSB0aGUgc2FtZSBw
YXRoCj4gYXMgd2hlcmUgdGhlIGJpbmFyeSByZXNpZGVzLCBoZW5jZSBJIHRoaW5rIGl0IHNob3Vs
ZCBiZToKPiAKPiAvdXNyL2xvY2FsL2xpYi9kZWJ1Zy91c3IvbG9jYWwvbGliL3hlbi8KCk1ha2Vz
IHNlbnNlIGZvciBzdHVmZiB1bmRlciAvdXNyIGFuZCAvdXNyL2xvY2FsLCBidXQgbm90IHJlYWxs
eQpmb3Igc3R1ZmYgdW5kZXIgZS5nLiAvaG9tZSBvciBzb21lIG5ldHdvcmsgbW91bnQuCgpKYW4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
