From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] tools/libxl: Fix assertion failure when
 trying to build a nested-virt PVH domain
Date: Fri, 26 Jan 2018 19:37:22 +0000
Message-ID: <20180126193722.rmv62l3gyhld7pj4@MacBook-Pro-de-Roger.local>
References: <1516993392-25795-1-git-send-email-andrew.cooper3@citrix.com>
 <23147.32105.390499.454833@mariner.uk.xensource.com>
 <e08a5a32-8917-2298-c442-6570f38ec6fd@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <e08a5a32-8917-2298-c442-6570f38ec6fd@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjYsIDIwMTggYXQgMDc6MjM6NTJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNi8wMS8xOCAxOToxMSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBBbmRyZXcg
Q29vcGVyIHdyaXRlcyAoIltQQVRDSF0gdG9vbHMvbGlieGw6IEZpeCBhc3NlcnRpb24gZmFpbHVy
ZSB3aGVuIHRyeWluZyB0byBidWlsZCBhIG5lc3RlZC12aXJ0IFBWSCBkb21haW4iKToKPiA+PiB4
bDogbGlieGwuYzozMzk6IGxpYnhsX2RlZmJvb2xfdmFsOiBBc3NlcnRpb24gYCFsaWJ4bF9kZWZi
b29sX2lzX2RlZmF1bHQoZGIpJyBmYWlsZWQuCj4gPj4KPiA+PiBUaGlzIGhhcHBlbnMgYmVjYXVz
ZSBpbml0aWF0ZV9kb21haW5fY3JlYXRlKCkgY2hlY2tzIGZvciB0eXBlICE9IEhWTSwgdGhlbgo+
ID4+IHBva2VzIGF0IHRoZSBodm0gdW5pb24uICBDaGVjayBmb3IgPT0gSFZNIGluc3RlYWQgc28g
dGhlIHVuaW9uIGFjY2VzcyBpcwo+ID4+IGNvcnJlY3RseSBndWFyZGVkLgo+ID4+Cj4gPj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+
IEFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiA+Cj4g
PiBUaGlzIGJ1ZyB3aWxsIGJlIGluIGEgbG90IG9mIHN0YWJsZSBicmFuY2hlcy4gIERvIHdlIGNh
cmUgYWJvdXQgZml4aW5nCj4gPiB0aGlzIGJ1ZyBmb3IgdGhlbSA/ICBJdCdzIFVCIGluIGxpYnhs
IGJ1dCBvbmx5IGlmIG5lc3RlZF9odm0gaXMgZW5hYmxlZC4KPiAKPiBJJ20gbm90IHRoZSBjaGVj
ayBpcyBvdmVybHkgb2xkIHRvIGJlZ2luIHdpdGguwqAgV2Ugc2hvdWxkIHByb2JhYmx5IGZpeAo+
IGl0IGluIHRoZSBtYWludGFpbmVkIGJyYW5jaGVzLgoKQUZBSUNUIHRoaXMgd2FzIGludHJvZHVj
ZWQgYnkgbXkgdHlwZSA9ICdwdmgnIHdvcmssIHNvcnJ5LiBJdCBzaG91bGQKb25seSBuZWVkIGJh
Y2twb3J0aW5nIHRvIDQuMTAgYW5kIHRoZSA0LjguM3ByZS1zaGltLWNvbWV0IGJyYW5jaGVzLgoK
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
