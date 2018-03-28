From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 for-4.11 1/2] libxc/x86: fix mapping of
 the start_info area
Date: Wed, 28 Mar 2018 12:57:04 +0100
Message-ID: <20180328115704.rgmj5s6xmwxlndrj@citrix.com>
References: <20180328115516.11134-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=b9f4=gs=citrix.com=prvs=618f79229=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f19hj-00073m-CP
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 11:57:23 +0000
Content-Disposition: inline
In-Reply-To: <20180328115516.11134-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMjgsIDIwMTggYXQgMTI6NTU6MTVQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoZSBzdGFydF9pbmZvIHNpemUgY2FsY3VsYXRlZCBpbiBib290bGF0ZV9odm0g
aXMgd3JvbmcuIEl0IHNob3VsZCB1c2UKPiBIVk1MT0FERVJfTU9EVUxFX01BWF9DT1VOVCBpbnN0
ZWFkIG9mIGRvbS0+bnVtX21vZHVsZXMgYW5kIGl0IGRvZXNuJ3QKPiB0YWtlIGludG8gYWNjb3Vu
dCB0aGUgc2l6ZSBvZiB0aGUgbW9kdWxlcyBjb21tYW5kIGxpbmUuCj4gCj4gVGhpcyBpcyBub3Qg
YSBwcm9ibGVtIHNvIGZhciBiZWNhdXNlIHRoZSBhY3R1YWxseSB1c2VkIGFtb3VudCBvZgo+IG1l
bW9yeSBkb2Vzbid0IGNyb3NzIGEgcGFnZSBib3VuZGFyeSwgYW5kIHNvIG5vIHBhZ2UtZmF1bHQg
aXMKPiB0cmlnZ2VyZWQuCj4gCj4gSW5zdGVhZCBvZiBmaXhpbmcgdGhlIHNpemUgY2FsY3VsYXRp
b24gZG9uZSBpbiBib290bGF0ZV9odm0ganVzdCBtYXAKPiB0aGUgYW1vdW50IG9mIG1lbW9yeSBh
bGxvY2F0ZWQgaW4gYWxsb2NfbWFnaWNfcGFnZXNfaHZtLgo+IAo+IFN1Z2dlc3RlZC1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
