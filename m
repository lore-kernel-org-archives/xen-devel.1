From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 8/9] libxl: Kill QEMU by uid when possible
Date: Thu, 29 Nov 2018 17:16:32 +0000
Message-ID: <23552.7920.622490.61558@mariner.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-8-george.dunlap@citrix.com>
 <8b086fb2-e018-a669-b90d-42ce2179eaa7@citrix.com>
 <20181128155758.GA14786@perard.uk.xensource.com>
 <20181129115524.4yjt2ff2hwwqjsgi@zion.uk.xensource.com>
 <C5994DCA-A993-4BBD-9433-CD6DA9C47C32@citrix.com>
 <23551.56043.674081.561342@mariner.uk.xensource.com>
 <138137EE-1DC9-4B8A-998B-2D6790A232D5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mb5D=OI=citrix.com=prvs=8641bc5b5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gSPve-0007Ac-AE
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 17:16:42 +0000
In-Reply-To: <138137EE-1DC9-4B8A-998B-2D6790A232D5@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIDgvOV0gbGlieGw6IEtpbGwgUUVNVSBi
eSB1aWQgd2hlbiBwb3NzaWJsZSIpOgo+ID4gT24gTm92IDI5LCAyMDE4LCBhdCAxMjoyNiBQTSwg
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gR2VvcmdlIER1
bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIDgvOV0gbGlieGw6IEtpbGwgUUVNVSBieSB1aWQgd2hl
biBwb3NzaWJsZSIpOgo+ID4+IEl0IHdvdWxkbuKAmXQgYmUgdGVycmlibHkgaGFyZCB0byBoYXZl
IGEgY29tbW9uIOKAnGV4aXTigJ0gdG8gYm90aCB0aGUKPiA+PiBraWxsLWJ5LXBpZCBhbmQga2ls
bC1ieS11aWQgcGF0aHMgdGhhdCBkaWQgaXQgb25jZSwgYnV0IGl0IHdvdWxkCj4gPj4gaW52b2x2
ZSBhZGRpbmcgWWV0IEFub3RoZXIgRnVuY3Rpb247IGFuZCBlYWNoIGFkZGl0aW9uYWwgZnVuY3Rp
b24KPiA+PiBtYWtlcyB0aGUgY29kZSBhIGxpdHRsZSBiaXQgbW9yZSBkaWZmaWN1bHQgdG8gZm9s
bG93Lgo+ID4gCj4gPiBJJ20gYWZyYWlkIEkgZGlzYWdyZWUgb24gdGhpcyBwb2ludC4KPiA+IAo+
ID4gSSBhZ3JlZSB0aGF0IGFkZGl0aW9uYWwgZnVuY3Rpb25zIHNob3VsZCBiZSBhdm9pZGVkIHdo
ZXJlIHRoZXkgYXJlCj4gPiBuZWVkbGVzcy4gIEJ1dCBhIHNpbmdsZSBleGl0IHBhdGggaXMgbW9y
ZSBpbXBvcnRhbnQuCj4gPiAKPiA+IFdpdGhvdXQgYSBzaW5nbGUgZXhpdCBwYXRoLCBzb21lb25l
IHdobyBtb2RpZmllcyB0aGlzIGNvZGUgaW4gdGhlCj4gPiBmdXR1dHVyZSAodG8gYWRkIG5ldyBz
dGF0ZSwgc2F5KSB3aWxsIHJpc2sgYWx0ZXJpbmcgb25seSBvbmUgb2YgdGhlCj4gPiBleGl0IHBh
dGhzLgo+IAo+IOKAnENyZWF0aW5nIGFuIGV4dHJhIGZ1bmN0aW9uIHRvIGF2b2lkIG1vdmluZyBx
bXBfY2xlYW51cCBlYXJsaWVy4oCdCj4gZG9lc27igJl0IHNvdW5kIGxpa2UgYSBnb29kIHJlYXNv
biB0byBtZS4g4oCcQ3JlYXRpbmcgYW4gZXh0cmEgZnVuY3Rpb24KPiB0byBtYWtlIHN1cmUgZnV0
dXJlIG1vZGlmaWNhdGlvbnMgaGF2ZSBvbmx5IG9uZSBleGl0IHBhdGjigJ0gc291bmRzCj4gbGlr
ZSBhIGdvb2QgcmVhc29uLCB0aG91Z2guCgpPSywgZ29vZCwgSSB0aGluayB3ZSBhcmUgaW4gYWdy
ZWVtZW50IG9uIHRoaXMgcG9pbnQuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
