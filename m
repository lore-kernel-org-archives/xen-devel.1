From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 04/12] microcode: introduce a global
 cache of ucode patch
Date: Wed, 13 Mar 2019 10:30:17 +0000
Message-ID: <3b84e762-96ff-f1c7-7f37-4af9afb48153@citrix.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-5-git-send-email-chao.gao@intel.com>
 <20190312165353.j6fj53ho2y6rcxzr@Air-de-Roger>
 <5C88B3B9020000780021DF27@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tilE=RQ=citrix.com=prvs=968d75336=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h419v-00040l-Bc
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 10:30:51 +0000
In-Reply-To: <5C88B3B9020000780021DF27@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDMvMjAxOSAwNzozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTIuMDMuMTkg
YXQgMTc6NTMsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IElJUkMgd2UgYWdyZWVk
IHRoYXQgc3lzdGVtcyB3aXRoIG1peGVkIENQVSB2ZXJzaW9ucyBhcmUgbm90IHN1cHBvcnRlZCwK
Pj4gaGVuY2UgdGhlIHNhbWUgbWljcm9jb2RlIGJsb2Igc2hvdWxkIGJlIHVzZWQgdG8gdXBkYXRl
IGFsbCB0aGUKPj4gcG9zc2libGUgQ1BVcyBvbiB0aGUgc3lzdGVtLCBzbyBhIGxpc3Qgc2hvdWxk
IG5vdCBiZSBuZWVkZWQgaGVyZS4KPiBUaGF0J3Mgbm90IHdoYXQgSSByZWNhbGwuIFdlIGFncmVl
ZCB0byBub3Qgc3RvcmUgZXZlcnl0aGluZywgYmVjYXVzZQo+IG1peGVkLWZhbWlseSAvIG1peGVk
LW1vZGVsIHN5c3RlbXMgYXJlIGNvbW1vbmx5IG5vdCBzdXBwb3J0ZWQgYnkKPiB0aGUgaHcgdmVu
ZG9ycy4gQnV0IG1peGVkIHN0ZXBwaW5nIHN5c3RlbXMgbWF5IHdlbGwgYmUuCgpUaGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIFNreWxha2UgYW5kIENhc2NhZGVMYWtlIHNlcnZlciBDUFVzIGlzIG9ubHkg
aW4KdGhlIHN0ZXBwaW5nICg0IHZzIDYpLsKgIFNhbWUgZm9yIEthYnkvQ29mZmVlL1doaXNrZXkv
QW1iZXIgbGFrZSAodGhlCm1vYmlsZSBhbmQgZGVza3RvcCBsaW5lcyBoYXZlIGEgbW9kZWwgZWFj
aCwgYW5kIG5ld2VyIGdlbmVyYXRpb25zIGFyZQpqdXN0IG5ldyBzdGVwcGluZ3MpLgoKSSdsbCBo
YXZlIHRvIGRlZmVyIHRvIEludGVsIGFzIHRvIGV4YWN0bHkgd2hhdCBpcyBzdXBwb3J0ZWQsIGJ1
dCB3aGVuIEkKYXNrZWQgdGhpcyBiZWZvcmUsIHRoZSBhbnN3ZXIgd2FzIHRoYXQgbm8gaGV0ZXJv
Z2VuZWl0eSB3YXMgc3VwcG9ydGVkIGF0CmFsbCwgbm90IGV2ZW4gYXQgdGhlIHN0ZXBwaW5nIGxl
dmVsIG9yIHBsYXRmb3JtIElEIGxldmVsLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
