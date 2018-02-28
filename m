From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 0/2][XTF] FPU test improvements
Date: Wed, 28 Feb 2018 16:49:27 +0000
Message-ID: <dfab1e6d-79cb-cb34-2a87-4cef07553e4f@citrix.com>
References: <5A96B98502000078001ACC73@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gfx2=fw=citrix.com=prvs=590b5ce2e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1er5W4-00057N-VK
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 17:27:44 +0000
In-Reply-To: <5A96B98502000078001ACC73@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMTggMTM6MTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IDE6IGFkZCBGUFUvU0lNRCBy
ZWdpc3RlciBzdGF0ZSB0ZXN0Cj4gMjogZXh0ZW5kIEZQVSBleGNlcHRpb24gdGVzdHMKPgo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiB2NDog
SnVzdCByZS1iYXNpbmcsIG5vIG90aGVyIGZlZWRiYWNrIHdhcyByZWNlaXZlZC4KCkluIHByaW5j
aXBsZSwgdGhpcyBpcyBhbGwgZmluZSwgYnV0IEkgY2Fubm90IGNvbW1pdCBpdCB1bnRpbCB0aGUg
dGVzdApyZXZpc2lvbiBsb2dpYyBpcyBzb3J0ZWQuwqAgT3RoZXJ3aXNlLCBpdCB3aWxsIHdpbGwg
YnJlYWsgT1NTVGVzdHMKYmlzZWN0aW9uIGxvZ2ljIGFuZCBlaXRoZXIgY2F1c2UgWFRGIHVwZGF0
ZXMgdG8gYmUgcmVqZWN0ZWQsIG9yCnN0YWdpbmctJFguJFkgdXBkYXRlcyB0byBiZSByZWplY3Rl
ZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
