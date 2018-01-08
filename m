From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 40/74] xen/x86: report domain id on
 cpuid
Date: Mon, 08 Jan 2018 04:27:55 -0700
Message-ID: <5A5363CB020000780019C1D2@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-41-wei.liu2@citrix.com>
 <5A53558B020000780019C0B9@prv-mh.provo.novell.com>
 <fae0af45-67bf-e0ac-4f01-fbe6a81e2843@citrix.com>
 <5A535FDB020000780019C16E@prv-mh.provo.novell.com>
 <1679a857-d6fa-76c3-b8c1-fef122a151c0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dk2s=ed=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYVb3-0006MG-P8
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 11:28:05 +0000
In-Reply-To: <1679a857-d6fa-76c3-b8c1-fef122a151c0@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAxLjE4IGF0IDEyOjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDgvMDEvMTggMTE6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwOC4w
MS4xOCBhdCAxMTozNCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MDgvMDEvMTggMTA6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDA0LjAxLjE4IGF0
IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4+IEZyb206IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Pj4+Cj4+Pj4+IFVzZSB0aGUgZWJ4IHJl
Z2lzdGVyIG9mIHRoZSBoeXBlcnZpc29yIGxlYWYgMS4gVGhlIGVheCByZWdpc3RlciBvbgo+Pj4+
PiB0aGlzIGxlYWYgaXMgYWxyZWFkeSB1c2VkIHRvIHJlcG9ydCB0aGUgWGVuIG1ham9yIGFuZCBt
aW5vciB2ZXJzaW9ucy4KPj4+PiBUaGUgcmF0aW9uYWxlIGZvciBkb2luZyB0aGlzIGlzIG1pc3Np
bmcuIElpcmMgaW4gcGFzdCBkaXNjdXNzaW9ucyB0aGUKPj4+PiBvcGluaW9uIHdhcyB2b2ljZWQg
KG1vcmUgdGhhbiBvbmNlLCBhbmQgaWlyYyBieSBBbmRyZXcgYW55IG1heWJlCj4+Pj4gb3RoZXJz
KSB0aGF0IGEgZG9tYWluIGluIGdlbmVyYWwgc2hvdWxkbid0IGJlIHRvbGQgYWJvdXQgaXRzIGRv
bWFpbgo+Pj4+IElELiBPdGhlcndpc2UgSSBhbHNvIGNhbid0IHNlZSB3aHkgd2UgZG9uJ3QgaGF2
ZSBhIGh5cGVyY2FsbCBmb3IKPj4+PiB0aGlzLCBhbmQgZS5nLiBYVEYgbmVlZHMgdG8gZ28gdGhy
b3VnaCBob29wcyB0byBmaWd1cmUgaXQgb3V0LiBBcmUKPj4+PiB0aG9zZSBhcmd1bWVudHMgKHdo
aWNoIEkgZG9uJ3QgcmVjYWxsKSBub3QgYXBwbGljYWJsZSBhbnltb3JlPwo+Pj4+Cj4+Pj4gSW4g
dGhlIEFtYXpvbiBzaGltIHBhdGNoZXMgdGhyZWFkIGhhbmRpbmcgb3V0IHRoZSBkb21haW4gSUQg
YnkKPj4+PiBjb21tYW5kIGxpbmUgb3B0aW9uIHdhcyBzdWdnZXN0ZWQgYXMgYW4gYWx0ZXJuYXRp
dmUsIHdoaWNoIHRoZW4KPj4+PiB3b3VsZG4ndCBhZmZlY3Qgb3RoZXIgKG5vbi1zaGltKSBkb21h
aW5zLCBvciB0aGUgY2xpZW50IG9mIHRoZSBzaGltLgo+Pj4gQSBndWVzdHMgZG9taWQgaXMgdW5j
b25kaXRpb25hbGx5IGFsd2F5cyBhdmFpbGFibGUgaW4geGVuc3RvcmUsIGFuZCBpcyBhCj4+PiBu
ZWNlc3NhcnkgcGFydCBvZiBhbnkgUFYgY29tbXVuaWNhdGlvbi4KPj4+Cj4+PiBMaWtlIGl0IG9y
IG5vdCwgZG9taWQgaXMgcGFydCBvZiB0aGUgZ3Vlc3RzIHZpZXcgb2YgdGhlIFhlbiBBQkkuIAo+
Pj4gVGhlcmVmb3JlLCBtYWtpbmcgaXQgZWFzaWx5IGFjY2Vzc2libGUgaXMgdGhlIGJlc3QgY291
cnNlIG9mIGFjdGlvbgo+Pj4gKGVzcGVjaWFsbHkgYXMgcHYtc2hpbSBkZWxpYmVyYXRlbHkgZG9l
c24ndCBpbnRlcnBvc2Ugb24gdGhlIHhlbnN0b3JlIHJpbmcpLgo+PiBBbGwgdW5kZXJzdG9vZCwg
eWV0IHlvdSBkb24ndCBhZGRyZXNzIHRoZSBxdWVzdGlvbiBvbiB0aGUKPj4gYmFja2dyb3VuZHMg
b2YgdGhlIGNoYW5nZSBvZiB5b3VyIG9waW5pb24gaGVyZS4gT3IgYW0gSQo+PiBtaXNyZW1lbWJl
cmluZyB0aGF0IGVhcmxpZXIgb24geW91IHdlcmUgYWdhaW5zdCBleHBvc2luZwo+PiB0aGUgZG9t
YWluIElEPwo+IAo+IEluIHRoZSBwYXN0LCBJIHdhcyBjb25jZXJuZWQgYWJvdXQgaG93IGEgZ3Vl
c3QgY2FuIGJydXRlIGZvcmNlIGl0cyBvd24KPiBkb21pZCB2aWEgbGVha3kgZXJyb3IgY29uZGl0
aW9ucyBpbiBzb21lIGh5cGVyY2FsbHMuICBJIHN0aWxsIHRoaW5rCj4gdGhlc2Ugc2hvdWxkIGJl
IGZpeGVkLgoKSSBhZ3JlZSBvbiB0aGF0IGxhdHRlciBwYXJ0LgoKSmFuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
