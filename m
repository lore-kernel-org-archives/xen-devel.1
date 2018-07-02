From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] console: avoid printing no or null time
 stamps
Date: Mon, 2 Jul 2018 15:28:58 -0500
Message-ID: <20180702202858.6ngi3cjddblvfqyt@doug-macbook.localdomain>
References: <5B31EA1802000078001CDD10@prv1-mh.provo.novell.com>
 <fbda932a-5710-93f5-2fc2-0052dfbafebc@arm.com>
 <5B32016502000078001CDE5B@prv1-mh.provo.novell.com>
 <31923b8c-8c90-9410-e767-25456c74f8a6@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mu3u=js=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1fa5RV-0007JN-Ry
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 20:29:02 +0000
Received: by mail-yb0-x243.google.com with SMTP id k127-v6so5568693ybk.6
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jul 2018 13:29:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <31923b8c-8c90-9410-e767-25456c74f8a6@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMDI6NDc6NDJQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IE9uIDA2LzI2LzIwMTggMTA6MDMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+
ID4gT24gMjYuMDYuMTggYXQgMTA6NDMsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4g
PiA+IE9uIDI2LzA2LzE4IDA4OjI0LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gPiBAQCAtNjk4
LDI2ICs3MDEsMzAgQEAgc3RhdGljIHZvaWQgcHJpbnRrX3N0YXJ0X29mX2xpbmUoY29uc3QgYwo+
ID4gPiA+ICAgICAgICBjYXNlIFRTTV9EQVRFX01TOgo+ID4gPiA+ICAgICAgICAgICAgdG0gPSB3
YWxsY2xvY2tfdGltZSgmbnNlYyk7Cj4gPiA+ID4gLSAgICAgICAgaWYgKCB0bS50bV9tZGF5ID09
IDAgKQo+ID4gPiA+IC0gICAgICAgICAgICByZXR1cm47Cj4gPiA+ID4gLQo+ID4gPiA+IC0gICAg
ICAgIGlmICggb3B0X2Nvbl90aW1lc3RhbXBfbW9kZSA9PSBUU01fREFURSApCj4gPiA+ID4gLSAg
ICAgICAgICAgIHNucHJpbnRmKHRzdHIsIHNpemVvZih0c3RyKSwgIlslMDR1LSUwMnUtJTAydSAl
MDJ1OiUwMnU6JTAydV0gIiwKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgMTkwMCArIHRt
LnRtX3llYXIsIHRtLnRtX21vbiArIDEsIHRtLnRtX21kYXksCj4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgIHRtLnRtX2hvdXIsIHRtLnRtX21pbiwgdG0udG1fc2VjKTsKPiA+ID4gPiAtICAg
ICAgICBlbHNlCj4gPiA+ID4gKyAgICAgICAgaWYgKCB0bS50bV9tZGF5ICkKPiA+ID4gPiArICAg
ICAgICB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgc25wcmludGYodHN0ciwgc2l6ZW9mKHRzdHIp
LAo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAiWyUwNHUtJTAydS0lMDJ1ICUwMnU6JTAy
dTolMDJ1LiUwMyJQUkl1NjQiXSAiLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBvcHRf
Y29uX3RpbWVzdGFtcF9tb2RlID09IFRTTV9EQVRFCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgID8gIlslMDR1LSUwMnUtJTAydSAlMDJ1OiUwMnU6JTAydV0gIgo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICA6ICJbJTA0dS0lMDJ1LSUwMnUgJTAydTolMDJ1OiUwMnUuJTAzIlBSSXU2
NCJdICIsCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgMTkwMCArIHRtLnRtX3llYXIs
IHRtLnRtX21vbiArIDEsIHRtLnRtX21kYXksCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgdG0udG1faG91ciwgdG0udG1fbWluLCB0bS50bV9zZWMsIG5zZWMgLyAxMDAwMDAwKTsKPiA+
ID4gCj4gPiA+IEkgZmluZCB0aGlzIGNoYW5nZSByYXRoZXIgZGlmZmljdWx0IHRvIHJlYWQgYmVj
YXVzZSB0aGUgbnVtYmVyIG9mCj4gPiA+IGFyZ3VtZW50cyBmb3IgdGhlIDIgZm9ybWF0cyBhcmUg
ZGlmZmVyZW50LiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8ga2VlcAo+ID4gPiB0aGUgdHdvIHNucHJp
bnRmIHNlcGFyYXRlbHkuCj4gPiAKPiA+IEFuZCBJIGZpbmQgdGhlIHJlZHVuZGFuY3kgcmF0aGVy
IHVnbHkgdG8gbWFpbnRhaW4sIHNvIEknZCBwcmVmZXIgdG8gc3RpY2sgdG8KPiA+IHNpbmdsZSBp
bnZvY2F0aW9uLgo+IAo+IE1heWJlIGl0IGlzIGZvciB5b3UuIE5vdCBmb3IgbWUuCgpJJ20gaW4g
YWdyZWVtZW50IHdpdGggSnVsaWVuLiBJdHMgbm90IGVhc3kgdG8gZm9sbG93IGFuZCBjZXJ0YWlu
bHkgbm90CmhhdmluZyB0aGUgbnVtYmVyIG9mIGFyZ3VtZW50cyBsaW5lIHVwIGxvb2tzIGxpa2Ug
YSAiY29kZSBzbWVsbCIgdG8gbWUuCgotLQpEb3VnCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
