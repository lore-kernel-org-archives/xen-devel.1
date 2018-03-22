From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.11 1/2] libxc/x86: fix mapping of the
 start_info area
Date: Thu, 22 Mar 2018 09:10:03 +0000
Message-ID: <20180322091003.44yo2xopar2ktzoa@MacBook-Pro-de-Roger.local>
References: <20180321144211.57274-1-roger.pau@citrix.com>
 <20180321144211.57274-2-roger.pau@citrix.com>
 <20180321180957.v6unr7yhw564i2b4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fjst=gm=citrix.com=prvs=61285f498=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eywEg-00079f-Tf
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 09:10:14 +0000
Content-Disposition: inline
In-Reply-To: <20180321180957.v6unr7yhw564i2b4@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMjEsIDIwMTggYXQgMDY6MDk6NTdQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIE1hciAyMSwgMjAxOCBhdCAwMjo0MjoxMFBNICswMDAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gPiBUaGUgc3RhcnRfaW5mbyBzaXplIGNhbGN1bGF0ZWQgaW4gYm9vdGxhdGVf
aHZtIGlzIHdyb25nLiBJdCBzaG91bGQgdXNlCj4gPiBIVk1MT0FERVJfTU9EVUxFX01BWF9DT1VO
VCBpbnN0ZWFkIG9mIGRvbS0+bnVtX21vZHVsZXMgYW5kIGl0IGRvZXNuJ3QKPiA+IHRha2UgaW50
byBhY2NvdW50IHRoZSBzaXplIG9mIHRoZSBtb2R1bGVzIGNvbW1hbmQgbGluZS4KPiA+IAo+ID4g
VGhpcyBpcyBub3QgYSBwcm9ibGVtIHNvIGZhciBiZWNhdXNlIHRoZSBhY3R1YWxseSB1c2VkIGFt
b3VudCBvZgo+ID4gbWVtb3J5IGRvZXNuJ3QgY3Jvc3MgYSBwYWdlIGJvdW5kYXJ5LCBhbmQgc28g
bm8gcGFnZS1mYXVsdCBpcwo+ID4gdHJpZ2dlcmVkLgo+IAo+IEkgZ2V0IHRoZSBjbWRsaW5lIGJp
dC4KPiAKPiBXaGF0IGRvZXMgaXQgbmVlZCB0byBiZSBIVk1MT0FERVJfTU9EVUxFX01BWF9DT1VO
VD8gSXNuJ3QgYmV0dGVyIHRvIGp1c3QKPiBtYXAgd2hhdCB3ZSBuZWVkIGhlcmU/CgpCZWNhdXNl
IHRoZSBwb3NpdGlvbiBvZiB0aGUgbW9kdWxlcyBjb21tYW5kIGxpbmUgaXM6Cgptb2RsaXN0X3Bh
ZGRyICsgc2l6ZW9mKHN0cnVjdCBodm1fbW9kbGlzdF9lbnRyeSkgKiBIVk1MT0FERVJfTU9EVUxF
X01BWF9DT1VOVDsKCihUaGlzIGlzIGZyb20gYWRkX21vZHVsZV90b19saXN0KS4KClNvIGlmIGRv
bS0+bnVtX21vZHVsZXMgPCBIVk1MT0FERVJfTU9EVUxFX01BWF9DT1VOVCB0aGUgbWFwcGVkIHJl
Z2lvbgppcyBzbWFsbGVyIHRoYXQgd2hhdCB3ZSBtaWdodCBlbmQgdXAgdXNpbmcuCgpJJ20gbm90
IHN1cmUgd2h5IEhWTUxPQURFUl9NT0RVTEVfTUFYX0NPVU5UIGlzIHVzZWQgd2hlbiBhbGxvY2F0
aW5nCm1lbW9yeSAoaW4gYWxsb2NfbWFnaWNfcGFnZXNfaHZtKSBpbnN0ZWFkIG9mIHRoZSBhY3R1
YWwgbnVtYmVyIG9mCm1vZHVsZXMgKGRvbS0+bnVtX21vZHVsZXMpLCBidXQgdGhlIHByb3Bvc2Vk
IGNoYW5nZSBzZWVtcyB0byBiZSB0aGUKZWFzaWVyIHdheSB0byBmaXggdGhlIG1hcHBpbmcgaXNz
dWUuCgpJJ3ZlIENDJ2VkIHRoZSBvcmlnaW5hbCBhdXRob3JzIG9mIHRoaXMgY29kZSBpbiBhbm90
aGVyIHRocmVhZCwgYnV0CmdvdCBubyByZXNwb25zZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
