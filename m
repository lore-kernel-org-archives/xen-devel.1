From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: PVH dom0 creation fails - the system freezes
Date: Wed, 25 Jul 2018 15:10:49 +0100
Message-ID: <20180725141049.mepyvuprcx4hvo73@citrix.com>
References: <58fc47aa-0c76-4083-b605-b23353d5e42a@amazon.com>
 <5B56F77202000078001D717D@prv1-mh.provo.novell.com>
 <88eaaa06-24c9-d474-c40a-f37bafe1ad67@amazon.com>
 <20180725133530.235csakkjrz6y5yr@mac.bytemobile.com>
 <3db42ec0-8542-1bea-ffee-0ac5dc4d7277@suse.com>
 <20180725140237.pjjzeaibcdo2ov7j@citrix.com>
 <9f85c7af-1115-6888-da0d-d5f93376939f@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiKVV-0006ij-1Q
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 14:11:13 +0000
Content-Disposition: inline
In-Reply-To: <9f85c7af-1115-6888-da0d-d5f93376939f@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: bercarug@amazon.com
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, abelgun@amazon.com, xen-devel <xen-devel@lists.xenproject.org>, David Woodhouse <dwmw2@infradead.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMDU6MDU6MzVQTSArMDMwMCwgYmVyY2FydWdAYW1hem9u
LmNvbSB3cm90ZToKPiBPbiAwNy8yNS8yMDE4IDA1OjAyIFBNLCBXZWkgTGl1IHdyb3RlOgo+ID4g
T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMDM6NDE6MTFQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiA+ID4gT24gMjUvMDcvMTggMTU6MzUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4g
PiA+ID4gPiBXaGF0IGNvdWxkIGJlIGNhdXNpbmcgdGhlIGF2YWlsYWJsZSBtZW1vcnkgbG9zcyBw
cm9ibGVtPwo+ID4gPiA+IFRoYXQgc2VlbXMgdG8gYmUgTGludXggYWdncmVzc2l2ZWx5IGJhbGxv
b25pbmcgb3V0IG1lbW9yeSwgeW91IGdvIGZyb20KPiA+ID4gPiA3MTI5TSB0b3RhbCBtZW1vcnkg
dG8gMjQ2TS4gQXJlIHlvdSBjcmVhdGluZyBhIGxvdCBvZiBkb21haW5zPwo+ID4gPiBUaGlzIG1p
Z2h0IGJlIHJlbGF0ZWQgdG8gdGhlIHRvb2xzIHRoaW5raW5nIGRvbTAgaXMgYSBQViBkb21haW4u
Cj4gPiBHb29kIHBvaW50Lgo+ID4gCj4gPiBJbiB0aGF0IGNhc2UsIHhlbnN0b3JlLWxzIC1mcCB3
b3VsZCBhbHNvIGJlIHVzZWZ1bC4gVGhlIG91dHB1dCBzaG91bGQKPiA+IHNob3cgdGhlIGJhbGxv
b24gdGFyZ2V0IGZvciBEb20wLgo+ID4gCj4gPiBZb3UgY2FuIGFsc28gdHJ5IHRvIHNldCB0aGUg
YXV0b2JhbGxvb24gdG8gb2ZmIGluIC9ldGMveGVuL3hsLmNmZyB0byBzZWUKPiA+IGlmIGl0IG1h
a2VzIGFueSBkaWZmZXJlbmNlLgo+ID4gCj4gPiBXZWkuCj4gQWxzbyB0cmllZCBzZXR0aW5nIGF1
dG9iYWxsb29uaW5nIG9mZiwgYnV0IGl0IGhhZCBubyBlZmZlY3QuCgpXaGF0IGRvZXMgeGVuc3Rv
cmUtbHMgLWZwIHNheXM/IElzIHRoZSB0YXJnZXQgZm9yIERvbTAgc29tZXRoaW5nCnNlbnNpYmxl
PyBJZiB5ZXMsIHRoZW4gdGhlIGxlYWsgaXMgbm90IHJlbGF0ZWQgdG8gYmFsbG9vbmluZy4KCldl
aS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
