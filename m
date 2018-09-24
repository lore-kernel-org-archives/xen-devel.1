From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 2/6] test/depriv: Add a tool to check
 process-level depriv
Date: Mon, 24 Sep 2018 15:45:08 +0100
Message-ID: <7968eca4-67c1-58f5-5ea8-7480f9d6312b@citrix.com>
References: <20180921170428.13771-1-george.dunlap@citrix.com>
 <20180921170428.13771-2-george.dunlap@citrix.com>
 <23464.49955.726494.382397@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t0lp=mg=citrix.com=prvs=798996f71=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g4S72-0001Li-Ij
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 14:45:24 +0000
In-Reply-To: <23464.49955.726494.382397@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMjQvMjAxOCAxMTo1NyBBTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gR2VvcmdlIER1bmxh
cCB3cml0ZXMgKCJbUEFUQ0ggdjIgMi82XSB0ZXN0L2RlcHJpdjogQWRkIGEgdG9vbCB0byBjaGVj
ayBwcm9jZXNzLWxldmVsIGRlcHJpdiIpOgo+PiBBZGQgYSB0b29sIHRvIGNoZWNrIHdoZXRoZXIg
dGhlIHZhcmlvdXMgcHJvY2Vzcy1sZXZlbCBkZXByaXZpbGVnaW5nCj4+IG9wZXJhdGlvbnMgaGF2
ZSBhY3R1YWxseSB0YWtlbiBwbGFjZSBvbiB0aGUgcHJvY2Vzcy4KPiAuLi4KPj4gKyMgRXhhbXBs
ZSBpbnB1dDoKPj4gKyMgVWlkOgkxMTkzCTExOTMJMTE5MwkxMTkzCj4+ICtpbnB1dD0kKGdyZXAg
VWlkIC9wcm9jLyRkbXBpZC9zdGF0dXMpCj4gCj4gQXJlIHlvdSBzdXJlIHRoaXMgZ3JlcCBkb2Vz
IG5vdCBuZWVkIHRvIGJlIG1vcmUgc3BlY2lmaWMgPyAgV2hhdCBpZiBhCj4gbmV3IHRoaW5nIGdl
dHMgYWRkZWQsIEkgZG9uJ3Qga25vdywKPiAgIFNwb25nbGVmbGVlcC1VaWQtQmxhcmtpbmc6IHll
cyA0MgoKWWVzLCBpdCBwcm9iYWJseSBzaG91bGQgYmUgbW9yZSBzcGVjaWZpYy4KCj4+ICtpZiBb
WyAiJGlucHV0IiA9fiBeVWlkOltbOnNwYWNlOl1dKihbMC05XSspW1s6c3BhY2U6XV0qKFswLTld
KylbWzpzcGFjZTpdXSooWzAtOV0rKVtbOnNwYWNlOl1dKihbMC05XSspJCBdXSA7IHRoZW4KPiAK
PiBJIHRoaW5rIEkgbWFkZSBtb3N0IG9mIG15IGNvbW1lbnRzIGFib3V0IHRoaXMgc2NyaXB0IGlu
IG15IG90aGVyCj4gcmV2aWV3IGNvbW1lbnRzLgo+IAo+IEJ1dCwgc3BlY2lmaWNhbGx5LCBoZXJl
OiBpZiB5b3UgYXJlIGNvbmZpZGVudCBhYm91dCB0aGUgZm9ybWF0IG9mIHRoZQo+IGxpbmUgaW4g
L3Byb2MvKi9zdGF0dXMsIHlvdSBjb3VsZCBkbwo+ICAgIGZpZWxkcz0oJGlucHV0KQo+ICAgIGZv
ciB1aWQgaW4gJHtmaWVsZHNbKl06MX07IGRvCj4gICAgICAgY29tcGFyZSB1aWQgd2l0aCBleHBl
Y3RlZAoKSSBoYWQgc29tZXRoaW5nIGxpa2UgdGhhdCBvcmlnaW5hbGx5LCBidXQgd2Fzbid0IGNv
bmZpZGVudCBhYm91dCBpdDsKd2hlbiBJIGVuZGVkIHVwIGhhdmluZyB0byB3cml0ZSB0aGUgcmVn
ZXhwIGZvciAvcHJvYy8qL2xpbWl0cywgSSB3cm90ZQpvbmUgZm9yIGhlcmUgdG9vIHRvIGJlIGEg
Yml0IG1vcmUgc2FmZS4KCkxpbnVzIGNvbnNpZGVycyBhbG1vc3QgYW55IHVzZXItc3BhY2UgcmVs
aWFuY2Ugb24ga2VybmVsIGJlaGF2aW9yIGFzCmJpbmRpbmcsIHNvIEkgc3VzcGVjdCAoJGlucHV0
KSBpcyBwcm9iYWJseSBzYWZlIGVub3VnaCBpZiB3ZSB3YW50IHRvCnJlbW92ZSBhdCBsZWFzdCBv
bmUgbmFzdHkgQmFzaCByZWdleHAuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
