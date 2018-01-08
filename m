From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v2 15/23] vixen: pass through version
 hypercalls to parent Xen
Date: Sun, 7 Jan 2018 19:27:12 -0500
Message-ID: <20180108002711.GB21689@char.us.oracle.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-16-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=45m3=ed=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1eYLHj-0007BT-4A
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 00:27:27 +0000
Content-Disposition: inline
In-Reply-To: <1515356919-922-16-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMDcsIDIwMTggYXQgMTI6Mjg6MzFQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IEZyb206IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4KPiAK
PiBUaGlzIGlzIG5lY2Vzc2FyeSB0byB0cmlnZ2VyIGV2ZW50IGNoYW5uZWwgdXBjYWxscyBidXQg
aXQgaXMgYWxzbwo+IHVzZWZ1bCB0byBwYXNzdGhyb3VnaCB0aGUgZnVsbCB2ZXJzaW9uIGluZm9y
bWF0aW9uIHN1Y2ggdGhhdCB0aGUKPiBndWVzdCBiZWxpZXZlcyBpdCBpcyBydW5uaW5nIG9uIHRo
ZSBwYXJlbnQgWGVuLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHQgV2lsc29uIDxtc3dAYW1hem9u
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IExpZ3VvcmkgPGFsaWd1b3JpQGFtYXpvbi5j
b20+Cj4gLS0tCj4gdjEgLT4gdjIKPiAgLSBkb24ndCBwYXNzIHRocm91Z2ggdmVyc2lvbiBieSBk
ZWZhdWx0Cj4gIC0gaW50cm9kdWNlIHZpeGVuX3B0dmVyIHBhcmFtZXRlciB0byBlbmFibGUgdmVy
c2lvbiBwYXNzdGhyb3VnaC4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L2d1ZXN0L3ZpeGVuLmMgICAg
ICAgIHwgIDcgKysrCj4gIHhlbi9jb21tb24va2VybmVsLmMgICAgICAgICAgICAgICB8IDg5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ICB4ZW4vaW5jbHVkZS9hc20t
YXJtL2d1ZXN0L3ZpeGVuLmggfCAgNSArKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC92
aXhlbi5oIHwgIDIgKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3Qvdml4ZW4uYyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC92aXhlbi5jCj4gaW5kZXggYTE2MTRlMC4uN2M4ODZhMiAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3Qvdml4ZW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9ndWVzdC92aXhlbi5jCj4gQEAgLTMxLDggKzMxLDEwIEBAIHN0YXRpYyBpbnQgaW5fdml4ZW47
Cj4gIHN0YXRpYyBpbnQgdml4ZW5fZG9taWQgPSAxOwo+ICBzdGF0aWMgdWludDMyX3Qgdml4ZW5f
cmVzZXJ2ZWRfbWVtX3Bnc3RhcnQgPSAweGZlZmYwMDAwOwo+ICBzdGF0aWMgc2hhcmVkX2luZm9f
dCAqZ2xvYmFsX3NpOwo+ICtzdGF0aWMgYm9vbCB2aXhlbl9wdHZlcjsKPiAgCj4gIGludGVnZXJf
cGFyYW0oInZpeGVuX2RvbWlkIiwgdml4ZW5fZG9taWQpOwo+ICtib29sZWFuX3BhcmFtKCJ2aXhl
bl9wdHZlciIsIHZpeGVuX3B0dmVyKTsKCldvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSBhIGN1
c3RvbSBwYXJhbWV0ZXIgZnVuY3Rpb24gdGhhdCB3b3VsZApiZSBjYWxsZWQgJ3ZpeGVuJyBhbmQg
aGF2ZSBhbGwgb2YgdGhvc2UgaW4gaXQ/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
