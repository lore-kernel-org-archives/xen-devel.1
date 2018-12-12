From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] x86/dom0: rename paging function
Date: Wed, 12 Dec 2018 09:15:09 -0700
Message-ID: <5C11340D02000078002058FA@prv1-mh.provo.novell.com>
References: <20181205145500.11989-1-roger.pau@citrix.com>
 <20181205145500.11989-2-roger.pau@citrix.com>
 <5C0FD3030200007800205203@prv1-mh.provo.novell.com>
 <20181211151936.yr6s3dokmmpkgt5w@mac>
 <5C0FD8B40200007800205267@prv1-mh.provo.novell.com>
 <20181212091455.xziv2gbsswljlur2@mac>
 <5C10DA96020000780020560C@prv1-mh.provo.novell.com>
 <20181212100407.j5hg4vqi2l4kjvsk@mac>
 <5C10E3D5020000780020564D@prv1-mh.provo.novell.com>
 <20181212155608.nujhjevz2yyqfjdw@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gX7AK-0000bs-0H
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 16:15:16 +0000
In-Reply-To: <20181212155608.nujhjevz2yyqfjdw@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andrei.semenov@bertin.fr, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjEyLjE4IGF0IDE2OjU2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgRGVjIDEyLCAyMDE4IGF0IDAzOjMyOjUzQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTIuMTIuMTggYXQgMTE6MDQsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gWW91IG1lbnRpb25lZCB0aGVyZSdzIHNvbWUgY29kZSAoZm9yIFBWPykgdG8g
Y2FsY3VsYXRlIHRoZSBzaXplIG9mIHRoZQo+PiA+IHBhZ2UgdGFibGVzIGJ1dCBJJ20gaGF2aW5n
IHRyb3VibGUgZmluZGluZyBpdCAobWFpbmx5IGJlY2F1c2UgSSdtIG5vdAo+PiA+IHRoYXQgZmFt
aWxpYXIgd2l0aCBQViksIGNvdWxkIHlvdSBwb2ludCBtZSB0byBpdD8KPj4gCj4+IEluIGRvbTBf
Y29uc3RydWN0X3B2KCkgeW91J2xsIGZpbmQgYSBsb29wIHN0YXJ0aW5nIHdpdGgKPj4gImZvciAo
IG5yX3B0X3BhZ2VzID0gMjsgOyBucl9wdF9wYWdlcysrICkiLiBJdCdzIG5vdCB0aGUgbmVhdGVz
dCwKPj4gYnV0IGF0IGxlYXN0IHdlJ3ZlIG5ldmVyIGhhZCByZXBvcnRzIG9mIGZhaWx1cmUuCj4g
Cj4gVGhhdCBzZWVtcyBxdWl0ZSBjb21wbGljYXRlZCwgd2hhdCBhYm91dCB1c2luZyB0aGUgZm9y
bXVsYSBiZWxvdzoKPiAKPiAvKgo+ICAqIEFwcHJveGltYXRlIHRoZSBtZW1vcnkgcmVxdWlyZWQg
Zm9yIHRoZSBIQVAvSU9NTVUgcGFnZSB0YWJsZXMgYnkKPiAgKiBwZXNzaW1pc3RpY2FsbHkgYXNz
dW1pbmcgZXZlcnkgZ3Vlc3QgcGFnZSB3aWxsIHVzZSBhIHAybSBwYWdlIHRhYmxlCj4gICogZW50
cnkuCj4gICovCj4gcmV0dXJuIERJVl9ST1VORF9VUCgoCj4gICAgIC8qIEFjY291bnQgZm9yIG9u
ZSBlbnRyeSBpbiB0aGUgTDEgcGVyIHBhZ2UuICovCj4gICAgIG5yX3BhZ2VzICsKPiAgICAgLyog
QWNjb3VudCBmb3Igb25lIGVudHJ5IGluIHRoZSBMMiBwZXIgNTEyIHBhZ2VzLiAqLwo+ICAgICBE
SVZfUk9VTkRfVVAobnJfcGFnZXMsIDUxMikgKwo+ICAgICAvKiBBY2NvdW50IGZvciBvbmUgZW50
cnkgaW4gdGhlIEwzIHBlciA1MTJeMiBwYWdlcy4gKi8KPiAgICAgRElWX1JPVU5EX1VQKG5yX3Bh
Z2VzLCA1MTIgKiA1MTIpICsKPiAgICAgLyogQWNjb3VudCBmb3Igb25lIGVudHJ5IGluIHRoZSBM
NCBwZXIgNTEyXjMgcGFnZXMuICovCj4gICAgIERJVl9ST1VORF9VUChucl9wYWdlcywgNTEyICog
NTEyICogNTEyKSArCj4gICAgICkgKiA4LCBQQUdFX1NJWkUgPDwgUEFHRV9PUkRFUl80Syk7Cj4g
Cj4gVGhhdCB0YWtlcyBpbnRvIGFjY291bnQgaGlnaGVyIGxldmVsIHBhZ2UgdGFibGUgc3RydWN0
dXJlcy4KClRoYXQncyBhIGZhaXIgYXBwcm94aW1hdGlvbiB3aXRob3V0IDJNIGFuZCAxRyBwYWdl
cyBhdmFpbGFibGUuIEknbQp1bmNvbnZpbmNlZCB3ZSB3YW50IHRvIG92ZXItZXN0aW1hdGUgdGhp
cyBoZWF2aWx5IGluIHRoZSBtb3JlCmNvbW1vbiBjYXNlIG9mIGxhcmdlIHBhZ2UgbWFwcGluZ3Mg
YmVpbmcgYXZhaWxhYmxlLiBPdG9oIHRoaXMKcHJvdmlkZXMgZW5vdWdoIHJlc291cmNlcyB0byBs
YXRlciBhbHNvIGRlYWwgd2l0aCBzaGF0dGVyaW5nIG9mCmxhcmdlIHBhZ2VzLgoKVGhlIE1NSU8g
c2lkZSBvZiB0aGluZ3Mgb2YgY291cnNlIHN0aWxsIHJlbWFpbnMgdW5jbGVhci4KCldoYXQgSSBk
b24ndCB1bmRlcnN0YW5kIGluIGFueSBjYXNlIHRob3VnaCBpcwoiUEFHRV9TSVpFIDw8IFBBR0Vf
T1JERVJfNEsiLiBUaGlzIGlzIHg4NiBjb2RlIC0gd2h5IG5vdApqdXN0IFBBR0VfU0laRT8KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
