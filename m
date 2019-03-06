From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [PATCH 0/6] iomem cacheability
Date: Wed, 6 Mar 2019 17:16:13 +0530
Message-ID: <CABHD4K8JQdhi8P4ZbYndUFs90w0eH9QqMAa_XDPJM-QA_yr=QA@mail.gmail.com>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <CABHD4K-UAuyv0Cwmk1d-SBUgGvUarWq-fsAsJATbg3r+ovGLrg@mail.gmail.com>
 <alpine.DEB.2.10.1903051321390.17552@sstabellini-ThinkPad-X260>
 <CAF3u54Di61CufwzwJ35sqPrBRVt2ewrmR=siDHPWA8ur29db7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U2UN=RJ=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1h1V0E-0004Ae-VM
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 11:46:27 +0000
Received: by mail-oi1-x244.google.com with SMTP id q81so9575947oic.5
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2019 03:46:25 -0800 (PST)
In-Reply-To: <CAF3u54Di61CufwzwJ35sqPrBRVt2ewrmR=siDHPWA8ur29db7Q@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGksCj4gTG9va2luZyBhdCB0aGUgc3RhY2sgdHJhY2UsIHRoaXMgaXMgdmVyeSBsaWtlbHkgZHVl
IHRvIHRoZSBpc3N1ZSBJIHBvaW50ZWQgb3V0IGVhcmxpZXIgb24uIEkuZSByZXNlcnZlZC1tZW1v
cnkgcmVnaW9uIHNob3VsZCBiZSBkZXNjcmliZWQgaW4gdGhlIG1lbW9yeSBub2Rlcy4KCkRvIHlv
dSBtZWFuLCBzb21ldGhpbmcgbGlrZSB0aGlzKHJlc2VydmVkLW1lbW9yeSBub2RlIGlzIHVuZGVy
IG1lbW9yeSBub2RlKSA/CgotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5
NS1oM3VsY2IuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk1LWgz
dWxjYi5kdHMKQEAgLTE3LDIzICsxNywxMCBAQAogICAgICAgIG1lbW9yeUA0ODAwMDAwMCB7CiAg
ICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwogICAgICAgICAgICAgICAgLyog
Zmlyc3QgMTI4TUIgaXMgcmVzZXJ2ZWQgZm9yIHNlY3VyZSBhcmVhLiAqLwotICAgICAgICAgICAg
ICAgcmVnID0gPDB4MCAweDQ4MDAwMDAwIDB4MCAweDM4MDAwMDAwPjsKLSAgICAgICB9OwotCi0g
ICAgICAgbWVtb3J5QDUwMDAwMDAwMCB7Ci0gICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJt
ZW1vcnkiOwotICAgICAgICAgICAgICAgcmVnID0gPDB4NSAweDAwMDAwMDAwIDB4MCAweDQwMDAw
MDAwPjsKLSAgICAgICB9OwotCi0gICAgICAgbWVtb3J5QDYwMDAwMDAwMCB7Ci0gICAgICAgICAg
ICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwotICAgICAgICAgICAgICAgcmVnID0gPDB4NiAw
eDAwMDAwMDAwIDB4MCAweDQwMDAwMDAwPjsKLSAgICAgICB9OwotCi0gICAgICAgbWVtb3J5QDcw
MDAwMDAwMCB7Ci0gICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwotICAgICAg
ICAgICAgICAgcmVnID0gPDB4NyAweDAwMDAwMDAwIDB4MCAweDQwMDAwMDAwPjsKLSAgICAgICB9
OworICAgICAgICAgIHJlZyA9IDwweDAgMHg0ODAwMDAwMCAweDAgMHgzODAwMDAwMD4sCisgICAg
ICAgICAgICAgICAgPDB4NSAweDAwMDAwMDAwIDB4MCAweDQwMDAwMDAwPiwKKyAgICAgICAgICAg
ICAgICA8MHg2IDB4MDAwMDAwMDAgMHgwIDB4NDAwMDAwMDA+LAorICAgICAgICAgICAgICAgIDww
eDcgMHgwMDAwMDAwMCAweDAgMHg0MDAwMDAwMD47CgogICAgICAgIHJlc2VydmVkLW1lbW9yeSB7
CiAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKQEAgLTYxLDYgKzQ4LDcgQEAK
ICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHg3MDAwMDAwMCAweDAg
MHgxMDAwMDAwMD47CiAgICAgICAgICAgICAgICB9OwogICAgICAgIH07CisgICAgICAgfTsKClRo
YW5rcwotQW1pdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
