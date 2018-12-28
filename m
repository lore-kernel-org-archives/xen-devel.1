From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 0/4] x86/shim: minor fixes to the pv-shim
 mode
Date: Fri, 28 Dec 2018 14:58:49 +0000
Message-ID: <b2e6d0c4-6396-cac7-91f8-8c8fb0cac769@citrix.com>
References: <20181228120404.50346-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NC5F=PF=citrix.com=prvs=8935d23f2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gctbB-0002Th-FM
 for xen-devel@lists.xenproject.org; Fri, 28 Dec 2018 14:58:53 +0000
In-Reply-To: <20181228120404.50346-1-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMTIvMjAxOCAxMjowNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEhlbGxvLAo+Cj4g
VGhpcyBzZXJpZXMgaW5jbHVkZXMgc29tZSBtaXNjZWxsYW5lb3VzIGZpeGVzIGZvciB0aGUgcHYt
c2hpbSBtb2RlLAo+IHNwZWNpYWxseSByZWdhcmRpbmcgdGhlIGhhbmRsaW5nIG9mIHRoZSBtZW1v
cnkgbWFwLgoKVW5mb3J0dW5hdGVseSwgc29tZXRoaW5nIG92ZXJhbGwgaXMgbm93IHdvbmt5LsKg
IFdpdGggdGhpcyBzZXJpZXMKYXBwbGllZCwgSSdtIGdldHRpbmc6CgooZDkpIChYRU4pIEluaXRp
YWwgUFZILWU4MjAgUkFNIG1hcDoKKGQ5KSAoWEVOKcKgIDAwMDAwMDAwMDAwMDAwMDAgLSAwMDAw
MDAwMGZjMDAwMDAwICh1c2FibGUpCihkOSkgKFhFTinCoCAwMDAwMDAwMGZjMDAwMDAwIC0gMDAw
MDAwMDBmYzAwOTA0MCAoQUNQSSBkYXRhKQooZDkpIChYRU4pwqAgMDAwMDAwMDBmZWZmODAwMCAt
IDAwMDAwMDAwZmYwMDAwMDAgKHJlc2VydmVkKQooZDkpIChYRU4pwqAgMDAwMDAwMDEwMDAwMDAw
MCAtIDAwMDAwMDAxMDQwMDA0MDAgKHVzYWJsZSkKKGQ5KSAoWEVOKSBDaGVja2luZyBNVFJSIHJh
bmdlcy4uLgooZDkpIChYRU4pwqAgTVRSUiBjYXA6IDUwOCB0eXBlOiA4MDYKKGQ5KSAoWEVOKSBQ
VkgtZTgyMCBSQU0gbWFwOgooZDkpIChYRU4pwqAgMDAwMDAwMDAwMDAwMDAwMCAtIDAwMDAwMDAw
MDAwYTAwMDAgKHVzYWJsZSkKKGQ5KSAoWEVOKcKgIDAwMDAwMDAwZmMwMDAwMDAgLSAwMDAwMDAw
MGZjMDA5MDQwIChBQ1BJIGRhdGEpCihkOSkgKFhFTinCoCAwMDAwMDAwMGZlZmY4MDAwIC0gMDAw
MDAwMDBmZjAwMDAwMCAocmVzZXJ2ZWQpCihkOSkgKFhFTinCoCAwMDAwMDAwMTAwMDAwMDAwIC0g
MDAwMDAwMDEwNDAwMDQwMCAodXNhYmxlKQoKd2hpY2ggYSkgaXMgdHJ5aW5nIHRvIGFjY291bnQg
Zm9yIHRoZSBsZWdhY3kgcmFuZ2UgZGVzcGl0ZSBzdGFydGluZyBhcyBhClBWSCBndWVzdC7CoCAo
SSB0aGluayB0aGF0IHBlcmhhcHMgY3B1X2hhc19oeXBlcnZpc29yIGRvZXNuJ3Qgd29yayB0aGF0
CmVhcmx5LCBhbmQgSSdsbCB0cnkgbWFraW5nIGEgZml4IGZvciBpdC4pCgpiKSBUaGUgZW50aXJl
IHJlbWFpbmRlciBvZiB0aGUgUkFNIGJsb2NrIHdoaWNoIGNvdmVyZWQgdGhlIGxlZ2FjeSBob2xl
CmdvdCBkZWxldGVkLCBzbyBYZW4gZmFpbGVkIHRvIHJlbG9jYXRlIGl0c2VsZiBhbmQgcGFuaWMo
KSdkCgpjKSBYZW4gcmVhbGx5IG91Z2h0bid0IHRvIHJlbG9jYXRlIGl0c2VsZiBpbiBjYXNlcyBs
aWtlIHRoaXMsIGJ1dCB0aGF0CmlzIHdheSBvdXQgb2Ygc2NvcGUgaGVyZS4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
