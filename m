From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v12] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Mon, 11 Mar 2019 04:02:14 -0600
Message-ID: <5C863226020000780021D1DB@prv1-mh.provo.novell.com>
References: <20190308192059.24610-1-olaf@aepfle.de>
 <20190308202907.56f7609a.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dzfJ=RO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3HlI-0005Pa-Cf
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 10:02:24 +0000
In-Reply-To: <20190308202907.56f7609a.olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAzLjE5IGF0IDIwOjI5LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IEFtIEZy
aSwgIDggTWFyIDIwMTkgMjA6MjA6NTkgKzAxMDAKPiBzY2hyaWViIE9sYWYgSGVyaW5nIDxvbGFm
QGFlcGZsZS5kZT46Cj4gCj4+IFRvIHJlaXRlcmF0ZSB0aGUgc2Vjb25kIHBhcmFncmFwaDogaWYg
YSBkb21VIHVzZXMgVFNDIGFzIHByaW1hcnkgY2xvY2sKPj4gc291cmNlLCBpdCBpcyBleHBlY3Rl
ZCB0aGF0IGl0IHJ1bnMgTlRQIHRvIGNvdmVyIGZvciB0aGUgcmVzdWx0aW5nCj4+IGRyaWZ0LiBU
aGVyZWZvcmUgdGhpcyBjaGFuZ2UgZG9lcyBubyBuZWVkIGEga25vYiB0byB0dXJuIGl0IG9uIG9y
IG9mZi4KPiAKPiBPbmUgaW50ZXJlc3RpbmcgYXNwZWN0IGlzOiB0aGUgeGVubGludXggYmFzZWQg
a2VybmVscyByZXBvcnQgY2xvY2tzb3VyY2U9dHNjLAoKSSBkb24ndCB0aGluayB0aGV5IGRvIC0g
aWlyYyB0aGV5IGFyZSBoYXJkY29kZWQgdG8gY2xvY2tzb3VyY2U9eGVuLgoKPiBidXQgSSB0aGlu
ayB0aGVyZSB3YXMgbm8gZXhwbGljaXQgcmVxdWlyZW1lbnQgdG8gcnVuIE5UUCBpbiBkb21VLgoK
Q29ycmVjdCwgdW5sZXNzICJpbmRlcGVuZGVudCB3YWxsIGNsb2NrIiBtb2RlIHdhcyB1c2VkLgoK
PiBUaGVyZSB3YXMgZXZlbiB0aGF0ICdpbmRlcGVuZGVudF93YWxsY2xvY2snIGtub2IuIFdoeSBp
cyB0aGF0PwoKV2h5IGlzIHdoYXQ/IEFyZSB5b3UgcXVlc3Rpb25pbmcgdGhlIHByZXNlbmNlIG9m
IHRoZSBzZXR0aW5nIGluCnRoZSBYZW5vTGludXgga2VybmVscywgb3IgaXRzIGFic2VuY2UgaW4g
dGhlIHB2LW9wcyBvbmVzPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
