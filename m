From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ALSA: xen-front: Use Xen
 common shared buffer implementation
Date: Fri, 23 Nov 2018 10:19:38 +0200
Message-ID: <a5a5754f-0a1d-d537-feaa-8f4ff4e203e3__1665.82670431143$1542961112$gmane$org@gmail.com>
References: <20181122100230.14976-1-andr2000@gmail.com>
 <20181122100230.14976-3-andr2000@gmail.com> <s5hzhu13yil.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ug4v=oc=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gQ6gi-0002f4-4J
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 08:19:44 +0000
Received: by mail-lj1-x241.google.com with SMTP id c19-v6so9945410lja.5
 for <xen-devel@lists.xenproject.org>; Fri, 23 Nov 2018 00:19:42 -0800 (PST)
In-Reply-To: <s5hzhu13yil.wl-tiwai@suse.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: jgross@suse.com, alsa-devel@alsa-project.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjIvMTggNTo0NyBQTSwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+IE9uIFRodSwgMjIgTm92
IDIwMTggMTE6MDI6MzAgKzAxMDAsCj4gT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+
IEBAIC0yMTQsMTIgKzIyMSwxOSBAQCBzdGF0aWMgdm9pZCBzdHJlYW1fY2xlYXIoc3RydWN0IHhl
bl9zbmRfZnJvbnRfcGNtX3N0cmVhbV9pbmZvICpzdHJlYW0pCj4+ICAgCXN0cmVhbS0+b3V0X2Zy
YW1lcyA9IDA7Cj4+ICAgCWF0b21pY19zZXQoJnN0cmVhbS0+aHdfcHRyLCAwKTsKPj4gICAJeGVu
X3NuZF9mcm9udF9ldnRjaG5sX3BhaXJfY2xlYXIoc3RyZWFtLT5ldnRfcGFpcik7Cj4+IC0JeGVu
X3NuZF9mcm9udF9zaGJ1Zl9jbGVhcigmc3RyZWFtLT5zaF9idWYpOwo+PiArCW1lbXNldCgmc3Ry
ZWFtLT5zaGJ1ZiwgMCwgc2l6ZW9mKHN0cmVhbS0+c2hidWYpKTsKPj4gKwlzdHJlYW0tPmJ1ZmZl
ciA9IE5VTEw7Cj4+ICsJc3RyZWFtLT5idWZmZXJfc3ogPSAwOwo+PiArCXN0cmVhbS0+cGFnZXMg
PSBOVUxMOwo+PiArCXN0cmVhbS0+bnVtX3BhZ2VzID0gMDsKPj4gICB9Cj4+ICAgCj4+ICAgc3Rh
dGljIHZvaWQgc3RyZWFtX2ZyZWUoc3RydWN0IHhlbl9zbmRfZnJvbnRfcGNtX3N0cmVhbV9pbmZv
ICpzdHJlYW0pCj4+ICAgewo+PiAtCXhlbl9zbmRfZnJvbnRfc2hidWZfZnJlZSgmc3RyZWFtLT5z
aF9idWYpOwo+PiArCXhlbl9mcm9udF9wZ2Rpcl9zaGJ1Zl91bm1hcCgmc3RyZWFtLT5zaGJ1Zik7
Cj4+ICsJeGVuX2Zyb250X3BnZGlyX3NoYnVmX2ZyZWUoJnN0cmVhbS0+c2hidWYpOwo+PiArCWZy
ZWVfcGFnZXNfZXhhY3Qoc3RyZWFtLT5idWZmZXIsIHN0cmVhbS0+YnVmZmVyX3N6KTsKPj4gKwlr
ZnJlZShzdHJlYW0tPnBhZ2VzKTsKPj4gICAJc3RyZWFtX2NsZWFyKHN0cmVhbSk7Cj4+ICAgfQo+
PiAgIAo+PiBAQCAtNDIxLDEwICs0MzUsMzQgQEAgc3RhdGljIGludCBhbHNhX2Nsb3NlKHN0cnVj
dCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtKQo+PiAgIAlyZXR1cm4gMDsKPj4gICB9Cj4+
ICAgCj4+ICtzdGF0aWMgaW50IHNoYnVmX3NldHVwX2JhY2tzdG9yZShzdHJ1Y3QgeGVuX3NuZF9m
cm9udF9wY21fc3RyZWFtX2luZm8gKnN0cmVhbSwKPj4gKwkJCQkgc2l6ZV90IGJ1ZmZlcl9zeikK
Pj4gK3sKPj4gKwlpbnQgaTsKPj4gKwo+PiArCXN0cmVhbS0+YnVmZmVyX3N6ID0gYnVmZmVyX3N6
Owo+PiArCXN0cmVhbS0+YnVmZmVyID0gYWxsb2NfcGFnZXNfZXhhY3Qoc3RyZWFtLT5idWZmZXJf
c3osIEdGUF9LRVJORUwpOwo+PiArCWlmICghc3RyZWFtLT5idWZmZXIpCj4+ICsJCXJldHVybiAt
RU5PTUVNOwo+IFRoaXMga2VlcHMgdGhlIE5VTEwgc3RyZWFtLT5idWZmZXIsIGFuZCB0aGVuIHRo
ZSBjYWxsZXIgZ29lcyB0byB0aGUKPiBlcnJvciBwYXRoIHZpYSBzdHJlYW1fZnJlZSgpIHdoaWNo
IHdpbGwgbGVhZCB0byBhbiBPb3BzIGR1ZSB0byB0aGUKPiB1bmNvbmRpdGlvbmFsIGNhbGwgb2Yg
ZnJlZV9wYWdlc19leGFjdCgpLgoKWW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0LCB3aWxsIGZpeAoK
VGhhbmsgeW91IGZvciBjYXRjaGluZyB0aGlzCgo+Cj4KPiB0aGFua3MsCj4KPiBUYWthc2hpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
