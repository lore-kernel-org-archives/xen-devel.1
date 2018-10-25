From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Thu, 25 Oct 2018 03:42:09 -0600
Message-ID: <5BD18FF102000078001F48CF@prv1-mh.provo.novell.com>
References: <1535963136-31751-1-git-send-email-rcojocaru@bitdefender.com>
 <a44355eb-79ab-30ee-26d1-4d611dc8eeb7@citrix.com>
 <ac06731a-a44c-fce7-0638-eecf68579176@citrix.com>
 <d0358c5a-1f63-e64c-d988-d5475caa766f@bitdefender.com>
 <5BB62FA902000078001EE6BC@prv1-mh.provo.novell.com>
 <d66b5a9f-4e88-7d67-9238-3f813e665d1d@bitdefender.com>
 <7cc2d3bf-a1dc-b803-cfec-8dd8020b3b10@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=29w0=nf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gFc9f-0007Be-9k
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 09:42:15 +0000
In-Reply-To: <7cc2d3bf-a1dc-b803-cfec-8dd8020b3b10@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, george.dunlap@citrix.com, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjEwLjE4IGF0IDE1OjMwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTcvMTAvMTggMTQ6MjYsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gT24gMTAv
NC8xOCA2OjIwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFJvZ2VyIHJlY2VudGx5IGhhcyBw
b3N0ZWQgYSBwYXRjaCBhZGRpbmcgcmFuZ2VzZXRfbWVyZ2UoKSwgd2hpY2ggSSB0aGluawo+Pj4g
aXMgbW9yZSBnZW5lcmFsIHRoYW4geW91ciByYW5nZXNldF9jb3B5KCkuIFRoYXQgc2FpZCwgSSdt
IGluIG5vIHdheQo+Pj4gY29udmluY2VkIGNvcHlpbmcgKGFuZCB0aGVuIGtlZXBpbmcgaW4gc3lu
YykgdGhlIHJhbmdlIHNldHMgYWNyb3NzIHRoZQo+Pj4gYWx0cDJtLXMgaXMgdGhlIGJlc3QgYXBw
cm9hY2guIEl0IG1heSB3ZWxsIGJlIHRoYXQgdGhlIG9wdGltYWwgc29sdXRpb24gaXMKPj4+IHNv
bWV3aGVyZSBpbiB0aGUgbWlkZGxlIGJldHdlZW4gc2hhcmluZyBldmVyeXRoaW5nIGFuZCBjb3B5
aW5nCj4+PiBldmVyeXRoaW5nLgo+PiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBnZXQgUm9nZXIn
cyBwYXRjaCBpbnRvIHN0YWdpbmc/Cj4+Cj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0wNi9tc2cwMTMzMS5odG1sIAo+Pgo+PiBJdCBs
b29rcyBzaW1wbGUgZW5vdWdoIGFuZCBpdCBoYXMgYWxyZWFkeSBhY2tlZCBieSBXZWkuCj4gCj4g
TG9va3MgZ29vZCBlbm91Z2ggdG8gbWUuICBQdXNoZWQuCgpXZWxsLCB0aGUgcmVhc29uIEkgZGlk
bid0IHdhbnQgdG8gY29tbWl0IGl0IG9uIGl0cyBvd24gaXMgdGhhdCBub3cKd2UgaGF2ZSBpdCBp
biB0aGUgdHJlZSBhcyBkZWFkIGNvZGUuIEFueSBjaGFuZ2Ugb2YgeW91cnMgY291bGQKaGF2ZSBp
bmNsdWRlZCBSb2dlcidzIHBhdGNoICh1bnRpbCBpdCBtaWdodCBoYXZlIGdvbmUgaW4gZnJvbSBo
aXMKc2VyaWVzKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
