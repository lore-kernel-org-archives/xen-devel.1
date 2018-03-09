From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 4/6] xen/x86: disable global pages for
 domains with XPTI active
Date: Fri, 9 Mar 2018 15:40:02 +0100
Message-ID: <fcc57ee2-68dc-a6d4-44be-4200b85bb33d@suse.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-5-jgross@suse.com>
 <5AA15F9702000078001AFDDF@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vgtz=f7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1euJBp-0002cS-J5
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 14:40:09 +0000
In-Reply-To: <5AA15F9702000078001AFDDF@prv-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDMvMTggMTY6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjAzLjE4IGF0
IDA5OjE0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gQEAgLTEyMywyMiArMTQyLDE0IEBA
IHVuc2lnbmVkIGludCBmbHVzaF9hcmVhX2xvY2FsKGNvbnN0IHZvaWQgKnZhLCB1bnNpZ25lZCBp
bnQgZmxhZ3MpCj4+ICAgICAgICAgICAgICB1MzIgdCA9IHByZV9mbHVzaCgpOwo+PiAgCj4+ICAg
ICAgICAgICAgICBpZiAoICFjcHVfaGFzX2ludnBjaWQgKQo+PiAtICAgICAgICAgICAgewo+PiAt
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgY3I0ID0gcmVhZF9jcjQoKTsKPj4gLQo+PiAt
ICAgICAgICAgICAgICAgIHdyaXRlX2NyNChjcjQgJiB+WDg2X0NSNF9QR0UpOwo+PiAtICAgICAg
ICAgICAgICAgIGJhcnJpZXIoKTsKPj4gLSAgICAgICAgICAgICAgICB3cml0ZV9jcjQoY3I0KTsK
Pj4gLSAgICAgICAgICAgIH0KPj4gKyAgICAgICAgICAgICAgICBkb19mbHVzaF90bGIoMCk7Cj4+
ICAgICAgICAgICAgICBlbHNlCj4+IC0gICAgICAgICAgICB7Cj4+ICAgICAgICAgICAgICAgICAg
LyoKPj4gICAgICAgICAgICAgICAgICAgKiBVc2luZyBpbnZwY2lkIHRvIGZsdXNoIGFsbCBtYXBw
aW5ncyB3b3Jrcwo+PiAgICAgICAgICAgICAgICAgICAqIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBQ
Q0lEIGlzIGVuYWJsZWQgb3Igbm90Lgo+PiAgICAgICAgICAgICAgICAgICAqIEl0IGlzIGZhc3Rl
ciB0aGFuIHJlYWQtbW9kaWZ5LXdyaXRlIENSNC4KPj4gICAgICAgICAgICAgICAgICAgKi8KPj4g
ICAgICAgICAgICAgICAgICBpbnZwY2lkX2ZsdXNoX2FsbCgpOwo+PiAtICAgICAgICAgICAgfQo+
IAo+IEJ0dywgdGhpcyBpcyBjb3JyZWN0IGZvciBGTFVTSF9UTEJfR0xPQkFMLCBidXQgZ29lcyB0
b28gZmFyIGZvcgo+IEZMVVNIX1RMQi4KCllvdSBhcmUgYXdhcmUgdGhhdCBteSBwYXRjaGVzIGRp
ZG4ndCBjaGFuZ2UgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQ/CgoKSnVlcmdlbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
