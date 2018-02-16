From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] shut down domain when last vCPU goes down
Date: Fri, 16 Feb 2018 08:10:48 -0700
Message-ID: <5A87028802000078001A8759@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=jcsl=fk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1emhf7-0001Jb-DV
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 15:10:57 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

SSd2ZSBqdXN0IGhhZCB0byBkZWFsIHdpdGggYW4gZWFybHkgYm9vdCBjcmFzaCBvZiBMaW51eCB3
aGljaCBvY2N1cnJlZApzbyBlYXJseSB0aGF0IGV2ZW4gImVhcmx5cHJpbnRrPXhlbiIgZGlkIG5v
dCBwcm9kdWNlIGFueSB1c2VmdWwgb3V0cHV0LgpIZW5jZSB0aGUgZG9tYWluIGFwcGVhcmVkIHRv
IGhhbmcsIHdoaWxlIGluIGZhY3QgaXQgaGFkIGJyb3VnaHQgZG93biBpdHMKb25seSB2Q1BVLiBC
eSB0cmFuc2xhdGluZyB0aGlzIHRvIGEgc2h1dGRvd24sIHRoZSBzaXR1YXRpb24gd2lsbCBiZQpi
ZXR0ZXIgcmVjb2duaXphYmxlLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYworKysgYi94ZW4vY29tbW9uL2Rv
bWFpbi5jCkBAIC0xMzIxLDYgKzEzMjEsMjIgQEAgbG9uZyBkb192Y3B1X29wKGludCBjbWQsIHVu
c2lnbmVkIGludCB2YwogICAgICAgICBicmVhazsKIAogICAgIGNhc2UgVkNQVU9QX2Rvd246Cisg
ICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKKyAgICAgICAgICAgIGlmICggdi0+dmNwdV9p
ZCAhPSB2Y3B1aWQgJiYgIXRlc3RfYml0KF9WUEZfZG93biwgJnYtPnBhdXNlX2ZsYWdzKSApCisg
ICAgICAgICAgICB7CisgICAgICAgICAgICAgICByYyA9IDE7CisgICAgICAgICAgICAgICBicmVh
azsKKyAgICAgICAgICAgIH0KKworICAgICAgICBpZiAoICFyYyApCisgICAgICAgIHsKKyAgICAg
ICAgICAgIGRvbWFpbl9zaHV0ZG93bihkLCBTSFVURE9XTl9wb3dlcm9mZik7CisgICAgICAgICAg
ICBicmVhazsKKyAgICAgICAgfQorCisgICAgICAgIHJjID0gMDsKKyAgICAgICAgdiA9IGQtPnZj
cHVbdmNwdWlkXTsKKwogI2lmZGVmIENPTkZJR19YODYKICAgICAgICAgaWYgKCBwdl9zaGltICkK
ICAgICAgICAgICAgIHJjID0gY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgwLCBwdl9zaGltX2Nw
dV9kb3duLCB2KTsKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
