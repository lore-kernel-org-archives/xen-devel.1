From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] xen: make opt_xen_console true before
 console initialisation
Date: Fri, 28 Sep 2018 09:08:34 -0600
Message-ID: <5BAE43F202000078001ECF13@prv1-mh.provo.novell.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
 <20180928082437.15140-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ucvl=mk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g5uNj-00076c-Hh
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:08:39 +0000
In-Reply-To: <20180928082437.15140-3-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA5LjE4IGF0IDEwOjI0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPiArKysgYi94ZW4vZHJpdmVycy9jaGFy
L2NvbnNvbGUuYwo+IEBAIC05MSw3ICs5MSw4IEBAIHN0YXRpYyB1aW50MzJfdCBjb25yaW5nYywg
Y29ucmluZ3A7Cj4gIHN0YXRpYyBpbnQgX19yZWFkX21vc3RseSBzZXJjb25faGFuZGxlID0gLTE7
Cj4gIAo+ICAjaWZkZWYgQ09ORklHX1g4Ngo+IC1zdGF0aWMgYm9vbCBfX3JlYWRfbW9zdGx5IG9w
dF9jb25zb2xlX3hlbjsgLyogY29uc29sZT14ZW4gKi8KPiArLyogU2V0IHRvIHRydWUgYXQgc3Rh
cnQgb2YgZGF5IHRvIGNhdGNoIGVhcmx5IGJvb3QgaXNzdWVzICovCj4gK3N0YXRpYyBib29sIF9f
cmVhZF9tb3N0bHkgb3B0X2NvbnNvbGVfeGVuID0gdHJ1ZTsgLyogY29uc29sZT14ZW4gKi8KCldo
ZW4gQW5kcmV3IHN1Z2dlc3RlZCB0aGlzLCBpaXJjIGhlIHNhaWQgdG8gbWFrZSB0aGUgdmFyaWFi
bGUKdHJpc3RhdGUuIE90aGVyd2lzZSAuLi4KCj4gQEAgLTgyMSw2ICs4MjIsMTAgQEAgdm9pZCBf
X2luaXQgY29uc29sZV9pbml0X3ByZWlycSh2b2lkKQo+ICAKPiAgICAgIHNlcmlhbF9pbml0X3By
ZWlycSgpOwo+ICAKPiArI2lmZGVmIENPTkZJR19YODYKPiArICAgIG9wdF9jb25zb2xlX3hlbiA9
IGZhbHNlOwo+ICsjZW5kaWYKCi4uLiB5b3UgcG9zc2libHkgb3ZlcnJpZGUgYSB1c2VyIHNwZWNp
ZmllZCAidHJ1ZSIgaGVyZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
