From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v2 1/6] docs/qemu-deprivilege: Revise and
 update with status and future plans
Date: Fri, 28 Sep 2018 12:37:22 +0100
Message-ID: <CAFLBxZaoFcpAc+NKmDoN3f37EiPNXC41tTgNRQ-9bam04waryQ@mail.gmail.com>
References: <20180921170428.13771-1-george.dunlap@citrix.com>
 <20180925112001.GE2244@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jces=mk=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1g5r5U-00068w-4p
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 11:37:36 +0000
Received: by mail-qt1-x843.google.com with SMTP id l2-v6so6145015qtr.12
 for <xen-devel@lists.xenproject.org>; Fri, 28 Sep 2018 04:37:34 -0700 (PDT)
In-Reply-To: <20180925112001.GE2244@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMjUsIDIwMTggYXQgMTI6MjAgUE0gQW50aG9ueSBQRVJBUkQKPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMjEsIDIwMTggYXQgMDY6
MDQ6MjNQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiA+ICsjIyBNaWdyYXRpb24KPiA+
ICsKPiA+ICtXaGVuIGNhbGxpbmcgeGVuLXNhdmUtZGV2aWNlcy1zdGF0ZSwgc2luY2UgUUVNVSBp
cyBydW5uaW5nIGluIGEgY2hyb290Cj4gPiAraXQgaXMgbm90IHVzZWZ1bCB0byBwYXNzIGEgZmls
ZW5hbWUgKGl0IGRvZXNuJ3QgZXZlbiBoYXZlIHdyaXRlIGFjY2Vzcwo+ID4gK2luc2lkZSB0aGUg
Y2hyb290KS4gSW5zdGVhZCwgZ2l2ZSBpdCBhbiBvcGVuIGZkIHVzaW5nIHRoZSBhZGQtZmQKPiA+
ICttZWNoYW5pc20uCj4KPiBUaGF0IGRlc2NyaWJlIGFuIGlzc3VlIG9ubHkgb24gc2F2ZS4gVGhl
IHJlc3RvcmUgcGFydCBvZiBhIG1pZ3JhdGlvbgo+IGFsc28gaGF2ZSBhbiBpc3N1ZToKPgo+IE9u
IHJlc3RvcmUsIFFFTVUgc2lnbmFsIHRvIGxpYnhsIHRoYXQgaXQgaXMgcmVhZHkgb25seSBhZnRl
ciBwcml2aWxlZGdlCj4gcmVzdHJpY3Rpb24gaGF2ZSBiZWVuIHB1dCBpbiBwbGFjZSAoYW5kIGFm
dGVyIG9yIHdoZW4gaXQgcmVjZWl2ZSB0aGUKPiBtaWdyYXRpb24gZGF0YSkuIEJ1dCB4ZW5zdG9y
ZSBpc24ndCBhdmFpbGFibGUgYW55bW9yZSwgc28gcmVzdG9yZSBmYWlscwo+IGZyb20gbGlieGwg
cG9pbnQtb2Ytdmlldy4KPgo+Cj4gT3IgbWF5YmUgeW91IGRlc2NyaWJlIGhlcmUgYW4gaXNzdWUg
dGhhdCB3b3VsZCBhcmlzZSB3aGVuIGFuIGh5cG90aGV0aWMKPiBjaHJvb3QgaXMgYXBwbHkuIEJ1
dCB0aGUgbWlncmF0aW9uIGlzc3VlIGRlc2NyaWJlIGhlcmUgc3RpbGwgYXBwbHkKPiB3aXRob3V0
IGNocm9vdCBhbmQgd2l0aCBvbmx5IC1ydW5hcywgdGhlIHBhdGggbGlieGwgZ2l2ZSB0byBRRU1V
IGlzCj4gYWNjZXNzaWJsZSBieSByb290IG9ubHkuCgpEbyBvdXIgb3RoZXIgcmVzdHJpY3Rpb25z
IC0tIGNocm9vdCwgZGVwcml2aWxlZ2UsICZjIC0tIGFsbCB3b3JrIG9uCnJlc3RvcmUgYXQgdGhl
IG1vbWVudD8KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
