From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 00/15] Add support for Hygon Dhyana
 Family 18h processor
Date: Tue, 2 Apr 2019 16:00:01 +0100
Message-ID: <af3a73b3-d1d3-4cd0-0758-d457e1a6549a@citrix.com>
References: <cover.1553935727.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QSF0=SE=citrix.com=prvs=9886cf734=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBL6s-0003Nx-B2
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 15:13:58 +0000
In-Reply-To: <cover.1553935727.git.puwen@hygon.cn>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDMvMjAxOSAxMDo0MCwgUHUgV2VuIHdyb3RlOgo+IEFzIGEgbmV3IHg4NiBDUFUgdmVu
ZG9yLCBDaGVuZ2R1IEhhaWd1YW5nIElDIERlc2lnbiBDby4sIEx0ZCAoSHlnb24pCj4gaXMgYSBq
b2ludCB2ZW50dXJlIGJldHdlZW4gQU1EIGFuZCBIYWlndWFuZyBJbmZvcm1hdGlvbiBUZWNobm9s
b2d5IENvLiwKPiBMdGQuLCBhaW1zIGF0IHByb3ZpZGluZyBoaWdoIHBlcmZvcm1hbmNlIHg4NiBw
cm9jZXNzb3JzIGZvciBDaGluYQo+IHNlcnZlciBtYXJrZXQuCj4KPiBUaGUgZmlyc3QgZ2VuZXJh
dGlvbiBIeWdvbiBwcm9jZXNzb3IoRGh5YW5hKSBvcmlnaW5hdGVzIGZyb20gQU1ECj4gdGVjaG5v
bG9neSBhbmQgc2hhcmVzIG1vc3Qgb2YgdGhlIGFyY2hpdGVjdHVyZSB3aXRoIEFNRCdzIGZhbWls
eSAxN2gsCj4gYnV0IHdpdGggZGlmZmVyZW50IENQVSB2ZW5kb3IgSUQoIkh5Z29uR2VudWluZSIp
IGFuZCBmYW1pbHkgc2VyaWVzCj4gbnVtYmVyIDE4aCAoSHlnb24gbmVnb3RpYXRlZCB3aXRoIEFN
RCB0byBtYWtlIHN1cmUgdGhhdCBvbmx5IEh5Z29uCj4gd2lsbCB1c2UgZmFtaWx5IDE4aCkuCj4K
PiBUbyBlbmFibGUgc3VwcG9ydCBvZiBYZW4gdG8gSHlnb24gRGh5YW5hIENQVSwgYWRkIGEgbmV3
IHZlbmRvciB0eXBlCj4gKFg4Nl9WRU5ET1JfSFlHT04sIHdpdGggdmFsdWUgb2YgNSksIGFuZCBz
aGFyZSBtb3N0IG9mIHRoZSBjb2RlIHdpdGgKPiBBTUQgZmFtaWx5IDE3aC4KPgo+IFRoZSBNU1Jz
IGFuZCBDUFVJRHMgd2hpY2ggYXJlIHVzZWQgYnkgdGhpcyBwYXRjaCBzZXJpZXMgYXJlIGFsbCBk
ZWZpbmVkCj4gaW4gdGhpcyBQUFJbMV0uCj4KPiBUaGlzIHBhdGNoIHNlcmllcyBoYXZlIGJlZW4g
YXBwbGllZCBhbmQgdGVzdGVkIHN1Y2Nlc3NmdWxseSBvbiBIeWdvbgo+IERoeWFuYSBwcm9jZXNz
b3IsIGFsc28gYmVlbiB0ZXN0ZWQgb24gQU1EIEVQWUMgKGZhbWlseSAxN2gpIHByb2Nlc3Nvci4K
PiBJdCB3b3JrcyBmaW5lIGFuZCBtYWtlcyBubyBoYXJtIHRvIHRoZSBleGlzdGluZyBjb2RlLgo+
Cj4gUmVmZXJlbmNlOgo+IFsxXSBodHRwczovL3d3dy5hbWQuY29tL3N5c3RlbS9maWxlcy9UZWNo
RG9jcy81NDk0NV9QUFJfRmFtaWx5XzE3aF9Nb2RlbHNfMDBoLTBGaC5wZGYKCk9uZSB0aGluZyBJ
IGRvbid0IHNlZSBpbiB0aGlzIHNlcmllcyBpcyBhbnl0aGluZyBhYm91dCBtaWNyb2NvZGUKbG9h
ZGluZy7CoCBQcmVzdW1hYmx5IHlvdSdsbCBmb2xsb3cgdGhlIEFNRCBwYXRjaGxvYWRpbmcgbWVj
aGFuaXNtLCB3aXRoCmEgYmxvYiB5b3UgcHJvdmlkZSB5b3Vyc2VsZj8KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
