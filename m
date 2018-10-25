From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Interrupt injection with ISR set on Intel hardware
Date: Thu, 25 Oct 2018 14:02:16 +0100
Message-ID: <c6e6da14-2a0e-80ea-1d0e-2ffd4b400351@citrix.com>
References: <20181015103015.cyvld52tngd4d3qy@mac.bytemobile.com>
 <14a94f1b-0942-92a2-3b49-86adcc69b871@citrix.com>
 <5BD1BC5402000078001F4A63@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ahoo=nf=citrix.com=prvs=8298df8fa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gFfHg-0007XJ-8N
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 13:02:44 +0000
In-Reply-To: <5BD1BC5402000078001F4A63@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMTAvMTggMTM6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE1LjEwLjE4IGF0
IDE0OjA2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEZyb20gdGhlIGRl
YnVnZ2luZywgd2Ugc2VlIHRoYXQgUFBSL0lSUi9JU1IgYXBwZWFyIHRvIHJldGFpbiB0aGVpciBz
dGF0ZQo+PiBhY3Jvc3MgdGhlIG13YWl0LCBhbmQgdGhlcmUgaXMgbm90aGluZyBpbiB0aGUgbWFu
dWFsIHdoaWNoIEkgY2FuIHNlZQo+PiBkaXNjdXNzaW5nIHRoZSBpbnRlcmFjdGlvbiBvZiBMQVBJ
QyBzdGF0ZSBhbmQgQyBzdGF0ZXMuCj4gSXMgaXQgcGVyaGFwcyBhIGJhZCBpZGVhIHRvIGdvIGlk
bGUgd2l0aCBhbiB1bi1hY2tlZCBpbnRlcnJ1cHQ/CgpNb3N0IGxpa2VseS4KClRoZW4gYWdhaW4s
IGdvaW5nIGlkbGUgd2l0aCBhbiB1bi1hY2tlZCBsaW5lIGludGVycnVwdCBkb2VzIGFwcGVhciB0
bwp3b3JrLsKgIEl0IGlzIG9ubHkgdW4tYWNrZWQgZWRnZSBpbnRlcnJ1cHRzIHdoaWNoIGFwcGVh
ciB0byBoaXQgdGhpcyBpc3N1ZS4KClN0aWxsIC0gSSdkIHByZWZlciBzb21lIGd1aWRhbmNlIGZy
b20gdGhlIGhhcmR3YXJlIGZvbGsgYXMgdG8gd2hhdCBjYW4KcmVhbGlzdGljYWxseSBiZSBleHBl
Y3RlZCBoZXJlLgoKPiBRdWl0ZSBwb3NzaWJseSB0aGF0J3Mgbm90IHNvbWV0aGluZyBhbiBvcmRp
bmFyeSBPUyB3b3VsZCBkby4KClRoaXMgaXMgZGVmaW5pdGVseSBub3Qgc29tZXRoaW5nIGFuIG9y
ZGluYXJ5IE9TIHdvdWxkIGRvIGR1cmluZyBub3JtYWwKb3BlcmF0aW9uLsKgIFhlbiBzdWZmZXJz
IG1vcmUgdGhhbiBtb3N0IG90aGVyIGh5cGVydmlzb3JzIGJlY2F1c2Ugb3VyCmRldmljZSBkcml2
ZXJzIGFyZSBpbiBkb20wLgoKVGhhdCBzYWlkLCBjYW4ndCB3ZSBqdXN0IG1hc2sgdGhlIGxpbmUg
YXQgdGhlIFBJQy9JTy1BUElDIGFuZCBmb3JnbyB0aGUKUEVPSSBzdGFjayBlbnRpcmVseT/CoCBU
aGUgbW9yZSBJIHRoaW5rIGFib3V0IGhvdyBvdXIgaW50ZXJydXB0IGhhbmRsaW5nCndvcmtzLCB0
aGUgbW9yZSBJIHRoaW5rIHZhc3RseSBvdmVyIGNvbXBsaWNhdGVkLgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
