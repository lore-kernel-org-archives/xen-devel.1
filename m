From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.11] libacpi: fixes for iasl >= 20180427
Date: Wed, 9 May 2018 12:58:33 +0100
Message-ID: <3aee74f0-f1be-7433-9e01-2bbf46dfa061@citrix.com>
References: <20180509100812.14366-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n3eo=h4=citrix.com=prvs=660c42f54=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fGNjw-0004uj-O8
 for xen-devel@lists.xenproject.org; Wed, 09 May 2018 11:58:36 +0000
In-Reply-To: <20180509100812.14366-1-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDUvMTggMTE6MDgsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBOZXcgdmVyc2lvbnMg
b2YgaWFzbCBoYXZlIGludHJvZHVjZWQgaW1wcm92ZWQgQyBmaWxlIGdlbmVyYXRpb24sIGFzCj4g
cmVwb3J0ZWQgaW4gdGhlIGNoYW5nZWxvZzoKPgo+IGlBU0w6IEVuaGFuY2VkIHRoZSAtdGMgb3B0
aW9uICh3aGljaCBjcmVhdGVzIGFuIEFNTCBoZXggZmlsZSBpbiBDLAo+IHN1aXRhYmxlIGZvciBp
bXBvcnQgaW50byBhIGZpcm13YXJlIHByb2plY3QpOgo+ICAgMSkgQ3JlYXRlIGEgdW5pcXVlIG5h
bWUgZm9yIHRoZSB0YWJsZSwgdG8gc2ltcGxpZnkgdXNlIG9mIG11bHRpcGxlCj4gU1NEVHMuCj4g
ICAyKSBBZGQgYSBwcm90ZWN0aW9uICNpZmRlZiBpbiB0aGUgZmlsZSwgc2ltaWxhciB0byBhIC5o
IGhlYWRlciBmaWxlLgo+Cj4gVGhlIG5ldCBlZmZlY3Qgb2YgdGhhdCBvbiBnZW5lcmF0ZWQgZmls
ZXMgaXM6Cj4KPiAtdW5zaWduZWQgY2hhciBBbWxDb2RlW10gPQo+ICsjaWZuZGVmIF9fU1NEVF9T
NF9IRVhfXwo+ICsjZGVmaW5lIF9fU1NEVF9TNF9IRVhfXwo+ICsKPiArdW5zaWduZWQgY2hhciBz
c2R0X3M0X2FtbF9jb2RlW10gPQo+Cj4gVGhlIGFib3ZlIGV4YW1wbGUgaXMgZnJvbSBzc2R0X3M0
LmFzbC4KPgo+IEZpeCB0aGUgYnVpbGQgd2l0aCBuZXdlciB2ZXJzaW9ucyBvZiBpYXNsIGJ5IHN0
cmlwcGluZyB0aGUgJ19hbWxfY29kZScKPiBzdWZmaXggZnJvbSB0aGUgdmFyaWFibGUgbmFtZSBv
biBnZW5lcmF0ZWQgZmlsZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBD
YzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
