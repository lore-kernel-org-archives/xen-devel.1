From: Praveen Kumar <kpraveen.lkml@gmail.com>
Subject: [RFC PATCH v2 0/2] xen: credit2: rb-tree for runqueues
Date: Sun, 23 Dec 2018 19:51:32 +0530
Message-ID: <20181223142134.7857-1-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HxHq=PM=gmail.com=kpraveen.lkml@srs-us1.protection.inumbo.net>)
 id 1gfM90-0003tK-HB
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 09:51:58 +0000
Received: by mail-pf1-x441.google.com with SMTP id y126so18070153pfb.4
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jan 2019 01:51:56 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: george.dunlap@eu.citrix.com, Praveen Kumar <kpraveen.lkml@gmail.com>, dfaggioli@suse.com
List-Id: xen-devel@lists.xenproject.org

SGkgQWxsLAoKVGhpcyBpcyB0aGUgY29udGludWVkIHdvcmsgd2l0aCByZXNwZWN0IHRvIHJiLXRy
ZWUgdXNhZ2UgaW4gQ3JlZGl0MiwgYXMKbWVudGlvbmVkIGluIHByZXZpb3VzIGNvbnZlcnNhdGlv
bnMKCmh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTA2
L21zZzAxOTY4Lmh0bWwKaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRl
dmVsLzIwMTgtMDQvbXNnMDAxMTkuaHRtbAoKVGhlIHBhdGNoIG9wdGltaXplZCB0aGUgQ3JlZGl0
MiBydW5xdWV1ZSBmcm9tIHNvcnRlZCBxdWV1ZSB0byByYi10cmVlLgpUaGlzIHdpbGwgaGVscCBp
biBwZXJmb3JtYW5jZSBhbmQgc2NhbGFiaWxpdHksIHdoZW4gd2UgaGF2ZSBodWdlIG51bWJlciBv
Zgp2Q1BVcy4KClBsZWFzZSBwcm92aWRlIHlvdXIgY29tbWVudHMgb3ZlciB0aGUgY2hhbmdlcyBk
b25lLgoKQ2hhbmdlcyBzaW5jZSB2MToKICogUmVuYW1lZCB0aGUgcmJfcnVucV9pbnNlcnQKICog
Q29ycmVjdGVkIHRoZSBuZXh0IHByb2JhYmxlIHJ1bnEgZWxlbWVudCBmcm9tIHJiX2ZpcnN0IHRv
IHJiX2xhc3QKICogSW50cm9kdWNlZCBuZXcgY2FjaGVkIGF0dHJpYnV0ZSB0byBoYXZlIG5leHQg
cnVucXVldWUgZW50cnkgY2FjaGVkCgpyb290ICgyKToKICB4ZW46IGNyZWRpdDI6IHJiLXRyZWUg
Zm9yIHJ1bnF1ZXVlcwogIHhlbjogY3JlZGl0MjogY2FjaGVkIGF0dHJpYnV0ZSBmb3IgbmV4dCBy
dW5xdWV1ZSBlbnRyeQoKIHhlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jIHwgOTUgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYx
IGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTMuNwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
