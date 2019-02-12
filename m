From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.12 v2 1/7] dom0/pvh: align allocation
 and mapping order to start address
Date: Tue, 12 Feb 2019 10:52:42 +0000
Message-ID: <20190212105242.o5emeyk7zxd4wmh6@zion.uk.xensource.com>
References: <20190211174642.38046-1-roger.pau@citrix.com>
 <20190211174642.38046-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X2db=QT=citrix.com=prvs=93946142b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gtVgK-0003kF-Uu
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 10:52:52 +0000
Content-Disposition: inline
In-Reply-To: <20190211174642.38046-2-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMTEsIDIwMTkgYXQgMDY6NDY6MzZQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoZSBwMm0gYW5kIGlvbW11IG1hcHBpbmcgY29kZSBhbHdheXMgaGFkIHRoZSBy
ZXF1aXJlbWVudCB0aGF0Cj4gYWRkcmVzc2VzIGFuZCBvcmRlcnMgbXVzdCBiZSBhbGlnbmVkIHdo
ZW4gcG9wdWxhdGluZyB0aGUgcDJtIG9yIHRoZQo+IGlvbW11IHBhZ2UgdGFibGVzLgo+IAo+IFBW
SCBkb20wIGJ1aWxkZXIgZGlkbid0IHRha2UgdGhpcyByZXF1aXJlbWVudCBpbnRvIGFjY291bnQs
IGFuZCBjYW4KPiBjYWxsIGludG8gdGhlIHAybS9pb21tdSBtYXBwaW5nIGhlbHBlcnMgd2l0aCBh
ZGRyZXNzZXMgYW5kIG9yZGVycyB0aGF0Cj4gYXJlIG5vdCBhbGlnbmVkLgo+IAo+IEZpeCB0aGlz
IGJ5IG1ha2luZyBzdXJlIHRoZSBvcmRlcnMgcGFzc2VkIHRvIHRoZSBwaHlzbWFwIHBvcHVsYXRp
b24KPiBoZWxwZXJzIGFyZSBhbHdheXMgYWxpZ25lZCB0byB0aGUgZ3Vlc3QgYWRkcmVzcyB0byBi
ZSBwb3B1bGF0ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
