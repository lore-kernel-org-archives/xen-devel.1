From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 4/5] amd/iommu: assign iommu devices to
 Xen
Date: Thu, 15 Nov 2018 08:34:44 -0700
Message-ID: <5BED921402000078001FC78F@prv1-mh.provo.novell.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wsre=n2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gNJfN-0000BO-Q8
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 15:34:49 +0000
In-Reply-To: <20181114115740.1050-5-roger.pau@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjExLjE4IGF0IDEyOjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPiArKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4gQEAgLTk5Myw2ICs5OTMs
MTYgQEAgc3RhdGljIHZvaWQgKiBfX2luaXQgYWxsb2NhdGVfcHByX2xvZyhzdHJ1Y3QgYW1kX2lv
bW11ICppb21tdSkKPiAgCj4gIHN0YXRpYyBpbnQgX19pbml0IGFtZF9pb21tdV9pbml0X29uZShz
dHJ1Y3QgYW1kX2lvbW11ICppb21tdSkKPiAgewo+ICsgICAgc3RydWN0IHBjaV9kZXYgKnBkZXY7
Cj4gKwo+ICsgICAgcGNpZGV2c19sb2NrKCk7Cj4gKyAgICBwZGV2ID0gcGNpX2dldF9wZGV2KGlv
bW11LT5zZWcsIFBDSV9CVVMoaW9tbXUtPmJkZiksCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
IFBDSV9ERVZGTjIoaW9tbXUtPmJkZikpOwo+ICsgICAgaWYgKCBwZGV2ICkKPiArICAgICAgICAv
KiBBc3NpZ24gdGhlIElPTU1VIFBDSSBkZXZpY2UgdG8gWGVuICAqLwo+ICsgICAgICAgIHBkZXYt
PmRvbWFpbiA9IGRvbV94ZW47Cj4gKyAgICBwY2lkZXZzX3VubG9jaygpOwoKV2h5IGRvIHlvdSBr
aW5kIG9mIG9wZW4tY29kZSBwY2lfaGlkZV9kZXZpY2UoKT8gSXQgd291bGQgbmVlZApleHRlbmRp
bmcgdG8gY29wZSB3aXRoIGEgbm9uLXplcm8gc2VnbWVudCBudW1iZXIsIGJ1dCBJJ2QgbXVjaApw
cmVmZXIgaWYgdGhlcmUgY291bGQgYmUgb25lIGNlbnRyYWwgcGxhY2Ugd2hlcmUgdGhlIGxvZ2lj
IGxpdmVzLgpUaGF0IHdheSBsaXN0IGFkZGl0aW9uIHdvdWxkIGFsc28gbm90IGJlIG9taXR0ZWQs
IGxpa2UgeW91IGRvLgoKQXMgdG8gdGhlIGhpZGluZyBpbiBnZW5lcmFsLCBhbHNvIGNvbnNpZGVy
aW5nIEFuZHJldydzIG9iamVjdGlvbjoKQXJlIHRoZXNlIGRldmljZXMgcmVwcmVzZW50aW5nIHRo
ZSBJT01NVSBhbmQgbm90aGluZyBlbHNlPyBBcwptZW50aW9uZWQgYnkgQW5kcmV3IHNvbWV0aGlu
ZyBzaW1pbGFyIHdvdWxkIGJlIG5lZWRlZCBvbiB0aGUKVlQtZCBzaWRlLCBidXQgaWlyYyB0aGVy
ZSdzIGxlc3MgY2xlYXIgb2YgYSByZWxhdGlvbnNoaXAgdGhlcmUgaW4gYW55CmV2ZW50ICh3aGlj
aCBjYXVzZXMgbWUgdG8gd29uZGVyIGFib3V0IHRoZSBzaXR1YXRpb24gb24gdGhlCkFNRCBzaWRl
KS4gSSdtIGFza2luZyBub3QgdGhlIGxlYXN0IGJlY2F1c2UgaWlyYyBhdCB0aGUgdGltZQpwY2lf
aGlkZV9kZXZpY2UoKSB3YXMgaW50cm9kdWNlZCBJIHRoaW5rIGl0IHdhcyBjb25zaWRlcmVkIHRv
CmhpZGUgdGhlIEFNRCBJT01NVSBkZXZpY2VzOyBJIGRvbid0IHJlY2FsbCB3aHkgd2UgZGlkbid0
IGluIHRoZQplbmQsIHRob3VnaC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
