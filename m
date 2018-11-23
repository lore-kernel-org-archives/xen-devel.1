From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH] mm: make opt_bootscrub non-init
Date: Fri, 23 Nov 2018 15:41:36 +0000
Message-ID: <44e795a5-a603-4024-5653-023182afa658@citrix.com>
References: <20181123143002.79743-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mcL9=OC=citrix.com=prvs=858cd1240=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1gQDaS-0008F2-FP
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 15:41:44 +0000
In-Reply-To: <20181123143002.79743-1-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMTEvMjAxOCAxNDozMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IExMVk0gY29kZSBn
ZW5lcmF0aW9uIGNhbiBhdHRlbXB0IHRvIGxvYWQgZnJvbSBhIHZhcmlhYmxlIGluIHRoZSBuZXh0
Cj4gY29uZGl0aW9uIG9mIGFuIGV4cHJlc3Npb24gdW5kZXIgY2VydGFpbiBjaXJjdW1zdGFuY2Vz
LCB0aHVzIHR1cm5pbmcKPiB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbjoKPiAKPiBpZiAoIHN5c3Rl
bV9zdGF0ZSA8IFNZU19TVEFURV9hY3RpdmUgJiYgb3B0X2Jvb3RzY3J1YiA9PSBCT09UU0NSVUJf
SURMRSApCj4gCj4gSW50bzoKPiAKPiAweGZmZmY4MmQwODAyMjM5NjcgPCsxMDM+OiBjbXBsICAg
JDB4MywweDM3YjAzMiglcmlwKSAjIDB4ZmZmZjgyZDA4MDU5ZTlhMCA8c3lzdGVtX3N0YXRlPgo+
IDB4ZmZmZjgyZDA4MDIyMzk2ZSA8KzExMD46IHNldGIgICAtMHgyOSglcmJwKQo+IDB4ZmZmZjgy
ZDA4MDIyMzk3MiA8KzExND46IGNtcGwgICAkMHgyLDB4MjI4YThiKCVyaXApICMgMHhmZmZmODJk
MDgwNDRjNDA0IDxvcHRfYm9vdHNjcnViPgo+IAo+IFN1Y2ggY29kZSB3aWxsIHRyaWdnZXIgYSBw
YWdlIGZhdWx0IGlmIHN5c3RlbV9zdGF0ZSA+PQo+IFNZU19TVEFURV9hY3RpdmUgYmVjYXVzZSBv
cHRfYm9vdHNjcnViIHdpbGwgYmUgdW5tYXBwZWQuCj4gCj4gRml4IHRoaXMgYnkgbWFraW5nIG9w
dF9ib290c2NydWIgbm9uLWluaXQsIHRodXMgcHJldmVudGluZyB0aGUgcGFnZQo+IGZhdWx0LiBU
aGUgTExWTSBidWcgd2l0aCB0aGUgZGlzY3Vzc2lvbiBhYm91dCB0aGlzIGlzc3VlIGNhbiBiZSBm
b3VuZAo+IGF0Ogo+IAo+IGh0dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9Mzk3
MDcKPiAKPiBJIGhhdmVuJ3QgYmVlbiBhYmxlIHRvIGZpbmQgYW55IG90aGVyIGluc3RhbmNlcyBv
ZiBzdWNoIGNvbmRpdGlvbmFsCj4gZXhwcmVzc2lvbiB0aGF0IHVzZXMgc3lzdGVtX3N0YXRlIHRv
Z2V0aGVyIHdpdGggYW4gaW5pdCB2YXJpYWJsZSBvcgo+IGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQt
Ynk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KCkkgYWdyZWUgdGhh
dCBub3QgdXNpbmcgX19pbml0ZGF0YSB2YXJpYWJsZXMgaW4gbm9uLWluaXQgZnVuY3Rpb25zIGlz
CnRoZSBtb3N0IHNhbmUgYXBwcm9hY2guCgotLQpUaGFua3MsClNlcmdleQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
