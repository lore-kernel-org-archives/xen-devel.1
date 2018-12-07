From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 03/18] xen: introduce 'xen-block',
 'xen-disk' and 'xen-cdrom'
Date: Fri, 7 Dec 2018 14:35:25 +0000
Message-ID: <20181207143525.GF18875__35401.4709395871$1544193267$gmane$org@perard.uk.xensource.com>
References: <1544108924-10841-1-git-send-email-paul.durrant@citrix.com>
 <1544108924-10841-4-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRRO=OQ=citrix.com=prvs=87219212e=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gVHE3-0001fs-49
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 14:35:31 +0000
Content-Disposition: inline
In-Reply-To: <1544108924-10841-4-git-send-email-paul.durrant@citrix.com>
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

T24gVGh1LCBEZWMgMDYsIDIwMTggYXQgMDM6MDg6MjlQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ICtzdGF0aWMgY2hhciAqZGlza190b192YmRfbmFtZSh1bnNpZ25lZCBpbnQgZGlzaykK
PiArewo+ICsgICAgY2hhciAqbmFtZSwgKnByZWZpeCA9IChkaXNrID49IDI2KSA/Cj4gKyAgICAg
ICAgZGlza190b192YmRfbmFtZSgoZGlzayAvIDI2KSAtIDEpIDogZ19zdHJkdXAoIiIpOwo+ICsK
PiArICAgIG5hbWUgPSBnX3N0cmR1cF9wcmludGYoIiVzJWMiLCBwcmVmaXgsICdhJyArIGRpc2sp
OwoKSSBkb24ndCB0aGluayB0aGF0IHdvcmtzLCBpZiBkaXNrIGlzIDI3LCB3ZSBkbyAoJ2EnICsg
MjcpIGhlcmUuIEl0J3MKcHJvYmFibHkgbWlzc2luZyBhIGBkaXNrICUgMjZgLgoKPiArICAgIGdf
ZnJlZShwcmVmaXgpOwo+ICsKPiArICAgIHJldHVybiBuYW1lOwo+ICt9CgpbLi4uXQoKPiArc3Rh
dGljIHVuc2lnbmVkIGludCB2YmRfbmFtZV90b19kaXNrKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0
IGNoYXIgKiplbmRwKQo+ICt7Cj4gKyAgICB1bnNpZ25lZCBpbnQgZGlzayA9IDA7Cj4gKwo+ICsg
ICAgd2hpbGUgKCpuYW1lICE9ICdcMCcpIHsKPiArICAgICAgICBpZiAoIWdfYXNjaWlfaXNhbHBo
YSgqbmFtZSkgfHwgIWdfYXNjaWlfaXNsb3dlcigqbmFtZSkpIHsKPiArICAgICAgICAgICAgYnJl
YWs7Cj4gKyAgICAgICAgfQo+ICsKPiArICAgICAgICBkaXNrICo9IDI2Owo+ICsgICAgICAgIGRp
c2sgKz0gKm5hbWUrKyAtICdhJzsKPiArICAgIH0KPiArICAgICplbmRwID0gbmFtZTsKPiArCj4g
KyAgICByZXR1cm4gZGlzazsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgeGVuX2Jsb2NrX3NldF92
ZGV2KE9iamVjdCAqb2JqLCBWaXNpdG9yICp2LCBjb25zdCBjaGFyICpuYW1lLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqb3BhcXVlLCBFcnJvciAqKmVycnApCj4gK3sK
ClNldHRpbmcgdmRldiBkb2Vzbid0IHdvcmsuIEkndmUgdHJpZWQgdG8gYWRkIGEgZGlzayBgeHZk
YWEnLCBhbmQgaXQKcmVzdWx0IGluIGB4dmRhJywgb3IgYGQwcDAnIChpbiB0aGUgdHJhY2UpLiAo
U2FtZSByZXN1bHQgd2l0aCBgeHZkYWFhJywKYW5kICd4dmRiYScgZ2l2ZXMgJ3h2ZGFhJy9kMjZw
MCkKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
