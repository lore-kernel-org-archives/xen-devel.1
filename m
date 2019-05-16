From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] coverage: GCC coverage libfdt Makefile fix
Date: Thu, 16 May 2019 12:39:58 +0100
Message-ID: <20190516113958.GA2798@zion.uk.xensource.com>
References: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
 <20190516112638.GX2798@zion.uk.xensource.com>
 <611b22f7-8125-15e0-6154-93638c2a14ad@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hREk4-0003Xv-0y
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:40:08 +0000
Content-Disposition: inline
In-Reply-To: <611b22f7-8125-15e0-6154-93638c2a14ad@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <Julien.Grall@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Viktor Mitin <viktor.mitin.19@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6Mzc6MzNBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDE2LzA1LzIwMTkgMTI6MjYsIFdlaSBMaXUgd3JvdGU6Cj4gPiBPbiBU
aHUsIE1heSAxNiwgMjAxOSBhdCAwMjoxMzo1NFBNICswMzAwLCBWaWt0b3IgTWl0aW4gd3JvdGU6
Cj4gPj4gVGhlIHBhdGNoIHJlc29sdmVzICd4ZW5jb3YnIGNyYXNoZXMgaW4gY2FzZSBvZiBBYXJj
aDY0Lgo+ID4+Cj4gPj4gQWxsIHRoZSAuaW5pdC4qIHNlY3Rpb25zIGFyZSBzdHJpcHBlZCBhZnRl
ciBib290LAo+ID4+IGl0IG1lYW5zIHRoYXQgYW55dGhpbmcgaW4gLmluaXQuZGF0YSBjYW5ub3Qg
YmUgYWNjZXNzZWQgYW55bW9yZS4KPiA+PiBUaGUgYnVpbGQgc3lzdGVtIGV4cGxpY2l0bHkgY29t
cGlsZXMgYW55IC5pbml0IGJpbmFyeSB3aXRob3V0IGdjb3Ygb3B0aW9uLgo+ID4+IFRoZSBwcm9i
bGVtIGlzIGNvbWluZyBmcm9tIGxpYmZkdC4KPiA+PiBUaGUgZW50aXJlIGxpYnJhcnkgaXMgbW92
ZWQgdG8gLmluaXQgdXNpbmc6Cj4gPj4gJChPQkpDT1BZKSAkKGZvcmVhY2ggcywkKFNFQ1RJT05T
KSwtLXJlbmFtZS1zZWN0aW9uIC4kKHMpPS5pbml0LiQocykpICQ8ICRACj4gPj4gU28gd2UgbmVl
ZCB0byB0ZWxsIHRoZSB0b3AgTWFrZWZpbGUgdG8gZmlsdGVyIG91dCBsaWJmZHQuCj4gPj4KPiA+
PiBSZXBvcnRlZC1ieTogVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4uMTlAZ21haWwuY29tPgo+
ID4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4g
Pj4gVGVzdGVkLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvci5taXRpbi4xOUBnbWFpbC5jb20+Cj4g
PiAKPiA+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gCj4g
PiBBbHRob3VnaCBJIHdvdWxkIGxpa2UgdG8gYXNrIHlvdSB0byBhZGp1c3QgdGhlIHN1YmplY3Qg
dG8gYmUgbW9yZQo+ID4gc3BlY2lmaWM6Cj4gPiAKPiA+ICAgIGNvdmVyYWdlOiBmaWx0ZXIgb3V0
IGxpYmZkdC5vCj4gPiAKPiA+IGlmIHlvdSBhZ3JlZSwgdGhpcyBjYW4gYmUgZG9uZSB3aGlsZSBj
b21taXR0aW5nLgo+IAo+IFRoZXJlIGFyZSBtb3JlIHRoYW4gdGhhdCB0aGUgdGl0bGUgdG8gZml4
IG9uIGNvbW1pdC4gVGhlIFNpZ25lZC1vZmYtYnkgCj4gYW5kIGRvZXMgbm90IG1hdGNoIHRoZSBG
cm9tIGZvciBpbnN0YW5jZS4KPiAKPiBJIGluaXRpYWxseSBzdWdnZXN0ZWQgdGhlIGNoYW5nZSwg
c28gU3VnZ2VzdGVkLWJ5IHdvdWxkIGJlIG1vcmUgCj4gc3VpdGFibGUuIEFuZCB0aGVuIFZpa3Rv
ciBuZWVkcyB0byBhZGQgaGlzIHNpZ25lZC1vZmYtYnkuCj4gCj4gQWxzbywgY291bGQgd2UgYWxz
byBmaXggbGliZWxmIGF0IHRoZSBzYW1lIHRpbWU/CgorMS4gVmlrdG9yPwoKV2VpLgoKPiAKPiBD
aGVlcnMsCj4gCj4gLS0gCj4gSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
