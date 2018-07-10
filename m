From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 3/3] xl/vsnd: initialise rc in dryrun path
Date: Tue, 10 Jul 2018 14:46:07 +0100
Message-ID: <20180710134607.20302-4-wei.liu2@citrix.com>
References: <20180710134607.20302-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9fb0=j2=citrix.com=prvs=7221156ca=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fcsy4-0006Of-Ez
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 13:46:12 +0000
In-Reply-To: <20180710134607.20302-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, al1img@gmail.com, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

UmVwb3J0ZWQtYnk6IENvdmVyaXR5ClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Ci0tLQogdG9vbHMveGwveGxfdnNuZC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90b29scy94bC94bF92c25kLmMgYi90b29scy94
bC94bF92c25kLmMKaW5kZXggNmRkM2E5MDFiMi4uMzMwNmI5MzEzOSAxMDA2NDQKLS0tIGEvdG9v
bHMveGwveGxfdnNuZC5jCisrKyBiL3Rvb2xzL3hsL3hsX3ZzbmQuYwpAQCAtNDYsNiArNDYsNyBA
QCBpbnQgbWFpbl92c25kYXR0YWNoKGludCBhcmdjLCBjaGFyICoqYXJndikKICAgICBpZiAoZHJ5
cnVuX29ubHkpIHsKICAgICAgICAgY2hhciAqanNvbiA9IGxpYnhsX2RldmljZV92c25kX3RvX2pz
b24oY3R4LCAmdnNuZCk7CiAgICAgICAgIHByaW50ZigidnNuZDogJXNcbiIsIGpzb24pOworICAg
ICAgICByYyA9IDA7CiAgICAgICAgIGZyZWUoanNvbik7CiAgICAgICAgIGdvdG8gb3V0OwogICAg
IH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
