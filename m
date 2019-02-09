From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux 5.0 regression: BUG: unable to handle kernel
 paging request at ffff888023e26778 RIP: e030:move_page_tables+0x7c1/0xae0
Date: Sat, 9 Feb 2019 19:59:58 +0100
Message-ID: <35765bb9-95e4-0f06-3b8f-27d6e0547e7f__49778.7756890588$1549738859$gmane$org@suse.com>
References: <39ae9195-cf8f-01fe-df83-38a9a4c52e48@eikelenboom.it>
 <da8badb7-9743-020e-6891-dac944b61ee9@eikelenboom.it>
 <094e923b-4e64-57d8-42c4-6e8890473035@suse.com>
 <3be0ee8f-79d4-2a2f-59a5-71f3514d9dbd@eikelenboom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z1eq=QQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gsXrA-0000YP-8x
 for xen-devel@lists.xenproject.org; Sat, 09 Feb 2019 19:00:04 +0000
In-Reply-To: <3be0ee8f-79d4-2a2f-59a5-71f3514d9dbd@eikelenboom.it>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>, Linus Torvalds <torvalds@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "Joel Fernandes (Google)" <joel@joelfernandes.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDIvMjAxOSAxOTo1MSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IE9uIDA5LzAy
LzIwMTkgMTk6NDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA5LzAyLzIwMTkgMTk6NDUs
IFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4+IE9uIDA5LzAyLzIwMTkgMDk6MjYsIFNhbmRl
ciBFaWtlbGVuYm9vbSB3cm90ZToKPj4+PiBMLlMuLAo+Pj4+Cj4+Pj4KPj4+PiBXaGlsZSB0ZXN0
aW5nIGEgTGludXggNS4wLXJjNS1pc2gga2VybmVsIChwdWxsIG9mIHllc3RlcmRheSkgd2l0aCBz
b21lIGFkZGl0aW9uYWwgcGF0Y2hlcyBmb3IKPj4+PiBhbHJlYWR5IHJlcG9ydGVkIG90aGVyIGlz
c3VlcyBpIGNhbWUgYWNyb3NzIHRoZSBpc3N1ZSBiZWxvdyB3aGljaCBpIGhhdmVuJ3Qgc2VlbiB3
aXRoIDQuMjAueAo+Pj4+Cj4+Pj4gSSBoYXZlbid0IGdvdCBhIHJlcHJvZHVjZXIgc28gaSBtaWdo
dCBiZSBoYXJkIHRvIGhpdCBpdCBhZ2FpbiwgCj4+Pj4gc3lzdGVtIGlzIEFNRCBhbmQgdGhpcyBp
cyBmcm9tIHRoZSBob3N0IGtlcm5lbCBydW5uaW5nIHVuZGVyCj4+Pj4gdGhlIFhlbiBoeXBlcnZp
c29yIG1pZ2h0IGl0IG1hdHRlci4KPj4+Cj4+Pj4gLS0KPj4+Pgo+Pj4+IFNhbmRlcgo+Pj4KPj4+
IEhpIEJvcmlzIC8gSnVlcmdlbiwKPj4+Cj4+PiBUaGUgY29tbWl0IGNhdXNpbmcgdGhpcyBpczoK
Pj4+IDJjOTFiZDRhNGUyZTUzMDU4MmQ2ZmQ2NDNlYTdiODZiMjc5MDcxNTEgbW06IHNwZWVkIHVw
IG1yZW1hcCBieSAyMHggb24gbGFyZ2UgcmVnaW9ucwo+Pj4KPj4+IFNpbmNlIGl0IHNlZW1zIHRo
ZXJlIGhhdmVuJ3QgYmVlbiBhbnkgb3RoZXIgcmVwb3J0cyBhYm91dCB0aGlzIC4uIAo+Pj4gY291
bGQgaXQgYmUgdGhpcyBkb2Vzbid0IHNwZWNpZmljYWxseSB3b3JrIHdlbGwgd2l0aCBhIFhlbiBQ
VkggZG9tMCA/Cj4+Cj4+IFBWSD8gTm90IFBWPwo+IAo+IEFoIHNvcnJ5LCBpbmRlZWQgUFYgIQoK
T2theSwgZm91bmQgdGhlIHByb2JsZW0uIHNldF9wbWRfYXQoKSBpcyB1c2VkIGluIGFib3ZlIGNv
bW1pdCBmb3IKd3JpdGluZyBhIFBNRCBlbnRyeSB3aXRoIGEgcGFnZSB0YWJsZSBhZGRyZXNzLiBJ
biBhbGwgb3RoZXIgcGxhY2VzCml0IGlzIHVzZWQgb25seSBmb3IgaHVnZSBwYWdlcywgd2hpY2gg
YXJlIG5vdCBwb3NzaWJsZSBpbiBQViBndWVzdHMuCgpJJ2xsIHNlbmQgYSBwYXRjaCBvbiBNb25k
YXkuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
