From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 05/25] argo: Add initial argo_init and
 argo_destroy
Date: Thu, 13 Dec 2018 06:16:49 -0700
Message-ID: <5C125BC10200007800205D55@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-6-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXQrH-0003yM-Hd
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 13:16:55 +0000
In-Reply-To: <1543627984-21394-6-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEyLjE4IGF0IDAyOjMyLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IC0tLSAvZGV2L251bGwKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJnby5o
Cj4gQEAgLTAsMCArMSw1NSBAQAo+ICsvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gKyAqIEFyZ28g
OiBIeXBlcnZpc29yLU1lZGlhdGVkIGRhdGEgZVhjaGFuZ2UKPiArICoKPiArICogRGVyaXZlZCBm
cm9tIHY0diwgdGhlIHZlcnNpb24gMiBvZiB2MnYuCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoYykg
MjAxMCwgQ2l0cml4IFN5c3RlbXMKPiArICogQ29weXJpZ2h0IChjKSAyMDE4LCBCQUUgU3lzdGVt
cwo+ICsgKgo+ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhh
dCBpdCB3aWxsIGJlIHVzZWZ1bCwKPiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRo
b3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKPiArICogTUVSQ0hBTlRBQklMSVRZIG9y
IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQo+ICsgKiBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgo+ICsgKgo+ICsgKiBZb3Ugc2hv
dWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZQo+ICsgKiBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJl
ZSBTb2Z0d2FyZQo+ICsgKiBGb3VuZGF0aW9uLCBJbmMuLCA1OSBUZW1wbGUgUGxhY2UsIFN1aXRl
IDMzMCwgQm9zdG9uLCBNQSAgMDIxMTEtMTMwNyAgVVNBCj4gKyAqLwo+ICsKPiArI2lmbmRlZiBf
X1hFTl9QVUJMSUNfQVJHT19IX18KPiArI2RlZmluZSBfX1hFTl9QVUJMSUNfQVJHT19IX18KPiAr
Cj4gKyNpbmNsdWRlICJ4ZW4uaCIKPiArCj4gK3R5cGVkZWYgc3RydWN0IGFyZ29fYWRkcgo+ICt7
Cj4gKyAgICB1aW50MzJfdCBwb3J0Owo+ICsgICAgZG9taWRfdCBkb21haW5faWQ7Cj4gKyAgICB1
aW50MTZfdCBwYWQ7Cj4gK30gYXJnb19hZGRyX3Q7Cj4gKwo+ICt0eXBlZGVmIHN0cnVjdCBhcmdv
X3JpbmdfaWQKPiArewo+ICsgICAgc3RydWN0IGFyZ29fYWRkciBhZGRyOwo+ICsgICAgZG9taWRf
dCBwYXJ0bmVyOwo+ICsgICAgdWludDE2X3QgcGFkOwo+ICt9IGFyZ29fcmluZ19pZF90Owo+ICsK
PiArdHlwZWRlZiBzdHJ1Y3QgYXJnb19yaW5nCj4gK3sKPiArICAgIHVpbnQ2NF90IG1hZ2ljOwo+
ICsgICAgYXJnb19yaW5nX2lkX3QgaWQ7Cj4gKyAgICB1aW50MzJfdCBsZW47Cj4gKyAgICAvKiBH
dWVzdHMgc2hvdWxkIHVzZSBhdG9taWMgb3BlcmF0aW9ucyB0byBhY2Nlc3MgcnhfcHRyICovCj4g
KyAgICB1aW50MzJfdCByeF9wdHI7Cj4gKyAgICAvKiBHdWVzdHMgc2hvdWxkIHVzZSBhdG9taWMg
b3BlcmF0aW9ucyB0byBhY2Nlc3MgdHhfcHRyICovCj4gKyAgICB1aW50MzJfdCB0eF9wdHI7Cj4g
KyAgICB1aW50OF90IHJlc2VydmVkWzMyXTsKPiArI2lmIGRlZmluZWQoX19TVERDX1ZFUlNJT05f
XykgJiYgX19TVERDX1ZFUlNJT05fXyA+PSAxOTk5MDFMCj4gKyAgICB1aW50OF90IHJpbmdbXTsK
PiArI2VsaWYgZGVmaW5lZChfX0dOVUNfXykKPiArICAgIHVpbnQ4X3QgcmluZ1swXTsKPiArI2Vu
ZGlmCj4gK30gYXJnb19yaW5nX3Q7CgpCdHcsIGZvciBhbGwgc3RydWN0dXJlIHR5cGVzIHlvdSBk
ZWZpbmUsIGFuZCB3aXRoIHlvdXIgZGVzaXJlIHRvIGF2b2lkCmNvbXBhdCBtb2RlIHRyYW5zbGF0
aW9uLCB5b3Ugc2hvdWxkIGFkZCA/LXByZWZpeGVkIGVudHJpZXMgdG8KeGVuL2luY2x1ZGUveGxh
dC5sc3QgYW5kIGludm9rZSB0aGUgcHJvZHVjZWQgQ0hFQ0tfKiBtYWNyb3MgZnJvbQpzb21ld2hl
cmUuIElmLCBmb3IgcmVmZXJlbmNlLCB5b3UnZCBsb29rIGF0IGV4aXN0aW5nIGluc3RhbmNlcywg
eW91J2xsCnRoZW4gYWxzbyBmaW5kIGFub3RoZXIgcmVhc29uIHdoeSBhbGwgdGhlc2Ugd291bGQg
YmV0dGVyIGhhdmUgeGVuXwpwcmVmaXhlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
