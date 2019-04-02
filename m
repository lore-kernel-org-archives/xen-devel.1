From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: return full destination ID for
 IO-APIC reads
Date: Tue, 2 Apr 2019 14:01:38 +0100
Message-ID: <afafd12c-b396-ac39-12a7-a40fefe479ac@citrix.com>
References: <5CA35C010200007800223E4C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QSF0=SE=citrix.com=prvs=9886cf734=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBJ3x-0007oz-TI
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 13:02:49 +0000
In-Reply-To: <5CA35C010200007800223E4C@prv1-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDQvMjAxOSAxMzo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW4geDJBUElDIG1vZGUg
aXQgaXMgMzIgYml0cyB3aWRlLiBOb3QgaGF2aW5nIHJldHVybmVkIHRoZSBmdWxsIHZhbHVlCj4g
d2FzIG1vc3RseSBiZW5pZ246IFdlIG5ldmVyIG1vZGlmeSB0aGUgSUQgYmFzZWQgb24gaXRzIG9y
aWdpbmFsIHZhbHVlOwo+IGZ1bGwgbmV3IHZhbHVlcyBnZXQgd3JpdHRlbiBhdCBhbGwgdGltZXMu
IEl0IHdhcyAianVzdCIgZGVidWcgbG9nZ2luZwo+IHdoaWNoIGVuZGVkIHVwIHdyb25nIHRoaXMg
d2F5IChhbmQgd2hpY2ggd2lsbCBuZWVkIGFkanVzdG1lbnQgaXRzZWxmIGFzCj4gd2VsbCwgdG8g
YWxzbyBjb25zdW1lIHRoZSBmdWxsIHZhbHVlKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
