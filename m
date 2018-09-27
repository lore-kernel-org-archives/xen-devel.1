From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [RFC PATCH 2/2] x86/mm: Add mem access rights to NPT
Date: Thu, 27 Sep 2018 11:37:48 +0100
Message-ID: <0f46782a-66f5-f2c6-4ed1-3e4dc4c7e6a7@citrix.com>
References: <20180926164741.13405-1-george.dunlap@citrix.com>
 <20180926164741.13405-2-george.dunlap@citrix.com>
 <6c2e77c5-fe94-3644-8b33-ac8785e4d065@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fyp+=mj=citrix.com=prvs=8016ebfd3=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g5TgE-0002cK-Vi
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 10:37:59 +0000
In-Reply-To: <6c2e77c5-fe94-3644-8b33-ac8785e4d065@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Isaila Alexandru <aisaila@bitdefender.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMjYvMjAxOCAwNjoyMiBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNi8wOS8x
OCAxNzo0NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gRnJvbTogSXNhaWxhIEFsZXhhbmRydSA8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4+Cj4+IFRoaXMgcGF0Y2ggYWRkcyBhY2Nlc3MgY29u
dHJvbCBmb3IgTlBUIG1vZGUuCj4+Cj4+IFRoZXJlIGFyZW7igJl0IGVub3VnaCBleHRyYSBiaXRz
IHRvIHN0b3JlIHRoZSBhY2Nlc3MgcmlnaHRzIGluIHRoZSBOUFQgcDJtCj4+IHRhYmxlLCBzbyB3
ZSBhZGQgYSByYWRpeCB0cmVlIHRvIHN0b3JlIGV4dHJhIGluZm9ybWF0aW9uLgo+IAo+IEknbSBz
b3JyeSB0byByZS1vcGVuIHRoaXMgYXJndW1lbnQsIGJ1dCB3aHk/Cj4gCj4gSVNUUiB0aGVyZSBi
ZWluZyBzb21lIGFyZ3VtZW50IGJhc2VkIG9uIHBhZ2V0YWJsZSBzaGFyaW5nIHdpdGggdGhlCj4g
SU9NTVUsIGJ1dCB0aGF0IGRvZXNuJ3Qgd29yayBhdCB0aGUgbW9tZW50IGFuZCBjYW4ndCByZWFz
b25hYmx5IGJlIG1hZGUKPiB0byB3b3JrLsKgIEZvciBvbmUsIGF0dGVtcHRpbmcgdG8gdXNlIHB0
IHNoYXJpbmcgd2lsbCBicmVhayBhcyBzb29uIGFzCj4geW91IHRyeSBhbmQgRE1BIHRvIGEgbWFw
cGVkIGdyYW50Lgo+IAo+IEknbSBkaXNpbmNsaW5lZCB0byBsZXQgYSBicm9rZW4gdmVzdGlnaWFs
IGZlYXR1cmUgZ2V0IGluIHRoZSB3YXkgb2YgcmVhbAo+IGltcHJvdmVtZW50cy4KPiAKPiBCZXlv
bmQgdGhhdCwgYW4gTlBUIFBURSBoYXMgYmFzaWNhbGx5IHRoZSBzYW1lIG51bWJlciBvZiBzb2Z0
d2FyZQo+IGF2YWlsYWJsZSBiaXRzIGFzIGFuIEVQVCBQVEUuCj4gCj4gQW0gSSBtaXNzaW5nIGFu
eXRoaW5nPwoKV293IC0tIGxvb2tzIGxpa2UgSU9NTVUvcDJtIHNoYXJpbmcgaGFzIGJlZW4gZGlz
YWJsZWQgdW5jb25kaXRpb25hbGx5CnNpbmNlIDIwMTQuICBJZiBub2JvZHkgaGFzIGNvbXBsYWlu
ZWQgc2luY2UgdGhlbiwgdGhhdCBzZWVtcyBsaWtlIGEgZ29vZAplbm91Z2ggcmVhc29uIHRvIG1l
IHRvIHJpcCBpdCBvdXQuCgpTdXJhdmVlIC8gQnJpYW4gLyBCb3JpcyAtLSBhbnkgb3BpbmlvbnM/
CgpUaGUgbWFpbiByZWFzb24gdG8gZ28gd2l0aCB0aGUgJ2V4dHJhIGJpdHMnIHNvbHV0aW9uIHJh
dGhlciB0aGFuIHRoZQoncmlwIG91dCBpb21tdS9wMm0gc2hhcmluZycgc29sdXRpb24gaXMgYmVj
YXVzZSBwZW9wbGUgaGF2ZSBiZWVuCnByb2dub3N0aWNhdGluZyBmb3IgeWVhcnMgdGhhdCB3ZSB3
b3VsZCBiZSBydW5uaW5nIG91dCBvZiBiaXRzIGFuZCBuZWVkCm1vcmUgYXQgc29tZSBwb2ludCBp
biB0aGUgZnV0dXJlLiAgSSB0aG91Z2h0IFBhdWwsIGZvciBpbnN0YW5jZSwgbWlnaHQKaGF2ZSBh
IHVzZSBmb3IgdGhlIGV4dHJhIGJpdHMuICBCdXQgSSdtIGhhcHB5IHRvIHdhaXQgdW50aWwgc3Vj
aCB0aW1lIGFzCndlIG5lZWQgaXQgYW5kIHRoZW4gZmlzaCB0aGlzIHBhdGNoIG91dCBvZiB0aGUg
bWFpbCBhcmNoaXZlcy4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
