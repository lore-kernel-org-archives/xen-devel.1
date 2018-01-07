From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH 18/22] vixen: Introduce ECS_PROXY for event
 channel proxying
Date: Sun, 7 Jan 2018 07:46:55 -0800
Message-ID: <CA+aC4ku-q3x5dkwyhu+Twb-SrDVAx+uQ8sfbHdT0sQEOb-ut1w@mail.gmail.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-19-git-send-email-aliguori@amzn.com>
 <20180107084426.4adspnlbemfgr3rd@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=swlg=ec=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYDA3-0000qG-5S
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 15:46:59 +0000
Received: by mail-lf0-x234.google.com with SMTP id c19so9712798lfg.3
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jan 2018 07:46:57 -0800 (PST)
In-Reply-To: <20180107084426.4adspnlbemfgr3rd@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gNywgMjAxOCBhdCAxMjo0NCBBTSwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+IE9uIFNhdCwgSmFuIDA2LCAyMDE4IGF0IDAyOjU0OjMz
UE0gLTA4MDAsIEFudGhvbnkgTGlndW9yaSB3cm90ZToKPj4gRnJvbTogSmFuIEguIFNjaMO2bmhl
cnIgPGpzY2hvZW5oQGFtYXpvbi5kZT4KPj4KPj4gUHJldmlvdXNseSwgd2Ugd291bGQga2VlcCBw
cm94aWVkIGV2ZW50IGNoYW5uZWxzIGFzIEVDU19JTlRFUkRPTUFJTgo+PiBjaGFubmVsIGFyb3Vu
ZC4gVGhpcyB3b3JrcyBmb3IgbW9zdCB0aGluZ3MsIGJ1dCBoYXMgdGhlIHByb2JsZW0KPj4gdGhh
dCBFVlRDSE5PUF9zdGF0dXMgaXMgYnJva2VuLCBhbmQgdGhhdCBFVlRDSE5PUF9jbG9zZSBkb2Vz
IG5vdAo+PiBtYXJrIGFuIGV2ZW50IGNoYW5uZWwgYXMgZnJlZS4KPgo+IFdoeSBub3QgdXNlIEVD
U19SRVNFUlZFRCBmb3IgZXZlbnQgY2hhbm5lbHMgdGhhdCBhcmUgZm9yd2FyZGVkIHRvIEwwPwo+
Cj4gWW91IGNvdWxkIGVhc2lseSBzZWUgd2hldGhlciBhbiBldmVudCBjaGFubmVsIGlzIGZvcndh
cmRlZCBvciBub3QganVzdAo+IGJ5IGNoZWNraW5nIGlmIGl0J3MgRUNTX1JFU0VSVkVELCBhbmQg
dGhlbiBkZWNpZGUgd2hldGhlciB0byBmb3J3YXJkCj4gdGhlIGh5cGVyY2FsbCB0byBMMCBvciBo
YW5kbGUgaXQgaW4gdml4ZW4uCgpKYW4/CgpSZWdhcmRzLAoKQW50aG9ueSBMaWd1b3JpCgo+Cj4g
VGhhbmtzLCBSb2dlci4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
