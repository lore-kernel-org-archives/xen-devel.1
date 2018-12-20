From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 07/25] xen (ARM,
 x86): add errno-returning functions for copy
Date: Wed, 19 Dec 2018 21:16:38 -0800
Message-ID: <CACMJ4GaUTxrVKvTvNUYUz0vkMHSUp6zsJr_aAh_TxvnazCr2Pg@mail.gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-8-git-send-email-christopher.w.clark@gmail.com>
 <20181212160149.aoaevnf66q72oa7k@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZmS=O5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gZqhY-0006fD-PE
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 05:16:52 +0000
Received: by mail-lj1-x244.google.com with SMTP id v1-v6so408954ljd.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 21:16:51 -0800 (PST)
In-Reply-To: <20181212160149.aoaevnf66q72oa7k@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, James McKenzie <voreekf@madingley.org>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTIsIDIwMTggYXQgODowMyBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE5vdiAzMCwgMjAxOCBhdCAwNTozMjo0
NlBNIC0wODAwLCBDaHJpc3RvcGhlciBDbGFyayB3cm90ZToKPiA+IEFwcGxpZWQgdG8gYm90aCB4
ODYgYW5kIEFSTSBoZWFkZXJzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENs
YXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Cj4gPiAtLS0KPiA+ICB4ZW4v
aW5jbHVkZS9hc20tYXJtL2d1ZXN0X2FjY2Vzcy5oIHwgMjUgKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ID4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3RfYWNjZXNzLmggfCAyOSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ID4gIHhlbi9pbmNsdWRlL3hlbi9ndWVzdF9hY2Nlc3Mu
aCAgICAgfCAgMyArKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9ndWVzdF9hY2Nlc3MuaCBiL3hl
bi9pbmNsdWRlL2FzbS1hcm0vZ3Vlc3RfYWNjZXNzLmgKPiA+IGluZGV4IDIyNGQyYTAuLjdiNmY4
OWMgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2d1ZXN0X2FjY2Vzcy5oCj4g
PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2d1ZXN0X2FjY2Vzcy5oCj4gPiBAQCAtMjQsNiAr
MjQsMTEgQEAgaW50IGFjY2Vzc19ndWVzdF9tZW1vcnlfYnlfaXBhKHN0cnVjdCBkb21haW4gKmQs
IHBhZGRyX3QgaXBhLCB2b2lkICpidWYsCj4gPiAgI2RlZmluZSBfX3Jhd19jb3B5X2Zyb21fZ3Vl
c3QgcmF3X2NvcHlfZnJvbV9ndWVzdAo+ID4gICNkZWZpbmUgX19yYXdfY2xlYXJfZ3Vlc3QgcmF3
X2NsZWFyX2d1ZXN0Cj4gPgo+ID4gKyNkZWZpbmUgcmF3X2NvcHlfZnJvbV9ndWVzdF9lcnJubyhk
c3QsIHNyYywgbGVuKSAgICAgICAgICAgICBcCj4gPiArICAgIChyYXdfY29weV9mcm9tX2d1ZXN0
KChkc3QpLCAoc3JjKSwgKGxlbikpID8gLUVGQVVMVCA6IDApCj4gPiArI2RlZmluZSByYXdfY29w
eV90b19ndWVzdF9lcnJubyhkc3QsIHNyYywgbGVuKSAgICAgICAgICAgICAgIFwKPiA+ICsgICAg
KHJhd19jb3B5X3RvX2d1ZXN0KChkc3QpLCAoc3JjKSwgKGxlbikpID8gLUVGQVVMVCA6IDApCj4K
PiBTaW5jZSB0aGUgb25seSBlcnJvciB0aGF0IHlvdSByZXR1cm4gaXMgRUZBVUxULCBJIGRvbid0
IHJlYWxseSBzZWUgdGhlCj4gcG9pbnQgaW4gYWRkaW5nIGFsbCB0aG9zZSBoZWxwZXJzLiBZb3Ug
YWNoaWV2ZSBleGFjdGx5IHRoZSBzYW1lIGJ5Cj4gcmV0dXJuaW5nIGEgYm9vbGVhbiBhbmQgZG9p
bmcgdGhlIHRyYW5zbGF0aW9uIHRvIEVGQVVMVCBpbiB0aGUgY2FsbGVyCj4gaWYgcmVxdWlyZWQu
Cj4KPiBJdCBtaWdodCBoYXZlIGJlZW4gbmljZSB0byBoYXZlIHRoZSBjb3B5IHRvL2Zyb20gc2V0
IG9mIGZ1bmN0aW9ucwo+IHJldHVybiBhbiBlcnJvciB2YWx1ZSwgYnV0IGFkZGluZyBhIG5ldyBz
ZXQgb2YgaGVscGVycyB0aGF0IGhhdmUgdGhlCj4gc2FtZSBmdW5jdGlvbmFsaXR5IGJ1dCBqdXN0
IGRpZmZlciBpbiB0aGUgcmV0dXJuIHZhbHVlIGxvb2sKPiByZWR1bmRhbnQuCgpJdCBpcyB0cnVl
IHRoYXQgdGhlcmUgaXMgcmVkdW5kYW5jeSB3aXRoIHRoZXNlIC0tIGJ1dCBJIHRoaW5rIHRoZXJl
IGFyZSBkZWNlbnQKYXJndW1lbnRzIGluIGZhdm91ciBvZiB0YWtpbmcgdGhlc2UgaW46CgoqIHRo
ZSBlcnJuby1wcm92aWRpbmcgaW50ZXJmYWNlIGlzIGp1c3QgYSBiZXR0ZXIgZml0IGZvciBhbG1v
c3QgZXZlcnkgY2FsbCBzaXRlCi0gd2hpY2ggbWVhbnMgbGVzcyBzb3VyY2UgY29kZSBpbiB0b3Rh
bCwgdGhhdCBpcyBlYXNpZXIgdG8gcmVhZC4KCiogaXQgaXMgcHJvbW90aW5nIGdvb2QgaW50ZXJm
YWNlIGRlc2lnbiBmb3IgZXJyb3IgaGFuZGxpbmc6CiAgcmV0dXJuIG9mIGVycm9yIGNvZGUuCgoq
IHNpbmNlIHRoZXNlIGFyZSBpbiB1c2Ugd2l0aGluIHRoZSB1eGVuIHNvdXJjZSBjb2RlLCBpdCBl
YXNlcyBjb21wYXJpc29uIGFuZAogIHdvcmsgYWNyb3NzIGJvdGggY29kZWJhc2VzIC0gcmVsZXZh
bnQgZm9yIEFyZ28sIGR1ZSB0byB2NHYuCgpJJ3ZlIHJld3JpdHRlbiB0aGUgaW1wbGVtZW50YXRp
b24gb2YgdGhlc2UgZm9yIHRoZSBzZWNvbmQgdmVyc2lvbiBvZiB0aGUgcGF0Y2gKc2VyaWVzIC0t
IG5vdyBtdWNoIHNpbXBsZXIgLS0gYW5kIGhvcGVmdWxseSB0aGF0IHdpbGwgbWl0aWdhdGUgc29t
ZSBvZiB5b3VyCmNvbmNlcm4gYWJvdXQgdGhlbS4KCkNocmlzdG9waGVyCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
