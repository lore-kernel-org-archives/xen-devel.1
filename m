From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/mtrr: fix build with gcc9
Date: Thu, 07 Mar 2019 04:22:13 -0700
Message-ID: <5C80FEE5020000780021C6D5@prv1-mh.provo.novell.com>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
 <5C80F32C020000780021C626@prv1-mh.provo.novell.com>
 <20190307105554.42ek2lerz7nujfef@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1r6S-00056X-3A
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 11:22:20 +0000
In-Reply-To: <20190307105554.42ek2lerz7nujfef@Air-de-Roger>
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
Cc: Charles Arnold <CARNOLD@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAzLjE5IGF0IDExOjU1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgTWFyIDA3LCAyMDE5IGF0IDAzOjMyOjEyQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBnZW5lcmljLmM6IEluIGZ1bmN0aW9uIOKAmHByaW50X210cnJfc3RhdGXigJk6Cj4+
IGdlbmVyaWMuYzoyMTA6MTE6IGVycm9yOiDigJglMCpseOKAmSBkaXJlY3RpdmUgb3V0cHV0IGJl
dHdlZW4gMSBhbmQgMTA3Mzc0MTgyMyBieXRlcyBtYXkgY2F1c2UgcmVzdWx0IHRvIGV4Y2VlZAo+
PiDigJhJTlRfTUFY4oCZIFstV2Vycm9yPWZvcm1hdC1vdmVyZmxvdz1dCj4+ICAgMjEwIHwgICAg
cHJpbnRrKCIlcyAgJXUgYmFzZSAlMCoiUFJJeDY0IjAwMCBtYXNrICUwKiJQUkl4NjQiMDAwICVz
XG4iLAo+PiAgICAgICB8ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgo+PiBnZW5lcmljLmM6
MjEwOjQ0OiBub3RlOiBmb3JtYXQgc3RyaW5nIGlzIGRlZmluZWQgaGVyZQo+PiAgIDIxMCB8ICAg
IHByaW50aygiJXMgICV1IGJhc2UgJTAqIlBSSXg2NCIwMDAgbWFzayAlMCoiUFJJeDY0IjAwMCAl
c1xuIiwKPj4gZ2VuZXJpYy5jOjIxMDoxMTogbm90ZTogZGlyZWN0aXZlIGFyZ3VtZW50IGluIHRo
ZSByYW5nZSBbMCwgNDUwMzU5OTYyNzM3MDQ5NV0KPj4gICAyMTAgfCAgICBwcmludGsoIiVzICAl
dSBiYXNlICUwKiJQUkl4NjQiMDAwIG1hc2sgJTAqIlBSSXg2NCIwMDAgJXNcbiIsCj4+ICAgICAg
IHwgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+Cj4+IGdlbmVyaWMuYzoyMTA6MTE6IG5vdGU6
IGFzc3VtaW5nIGRpcmVjdGl2ZSBvdXRwdXQgb2YgMSBieXRlCj4+IAo+PiBSZXN0cmljdCB0aGUg
d2lkdGggb2YgdGhlIHZhcmlhYmxlICJ3aWR0aCIgY29udHJvbGxpbmcgdGhlIG51bWJlciBvZgo+
PiBhZGRyZXNzIGRpZ2l0cyBvdXRwdXQuCj4gCj4gSSBoYXZlIHRvIGFkbWl0IEknbSBub3Qgc3Vy
ZSB3aHkgZ2NjIGNvbXBsYWlucyBoZXJlLCBhbmQgd2h5IHN3aXRjaGluZwo+IHRvIHVuc2lnbmVk
IGNoYXIgZml4ZXMgaXQuIHVuc2lnbmVkIGNoYXIgbWF4IHZhbHVlIHdvdWxkIGJlIDI1NSwgd2hp
Y2gKPiB3aGVuIHVzZWQgYXMgYSB3aWR0aCB0byBwcmludCBhbiB1bnNpZ25lZCBsb25nIGl0J3Mg
YWxzbyB0b28gaGlnaD8KCldpdGgKCgl3aWR0aCA9IChwYWRkcl9iaXRzIC0gUEFHRV9TSElGVCAr
IDMpIC8gNDsKCmdjYyBzaW1wbHkgY2FuJ3Qga25vdyB0aGF0IHRoZSB2YWxpZCB2YWx1ZSByYW5n
ZSBpcyByYXRoZXIgc21hbGwuIEhlbmNlCml0IGFzc3VtZXMgbWlsbGlvbnMgb2YgbGVhZGluZyB6
ZXJvcyBfY291bGRfIGJlIHByaW50ZWQuIFRoZWlyIGRvYwpleHBsaWNpdGx5IHN1Z2dlc3RzIHVz
aW5nIGEgbW9yZSBuYXJyb3cgdHlwZSwgd2hpY2ggaXMgd2h5IC4uLgoKPiBEb2VzIGNoZWNraW5n
IHRoYXQgd2lkdGggPD0gMTYgYWxzbyBwbGFjYXRlIGdjYz8KCi4uLiBJIGRpZG4ndCBldmVuIHRy
eSB0aGlzIG9wdGlvbiAoZGVzcGl0ZSBoYXZpbmcgY29uc2lkZXJlZCBpdCkuCgpKYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
