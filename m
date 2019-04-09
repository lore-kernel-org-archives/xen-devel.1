From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC 14/55] x86/mm: rewrite xen_to_virt_l2e
Date: Tue, 9 Apr 2019 13:27:45 +0100
Message-ID: <20190409122745.GE30543@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-15-wei.liu2@citrix.com>
 <1552943659.6788.97.camel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpqx-0000nS-2V
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:27:51 +0000
Content-Disposition: inline
In-Reply-To: <1552943659.6788.97.camel@amazon.de>
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

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDk6MTQ6MTlQTSArMDAwMCwgTnVlcm5iZXJnZXIsIFN0
ZWZhbiB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDItMDcgYXQgMTY6NDQgKzAwMDAsIFdlaSBMaXUg
d3JvdGU6Cj4gPiBSZXdyaXRlIHRoYXQgZnVuY3Rpb24gdG8gdXNlIHRoZSBuZXcgQVBJcy4gTW9k
aWZ5IGl0cyBjYWxsZXJzIHRvCj4gPiB1bm1hcAo+ID4gdGhlIHBvaW50ZXIgcmV0dXJuZWQuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiAt
LS0KPiAKPiBuaXQ6IHRoZSBjb21taXQgdGl0bGUgc2hvdWxkIGJlICd2aXJ0X3RvX3hlbl9sMmUn
IG5vdCAneGVuX3RvX3ZpcnQuLi4nCgpGaXhlZC4gVGhhbmtzLgoKV2VpLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
