From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Unable to copy the kernel in the hwdom memory
Date: Tue, 5 Mar 2019 14:11:52 +0000
Message-ID: <SN6PR08MB45440143DECE7974364A3B2EDB720@SN6PR08MB4544.namprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jWr4=RI=micron.com=beanhuo@srs-us1.protection.inumbo.net>)
 id 1h1AnX-0003O6-Ai
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 14:11:59 +0000
Received: from mail.micron.com (bowex36h.micron.com [137.201.84.179])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x25EBtMX016804
 for <xen-devel@lists.xenproject.org>; Tue, 5 Mar 2019 07:11:55 -0700
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CkhpLCAKSSBqdXN0IHRyeSB0byBlbmFibGUgeGVuIDQuMTIgb24gbXkgb25lIHBsYXRmb3JtLCBi
dXQgZ290IHRoaXMgZXJyb3IuIEFuZCBpZiBJIGNob29zZSA0LjggdmVyc2lvbiBYZW4uCkl0IHdv
cmtzLCBkb2Vzbid0IGhhdmUgdGhpcy4gSWYgdGhlcmUgaXMgc29tZW9uZSBjYW4gZ2l2ZSBtZSBz
b21lIGRlZXAgZGVidWdnaW5nIHRpcCwgdGhhdCB3aWxsIGJlIHZlcnkgYXBwcmVjaWF0aXZlLgpU
aGFua3MKCgooWEVOKSBQMk06IDQwLWJpdCBJUEEgd2l0aCA0MC1iaXQgUEEgYW5kIDgtYml0IFZN
SUQKKFhFTikgUDJNOiAzIGxldmVscyB3aXRoIG9yZGVyLTEgcm9vdCwgVlRDUiAweDgwMDIzNTU4
CihYRU4pIEkvTyB2aXJ0dWFsaXNhdGlvbiBkaXNhYmxlZAooWEVOKSBidWlsZC1pZDogZWVmM2Yz
Y2EzMTkyMzkxZDYwYjAzMDNlMzEwOTUyNjE2YmVmNzhiZgooWEVOKSBhbHRlcm5hdGl2ZXM6IFBh
dGNoaW5nIHdpdGggYWx0IHRhYmxlIDAwMDAwMDAwMDAyYWJiZDggLT4gMDAwMDAwMDAwMDJhYzIy
MAooWEVOKSAqKiogTE9BRElORyBET01BSU4gMCAqKioKKFhFTikgTG9hZGluZyBEb21kMCBrZXJu
ZWwgZnJvbSBib290IG1vZHVsZSBAIDAwMDAwMDAwYjhlZGYwMDAKKFhFTikgQWxsb2NhdGluZyAx
OjEgbWFwcGluZ3MgdG90YWxsaW5nIDUxMk1CIGZvciBkb20wOgooWEVOKSBCQU5LWzBdIDB4MDAw
MDAwMjAwMDAwMDAtMHgwMDAwMDAzMDAwMDAwMCAoMjU2TUIpCihYRU4pIEJBTktbMV0gMHgwMDAw
MDA5MDAwMDAwMC0weDAwMDAwMGEwMDAwMDAwICgyNTZNQikKKFhFTikgR3JhbnQgdGFibGUgcmFu
Z2U6IDB4MDAwMDAwYjhkYjMwMDAtMHgwMDAwMDBiOGRmMzAwMAooWEVOKSBBbGxvY2F0aW5nIFBQ
SSAxNiBmb3IgZXZlbnQgY2hhbm5lbCBpbnRlcnJ1cHQKKFhFTikgTG9hZGluZyB6SW1hZ2UgZnJv
bSAwMDAwMDAwMGI4ZWRmMDAwIHRvIDAwMDAwMDAwMjAwODAwMDAtMDAwMDAwMDAyMTRiYmEwMAoo
WEVOKSAKKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgooWEVO
KSBQYW5pYyBvbiBDUFUgMDoKKFhFTikgVW5hYmxlIHRvIGNvcHkgdGhlIGtlcm5lbCBpbiB0aGUg
aHdkb20gbWVtb3J5CihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
