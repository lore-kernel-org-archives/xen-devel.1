From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: work around SandyBridge errata
Date: Tue, 18 Dec 2018 13:44:39 +0000
Message-ID: <f072bbc9-8cbc-b605-30fa-149e7b5a05e2@citrix.com>
References: <5C0F7A3A0200007800204F66@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=snIL=O3=citrix.com=prvs=883e14dc5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gZFfv-0007K5-Ie
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 13:44:43 +0000
In-Reply-To: <5C0F7A3A0200007800204F66@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTIvMjAxOCAwODo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlcmUgYXJlIGEgbnVt
YmVyIG9mIGV4Y2VwdGlvbiBjb25kaXRpb24gcmVsYXRlZCBlcnJhdGEgb24gU2FuZHlCcmlkZ2UK
PiBDUFVzLCBzb21lIG9mIHdoaWNoIGFyZSB1bmV4cGVjdGVkICNVRCAob3RoZXJzLCBvZiBubyBp
bnRlcmVzdCBoZXJlLCBhcmUKPiBsYWNrIG9mIG1hbmRhdGVkIGV4Y2VwdGlvbnMsIG9yIGV4Y2Vw
dGlvbnMgb2YgdW5leHBlY3RlZCB0eXBlKS4gQW5ub3RhdGUKPiB0aGUgb25lIHdvcmthcm91bmQg
d2UgYWxyZWFkeSBoYXZlLCBhbmQgYWRkIHR3byBtb3JlLgo+Cj4gRHVlIHRvIHRoZSBleGNlcHRp
b24gcmVjb3Zlcnkgd2UgaGF2ZSBpbiBwbGFjZSBmb3Igc3R1YiBpbnZvY2F0aW9ucwo+IHRoZXNl
IGFyZW4ndCBzZWN1cml0eSBpc3N1ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
