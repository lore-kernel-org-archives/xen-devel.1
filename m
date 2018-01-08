From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC v1 40/74] xen/x86: report domain id on
 cpuid
Date: Mon, 8 Jan 2018 10:34:35 +0000
Message-ID: <fae0af45-67bf-e0ac-4f01-fbe6a81e2843@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-41-wei.liu2@citrix.com>
 <5A53558B020000780019C0B9@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ex30=ed=citrix.com=prvs=539ecd727=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eYUlN-0000R4-1S
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 10:34:41 +0000
In-Reply-To: <5A53558B020000780019C0B9@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDEvMTggMTA6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA0LjAxLjE4IGF0
IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Cj4+IFVzZSB0aGUgZWJ4IHJlZ2lzdGVyIG9m
IHRoZSBoeXBlcnZpc29yIGxlYWYgMS4gVGhlIGVheCByZWdpc3RlciBvbgo+PiB0aGlzIGxlYWYg
aXMgYWxyZWFkeSB1c2VkIHRvIHJlcG9ydCB0aGUgWGVuIG1ham9yIGFuZCBtaW5vciB2ZXJzaW9u
cy4KPiBUaGUgcmF0aW9uYWxlIGZvciBkb2luZyB0aGlzIGlzIG1pc3NpbmcuIElpcmMgaW4gcGFz
dCBkaXNjdXNzaW9ucyB0aGUKPiBvcGluaW9uIHdhcyB2b2ljZWQgKG1vcmUgdGhhbiBvbmNlLCBh
bmQgaWlyYyBieSBBbmRyZXcgYW55IG1heWJlCj4gb3RoZXJzKSB0aGF0IGEgZG9tYWluIGluIGdl
bmVyYWwgc2hvdWxkbid0IGJlIHRvbGQgYWJvdXQgaXRzIGRvbWFpbgo+IElELiBPdGhlcndpc2Ug
SSBhbHNvIGNhbid0IHNlZSB3aHkgd2UgZG9uJ3QgaGF2ZSBhIGh5cGVyY2FsbCBmb3IKPiB0aGlz
LCBhbmQgZS5nLiBYVEYgbmVlZHMgdG8gZ28gdGhyb3VnaCBob29wcyB0byBmaWd1cmUgaXQgb3V0
LiBBcmUKPiB0aG9zZSBhcmd1bWVudHMgKHdoaWNoIEkgZG9uJ3QgcmVjYWxsKSBub3QgYXBwbGlj
YWJsZSBhbnltb3JlPwo+Cj4gSW4gdGhlIEFtYXpvbiBzaGltIHBhdGNoZXMgdGhyZWFkIGhhbmRp
bmcgb3V0IHRoZSBkb21haW4gSUQgYnkKPiBjb21tYW5kIGxpbmUgb3B0aW9uIHdhcyBzdWdnZXN0
ZWQgYXMgYW4gYWx0ZXJuYXRpdmUsIHdoaWNoIHRoZW4KPiB3b3VsZG4ndCBhZmZlY3Qgb3RoZXIg
KG5vbi1zaGltKSBkb21haW5zLCBvciB0aGUgY2xpZW50IG9mIHRoZSBzaGltLgoKQSBndWVzdHMg
ZG9taWQgaXMgdW5jb25kaXRpb25hbGx5IGFsd2F5cyBhdmFpbGFibGUgaW4geGVuc3RvcmUsIGFu
ZCBpcyBhCm5lY2Vzc2FyeSBwYXJ0IG9mIGFueSBQViBjb21tdW5pY2F0aW9uLgoKTGlrZSBpdCBv
ciBub3QsIGRvbWlkIGlzIHBhcnQgb2YgdGhlIGd1ZXN0cyB2aWV3IG9mIHRoZSBYZW4gQUJJLsKg
ClRoZXJlZm9yZSwgbWFraW5nIGl0IGVhc2lseSBhY2Nlc3NpYmxlIGlzIHRoZSBiZXN0IGNvdXJz
ZSBvZiBhY3Rpb24KKGVzcGVjaWFsbHkgYXMgcHYtc2hpbSBkZWxpYmVyYXRlbHkgZG9lc24ndCBp
bnRlcnBvc2Ugb24gdGhlIHhlbnN0b3JlIHJpbmcpLgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
