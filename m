From: Oleksandr Grytsov <al1img@gmail.com>
Subject: [PATCH 0/1] libxl/xl: rename id to unique-id in vdispl
 xen store
Date: Tue, 12 Jun 2018 18:40:45 +0300
Message-ID: <20180612154046.3492-1-al1img@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=d/ex=i6=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1fSlPk-0003b1-BX
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 15:40:56 +0000
Received: by mail-lf0-x242.google.com with SMTP id i15-v6so26440989lfc.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jun 2018 08:40:54 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: ian.jackson@eu.citrix.com, wei.liu2@citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKQXMg
bmV3IHZlcnNpb24gb2YgdGhlIGRpc3BsYXkgcHJvdG9jb2wgaW50cm9kdWNlcyB1bmlxdWUtaWQg
dmFyaWFibGUsIGl0IG5lZWRzCnRvIGJlIGNoYW5nZWQgaW4gbGlieGwveGwuIFRoaXMgcGF0Y2hz
ZXQgcmVuYW1lcyBpdCBpbiB0aGUgeGVuIHN0b3JlIGFuZCBpbgpkaXNwbGF5IGRldmljZSBzdHJ1
Y3R1cmVzLiBBbHNvIGl0IHVzZXMgWEVORElTUExfRklFTERfLi4uIGRlZmluZXMgaW5zdGVhZCBv
ZgppbmxpbmUgbmFtZXMuCgpPbGVrc2FuZHIgR3J5dHNvdiAoMSk6CiAgbGlieGwveGw6IHJlbmFt
ZSBpZCB0byB1bmlxdWUtaWQgaW4gdmRpc3BsIHhlbiBzdG9yZQoKIGRvY3MvbWFuL3hsLmNmZy5w
b2QuNS5pbiAgICB8ICAyICstCiB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgfCAgNCArKy0t
CiB0b29scy9saWJ4bC9saWJ4bF92ZGlzcGwuYyAgfCAzMiArKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLQogdG9vbHMveGwveGxfcGFyc2UuYyAgICAgICAgIHwgIDIgKy0KIHRvb2xzL3hs
L3hsX3ZkaXNwbC5jICAgICAgICB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKyksIDIwIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
