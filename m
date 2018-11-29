From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 8/9] libxl: Kill QEMU by uid when possible
Date: Thu, 29 Nov 2018 17:01:49 +0000
Message-ID: <23552.7037.541564.444537@mariner.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-8-george.dunlap@citrix.com>
 <23550.51384.89698.110737@mariner.uk.xensource.com>
 <E08C72B6-B4AC-4C1B-B8E6-6D0D8D51E3F6@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mb5D=OI=citrix.com=prvs=8641bc5b5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gSPiJ-0005uY-5i
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 17:02:55 +0000
In-Reply-To: <E08C72B6-B4AC-4C1B-B8E6-6D0D8D51E3F6@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIDgvOV0gbGlieGw6IEtpbGwgUUVNVSBi
eSB1aWQgd2hlbiBwb3NzaWJsZSIpOgo+IFJpZ2h0LCBJIGRpZG7igJl0IG5vdGljZSB0aGF0IHJl
YWRfY2hlY2tlZCBmaWx0ZXJlZCBvdXQgRU5PRU5UICh0aHVzIGEgbm9uLXplcm8gdmFsdWUgZm9y
IHJldCBpbmRpY2F0ZXMgYSBkaWZmZXJlbnQgZXJyb3IpLgo+IAo+IE5vdCByZWFsbHkgc3VyZSB3
aGF0IHRoZSBiZXN0IHRoaW5nIHdvdWxkIGJlIHRvIGRvIGluIHRoYXQgY2FzZTsgbWF5YmUgcmV0
dXJuaW5nIGFuIGVycm9yIGltbWVkaWF0ZWx5IGlzIHRoZSBiZXR0ZXIgb3B0aW9uLgoKSSBkb24n
dCBtaW5kIHdoZXRoZXIgd2UgZG8gc29tZSBraW5kIG9mIGJlc3QgZWZmb3J0IHRoaW5nIG9yIGJh
aWwKcmlnaHQgYXdheSwgYnV0IGluIGVpdGhlciBjYXNlIHRoaXMgc2hvdWxkIGJlIHJlZ2FyZGVk
IGFzIGFuIGVycm9yLgoKPiBCdXQgQW50aG9ueSB0ZWxscyBtZSB0aGF04oCZcyBub3QgdGhlIGNh
c2UsIHNvIEnigJltIGxlYW5pbmcgbW9yZSB0b3dhcmRzIHJlb3JnYW5pemluZyB0aGlzIGZ1bmN0
aW9uIHRvIGxvb2sgbGlrZSB0aGUgZm9sbG93aW5nOgo+IAo+IDEuIGxpYnhsX19xbXBfY2xlYW51
cCgpCj4gMi4ga2lsbF9ieV9waWQocGlkKTsKPiAzLiBpZiAodWlkKSBraWxsX2J5X3VpZCh1aWQp
Owo+IAo+IFRoYXQgaXMsIGFsd2F5cyBraWxsIGJ5IHBpZCwgYW5kIGtpbGwgYnkgdWlkIGlmIGl0
4oCZcyBhdmFpbGFibGU7IGJ1dCByZW1vdmUgdGhlIHFtcCBzb2NrZXQgZmlyc3QuCgpJIGRvbid0
IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBhYm91dCB0aGlzLCBidXQgcHV0dGluZyB0aGUKbGlieGxf
X3FtcF9jbGVhbnVwIGFmdGVyIHFlbXUgaGFzIGJlZW4ga2lsbGVkIHNlZW1zIG1vcmUKc3RyYWln
aHRmb3J3YXJkIHRvIG1lIChhbmQgSSd2ZSBhbHJlYWR5IHNhaWQgdGhlcmUgc2hvdWxkIGJlIGEg
c2luZ2xlCmV4aXQgcGF0aCBzbyBpdCBjYW4gZ28gdGhlcmUuLi4pCgo+ID4gSXQgd291bGQgYmUg
bmljZSB0byBkcm9wIHRoZSBzcHVyaW91cyBzcGFjZSBiZWZvcmUgZG1fcnVuYXMgd2hpbGUgeW91
Cj4gPiBhcmUgaGVyZSwgYW5kIHRoZW4gcHJlc3VtYWJseSB0aGUgZG91YmxlIHNwYWNlIGJlZm9y
ZSAqZG1fdWlkIHdvdWxkCj4gPiBub3QgYmUgbmVlZGVkLgo+IAo+IFdlbGwgcHJlc3VtYWJseSBp
dCB3b3VsZCBiZSBiZXR0ZXIgdG8gZml4IGl0IGJhY2sgaW4gcGF0Y2ggMiBpbnN0ZWFkLiA6LSkK
CkVyciwgeWVzIDotKS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
