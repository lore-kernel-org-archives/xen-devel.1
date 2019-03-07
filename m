From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] x86/mtrr: fix build with gcc9
Date: Thu, 7 Mar 2019 15:20:18 +0100
Message-ID: <20190307142018.znh74smoi4nnt4ds@Air-de-Roger>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
 <5C80F32C020000780021C626@prv1-mh.provo.novell.com>
 <20190307105554.42ek2lerz7nujfef@Air-de-Roger>
 <5C80FEE5020000780021C6D5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZO0X=RK=citrix.com=prvs=96265d518=roger.pau@srs-us1.protection.inumbo.net>)
 id 1h1tyk-0003XM-7I
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 14:26:34 +0000
Content-Disposition: inline
In-Reply-To: <5C80FEE5020000780021C6D5@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Charles Arnold <CARNOLD@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMDQ6MjI6MTNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjAzLjE5IGF0IDExOjU1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMDM6MzI6MTJBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gZ2VuZXJpYy5jOiBJbiBmdW5jdGlvbiDigJhwcmludF9tdHJyX3N0
YXRl4oCZOgo+ID4+IGdlbmVyaWMuYzoyMTA6MTE6IGVycm9yOiDigJglMCpseOKAmSBkaXJlY3Rp
dmUgb3V0cHV0IGJldHdlZW4gMSBhbmQgMTA3Mzc0MTgyMyBieXRlcyBtYXkgY2F1c2UgcmVzdWx0
IHRvIGV4Y2VlZAo+ID4+IOKAmElOVF9NQVjigJkgWy1XZXJyb3I9Zm9ybWF0LW92ZXJmbG93PV0K
PiA+PiAgIDIxMCB8ICAgIHByaW50aygiJXMgICV1IGJhc2UgJTAqIlBSSXg2NCIwMDAgbWFzayAl
MCoiUFJJeDY0IjAwMCAlc1xuIiwKPiA+PiAgICAgICB8ICAgICAgICAgICBefn5+fn5+fn5+fn5+
fn5+fgo+ID4+IGdlbmVyaWMuYzoyMTA6NDQ6IG5vdGU6IGZvcm1hdCBzdHJpbmcgaXMgZGVmaW5l
ZCBoZXJlCj4gPj4gICAyMTAgfCAgICBwcmludGsoIiVzICAldSBiYXNlICUwKiJQUkl4NjQiMDAw
IG1hc2sgJTAqIlBSSXg2NCIwMDAgJXNcbiIsCj4gPj4gZ2VuZXJpYy5jOjIxMDoxMTogbm90ZTog
ZGlyZWN0aXZlIGFyZ3VtZW50IGluIHRoZSByYW5nZSBbMCwgNDUwMzU5OTYyNzM3MDQ5NV0KPiA+
PiAgIDIxMCB8ICAgIHByaW50aygiJXMgICV1IGJhc2UgJTAqIlBSSXg2NCIwMDAgbWFzayAlMCoi
UFJJeDY0IjAwMCAlc1xuIiwKPiA+PiAgICAgICB8ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fgo+ID4+IGdlbmVyaWMuYzoyMTA6MTE6IG5vdGU6IGFzc3VtaW5nIGRpcmVjdGl2ZSBvdXRwdXQg
b2YgMSBieXRlCj4gPj4gCj4gPj4gUmVzdHJpY3QgdGhlIHdpZHRoIG9mIHRoZSB2YXJpYWJsZSAi
d2lkdGgiIGNvbnRyb2xsaW5nIHRoZSBudW1iZXIgb2YKPiA+PiBhZGRyZXNzIGRpZ2l0cyBvdXRw
dXQuCj4gPiAKPiA+IEkgaGF2ZSB0byBhZG1pdCBJJ20gbm90IHN1cmUgd2h5IGdjYyBjb21wbGFp
bnMgaGVyZSwgYW5kIHdoeSBzd2l0Y2hpbmcKPiA+IHRvIHVuc2lnbmVkIGNoYXIgZml4ZXMgaXQu
IHVuc2lnbmVkIGNoYXIgbWF4IHZhbHVlIHdvdWxkIGJlIDI1NSwgd2hpY2gKPiA+IHdoZW4gdXNl
ZCBhcyBhIHdpZHRoIHRvIHByaW50IGFuIHVuc2lnbmVkIGxvbmcgaXQncyBhbHNvIHRvbyBoaWdo
Pwo+IAo+IFdpdGgKPiAKPiAJd2lkdGggPSAocGFkZHJfYml0cyAtIFBBR0VfU0hJRlQgKyAzKSAv
IDQ7Cj4gCj4gZ2NjIHNpbXBseSBjYW4ndCBrbm93IHRoYXQgdGhlIHZhbGlkIHZhbHVlIHJhbmdl
IGlzIHJhdGhlciBzbWFsbC4gSGVuY2UKPiBpdCBhc3N1bWVzIG1pbGxpb25zIG9mIGxlYWRpbmcg
emVyb3MgX2NvdWxkXyBiZSBwcmludGVkLiBUaGVpciBkb2MKPiBleHBsaWNpdGx5IHN1Z2dlc3Rz
IHVzaW5nIGEgbW9yZSBuYXJyb3cgdHlwZSwgd2hpY2ggaXMgd2h5IC4uLgo+IAo+ID4gRG9lcyBj
aGVja2luZyB0aGF0IHdpZHRoIDw9IDE2IGFsc28gcGxhY2F0ZSBnY2M/Cj4gCj4gLi4uIEkgZGlk
bid0IGV2ZW4gdHJ5IHRoaXMgb3B0aW9uIChkZXNwaXRlIGhhdmluZyBjb25zaWRlcmVkIGl0KS4K
CkFjaywgaWYgdGhhdCdzIHRoZSByZWNvbW1lbmRlZCB3YXkuIEkgd291bGQgcHJlZmVyIHVzaW5n
IHVuc2lnbmVkIGludAphbmQgYWRkaW5nIGEgQlVHX09OIGlmID4gMTYuIEFueXdheToKClJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcy4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
