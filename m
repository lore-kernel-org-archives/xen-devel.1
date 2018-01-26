From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools/libxl: Fix assertion failure when
 trying to build a nested-virt PVH domain
Date: Fri, 26 Jan 2018 19:23:52 +0000
Message-ID: <e08a5a32-8917-2298-c442-6570f38ec6fd@citrix.com>
References: <1516993392-25795-1-git-send-email-andrew.cooper3@citrix.com>
 <23147.32105.390499.454833@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <23147.32105.390499.454833@mariner.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDEvMTggMTk6MTEsIElhbiBKYWNrc29uIHdyb3RlOgo+IEFuZHJldyBDb29wZXIgd3Jp
dGVzICgiW1BBVENIXSB0b29scy9saWJ4bDogRml4IGFzc2VydGlvbiBmYWlsdXJlIHdoZW4gdHJ5
aW5nIHRvIGJ1aWxkIGEgbmVzdGVkLXZpcnQgUFZIIGRvbWFpbiIpOgo+PiB4bDogbGlieGwuYzoz
Mzk6IGxpYnhsX2RlZmJvb2xfdmFsOiBBc3NlcnRpb24gYCFsaWJ4bF9kZWZib29sX2lzX2RlZmF1
bHQoZGIpJyBmYWlsZWQuCj4+Cj4+IFRoaXMgaGFwcGVucyBiZWNhdXNlIGluaXRpYXRlX2RvbWFp
bl9jcmVhdGUoKSBjaGVja3MgZm9yIHR5cGUgIT0gSFZNLCB0aGVuCj4+IHBva2VzIGF0IHRoZSBo
dm0gdW5pb24uICBDaGVjayBmb3IgPT0gSFZNIGluc3RlYWQgc28gdGhlIHVuaW9uIGFjY2VzcyBp
cwo+PiBjb3JyZWN0bHkgZ3VhcmRlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4KPiBUaGlzIGJ1ZyB3aWxsIGJlIGluIGEgbG90IG9m
IHN0YWJsZSBicmFuY2hlcy4gIERvIHdlIGNhcmUgYWJvdXQgZml4aW5nCj4gdGhpcyBidWcgZm9y
IHRoZW0gPyAgSXQncyBVQiBpbiBsaWJ4bCBidXQgb25seSBpZiBuZXN0ZWRfaHZtIGlzIGVuYWJs
ZWQuCgpJJ20gbm90IHRoZSBjaGVjayBpcyBvdmVybHkgb2xkIHRvIGJlZ2luIHdpdGguwqAgV2Ug
c2hvdWxkIHByb2JhYmx5IGZpeAppdCBpbiB0aGUgbWFpbnRhaW5lZCBicmFuY2hlcy4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
