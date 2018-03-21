From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 2/4] libxl/x86: Build e820 map earlier
 for HVM/PVH guests
Date: Wed, 21 Mar 2018 17:49:46 +0000
Message-ID: <20180321174946.w2rbzchsszrsqgal@citrix.com>
References: <1521564536-31880-1-git-send-email-maran.wilson@oracle.com>
 <1521564652-31992-1-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1521564652-31992-1-git-send-email-maran.wilson@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>
Cc: wei.liu2@citrix.com, boris.ostrovsky@oracle.com, roger.pau@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDk6NTA6NTBBTSAtMDcwMCwgTWFyYW4gV2lsc29uIHdy
b3RlOgo+ICAgICAgY2FzZSBMSUJYTF9ET01BSU5fVFlQRV9QVjoKPiAtICAgICAgICByZXQgPSBs
aWJ4bF9fYnVpbGRfcHYoZ2MsIGRvbWlkLCBpbmZvLCBzdGF0ZSk7Cj4gKyAgICAgICAgcmV0ID0g
bGlieGxfX2J1aWxkX3B2KGdjLCBkb21pZCwgZF9jb25maWcsIGluZm8sIHN0YXRlKTsKPiAgICAg
ICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICBnb3RvIG91dDsKPiAgCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMKPiBpbmRl
eCAyZTI5YjUyLi5lODNhZWI5IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5j
Cj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMKPiBAQCAtNjk4LDYgKzY5OCw3IEBAIHN0
YXRpYyBpbnQgc2V0X3ZudW1hX2luZm8obGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCj4g
IH0KPiAgCj4gIHN0YXRpYyBpbnQgbGlieGxfX2J1aWxkX2RvbShsaWJ4bF9fZ2MgKmdjLCB1aW50
MzJfdCBkb21pZCwKPiArICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmln
LAo+ICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmluZm8sIGxpYnhsX19k
b21haW5fYnVpbGRfc3RhdGUgKnN0YXRlLAoKQUZBSUNUIGJ1aWxkX2luZm8gaXMgYSBtZW1iZXIg
b2YgZG9tYWluX2NvbmZpZy4gWW91IGNhbiBvbmx5IHRha2UgdGhlCmxhdHRlciBpbiB0aGlzIGZ1
bmN0aW9uLiBGdXJ0aGVyIGFkanVzdG1lbnQgaXMgcmVxdWlyZWQgdG8gYWNjb21tb2RhdGUKdGhh
dCBjaGFuZ2UuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
