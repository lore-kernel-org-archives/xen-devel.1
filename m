From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 05/18] xen: add xenstore watcher
 infrastructure
Date: Fri, 7 Dec 2018 15:57:45 +0000
Message-ID: <20181207155745.GI18875__24715.8349062831$1544198198$gmane$org@perard.uk.xensource.com>
References: <1544108924-10841-1-git-send-email-paul.durrant@citrix.com>
 <1544108924-10841-6-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRRO=OQ=citrix.com=prvs=87219212e=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gVIVn-0002H0-9c
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 15:57:55 +0000
Content-Disposition: inline
In-Reply-To: <1544108924-10841-6-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMDYsIDIwMTggYXQgMDM6MDg6MzFQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEBAIC0zNiw2ICs1NCwxMiBAQCBzdGF0aWMgdm9pZCB4ZW5fYmxvY2tfdW5yZWFsaXpl
KFhlbkRldmljZSAqeGVuZGV2LCBFcnJvciAqKmVycnApCj4gIAo+ICAgICAgdHJhY2VfeGVuX2Js
b2NrX3VucmVhbGl6ZSh0eXBlLCB2ZGV2LT5kaXNrLCB2ZGV2LT5wYXJ0aXRpb24pOwo+ICAKPiAr
ICAgIC8qIERpc2Nvbm5lY3QgZnJvbSB0aGUgZnJvbnRlbmQgaW4gY2FzZSB0aGlzIGhhcyBub3Qg
YWxyZWFkeSBoYXBwZW5lZCAqLwo+ICsgICAgeGVuX2Jsb2NrX2Rpc2Nvbm5lY3QoeGVuZGV2LCAm
bG9jYWxfZXJyKTsKPiArICAgIGlmIChsb2NhbF9lcnIpIHsKPiArICAgICAgICBlcnJvcl9wcm9w
YWdhdGUoZXJycCwgbG9jYWxfZXJyKTsKCklmIHhlbl9ibG9ja19kaXNjb25uZWN0IGZhaWxzLCBs
b2NhbF9lcnIgaXMgZ29pbmcgdG8gYmUgcmV1c2UgYmVsb3cuIElmCml0J3MgZmluZSB0byB0cnkg
dW5yZWFsaXplLCB0aGVuIGBsb2NhbF9lcnI9TlVMTGAgaXMgcHJvYmFibHkgZW5vdWdoLgoKPiAr
ICAgIH0KPiArCj4gICAgICBpZiAoYmxvY2tkZXZfY2xhc3MtPnVucmVhbGl6ZSkgewo+ICAgICAg
ICAgIGJsb2NrZGV2X2NsYXNzLT51bnJlYWxpemUoYmxvY2tkZXYsICZsb2NhbF9lcnIpOwo+ICAg
ICAgICAgIGlmIChsb2NhbF9lcnIpIHsKClsuLi5dCgo+ICtzdGF0aWMgdm9pZCB4ZW5fYnVzX3Jl
bW92ZV93YXRjaChYZW5CdXMgKnhlbmJ1cywgWGVuV2F0Y2ggKndhdGNoLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBFcnJvciAqKmVycnApCj4gK3sKPiArICAgIEVycm9yICps
b2NhbF9lcnIgPSBOVUxMOwo+ICsKPiArICAgIHRyYWNlX3hlbl9idXNfcmVtb3ZlX3dhdGNoKHdh
dGNoLT5ub2RlLCB3YXRjaC0+a2V5LCB3YXRjaC0+dG9rZW4pOwo+ICsKPiArICAgIHhzX25vZGVf
dW53YXRjaCh4ZW5idXMtPnhzaCwgd2F0Y2gtPm5vZGUsIHdhdGNoLT5rZXksIHdhdGNoLT50b2tl
biwKPiArICAgICAgICAgICAgICAgICAgICAmbG9jYWxfZXJyKTsKCllvdSBjb3VsZCBzaW1wbHkg
cGFzcyBgZXJycCcgZGlyZWN0bHkgaW5zdGVhZCBvZiBoYXZpbmcgYGxvY2FsX2VycicuCgo+ICsK
PiArICAgIG5vdGlmaWVyX3JlbW92ZSgmd2F0Y2gtPm5vdGlmaWVyKTsKPiArICAgIGZyZWVfd2F0
Y2god2F0Y2gpOwo+ICsKPiArICAgIGlmIChsb2NhbF9lcnIpIHsKPiArICAgICAgICBlcnJvcl9w
cm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKTsKPiArICAgIH0KPiArfQo+ICsKCi0tIApBbnRob255
IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
