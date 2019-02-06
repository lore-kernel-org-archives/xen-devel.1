From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v5 8/9] common/grant_table:
 block speculative out-of-bound accesses
Date: Wed, 06 Feb 2019 07:52:11 -0700
Message-ID: <5C5AF49B0200007800214548@prv1-mh.provo.novell.com>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
 <1548772997-32742-9-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0104A7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grOYg-0001D6-He
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 14:52:14 +0000
In-Reply-To: <0104A7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAxLjE5IGF0IDE1OjQzLCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBA
QCAtOTYzLDYgKzk2NSw5IEBAIG1hcF9ncmFudF9yZWYoCj4gICAgICAgICAgUElOX0ZBSUwodW5s
b2NrX291dCwgR05UU1RfYmFkX2dudHJlZiwgIkJhZCByZWYgJSN4IGZvciBkJWRcbiIsCj4gICAg
ICAgICAgICAgICAgICAgb3AtPnJlZiwgcmd0LT5kb21haW4tPmRvbWFpbl9pZCk7Cj4gIAo+ICsg
ICAgLyogTWFrZSBzdXJlIHRoZSBhYm92ZSBjaGVjayBpcyBub3QgYnlwYXNzZWQgc3BlY3VsYXRp
dmVseSAqLwo+ICsgICAgb3AtPnJlZiA9IGFycmF5X2luZGV4X25vc3BlYyhvcC0+cmVmLCBucl9n
cmFudF9lbnRyaWVzKHJndCkpOwo+ICsKPiAgICAgIGFjdCA9IGFjdGl2ZV9lbnRyeV9hY3F1aXJl
KHJndCwgb3AtPnJlZik7Cj4gICAgICBzaGFoID0gc2hhcmVkX2VudHJ5X2hlYWRlcihyZ3QsIG9w
LT5yZWYpOwo+ICAgICAgc3RhdHVzID0gcmd0LT5ndF92ZXJzaW9uID09IDEgPyAmc2hhaC0+Zmxh
Z3MgOiAmc3RhdHVzX2VudHJ5KHJndCwgb3AtPnJlZik7CgpKdXN0IEZUUiAtIHRoaXMgaXMgYSBj
YXNlIHdoZXJlIHRoZSBjaGFuZ2UsIGFjY29yZGluZyB0byBwcmlvcgpkaXNjdXNzaW9uLCBpcyBw
cmV0dHkgdW5saWtlbHkgdG8gaGVscCBhdCBhbGwuIFRoZSBjb21waWxlciB3aWxsIGhhdmUKYSBo
YXJkIHRpbWUgcmVhbGl6aW5nIHRoYXQgaXQgY291bGQga2VlcCB0aGUgcmVzdWx0IGluIGEgcmVn
aXN0ZXIgcGFzdAp0aGUgYWN0aXZlX2VudHJ5X2FjcXVpcmUoKSBpbnZvY2F0aW9uLCBhcyB0aGF0
IC0gZHVlIHRvIHRoZSBzcGluCmxvY2sgYWNxdWlyZWQgdGhlcmUgLSBhY3RzIGFzIGEgY29tcGls
ZXIgYmFycmllci4gQW5kIGxvb2tpbmcgYXQKZ2VuZXJhdGVkIGNvZGUgKGdjYyA4LjIpIGNvbmZp
cm1zIHRoYXQgdGhlcmUncyBhIHJlbG9hZCBmcm9tIHRoZQpzdGFjay4KCj4gQEAgLTIwMjYsNiAr
MjAzMSw5IEBAIGdudHRhYl9wcmVwYXJlX2Zvcl90cmFuc2ZlcigKPiAgICAgICAgICBnb3RvIGZh
aWw7Cj4gICAgICB9Cj4gIAo+ICsgICAgLyogTWFrZSBzdXJlIHRoZSBhYm92ZSBjaGVjayBpcyBu
b3QgYnlwYXNzZWQgc3BlY3VsYXRpdmVseSAqLwo+ICsgICAgcmVmID0gYXJyYXlfaW5kZXhfbm9z
cGVjKHJlZiwgbnJfZ3JhbnRfZW50cmllcyhyZ3QpKTsKPiArCj4gICAgICBzaGEgPSBzaGFyZWRf
ZW50cnlfaGVhZGVyKHJndCwgcmVmKTsKPiAgCj4gICAgICBzY29tYm8ud29yZCA9ICoodTMyICop
JnNoYS0+ZmxhZ3M7Cj4gQEAgLTIyMjMsNyArMjIzMSw4IEBAIGdudHRhYl90cmFuc2ZlcigKPiAg
ICAgICAgICBva2F5ID0gZ250dGFiX3ByZXBhcmVfZm9yX3RyYW5zZmVyKGUsIGQsIGdvcC5yZWYp
Owo+ICAgICAgICAgIHNwaW5fbG9jaygmZS0+cGFnZV9hbGxvY19sb2NrKTsKPiAgCj4gLSAgICAg
ICAgaWYgKCB1bmxpa2VseSghb2theSkgfHwgdW5saWtlbHkoZS0+aXNfZHlpbmcpICkKPiArICAg
ICAgICAvKiBNYWtlIHN1cmUgdGhpcyBjaGVjayBpcyBub3QgYnlwYXNzZWQgc3BlY3VsYXRpdmVs
eSAqLwo+ICsgICAgICAgIGlmICggZXZhbHVhdGVfbm9zcGVjKHVubGlrZWx5KCFva2F5KSB8fCB1
bmxpa2VseShlLT5pc19keWluZykpICkKCkknbSBzdGlsbCBub3QgcmVhbGx5IGhhcHB5IGFib3V0
IHRoaXMuIFRoZSBjb21tZW50IGlzbid0IGhlbHBmdWwgaW4KY29ubmVjdGluZyB0aGUgdXNlIG9m
IGV2YWx1YXRlX25vc3BlYygpIHRvIHRoZSBwcm9ibGVtIHNpdGUKKGluIHRoZSBlYXJsaWVyIGh1
bmssIHdoaWNoIEkndmUgbGVmdCBpbiBjb250ZXh0KSwgYW5kIEkgc3RpbGwgZG9uJ3QKdW5kZXJz
dGFuZCB3aHkgdGhlIGUtPmlzX2R5aW5nIGlzIGdldHRpbmcgd3JhcHBlZCBhcyB3ZWxsLgpQbHVz
IGl0IG9jY3VycyB0byBtZSBub3cgdGhhdCB5b3UncmUgbGlhYmxlIHRvIHJlbmRlciB1bmxpa2Vs
eSgpCmluZWZmZWN0aXZlIGhlcmUuIFNvIGhvdyBhYm91dAoKICAgICAgICBpZiAoIHVubGlrZWx5
KGV2YWx1YXRlX25vc3BlYyghb2theSkpIHx8IHVubGlrZWx5KGUtPmlzX2R5aW5nKSApCgo/CgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
