From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 23/25] argo: signal x86 HVM and ARM via VIRQ
Date: Wed, 19 Dec 2018 22:20:47 -0800
Message-ID: <CACMJ4GZB8YLo9APuDkEBfMN39OzswxRWjQ8GLiAS9QDy51e39A@mail.gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-24-git-send-email-christopher.w.clark@gmail.com>
 <5C1269B40200007800205DFA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZmS=O5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gZrhe-0004aT-By
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 06:21:02 +0000
Received: by mail-lj1-x241.google.com with SMTP id k19-v6so480372lji.11
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 22:21:00 -0800 (PST)
In-Reply-To: <5C1269B40200007800205DFA@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMTMsIDIwMTggYXQgNjoxNiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDAxLjEyLjE4IGF0IDAyOjMzLCA8Y2hyaXN0b3BoZXIu
dy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gKiB4ODYgUFYgZG9tYWlucyBhcmUgbm90aWZp
ZWQgdmlhIGV2ZW50IGNoYW5uZWwuCj4gPgo+ID4gUFYgZ3Vlc3RzIGFyZSBrbm93biB0byBoYXZl
IHRoZSBldmVudCBjaGFubmVsIHNvZnR3YXJlIHByZXNlbnQgaW4gdGhlIGd1ZXN0Cj4gPiBrZXJu
ZWwsIHNvIGl0IGlzIGZpbmUgdG8gZGVwZW5kIG9uIGFuZCB1c2UgaXQuCj4gPgo+ID4gKiB4ODYg
SFZNIGRvbWFpbnMgYW5kIGFsbCBBUk0gZG9tYWlucyBhcmUgbm90aWZpZWQgdmlhIFZJUlEuCj4g
Pgo+ID4gVGhlIGludGVudCBpcyB0byByZW1vdmUgdGhlIHJlcXVpcmVtZW50IGZvciBldmVudCBj
aGFubmVsIHNvZnR3YXJlIHRvIGJlCj4gPiBpbnN0YWxsZWQgd2l0aGluIHRoZXNlIGd1ZXN0cyBp
biBvcmRlciB0byB1c2UgQXJnby4gVklSUSBzaWduYWxsaW5nIGlzIGFsc28KPiA+IHRoZSBtZXRo
b2QgdGhhdCBoYXMgYmVlbiBpbiB1c2UgZm9yIHRoZSBsb25nZXN0IHBlcmlvZCB3aXRoIHRoaXMg
aHlwZXJjYWxsCj4gPiBpbiBib3RoIFhlbkNsaWVudCBhbmQgT3BlblhULgo+Cj4gSSdtIGFmcmFp
ZCBJIGRvbid0IGZvbGxvdzogc2VuZF9ndWVzdF9nbG9iYWxfdmlycSgpIHVzZXMsIHdlbGwsCj4g
ZXZ0Y2huX3BvcnRfc2V0X3BlbmRpbmcoKSwganVzdCBsaWtlIGV2dGNobl9zZW5kKCkgZG9lcy4K
PiBUaGVyZWZvcmUgaG93IGRvZXMgc2VuZGluZyBhIHZJUlEgaGVscCB3aXRoIGEgZ3Vlc3Qgd2l0
aG91dAo+IGV2ZW50IGNoYW5uZWwgYXdhcmVuZXNzPwoKT24gdGhpcyB0b3BpYywgc2lnbmFsIGRl
bGl2ZXJ5IHRvIGd1ZXN0cywgSSdtIHNpbXBsaWZ5aW5nIHRoZSBuZXh0IHZlcnNpb24gb2YKdGhl
IHBhdGNoIHNlcmllczogSSdtIGp1c3QgZ29pbmcgdG8gdXNlIFZJUlFzLgoKSXQgZG9lc24ndCBy
ZW1vdmUgdGhlIGRlcGVuZGVuY3kgb24gZXZlbnQgY2hhbm5lbCBzb2Z0d2FyZSBpbiB0aGUgZ3Vl
c3QsCmFuZCBpdCBkb2Vzbid0IG9wdGltaXplIGVmZmljaWVuY3kgb2Ygbm90aWZpY2F0aW9ucyB3
aXRoIEhWTSBndWVzdHMKYnV0IEknZCBsaWtlIHRvIGNvbWUgYmFjayBhbmQgYWRkcmVzcyB0aGF0
IGluIGEgc3Vic2VxdWVudCBwYXRjaCBvbmNlCnRoaXMgc2VyaWVzIGhhcyBiZWVuIGFjY2VwdGVk
LiBJdCdsbCBmb2xsb3cgZnJvbSB0aGUgZXhwbGFuYXRpb24KdGhhdCBKYW1lcydzIG1lc3NhZ2Ug
cHJvdmlkZXMuCgpDaHJpc3RvcGhlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
