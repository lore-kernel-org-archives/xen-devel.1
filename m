From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 3/7] x86/pvh: allow PVH Dom0 to use the
 debug IO port console
Date: Mon, 29 Oct 2018 11:03:37 -0600
Message-ID: <5BD73D6902000078001F5F56@prv1-mh.provo.novell.com>
References: <20181019152021.64607-1-roger.pau@citrix.com>
 <20181019152021.64607-4-roger.pau@citrix.com>
 <47ce00b7-6f15-90f6-3ce3-b9316fae9845@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m5uw=nj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHAx4-0003zF-VZ
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 17:03:43 +0000
In-Reply-To: <47ce00b7-6f15-90f6-3ce3-b9316fae9845@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjEwLjE4IGF0IDE3OjUzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMTAvMTggMTY6MjAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4gQWRkIGFu
IG9wdGlvbiB0byBhbGxvdyB0cmFwcGluZyBhY2Nlc3NlcyB0byBJTyBwb3J0IDB4ZTkgZm9yIGEg
UFZICj4+IERvbTAsIHNvIGl0IGNhbiBwcmludCB0byB0aGUgSFZNIGRlYnVnIGNvbnNvbGUuIE5v
dGUgdGhpcyBpcyBub3QKPj4gZW5hYmxlZCBieSBkZWZhdWx0IGluIG9yZGVyIHRvIHByZXZlbnQg
Y2xhc2hlcyB3aXRoIGhhcmR3YXJlIG9uIHRoZQo+PiBzeXN0ZW0gdXNpbmcgMHhlOS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+
IC0tLQo+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBDYzogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4gQ2M6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+PiAgLSBVc2UgYSBk
ZWZpbmUgZm9yIDB4ZTkuCj4+ICAtIEV4cGFuZCAnTGlzdCBvZicgaW4gdGhlIFhlbiBjb21tYW5k
IGRvYy4KPiAKPiBBcyBzYWlkIGR1cmluZyB2MSwgbWFrZSB0aGlzIHVuY29uZGl0aW9uYWwgYW5k
IGRvIGF3YXkgdGhlIGNvbW1hbmQgbGluZQo+IG9wdGlvbi4KPiAKPiBOb29uZSB3aXRoIGEgUFZI
IGRvbTAgaXMgZ29pbmcgdG8gaGF2ZSBhIHJlYWwgQ29aZXQgSW5mbyBQQyByYWRpbyBvbiBhbgo+
IElTQSBidXMuCgpPaCwgSSdtIHNvcnJ5IC0gSSBoYWQgZm9yZ290dGVuIGFib3V0IHRoYXQgcmVx
dWVzdCBvZiB5b3VycywgYW5kCnNob3VsZCBoZW5jZSBub3QgaGF2ZSBnaXZlbiBteSBSLWIuCgpK
YW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
