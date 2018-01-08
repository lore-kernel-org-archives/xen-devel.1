From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 15/22] vixen: pass through version
 hypercalls to parent Xen
Date: Mon, 08 Jan 2018 02:36:05 -0700
Message-ID: <5A534995020000780019BFFB@prv-mh.provo.novell.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-16-git-send-email-aliguori@amzn.com>
 <20180107083123.judv4wjl7rhxc3gy@MacBook-Pro-de-Roger.local>
 <CA+aC4kuBj-roLCVN0_+O7rRorM8CaYYDT2JMQwBit2_c2K74qA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dk2s=ed=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYTqt-0002Pj-C6
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 09:36:19 +0000
In-Reply-To: <CA+aC4kuBj-roLCVN0_+O7rRorM8CaYYDT2JMQwBit2_c2K74qA@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony Liguori <anthony@codemonkey.ws>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, "=?UTF-8?Q?Jan=20H.=20Sch=C3=B6nherr?=" <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAxLjE4IGF0IDE2OjQwLCA8YW50aG9ueUBjb2RlbW9ua2V5LndzPiB3cm90ZToK
PiBPbiBTdW4sIEphbiA3LCAyMDE4IGF0IDEyOjMxIEFNLCBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIFNhdCwgSmFuIDA2LCAyMDE4IGF0IDAyOjU0
OjMwUE0gLTA4MDAsIEFudGhvbnkgTGlndW9yaSB3cm90ZToKPj4+IEZyb206IEFudGhvbnkgTGln
dW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4KPj4+Cj4+PiBUaGlzIGlzIG5lY2Vzc2FyeSB0byB0
cmlnZ2VyIGV2ZW50IGNoYW5uZWwgdXBjYWxscyBidXQgaXQgaXMgYWxzbwo+Pgo+PiBJJ20gbG9z
dCBoZXJlLCB3aGF0IGRvZXMgdmVyc2lvbiBoYXZlIHRvIGRvIHdpdGggdXBjYWxscz8KPiAKPiBJ
biBMaW51eCwgeGVuX2ZvcmNlX2V2dGNobl9jYWxsYmFjaygpIGRvZXMgSFlQRVJWSVNPUl94ZW5f
dmVyc2lvbigwLAo+IE5VTEwpLiAgVGhpcyBpcyBkb25lIHdoZW4gSVJRcyBhcmUgcmUtZW5hYmxl
ZCBhZnRlciBiZWluZyBkaXNhYmxlZCB0bwo+IHRyaWdnZXIgY2hlY2tpbmcgcGVuZGluZy4KPiAK
PiBJJ20gbm90IDEwMCUgY29uZmlkZW50IHRoYXQgaXQncyBuZWNlc3NhcnkgdG8gcGFzcyB0aGlz
IGFsbCB0aGUgd2F5Cj4gdGhyb3VnaCB0byB0aGUgcGFyZW50IFhlbiBidXQgaXQgc2VlbWVkIGxp
a2UgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvCj4gc2luY2Ugd2UgbmVlZCB0aGUgcGFyZW50IHRvIHVw
ZGF0ZSBwZW5kaW5nIGV2ZW50cyBpbiBvcmRlciBmb3IgdGhlCj4gZXZlbnRzIGluIFZpeGVuIHRv
IGdldCB1cGRhdGVkLgo+IAo+Pj4gdXNlZnVsIHRvIHBhc3N0aHJvdWdoIHRoZSBmdWxsIHZlcnNp
b24gaW5mb3JtYXRpb24gc3VjaCB0aGF0IHRoZQo+Pj4gZ3Vlc3QgYmVsaWV2ZXMgaXQgaXMgcnVu
bmluZyBvbiB0aGUgcGFyZW50IFhlbi4KPj4KPj4gSW4gYW55IGNhc2UsIEkgdGhpbmsgdGhpcyBp
cyB3cm9uZy4gVGhlIGludGVyZmFjZSB0aGUgZ3Vlc3Qgc2VlcyBpcwo+PiB0aGUgaW50ZXJmYWNl
IGZyb20gdml4ZW4sIG5vdCB0aGUgaW50ZXJmYWNlIG9mIHRoZSBMMC4gSGVuY2UgcmVwb3J0aW5n
Cj4+IHRoZSBMMCB2ZXJzaW9uIGlzIG5vdCBhcHByb3ByaWF0ZS4KPiAKPiBJIHRoaW5rIGl0IGRl
cGVuZHMgb24gd2hhdCB5b3Ugd2FudC4gIFdlIHdlcmUgYWltaW5nIGZvciBtYXhpbXVtCj4gY29t
cGF0aWJpbGl0eSBhbmQgbWFueSB1c2VycyB0cmlnZ2VyIGJlaGF2aW9yIGZyb20gWGVuIHZlcnNp
b24gZm9yCj4gYmV0dGVyIG9yIHdvcnNlLgoKQXQgdGhlIGV4YW1wbGUgb2YgdGhlIHBsYWluIHZl
cnNpb24gbnVtYmVyLCBJIHRoaW5rIHdoYXQgaXMgYmVpbmcKcmVwb3J0ZWQgYmFjayB0byB0aGUg
Z3Vlc3QgbWF5IG5lZWQgdG8gYmUgdGhlIGxvd2VyIG9mIHNoaW0gYW5kCmFjdHVhbCBoeXBlcnZp
c29yIHZlcnNpb25zLiBYRU5WRVJfZ2V0X2ZlYXR1cmVzIG1heSB3YW50IEFORGluZwpib3RoIHZh
bHVlcyAocGVyaGFwcyB3aXRoIHNvbWUgY3VzdG9taXphdGlvbiBpbiBjYXNlIHRoZXJlIGFyZQpi
aXRzIGV4Y2x1c2l2ZWx5IGFmZmVjdGVkIGJ5IGVpdGhlciBwYXJ0eSkuIEkgZGlkbid0IHRoaW5r
IHRocm91Z2ggb3RoZXIKc3ViLW9wcyB5ZXQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
