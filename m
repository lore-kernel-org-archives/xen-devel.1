From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] Revert "xen/balloon: Mark unallocated host
 memory as UNUSABLE"
Date: Thu, 29 Nov 2018 17:55:52 +0100
Message-ID: <5cbe05c5-352f-32f5-a53e-aef59d8b2f59__43483.9863483377$1543510475$gmane$org@suse.com>
References: <1543352301-29952-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jnsg=OI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gSPbY-0004qb-24
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 16:55:56 +0000
In-Reply-To: <1543352301-29952-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>, boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMTEvMjAxOCAyMTo1OCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gVGhpcyByZXZlcnRz
IGNvbW1pdCBiM2NmODUyOGJiMjFmZWJiNjUwYTdlY2JmMDgwZDA2NDdiZTQwYjlmLgo+IAo+IFRo
YXQgY29tbWl0IHVuaW50ZW50aW9uYWxseSBicm9rZSBYZW4gYmFsbG9vbiBtZW1vcnkgaG90cGx1
ZyB3aXRoCj4gImhvdHBsdWdfdW5wb3B1bGF0ZWQiIHNldCB0byAxLiBBcyBsb25nIGFzICJTeXN0
ZW0gUkFNIiByZXNvdXJjZQo+IGdvdCBhc3NpZ25lZCB1bmRlciBhIG5ldyAiVW51c2FibGUgbWVt
b3J5IiByZXNvdXJjZSBpbiBJTy9NZW0gdHJlZQo+IGFueSBhdHRlbXB0IHRvIG9ubGluZSB0aGlz
IG1lbW9yeSB3b3VsZCBmYWlsIGR1ZSB0byBnZW5lcmFsIGtlcm5lbAo+IHJlc3RyaWN0aW9ucyBv
biBoYXZpbmcgIlN5c3RlbSBSQU0iIHJlc291cmNlcyBhcyAxc3QgbGV2ZWwgb25seS4KPiAKPiBU
aGUgb3JpZ2luYWwgaXNzdWUgdGhhdCBjb21taXQgaGFzIHRyaWVkIHRvIHdvcmthcm91bmQgZmE1
NjRhZDk2MzY2Cj4gKCJ4ODYvUENJOiBFbmFibGUgYSA2NGJpdCBCQVIgb24gQU1EIEZhbWlseSAx
NWggKE1vZGVscyAwMC0xZiwgMzAtM2YsCj4gNjAtN2YpIikgYWxzbyBnb3QgYW1lbmRlZCBieSB0
aGUgZm9sbG93aW5nIDAzYTU1MTczNCAoIng4Ni9QQ0k6IE1vdmUKPiBhbmQgc2hyaW5rIEFNRCA2
NC1iaXQgd2luZG93IHRvIGF2b2lkIGNvbmZsaWN0Iikgd2hpY2ggbWFkZSB0aGUKPiBvcmlnaW5h
bCBmaXggdG8gWGVuIGJhbGxvb25pbmcgdW5uZWNlc3NhcnkuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpQdXNoZWQgdG8geGVu
L3RpcC5naXQgZm9yLWxpbnVzLTQuMjBhCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
