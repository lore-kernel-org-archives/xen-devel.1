From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] ocaml: remove undefined behaviour in
 systemd_stubs.c
Date: Mon, 23 Jul 2018 10:57:04 +0100
Message-ID: <11a20bb5-209b-82a6-5dda-189574d49c20@citrix.com>
References: <20180723093039.20382-1-wei.liu2@citrix.com>
 <20180723093039.20382-3-wei.liu2@citrix.com>
 <a8d83f90-9134-6d74-2e0b-7688ba5bc2d6@citrix.com>
 <20180723095209.el5x26qa3e3d5va2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jmrf=kh=citrix.com=prvs=7357aa5aa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fhXas-0001Oz-4q
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 09:57:30 +0000
In-Reply-To: <20180723095209.el5x26qa3e3d5va2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDcvMTggMTA6NTIsIFdlaSBMaXUgd3JvdGU6Cj4gT24gTW9uLCBKdWwgMjMsIDIwMTgg
YXQgMTA6NDc6MDRBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjMvMDcvMTgg
MTA6MzAsIFdlaSBMaXUgd3JvdGU6Cj4+PiBDbGFuZyBjb21wbGFpbnM6Cj4+Pgo+Pj4gc3lzdGVt
ZF9zdHVicy5jOjUxOjg6IGVycm9yOiBzaGlmdGluZyBhIG5lZ2F0aXZlIHNpZ25lZCB2YWx1ZSBp
cyB1bmRlZmluZWQgWy1XZXJyb3IsLVdzaGlmdC1uZWdhdGl2ZS12YWx1ZV0KPj4+ICAgICAgICAg
cmV0ID0gVmFsX2ludCgtMVUpOwo+Pj4gICAgICAgICAgICAgICBefn5+fn5+fn5+fn4KPj4+Cj4+
PiBTaW1wbHkgY2hhbmdlIHRoZSByZXR1cm4gdmFsdWUgdG8gMC4KPj4gVGhhdCB3aWxsIGJyZWFr
IHRoZSBmdW5jdGlvbiB0aG91Z2gsIGFzIGl0IHByZXZpb3VzbHkgcmV0dXJuZWQgLTEuCj4gSSBk
b24ndCB0aGluayB0aGUgY2FsbGVyIGNhcmVzIGFib3V0IHRoZSByZXR1cm4gdmFsdWUuIFRoZSBm
dW5jdGlvbgo+IHNpZ25hdHVyZSBpcyB1bml0IC0+IHVuaXQgZm9yIHNkX25vZml0eV9yZWFkeSwg
YW5kIHRoZSByZXR1cm4gdmFsdWUgaXMKPiBub3QgY2hlY2tlZCBhdCBhbGwuIEkgYWRtaXQgSSBj
b3VsZCBoYXZlIG1pc3JlYWQgdGhlIGNvZGUgdGhvdWdoLgoKT2ggLSBpbiB3aGljaCBjYXNlIHRo
aXMgaXMgZWFzeSB0byBmaXguwqAgWW91IHNob3VsZCByZXR1cm4gVmFsX3VuaXQKCn5BbmRyZXcK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
