From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: TLB flushing
Date: Tue, 20 Mar 2018 03:19:49 -0600
Message-ID: <5AB0E04502000078001B3CFF@prv-mh.provo.novell.com>
References: <0f224e94-2513-3146-d418-8789a5e1369b@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3grj=gk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyDQv-0003At-Ly
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 09:19:53 +0000
In-Reply-To: <0f224e94-2513-3146-d418-8789a5e1369b@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAzLjE4IGF0IDA5OjUwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBXaGls
ZSBodW50aW5nIGEgc3RyYW5nZSBidWcgaW4gbXkgUENJRCBwYXRjaCBzZXJpZXMgaGludGluZyBh
dCBzb21lCj4gVExCIGludmFsaWRhdGlvbiBwcm9ibGVtIEkgZGlzY292ZXJlZCBhIHBpZWNlIG9m
IGNvZGUgbG9va2luZyByYXRoZXIKPiBmaXNoeSB0byBtZS4KPiAKPiBJcyBpdCBjb3JyZWN0IGZv
ciBuZXdfdGxiZmx1c2hfY2xvY2tfcGVyaW9kKCkgdG8gdXNlIEZMVVNIX1RMQiBpbnN0ZWFkCj4g
b2YgRkxVU0hfVExCX0dMT0JBTD8KPiAKPiBXaGlsZSBub3QgYmVpbmcgYSBwcm9ibGVtIGluIGN1
cnJlbnQgY29kZSBhcyBib3RoIHdpbGwgZmx1c2ggYWxsIFRMQgo+IGVudHJpZXMgbXkgc2VyaWVz
IHdpbGwgY2hhbmdlIHRoYXQgYnkgdXNpbmcgaW52cGNpZCB0byBmbHVzaCBvbmx5IHRoZQo+IG5v
bi1nbG9iYWwgZW50cmllcyBpZiBGTFVTSF9UTEJfR0xPQkFMIHdhc24ndCBzZXQuCj4gCj4gSSBj
YW4gc2VuZCBhIHBhdGNoIGlmIGFueW9uZSBjYW4gY29uZmlybSB0aGF0IHVzaW5nIEZMVVNIX1RM
QiBvbmx5IGlzCj4gd3JvbmcuCgpJIHRoaW5rIHRoaXMgc2hvdWxkbid0IGJlIGEgc2VwYXJhdGUg
cGF0Y2gsIGJ1dCBhbiBpbnRlZ3JhbCBwYXJ0IG9mIHRoZQpvbmUgaW50cm9kdWNpbmcgdGhlIGRp
c3RpbmN0aW9uIGJldHdlZW4gImFsbCIgYW5kIG5vbi1nbG9iYWwgZmx1c2hlcy4KVGhpcyBpcyBi
ZWNhdXNlCi0gcmlnaHQgbm93IGl0IGRvZXNuJ3QgbWFrZSBhIGRpZmZlcmVuY2UgKHdlIGRvICJh
bGwiIGZsdXNoZXMgYW55d2F5KSwKLSBiYWNrIGluIHRoZSAzMi1iaXQgZGF5cyBpdCBkaWRuJ3Qg
bWF0dGVyIGJlY2F1c2UgZ3Vlc3QgbWFwcGluZ3MKICB3b3VsZCBuZXZlciBoYXZlIGJlZW4gYWxs
b3dlZCB0byBiZSBnbG9iYWwsIGFuZCB0cmFuc2llbnQgWGVuCiAgbWFwcGluZ3MgYWxzbyB3b3Vs
ZCBuZXZlciBoYXZlIGhhZCB0aGUgRyBiaXQgc2V0LgpJT1cgd2l0aCB3aGF0IHVzZWQgdG8gYmUg
bmFtZWQgVVNFUl9NQVBQSU5HU19BUkVfR0xPQkFMCnRoaXMgd291bGQgbmVlZCB0byBiZWNvbWUg
RkxVU0hfVExCX0dMT0JBTCBhdCB0aGUgcG9pbnQgdGhlCmtpbmQgb2YgZmx1c2ggZ2V0cyBhbHRl
cmVkLCB3aGlsZSB3aXRob3V0IGl0IGNvdWxkIHJlbWFpbiBhdCBGTFVTSF9UTEIuClBlcmhhcHMg
aXQgaXMgd29ydGh3aGlsZSB0byByZXRhaW4gdGhpcyBkaXN0aW5jdGlvbiBqdXN0IGZvcgpkb2N1
bWVudGF0aW9uIHB1cnBvc2VzIChpbiBjYXNlIGEgZnV0dXJlIGNoYW5nZSB3YW50cyB0byB0dXJu
IG9mZgp0aGF0IFVTRVJfTUFQUElOR1NfQVJFX0dMT0JBTCBiZWhhdmlvciBmb3Igd2hhdGV2ZXIg
cmVhc29uKS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
