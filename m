From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxc: check for null size file mapping
Date: Mon, 12 Feb 2018 12:35:53 +0000
Message-ID: <20180212123553.jcdyuvkna4smteic@citrix.com>
References: <20180212120915.25515-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=co21=fg=citrix.com=prvs=5740883f0=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1elDKz-0007hA-PA
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 12:36:01 +0000
Content-Disposition: inline
In-Reply-To: <20180212120915.25515-1-semelpaul@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Semel <semelpaul@gmail.com>
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMTIsIDIwMTggYXQgMDE6MDk6MTVQTSArMDEwMCwgUGF1bCBTZW1lbCB3cm90
ZToKPiBDaGFuZ2VkIHRoZSBlcnJvciBtZXNzYWdlIHdoZW4gdHJ5aW5nIHRvIG1hcCBhIG51bGwg
c2l6ZSBmaWxlLgo+IFdoZW4gZG9pbmcgYHhsIGNyZWF0ZWAgY29tbWFuZCwgd2UgZ2V0IGFuIElu
dmFsaWQgS2VybmVsIGVycm9yCj4gd2hlbiB0aGUgZmlsZSBzaXplIGlzIGdyZWF0ZXIgdGhhbiB6
ZXJvLiBGb3IgemVybyBsZW5ndGggZmlsZXMsIHdlIGFyZQo+IGZhbGxpbmcgaW4gdGhlIG1tYXAg
ZXJyb3IsIGFuZCB3ZSBnZXQgYW4gYEludmFsaWQgcGFyYW1ldGVyYCBlcnJvciwKPiB3aGljaCBp
cyBub3QgZXhwbGljaXQuIFdpdGggdGhpcyBjaGFuZ2UsIHdlIGdldCBhIGB6ZXJvIGxlbmd0aCBm
aWxlYAo+IGVycm9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgU2VtZWwgPHNlbWVscGF1bEBn
bWFpbC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoaXMg
Y2FuIGluIGZhY3QgYmUgZG9uZSByaWdodCBhZnRlciBsc2VlaywgYnV0IEkgZG9uJ3QgdGhpbmsg
aXQgaXMKaW1wb3J0YW50IGVub3VnaCB0byBhc2sgeW91IHRvIHJld3JpdGUgeW91ciBwYXRjaC4g
Oi0pCgo+IC0tLQo+ICB0b29scy9saWJ4Yy94Y19kb21fY29yZS5jIHwgNiArKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4
Yy94Y19kb21fY29yZS5jIGIvdG9vbHMvbGlieGMveGNfZG9tX2NvcmUuYwo+IGluZGV4IDk2ZTcx
ZGQyZDkuLjliZDA0Y2IyZDUgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGMveGNfZG9tX2NvcmUu
Ywo+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV9jb3JlLmMKPiBAQCAtMjI1LDYgKzIyNSwxMiBA
QCB2b2lkICp4Y19kb21fbWFsbG9jX2ZpbGVtYXAoc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tLAo+
ICAgICAgICAgICAgICAgICAgICAgICAidHJpZWQgdG8gbWFwIGZpbGUgd2hpY2ggaXMgdG9vIGxh
cmdlIik7Cj4gICAgICAgICAgZ290byBlcnI7Cj4gICAgICB9Cj4gKyAgICBlbHNlIGlmICggISpz
aXplICkKPiArICAgIHsKPiArICAgICAgICB4Y19kb21fcGFuaWMoZG9tLT54Y2gsIFhDX0lOVEVS
TkFMX0VSUk9SLAo+ICsgICAgICAgICAgICAgICAgICAgICAiJyVzJzogemVybyBsZW5ndGggZmls
ZSIsIGZpbGVuYW1lKTsKPiArICAgICAgICBnb3RvIGVycjsKPiArICAgIH0KPiAgCj4gICAgICBi
bG9jayA9IG1hbGxvYyhzaXplb2YoKmJsb2NrKSk7Cj4gICAgICBpZiAoIGJsb2NrID09IE5VTEwg
KSB7Cj4gLS0gCj4gMi4xNi4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
