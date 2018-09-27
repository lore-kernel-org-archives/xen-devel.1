From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [RFC PATCH 1/2] mem_access: Fix npfec.kind
 propagation
Date: Thu, 27 Sep 2018 09:46:44 +0100
Message-ID: <b722690c-a975-86b0-09e2-540a309a23c2@citrix.com>
References: <20180926164741.13405-1-george.dunlap@citrix.com>
 <02c6bddf-933c-5348-73eb-25d6d826d30b@citrix.com>
 <5BAC810302000078001EC6E9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fyp+=mj=citrix.com=prvs=8016ebfd3=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g5Rx9-0008TX-0r
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 08:47:19 +0000
In-Reply-To: <5BAC810302000078001EC6E9@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas.lengyel@zentific.com>, aisaila@bitdefender.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMjcvMjAxOCAwODowNCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjYuMDku
MTggYXQgMTk6MDAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjYv
MDkvMTggMTc6NDcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYv
bW0vbWVtX2FjY2Vzcy5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCj4+
PiBAQCAtMjMyLDEyICsyMzIsMTIgQEAgYm9vbCBwMm1fbWVtX2FjY2Vzc19jaGVjayhwYWRkcl90
IGdwYSwgdW5zaWduZWQgbG9uZyBnbGEsCj4+PiAgICAgICAgICB7Cj4+PiAgICAgICAgICAgICAg
cmVxLT51Lm1lbV9hY2Nlc3MuZmxhZ3MgfD0gTUVNX0FDQ0VTU19HTEFfVkFMSUQ7Cj4+PiAgICAg
ICAgICAgICAgcmVxLT51Lm1lbV9hY2Nlc3MuZ2xhID0gZ2xhOwo+Pj4gLQo+Pj4gLSAgICAgICAg
ICAgIGlmICggbnBmZWMua2luZCA9PSBucGZlY19raW5kX3dpdGhfZ2xhICkKPj4+IC0gICAgICAg
ICAgICAgICAgcmVxLT51Lm1lbV9hY2Nlc3MuZmxhZ3MgfD0gTUVNX0FDQ0VTU19GQVVMVF9XSVRI
X0dMQTsKPj4+IC0gICAgICAgICAgICBlbHNlIGlmICggbnBmZWMua2luZCA9PSBucGZlY19raW5k
X2luX2dwdCApCj4+PiAtICAgICAgICAgICAgICAgIHJlcS0+dS5tZW1fYWNjZXNzLmZsYWdzIHw9
IE1FTV9BQ0NFU1NfRkFVTFRfSU5fR1BUOwo+Pj4gICAgICAgICAgfQo+Pj4gKwo+Pj4gKyAgICAg
ICAgaWYgKCBucGZlYy5raW5kID09IG5wZmVjX2tpbmRfd2l0aF9nbGEgKQo+Pj4gKyAgICAgICAg
ICAgIHJlcS0+dS5tZW1fYWNjZXNzLmZsYWdzIHw9IE1FTV9BQ0NFU1NfRkFVTFRfV0lUSF9HTEE7
Cj4+PiArICAgICAgICBlbHNlIGlmICggbnBmZWMua2luZCA9PSBucGZlY19raW5kX2luX2dwdCAp
Cj4+PiArICAgICAgICAgICAgcmVxLT51Lm1lbV9hY2Nlc3MuZmxhZ3MgfD0gTUVNX0FDQ0VTU19G
QVVMVF9JTl9HUFQ7Cj4+Cj4+IE5pdC4gIE5ld2xpbmUgaGVyZSBwbGVhc2UsIGFzIGl0IGlzIG5v
dCBsb2dpY2FsbHkgcmVsYXRlZCB3aXRoIHRoZSBibG9jawo+PiBiZWxvdy4KPiAKPiBBbmQsIGRl
c3BpdGUgaXQgYmVpbmcganVzdCB0d28gY29tcGFyaXNvbnMsIHBlcmhhcHMgYmV0dGVyIHRvCj4g
bWFrZSBpdCBhIHN3aXRjaCgpIGF0IHRoZSBzYW1lIHRpbWU/CgpTdXJlIC0tIHRoaXMgaXMgbG9n
aWNhbGx5IHNlcGFyYXRlIGZyb20gdGhlIGZvbGxvdy11cCBwYXRjaCwgc28gSSdsbApyZS1zZW5k
IGl0IGFzIGEgc2luZ2xldG9uIHdpdGggdGhlIGNvbW1lbnRzLgoKIC1HZW9yZ2UKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
