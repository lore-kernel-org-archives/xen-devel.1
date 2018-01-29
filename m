From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 5/5] x86: remove usage of .skip with
 non-absolute expressions
Date: Mon, 29 Jan 2018 09:50:56 -0700
Message-ID: <5A6F5F0002000078001A37EE@prv-mh.provo.novell.com>
References: <20180129122643.13008-1-roger.pau@citrix.com>
 <20180129122643.13008-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=763w=ey=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1egCeA-0000aE-M5
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 16:51:06 +0000
In-Reply-To: <20180129122643.13008-6-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAxLjE4IGF0IDEzOjI2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IENsYW5nIGFzc2VtYmxlciBkb2Vzbid0IHN1cHBvcnQgdXNpbmcgLnNraXAgd2l0aCBub24tYWJz
b2x1dGUKPiBleHByZXNzaW9uczoKPiAKPiBlbnRyeS5TOjEwOToxNTogZXJyb3I6IGV4cGVjdGVk
IGFic29sdXRlIGV4cHJlc3Npb24KPiAgICAgICAgIC5za2lwIC5MY3I0X2FsdF9lbmQgLSAuTGNy
NF9hbHQsIDB4OTAKPiAgICAgICAgICAgICAgIF4KPiAKPiBUaGlzIHVzYWdlIG9mIC5za2lwIHdh
cyB0byBmaWxsIGNvZGUgc2VjdGlvbnMgd2l0aCBOT1BzIGluIG9yZGVyIGZvcgo+IHRoZW0gdG8g
YmUgcGF0Y2hlZCBhdCBydW4gdGltZSBpZiByZXF1aXJlZCBieSB0aGUgYWx0ZXJuYXRpdmVzCj4g
ZnJhbWV3b3JrLiBJbnN0ZWFkIG9mIHVzaW5nIC5za2lwIHVzZSB0aGUgYXBwcm9wcmlhdGUgbnVt
YmVyIG9mIE5PUHMKPiB0byBtYXRjaCB0aGUgc2l6ZSBvZiB0aGUgYWx0ZXJuYXRpdmUgY29kZS4K
Ck5BSyAtIEkndmUgdm9pY2VkIGEgbnVtYmVyIG9mIHRpbWVzIG15IG9wcG9zaXRpb24gdG8gQW5k
cmV3IGFkZGluZwp0aGUgdmFyaW91cyBBU01fTk9QPE4+IGluIGhpcyBTcGVjdHJlIHYyIHNlcmll
cywgYW5kIEknbSBwbGFubmluZwp0byBlbGltaW5hdGUgdGhlbSBpbiBkdWUgY291cnNlIChieSB1
c2luZyAtIHlvdSBndWVzcyBpdCAtIC5za2lwKS4gSXQKaXMgcHJldHR5IG11Y2ggdW5hY2NlcHRh
YmxlIHRvIG1lIHRvIGhhdmUgdG8gZW5jb2RlIHRoZSBzaXplIG9mCmNlcnRhaW4gaW5zdHJ1Y3Rp
b25zIGluIGEgc2Vjb25kIHBsYWNlLCByaXNraW5nIHRoZW0gdG8gZ28gb3V0IG9mIHN5bmMKd2l0
aCB3aGF0IHRoZXkgc2hhZG93LgoKSWYgdWdsaW5lc3MgbGlrZSB0aGlzIGlzIG5lZWRlZCB0byBz
dXBwb3J0IGNsYW5nJ3MgaW50ZWdyYXRlZCBhc3NlbWJsZXIsCnRoZW4gSSBzZWUgbm8gd2F5IG90
aGVyIHRoYW4gYXZvaWRpbmcgaXRzIHVzZS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
