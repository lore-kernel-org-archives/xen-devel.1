From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v2 15/23] vixen: pass through version
 hypercalls to parent Xen
Date: Sun, 7 Jan 2018 19:42:40 -0500
Message-ID: <20180108004240.GA31196@char.us.oracle.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-16-git-send-email-aliguori@amzn.com>
 <20180108002711.GB21689@char.us.oracle.com>
 <CA+aC4ktUvNvngWdFxDz_wCc8+4oO7L-SzhpSZyYo0HKfcdqH-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=45m3=ed=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1eYLWg-0000bL-0y
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 00:42:54 +0000
Content-Disposition: inline
In-Reply-To: <CA+aC4ktUvNvngWdFxDz_wCc8+4oO7L-SzhpSZyYo0HKfcdqH-Q@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <anthony@codemonkey.ws>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiA+PiAgaW50ZWdlcl9wYXJhbSgidml4ZW5fZG9taWQiLCB2aXhlbl9kb21pZCk7Cj4gPj4gK2Jv
b2xlYW5fcGFyYW0oInZpeGVuX3B0dmVyIiwgdml4ZW5fcHR2ZXIpOwo+ID4KPiA+IFdvdWxkIGl0
IG1ha2Ugc2Vuc2UgdG8gaGF2ZSBhIGN1c3RvbSBwYXJhbWV0ZXIgZnVuY3Rpb24gdGhhdCB3b3Vs
ZAo+ID4gYmUgY2FsbGVkICd2aXhlbicgYW5kIGhhdmUgYWxsIG9mIHRob3NlIGluIGl0Pwo+IAo+
IENhbiB5b3UgZ2l2ZSBhbiBleGFtcGxlPyAgSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4uCgpB
bmRyZXcncyBidGk9IGhhbmRsaW5nIGZvciBleGFtcGxlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
