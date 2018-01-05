From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 31/74] x86: read wallclock from Xen
 running in pvh mode
Date: Fri, 05 Jan 2018 07:43:31 -0700
Message-ID: <5A4F9D23020000780019B6D9@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-32-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ivak=ea=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eXTDg-00054O-Os
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 14:43:40 +0000
In-Reply-To: <20180104130625.28605-32-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGggYSBzdWdnZXN0aW9uIG9uIGNv
ZGUgc3RydWN0dXJlOgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvdGltZS5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L3RpbWUuYwo+IEBAIC05NjksNiArOTY5LDM2IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25n
IGdldF9jbW9zX3RpbWUodm9pZCkKPiAgICAgIHJldHVybiBta3RpbWUocnRjLnllYXIsIHJ0Yy5t
b24sIHJ0Yy5kYXksIHJ0Yy5ob3VyLCBydGMubWluLCBydGMuc2VjKTsKPiAgfQo+ICAKPiArc3Rh
dGljIHVuc2lnbmVkIGxvbmcgbm9pbmxpbmUgZ2V0X3hlbl93YWxsY2xvY2tfdGltZSh2b2lkKQo+
ICt7Cj4gKyNpZmRlZiBDT05GSUdfWEVOX0dVRVNUCj4gKyAgICBzdHJ1Y3Qgc2hhcmVkX2luZm8g
KnNoX2luZm8gPSBYRU5fc2hhcmVkX2luZm87Cj4gKyAgICB1aW50MzJfdCB3Y192ZXJzaW9uOwo+
ICsgICAgdWludDY0X3Qgd2Nfc2VjOwo+ICsKPiArICAgIGRvIHsKPiArICAgICAgICB3Y192ZXJz
aW9uID0gc2hfaW5mby0+d2NfdmVyc2lvbiAmIH4xOwo+ICsgICAgICAgIHNtcF9ybWIoKTsKPiAr
Cj4gKyAgICAgICAgd2Nfc2VjICA9IHNoX2luZm8tPndjX3NlYzsKPiArICAgICAgICBzbXBfcm1i
KCk7Cj4gKyAgICB9IHdoaWxlICggd2NfdmVyc2lvbiAhPSBzaF9pbmZvLT53Y192ZXJzaW9uICk7
Cj4gKwo+ICsgICAgcmV0dXJuIHdjX3NlYyArIHJlYWRfeGVuX3RpbWVyKCkgLyAxMDAwMDAwMDAw
OwoKV2h5IG5vdCBtb3ZlIGFsbCBvZiB0aGlzIC4uLgoKPiArI2Vsc2UKPiArICAgIEFTU0VSVF9V
TlJFQUNIQUJMRSgpOwo+ICsgICAgcmV0dXJuIDA7Cj4gKyNlbmRpZgo+ICt9Cj4gKwo+ICtzdGF0
aWMgdW5zaWduZWQgbG9uZyBnZXRfd2FsbGNsb2NrX3RpbWUodm9pZCkKPiArewoKLi4uIGhlcmU6
CgojaWZkZWYgQ09ORklHX1hFTl9HVUVTVAogICAgaWYgKCB4ZW5fZ3Vlc3QgKQogICAgewogICAg
ICAgIC4uLgogICAgICAgIHJldHVybiB3Y19zZWMgKyByZWFkX3hlbl90aW1lcigpIC8gMTAwMDAw
MDAwMDsKICAgIH0KI2VuZGlmCgogICByZXR1cm4gZ2V0X2Ntb3NfdGltZSgpOwp9Cgphdm9pZGlu
ZyBvbmUgb2YgdGhlc2Ugbm90IHZlcnkgbmljZSBBU1NFUlRfVU5SRUFDSEFCTEUoKT8KCkphbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
