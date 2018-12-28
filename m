From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 0/4] x86/shim: minor fixes to the pv-shim
 mode
Date: Fri, 28 Dec 2018 16:57:36 +0100
Message-ID: <20181228155736.5t3empxexncbvafw@mac>
References: <20181228120404.50346-1-roger.pau@citrix.com>
 <b2e6d0c4-6396-cac7-91f8-8c8fb0cac769@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SD/o=PF=citrix.com=prvs=893533f24=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gcuW9-0007XL-1A
 for xen-devel@lists.xenproject.org; Fri, 28 Dec 2018 15:57:45 +0000
Content-Disposition: inline
In-Reply-To: <b2e6d0c4-6396-cac7-91f8-8c8fb0cac769@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMjgsIDIwMTggYXQgMDI6NTg6NDlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyOC8xMi8yMDE4IDEyOjA0LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBI
ZWxsbywKPiA+Cj4gPiBUaGlzIHNlcmllcyBpbmNsdWRlcyBzb21lIG1pc2NlbGxhbmVvdXMgZml4
ZXMgZm9yIHRoZSBwdi1zaGltIG1vZGUsCj4gPiBzcGVjaWFsbHkgcmVnYXJkaW5nIHRoZSBoYW5k
bGluZyBvZiB0aGUgbWVtb3J5IG1hcC4KPiAKPiBVbmZvcnR1bmF0ZWx5LCBzb21ldGhpbmcgb3Zl
cmFsbCBpcyBub3cgd29ua3kuwqAgV2l0aCB0aGlzIHNlcmllcwo+IGFwcGxpZWQsIEknbSBnZXR0
aW5nOgo+IAo+IChkOSkgKFhFTikgSW5pdGlhbCBQVkgtZTgyMCBSQU0gbWFwOgo+IChkOSkgKFhF
TinCoCAwMDAwMDAwMDAwMDAwMDAwIC0gMDAwMDAwMDBmYzAwMDAwMCAodXNhYmxlKQo+IChkOSkg
KFhFTinCoCAwMDAwMDAwMGZjMDAwMDAwIC0gMDAwMDAwMDBmYzAwOTA0MCAoQUNQSSBkYXRhKQo+
IChkOSkgKFhFTinCoCAwMDAwMDAwMGZlZmY4MDAwIC0gMDAwMDAwMDBmZjAwMDAwMCAocmVzZXJ2
ZWQpCj4gKGQ5KSAoWEVOKcKgIDAwMDAwMDAxMDAwMDAwMDAgLSAwMDAwMDAwMTA0MDAwNDAwICh1
c2FibGUpCj4gKGQ5KSAoWEVOKSBDaGVja2luZyBNVFJSIHJhbmdlcy4uLgo+IChkOSkgKFhFTinC
oCBNVFJSIGNhcDogNTA4IHR5cGU6IDgwNgo+IChkOSkgKFhFTikgUFZILWU4MjAgUkFNIG1hcDoK
PiAoZDkpIChYRU4pwqAgMDAwMDAwMDAwMDAwMDAwMCAtIDAwMDAwMDAwMDAwYTAwMDAgKHVzYWJs
ZSkKPiAoZDkpIChYRU4pwqAgMDAwMDAwMDBmYzAwMDAwMCAtIDAwMDAwMDAwZmMwMDkwNDAgKEFD
UEkgZGF0YSkKPiAoZDkpIChYRU4pwqAgMDAwMDAwMDBmZWZmODAwMCAtIDAwMDAwMDAwZmYwMDAw
MDAgKHJlc2VydmVkKQo+IChkOSkgKFhFTinCoCAwMDAwMDAwMTAwMDAwMDAwIC0gMDAwMDAwMDEw
NDAwMDQwMCAodXNhYmxlKQo+IAo+IHdoaWNoIGEpIGlzIHRyeWluZyB0byBhY2NvdW50IGZvciB0
aGUgbGVnYWN5IHJhbmdlIGRlc3BpdGUgc3RhcnRpbmcgYXMgYQo+IFBWSCBndWVzdC7CoCAoSSB0
aGluayB0aGF0IHBlcmhhcHMgY3B1X2hhc19oeXBlcnZpc29yIGRvZXNuJ3Qgd29yayB0aGF0Cj4g
ZWFybHksIGFuZCBJJ2xsIHRyeSBtYWtpbmcgYSBmaXggZm9yIGl0LikKCkkndmUgbGlrZWx5IHRl
c3RlZCBhbiBzdGFsbCB2ZXJzaW9uIG9mIHRoZSBzaGltIGJpbmFyeSwgc29ycnkuCgo+IGIpIFRo
ZSBlbnRpcmUgcmVtYWluZGVyIG9mIHRoZSBSQU0gYmxvY2sgd2hpY2ggY292ZXJlZCB0aGUgbGVn
YWN5IGhvbGUKPiBnb3QgZGVsZXRlZCwgc28gWGVuIGZhaWxlZCB0byByZWxvY2F0ZSBpdHNlbGYg
YW5kIHBhbmljKCknZAoKSG0sIHNvIHRoZSBMaW51eCBmdW5jdGlvbiBkb2Vzbid0IHNlZW0gdG8g
d29yayBhcyBleHBlY3RlZC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
