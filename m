From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 15/25] argo: implement the sendv op
Date: Thu, 20 Dec 2018 01:33:00 -0700
Message-ID: <5C1B53BC0200007800207E73@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-16-git-send-email-christopher.w.clark@gmail.com>
 <5C10F69A0200007800205711@prv1-mh.provo.novell.com>
 <CACMJ4Ga6uRNtLN75dY7rugrMgb0VOXYVXEE11R2CSbabNTa0-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gZtlQ-0001Za-4I
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 08:33:04 +0000
In-Reply-To: <CACMJ4Ga6uRNtLN75dY7rugrMgb0VOXYVXEE11R2CSbabNTa0-Q@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDA2OjU4LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IE9uIFdlZCwgRGVjIDEyLCAyMDE4IGF0IDM6NTMgQU0gSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4gPj4+IE9uIDAxLjEyLjE4IGF0IDAyOjMyLCA8Y2hy
aXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+PiA+ICtzdGF0aWMgc3RydWN0IGFy
Z29fcmluZ19pbmZvICoKPj4gPiArYXJnb19yaW5nX2ZpbmRfaW5mb19ieV9tYXRjaChjb25zdCBz
dHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBwb3J0LAo+PiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGRvbWlkX3QgcGFydG5lcl9pZCwgdWludDY0X3QgcGFydG5lcl9jb29raWUpCj4+
ID4gK3sKPj4gPiArICAgIGFyZ29fcmluZ19pZF90IGlkOwo+PiA+ICsgICAgc3RydWN0IGFyZ29f
cmluZ19pbmZvICpyaW5nX2luZm87Cj4+ID4gKwo+PiA+ICsgICAgQVNTRVJUKHJ3X2lzX2xvY2tl
ZCgmZC0+YXJnby0+bG9jaykpOwo+PiA+ICsKPj4gPiArICAgIGlkLmFkZHIucG9ydCA9IHBvcnQ7
Cj4+ID4gKyAgICBpZC5hZGRyLmRvbWFpbl9pZCA9IGQtPmRvbWFpbl9pZDsKPj4gPiArICAgIGlk
LnBhcnRuZXIgPSBwYXJ0bmVyX2lkOwo+PiA+ICsKPj4gPiArICAgIHJpbmdfaW5mbyA9IGFyZ29f
cmluZ19maW5kX2luZm8oZCwgJmlkKTsKPj4gPiArICAgIGlmICggcmluZ19pbmZvICYmIChwYXJ0
bmVyX2Nvb2tpZSA9PSByaW5nX2luZm8tPnBhcnRuZXJfY29va2llKSApCj4+ID4gKyAgICAgICAg
cmV0dXJuIHJpbmdfaW5mbzsKPj4KPj4gU3VjaCBhIGNvb2tpZSBtYWtlcyBtaXNtYXRjaGVzIHVu
bGlrZWx5LCBidXQgaXQgZG9lc24ndCBleGNsdWRlCj4+IHRoZW0uIElmIHRoZXJlIGFyZSBvdGhl
ciBjaGVja3MsIGlzIHRoZSBjb29raWUgdXNlZnVsIGF0IGFsbD8KPiAKPiBZZXMsIEkgdGhpbmsg
c28gYW5kIGl0J3MgcHJvdmVkIHVzZWZ1bCBlbHNld2hlcmUgaW4gdGhlIHNlY29uZAo+IHZlcnNp
b24gb2YgdGhlIHNlcmllczogaXQgaGVscHMgYXZvaWQgc2VuZGluZyBzaWduYWxzIHRvIGluY29y
cmVjdAo+IGRvbWFpbnMgdGhhdCBtYXkgbm90IGJlIGFyZ28tZW5hYmxlZC4KCiJJdCBoZWxwcyBh
dm9pZCIgc3RpbGwgaXNuJ3QgIml0IGFsbG93cyB0byBhdm9pZCIsIGkuZS4gaXQgc3RpbGwgc291
bmRzIGxpa2UKYW4gYXBwcm9hY2ggcmVkdWNpbmcgbGlrZWxpaG9vZCBpbnN0ZWFkIG9mIG9uZSBl
eGNsdWRpbmcgbWlzdGFrZXMKYWx0b2dldGhlci4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
