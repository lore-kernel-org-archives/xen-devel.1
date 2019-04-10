From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/3] xen: remove tmem from hypervisor
Date: Wed, 10 Apr 2019 04:55:50 -0600
Message-ID: <5CADCBB60200007800226206@prv1-mh.provo.novell.com>
References: <20190409165210.7624-1-wei.liu2@citrix.com>
 <20190409165210.7624-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEAvS-0003cB-Qh
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 10:57:54 +0000
In-Reply-To: <20190409165210.7624-3-wei.liu2@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA0LjE5IGF0IDE4OjUyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVyY2FsbF9wYWdlLlMKPiArKysgYi94ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJjYWxsX3BhZ2UuUwo+IEBAIC01OCw4ICs1OCw4IEBAIERFQ0xBUkVf
SFlQRVJDQUxMKGh2bV9vcCkKPiAgREVDTEFSRV9IWVBFUkNBTEwoc3lzY3RsKQo+ICBERUNMQVJF
X0hZUEVSQ0FMTChkb21jdGwpCj4gIERFQ0xBUkVfSFlQRVJDQUxMKGtleGVjX29wKQo+IC1ERUNM
QVJFX0hZUEVSQ0FMTCh0bWVtX29wKQo+ICBERUNMQVJFX0hZUEVSQ0FMTChhcmdvX29wKQo+ICtE
RUNMQVJFX0hZUEVSQ0FMTCh4Y19yZXNlcnZlZF9vcCkKCklzIHRoaXMgYWRkZWQgbGluZSBhIHJl
LWJhc2luZyBtaXN0YWtlIG92ZXIgdGhlIEFyZ28gc2VyaWVzPwoKCj4gLS0tIGEveGVuL2NvbW1v
bi9NYWtlZmlsZQo+ICsrKyBiL3hlbi9jb21tb24vTWFrZWZpbGUKClRoZXJlJ3MgYXJlIGh1bmtz
IG1pc3NpbmcgaGVyZSB0byByZW1vdmUKCm9iai0kKENPTkZJR19UTUVNKSArPSBsem8ubwoKYW5k
IHRvIHJlcGxhY2UKCmx6by15IDo9IGx6bwpsem8tJChDT05GSUdfVE1FTSkgOj0KCihhbmQgaXRz
IHVzZSkuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy90bWVtLmgKPiArKysgYi94ZW4vaW5j
bHVkZS9wdWJsaWMvdG1lbS5oCj4gQEAgLTEsOCArMSw4IEBACj4gIAo+IC8qKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqCj4gKioKPiAgICogdG1lbS5oCj4gLSAqIAo+ICsgKgo+ICAgKiBHdWVzdCBPUyBpbnRl
cmZhY2UgdG8gWGVuIFRyYW5zY2VuZGVudCBNZW1vcnkuCj4gLSAqIAo+ICsgKgo+ICAgKiBQZXJt
aXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBv
YnRhaW5pbmcgYSBjb3B5Cj4gICAqIG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9j
dW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0bwo+ICAgKiBkZWFsIGluIHRoZSBT
b2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9u
IHRoZQo+IEBAIC0yOSwxNSArMjksMTEgQEAKPiAgCj4gICNpbmNsdWRlICJ4ZW4uaCIKPiAgCj4g
KyNpZiBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fIDwgMHgwMDA0MTIwMAoKSSBndWVzcyB5b3Ug
bWVhbiAweDAwMDQxMzAwIG5vdy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
