From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC 23/55] x86_64/mm: drop l4e_to_l3e
 invocation from paging_init
Date: Tue, 9 Apr 2019 13:22:55 +0100
Message-ID: <20190409122255.GR1986@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-24-wei.liu2@citrix.com>
 <1552943674.6788.102.camel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpmL-0008L7-Pc
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:23:05 +0000
Content-Disposition: inline
In-Reply-To: <1552943674.6788.102.camel@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Nuernberger, Stefan" <snu@amazon.de>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDk6MTQ6MzRQTSArMDAwMCwgTnVlcm5iZXJnZXIsIFN0
ZWZhbiB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDItMDcgYXQgMTY6NDQgKzAwMDAsIFdlaSBMaXUg
d3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+
IAo+IEFueSByZWFzb24gd2h5IHRoaXMgaXNuJ3Qgc3F1YXNoZWQgd2l0aCB0aGUgcHJldmlvdXMg
cGF0Y2g/CgpCZWNhdXNlIG9mIGhvdyBJIGNsYXNzaWZpZWQgY2hhbmdlcyAtLSBsWGVfdG9fbFll
IGJlbG9uZ3MgdG8gdGhlaXIgb3duCmdyb3VwLgoKSSBjYW4gc3F1YXNoIGEgbG90IG9mIHN0dWZm
IHRvZ2V0aGVyIGJ1dCBJIGRlY2lkZWQgdGhpcyB3YXkgd2FzIGJldHRlci4KCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
